<div class="m-subheader">
	<div class="d-flex align-items-center">
		<div class="mr-auto">
			<h3 class="m-subheader__title">
				Node
			</h3>
		</div>
	</div>
</div>
<div class="m-content">
	<div class="row">
		<div class="col-lg-6">
			<div class="m-portlet m-portlet--head-sm m-portlet--full-height ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<div class="m-portlet__head-text">Node Information</div>
						</div>
					</div>
					<div class="m-portlet__head-tools"></div>
				</div>
				<div class="m-portlet__body">
					<div class="m-widget12" style="height: 300px;">
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Node Name</span> <div id="nodeNameArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>Node Ip</span> <div id="nodeIpArea"></div>
							</div>
						</div>
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Creation Time</span> <div id="creationTimestampArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>UID</span> <div id="uidArea"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="m-portlet m-portlet--head-sm m-portlet--full-height ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<div class="m-portlet__head-text">System Information</div>
						</div>
					</div>
					<div class="m-portlet__head-tools"></div>
				</div>
				<div class="m-portlet__body">
					<div class="m-widget12" style="height: 300px;">
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Architecture</span> <div id="architectureArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>Boot ID</span> <div id="bootIdArea"></div>
							</div>
						</div>
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Container Runtime Version</span> <div id="crvArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>KernelVersion</span> <div id="kvArea"></div>
							</div>
						</div>
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Kube Proxy Version</span> <div id="kpvArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>Kubelet Version</span> <div id="kuvArea"></div>
							</div>
						</div>
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Operating System</span> <div id="osArea"></div>
							</div>
							<div class="m-widget12__text2">
								<span>OS Image</span> <div id="osiArea"></div>
							</div>
						</div>
						<div class="m-widget12__item">
							<div class="m-widget12__text1">
								<span>Machine ID</span> <div id="machineIdArea"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="m-portlet m-portlet--head-sm m-portlet--full-height ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<div class="m-portlet__head-text">Cpu</div>
						</div>
					</div>
					<div class="m-portlet__head-tools"></div>
				</div>
				<div class="m-portlet__body">
					<div class="m-widget14">
						<div id="cpuChartArea" style="height: 250px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="m-portlet m-portlet--head-sm m-portlet--full-height ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<div class="m-portlet__head-text">Memory</div>
						</div>
					</div>
					<div class="m-portlet__head-tools"></div>
				</div>
				<div class="m-portlet__body">
					<div class="m-widget14">
						<div id="memoryChartArea" style="height: 250px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="m-portlet m-portlet--head-sm m-portlet--full-height ">
				<div class="m-portlet__head">
					<div class="m-portlet__head-caption">
						<div class="m-portlet__head-title">
							<div class="m-portlet__head-text">Pod List</div>
						</div>
					</div>
					<div class="m-portlet__head-tools"></div>
				</div>
				<div class="m-portlet__body">
					<div class="m-widget14">
						<div id="podListArea"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/module/common/client.js" type="text/javascript"></script>
