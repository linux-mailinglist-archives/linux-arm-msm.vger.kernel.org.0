Return-Path: <linux-arm-msm+bounces-41956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA9C9F0923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23C07169AF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120821C3C1D;
	Fri, 13 Dec 2024 10:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="inH4R0tB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B81C1F03;
	Fri, 13 Dec 2024 10:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084547; cv=none; b=LAyZfY+OjsFxcAZMN2PPmSrMqeY/1cZHYHGD23hjWRfHckgee3e1BkqPkuXm6QnLCGD86SrR0VvY93EoYPAMkG6fnz0Eg6qFQnEEaWzddAWel56TdBsuoR2+rdp5lS/n95lyiibsPAbPGfYzU/NJlyYsk/aDznB1L0Y9OZeL1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084547; c=relaxed/simple;
	bh=JIpx6kGR/zxPY770OgZ4PonDEMT+Km2rOkR7xHsrfcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sCZBA5THyDVFszOCROOAAJzDBVcvo+NC+a6jXFBQS5gTf3g3zz1xSItGty5p2jpn7zfnqjSzaGf4lBklx3vW468O5POaiY8n3MtHZYItwTRLBRQfqCE/FkFyMvrxpEFyufJQ4s4mJckrLlxmLzqlCb5JxBdzWB15fJfoeVwC5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=inH4R0tB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9ZpN3006041;
	Fri, 13 Dec 2024 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XEa/wQjsP+lqqnwK+sxD0NLn
	OedErYOTQvU6riBdWDY=; b=inH4R0tBymQ120C0goHt/yuzAQAVDpOj4srPWlv/
	/b7HOTd6Wxz8VysJuK6Ime6J3arDa5rfFXQZB0cFtzTsoAr0lqEtNW/dGEXVJPnr
	AFvPYCFpN+5n+cZK3DdD/Amsg6x9xgKVPHiANyJqp49p8KxMkkKyaj1EAtipj6sR
	1ohL49fpN2QekVMPXzbyO0eA5u6+elcvLE3HJyErL0O+8hMl9hxoCriYItJjkecA
	7bmMOxoKuh6Byz9SeufSwXnUnGvOpEsOqIZLTzG/DlKQZNAqYBxMBXCHlzSFg3q6
	Rd5DKz9Nbqw9/mo9YaFqAouZe7KOflC3GFZU0aoB8I9Ktg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xusqfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDA8npm026193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:49 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 02:08:45 -0800
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v7 3/4] coresight: Add support for trace filtering by source
Date: Fri, 13 Dec 2024 18:07:30 +0800
Message-ID: <20241213100731.25914-4-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241213100731.25914-1-quic_taozha@quicinc.com>
References: <20241213100731.25914-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tcf-yKaPEsPf0ou8XlsogOmGlyuC2f9G
X-Proofpoint-GUID: tcf-yKaPEsPf0ou8XlsogOmGlyuC2f9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130069

Some replicators have hard coded filtering of "trace" data, based on the
source device. This is different from the trace filtering based on
TraceID, available in the standard programmable replicators. e.g.,
Qualcomm replicators have filtering based on custom trace protocol
format and is not programmable.

The source device could be connected to the replicator via intermediate
components (e.g., a funnel). Thus we need platform information from
the firmware tables to decide the source device corresponding to a
given output port from the replicator. Given this affects "trace
path building" and traversing the path back from the sink to source,
add the concept of "filtering by source" to the generic coresight
connection.

The specified source will be marked like below in the Devicetree.
test-replicator {
    ... ... ... ...
    out-ports {
        ... ... ... ...
        port@0 {
            reg = <0>;
            xyz: endpoint {
                remote-endpoint = <&zyx>;
                filter-source = <&source_1>; <-- To specify the source to
            };                           be filtered out here.
        };

        port@1 {
            reg = <1>;
            abc: endpoint {
                remote-endpoint = <&cba>;
                filter-source = <&source_2>; <-- To specify the source to
            };                           be filtered out here.
        };
    };
};

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 113 +++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  21 ++++
 include/linux/coresight.h                     |   5 +
 3 files changed, 120 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ea38ecf26fcb..0a9380350fb5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -75,22 +75,54 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
+static struct coresight_device *coresight_get_source(struct list_head *path)
+{
+	struct coresight_device *csdev;
+
+	if (!path)
+		return NULL;
+
+	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
+	if (!coresight_is_device_source(csdev))
+		return NULL;
+
+	return csdev;
+}
+
+/**
+ * coresight_blocks_source - checks whether the connection matches the source
+ * of path if connection is bound to specific source.
+ * @src:	The source device of the trace path
+ * @conn:	The connection of one outport
+ *
+ * Return false if the connection doesn't have a source binded or source of the
+ * path matches the source binds to connection.
+ */
+static bool coresight_blocks_source(struct coresight_device *src,
+				    struct coresight_connection *conn)
+{
+	return conn->filter_src_fwnode && (conn->filter_src_dev != src);
+}
+
 static struct coresight_connection *