<script src="/resources/js/module/common/colors.js" type="text/javascript"></script>
<script src="/resources/js/module/table/mDataTable.js" type="text/javascript"></script>
<script src="/resources/js/module/chart/basicLine.js" type="text/javascript"></script>
<script type="text/javascript">
var nodeIp = "${nodeIp}";
function drawNode (data) {
	var thisNode;
	data.items.forEach(function(node){
		if(node.metadata.node_ip == nodeIp)
			thisNode = node;
	})
	drawNodeInfo(thisNode);
	drawSystemInfo(thisNode);
	getNodeCpu(thisNode.metadata.name);
	getNodeMemory(thisNode.metadata.name);
	getPodList(thisNode.metadata.name);
}
function drawNodeInfo(node) {
	$("#nodeNameArea").empty().text(node.metadata.name);
	$("#nodeIpArea").empty().text(node.metadata.node_ip);
	$("#creationTimestampArea").empty().text(node.metadata.creationTimestamp);
	$("#uidArea").empty().text(node.metadata.uid);
}
function drawSystemInfo(node) {
	$("#architectureArea").empty().text(node.status.nodeInfo.architecture);
	$("#bootIdArea").empty().text(node.status.nodeInfo.bootID);
	$("#crvArea").empty().text(node.status.nodeInfo.containerRuntimeVersion);
	$("#kvArea").empty().text(node.status.nodeInfo.kernelVersion);
	$("#kpvArea").empty().text(node.status.nodeInfo.kubeProxyVersion);
	$("#kuvArea").empty().text(node.status.nodeInfo.kubeletVersion);
	$("#osArea").empty().text(node.status.nodeInfo.operatingSystem);
	$("#osiArea").empty().text(node.status.nodeInfo.osImage);
	$("#machineIdArea").empty().text(node.status.nodeInfo.machineID);
}
function getNodeCpu(nodeName) {
	new Client().url("/api/v1/kubernetes/node/" + nodeName + "/cpu/used?startTime=1h&time=5m&limit=1000")
	.callback(drawNodeCpu).get();
}
function drawNodeCpu(data) {
	new BasicLine().area("cpuChartArea").colors(colors.cpuUsed).data(data, "cpuUsed", "cpuUsed").draw();
}
function getNodeMemory(nodeName) {
	new Client().url("/api/v1/kubernetes/node/" + nodeName + "/memory/used?startTime=1h&time=5m&limit=1000")
	.callback(drawNodeMemory).get();
}
function drawNodeMemory(data) {
	new BasicLine().area("memoryChartArea").colors(colors.memoryUsed).data(data, "memoryUsed", "memoryUsed").draw();
}
function getPodList(nodeName) {
	new Client().url("/api/v1/kubernetes/pod/snapshot").callback(drawPodList).bindData(nodeName).get();
}
function drawPodList(data, nodeName) {
	var tableData = [];
	data.items.forEach(function(item) {
		if (nodeName == item.spec.nodeName) {
			var m = {
				name : item.metadata.name,
				status : item.status.phase,
				namespace : item.metadata.namespace,
				cpu : Number(item.resource.used_percent.cpu),
				memory : Number(item.resource.used_percent.memory)
			}
			tableData.push(m);
		}
	})
	var columns = [
		{ 
			field : "name", 
			title : "Name", 
			width : 100, 
			template : function(row){
				return "<a href='/kubernetes/pod/"+row.name+"/detail'><span style='cursor:pointer;' class='font-weight-bold m--font-brand'>" + row.name + "</span></a>";
			}
		},
		{ field : "status", title : "Status", width : 100,
			template: function (row) {
				var color = "danger";
				if ("Running" == row.status)
					color = "success";
				return "<span class='m-badge m-badge--"+color+" m-badge--wide'></span>&nbsp&nbsp<strong>"+row.status+"</strong>";
			}
		},
		{ field : "namespace", title : "Namespace", width : 100},
		{ field : "cpu", title : "Cpu(%)", width : 100,
			template: function (row) {
				return '<div class="m-table__progress"><div class="m-table__progress-sm progress m-progress--sm"> <div class="m-table__progress-bar progress-bar bg-brand" role="progressbar" aria-valuenow="' + row.cpu + '" aria-valuemin="0" aria-valuemax="100" style="width:' + row.cpu + '%;"></div></div><span class="m-table__stats">' + row.cpu + '</span> </div>';
			}
		},
		{ field : "memory", title : "Memory(%)", width : 100,
			template: function (row) {
				return '<div class="m-table__progress"><div class="m-table__progress-sm progress m-progress--sm"> <div class="m-table__progress-bar progress-bar bg-brand" role="progressbar" aria-valuenow="' + row.memory + '" aria-valuemin="0" aria-valuemax="100" style="width:' + row.memory + '%;"></div></div><span class="m-table__stats">' + row.memory + '</span> </div>';
			}
		}
	];
	new MDT().area("podListArea").columns(columns).data(tableData).draw();
	
}
new Client().url("/api/v1/kubernetes/node/snapshot").callback(drawNode).get();
</script>