-coresight_find_out_connection(struct coresight_device *src_dev,
-			      struct coresight_device *dest_dev)
+coresight_find_out_connection(struct coresight_device *csdev,
+			      struct coresight_device *out_dev,
+			      struct coresight_device *trace_src)
 {
 	int i;
 	struct coresight_connection *conn;
 
-	for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
-		conn = src_dev->pdata->out_conns[i];
-		if (conn->dest_dev == dest_dev)
+	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
+		conn = csdev->pdata->out_conns[i];
+		if (coresight_blocks_source(trace_src, conn))
+			continue;
+		if (conn->dest_dev == out_dev)
 			return conn;
 	}
 
-	dev_err(&src_dev->dev,
-		"couldn't find output connection, src_dev: %s, dest_dev: %s\n",
-		dev_name(&src_dev->dev), dev_name(&dest_dev->dev));
+	dev_err(&csdev->dev,
+		"couldn't find output connection, csdev: %s, out_dev: %s\n",
+		dev_name(&csdev->dev), dev_name(&out_dev->dev));
 
 	return ERR_PTR(-ENODEV);
 }
@@ -251,7 +283,8 @@ static void coresight_disable_sink(struct coresight_device *csdev)
 
 static int coresight_enable_link(struct coresight_device *csdev,
 				 struct coresight_device *parent,
-				 struct coresight_device *child)
+				 struct coresight_device *child,
+				 struct coresight_device *source)
 {
 	int link_subtype;
 	struct coresight_connection *inconn, *outconn;
@@ -259,8 +292,8 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (!parent || !child)
 		return -EINVAL;
 
-	inconn = coresight_find_out_connection(parent, csdev);
-	outconn = coresight_find_out_connection(csdev, child);
+	inconn = coresight_find_out_connection(parent, csdev, source);
+	outconn = coresight_find_out_connection(csdev, child, source);
 	link_subtype = csdev->subtype.link_subtype;
 
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && IS_ERR(inconn))
@@ -273,15 +306,16 @@ static int coresight_enable_link(struct coresight_device *csdev,
 
 static void coresight_disable_link(struct coresight_device *csdev,
 				   struct coresight_device *parent,
-				   struct coresight_device *child)
+				   struct coresight_device *child,
+				   struct coresight_device *source)
 {
 	struct coresight_connection *inconn, *outconn;
 
 	if (!parent || !child)
 		return;
 
-	inconn = coresight_find_out_connection(parent, csdev);
-	outconn = coresight_find_out_connection(csdev, child);
+	inconn = coresight_find_out_connection(parent, csdev, source);
+	outconn = coresight_find_out_connection(csdev, child, source);
 
 	link_ops(csdev)->disable(csdev, inconn, outconn);
 }
@@ -375,7 +409,8 @@ static void coresight_disable_path_from(struct list_head *path,
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			coresight_disable_link(csdev, parent, child);
+			coresight_disable_link(csdev, parent, child,
+					       coresight_get_source(path));
 			break;
 		default:
 			break;
@@ -418,7 +453,9 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 	u32 type;
 	struct coresight_node *nd;
 	struct coresight_device *csdev, *parent, *child;
+	struct coresight_device *source;
 
+	source = coresight_get_source(path);
 	list_for_each_entry_reverse(nd, path, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
@@ -456,7 +493,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child);
+			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
 				goto err;
 			break;
@@ -619,6 +656,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
 /**
  * _coresight_build_path - recursively build a path from a @csdev to a sink.
  * @csdev:	The device to start from.
+ * @source:	The trace source device of the path.
  * @sink:	The final sink we want in this path.
  * @path:	The list to add devices to.
  *
@@ -628,6 +666,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
  * the source is the first device and the sink the last one.
  */
 static int _coresight_build_path(struct coresight_device *csdev,
+				 struct coresight_device *source,
 				 struct coresight_device *sink,
 				 struct list_head *path)
 {
@@ -641,7 +680,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
 	    sink == per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev))) {
-		if (_coresight_build_path(sink, sink, path) == 0) {
+		if (_coresight_build_path(sink, source, sink, path) == 0) {
 			found = true;
 			goto out;
 		}
@@ -652,8 +691,12 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		struct coresight_device *child_dev;
 
 		child_dev = csdev->pdata->out_conns[i]->dest_dev;
+
+		if (coresight_blocks_source(source, csdev->pdata->out_conns[i]))
+			continue;
+
 		if (child_dev &&
-		    _coresight_build_path(child_dev, sink, path) == 0) {
+		    _coresight_build_path(child_dev, source, sink, path) == 0) {
 			found = true;
 			break;
 		}
@@ -698,7 +741,7 @@ struct list_head *coresight_build_path(struct coresight_device *source,
 
 	INIT_LIST_HEAD(path);
 
-	rc = _coresight_build_path(source, sink, path);
+	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
 		kfree(path);
 		return ERR_PTR(rc);
@@ -927,6 +970,16 @@ static int coresight_orphan_match(struct device *dev, void *data)
 	for (i = 0; i < src_csdev->pdata->nr_outconns; i++) {
 		conn = src_csdev->pdata->out_conns[i];
 
+		/* Fix filter source device before skip the port */
+		if (conn->filter_src_fwnode && !conn->filter_src_dev) {
+			if (dst_csdev &&
+			    (conn->filter_src_fwnode == dst_csdev->dev.fwnode) &&
+			    !WARN_ON_ONCE(!coresight_is_device_source(dst_csdev)))
+				conn->filter_src_dev = dst_csdev;
+			else
+				still_orphan = true;
+		}
+
 		/* Skip the port if it's already connected. */
 		if (conn->dest_dev)
 			continue;
@@ -977,18 +1030,40 @@ static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
 			 csdev, coresight_orphan_match);
 }
 
+static int coresight_clear_filter_source(struct device *dev, void *data)
+{
+	int i;
+	struct coresight_device *source = data;
+	struct coresight_device *csdev = to_coresight_device(dev);
+
+	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
+		if (csdev->pdata->out_conns[i]->filter_src_dev == source)
+			csdev->pdata->out_conns[i]->filter_src_dev = NULL;
+	}
+	return 0;
+}
+
 /* coresight_remove_conns - Remove other device's references to this device */
 static void coresight_remove_conns(struct coresight_device *csdev)
 {
 	int i, j;
 	struct coresight_connection *conn;
 
+	if (coresight_is_device_source(csdev))
+		bus_for_each_dev(&coresight_bustype, NULL, csdev,
+				 coresight_clear_filter_source);
+
 	/*
 	 * Remove the input connection references from the destination device
 	 * for each output connection.
 	 */
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		conn = csdev->pdata->out_conns[i];
+		if (conn->filter_src_fwnode) {
+			conn->filter_src_dev = NULL;
+			fwnode_handle_put(conn->filter_src_fwnode);
+		}
+
 		if (!conn->dest_dev)
 			continue;
 
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 633d96b9577a..8192ba3279f0 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -243,6 +243,27 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
 		conn.dest_port = rendpoint.port;
 
+		/*
+		 * Get the firmware node of the filter source through the
+		 * reference. This could be used to filter the source in
+		 * building path.
+		 */
+		conn.filter_src_fwnode =
+			fwnode_find_reference(&ep->fwnode, "filter-source", 0);
+		if (IS_ERR(conn.filter_src_fwnode)) {
+			conn.filter_src_fwnode = NULL;
+		} else {
+			conn.filter_src_dev =
+			 coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
+			if (conn.filter_src_dev &&
+			    !coresight_is_device_source(conn.filter_src_dev)) {
+				dev_warn(dev, "port %d: Filter handle is not a trace source : %s\n",
+					 conn.src_port, dev_name(&conn.filter_src_dev->dev));
+				conn.filter_src_dev = NULL;
+				conn.filter_src_fwnode = NULL;
+			}
+		}
+
 		new_conn = coresight_add_out_conn(dev, pdata, &conn);
 		if (IS_ERR_VALUE(new_conn)) {
 			fwnode_handle_put(conn.dest_fwnode);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index c50d128e8d93..17276965ff1d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -172,6 +172,9 @@ struct coresight_desc {
  * @dest_dev:	a @coresight_device representation of the component
 		connected to @src_port. NULL until the device is created
  * @link: Representation of the connection as a sysfs link.
+ * @filter_src_fwnode: filter source component's fwnode handle.
+ * @filter_src_dev: a @coresight_device representation of the component that
+		needs to be filtered.
  *
  * The full connection structure looks like this, where in_conns store
  * references to same connection as the source device's out_conns.
@@ -200,6 +203,8 @@ struct coresight_connection {
 	struct coresight_device *dest_dev;
 	struct coresight_sysfs_link *link;
 	struct coresight_device *src_dev;
+	struct fwnode_handle *filter_src_fwnode;
+	struct coresight_device *filter_src_dev;
 	int src_refcnt;
 	int dest_refcnt;
 };
-- 
2.17.1


