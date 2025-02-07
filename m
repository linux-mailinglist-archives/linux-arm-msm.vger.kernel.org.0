Return-Path: <linux-arm-msm+bounces-47077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21FA2BBBC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 07:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A409C188A24C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 06:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC798234970;
	Fri,  7 Feb 2025 06:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HNwItMVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B902343A1;
	Fri,  7 Feb 2025 06:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910605; cv=none; b=dxYAgY99Hw+uexAGo3rJR2jo1yjN+Eu5RD2R9YhMJ9/wZj9YZ+9CGwOb4RqIVMUPx9LlhuLJ8vRleBZl/W4M4yxKBYaej5T6PIVA2wjt+LDEQy+/X0rbpNyxHrzfcqPytaDtYQPmrb+PfnP8JkikWMQSx3zAX2U8vZPF4aMyyYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910605; c=relaxed/simple;
	bh=wV58oJcWp1zdkUOBayRAdv8Es8iIyE50E4bKxV8xkpc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPwGPo8uZUkX6NRROGWhwugdEcutqsFe31GiwKCsr1hMmW6neQuq/f+mV6fv0mZ1hGd84Y/pOqc1uKZ3TrLOMcHvcfc+1LNLEteRGKxd1oZS5vxfsLgGiTZ2GREfyD87UN8oCrU2sZYVwbUYz2mcCNk8JUIRb0A62v5/vbpzJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HNwItMVe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51756vMu024488;
	Fri, 7 Feb 2025 06:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tV6TwpVsHYj3buv5NnBevXC8TvjqVz0WF3VmeQZCPHk=; b=HNwItMVejaaKFpG9
	F7jUAcvSJPMXezxcQKLv5dz1Pg66T+gSaMNT/VNXWpxryrrjac4N6fI/xrZWcRdm
	ed1GFKGjU9D8S2y8rBvTWxQ9biF0H3azouTArOMQY7MRMFeGCyCV8l2mEK/j2kXS
	4WBnz3p3iV6iXIJIQwDkHRsqwdIpk8wBx29WwjQzYqdHR94rzP3uyanhhy2EtOF9
	yn4B2eSYPp/6BkphOE4Uz5FWHRx16rz/VBGJ/cYPjoxNy86vUv124TCb6SOQ1cNI
	VLBpoVJ2eRm2lF/FOSIYLawjg5KOiUrzNf6y/+KYs19gir2aQOzOFJ0mv+S8wRWN
	Bikzgg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nbr406ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 06:43:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5176h6ep015090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 06:43:06 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 22:42:59 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v10 4/7] Coresight: Introduce a new struct coresight_path
Date: Fri, 7 Feb 2025 14:42:10 +0800
Message-ID: <20250207064213.2314482-5-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
References: <20250207064213.2314482-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l-FZC0ONdoghIIqMPWE71i1WMcGbiKte
X-Proofpoint-ORIG-GUID: l-FZC0ONdoghIIqMPWE71i1WMcGbiKte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070051

Add 'struct coresight_path' to store the data that is needed by
coresight_enable_path/coresight_disable_path. The structure will be
transmitted to any required devices to enable related funcationalities.

The trace_id will be allocated after the path is built. Consequently,
The ETM3x and ETM4x devices will directly read the trace_id from path
which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id
being deleted.

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 106 +++++++++++++-----
 drivers/hwtracing/coresight/coresight-dummy.c |   5 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  30 +++--
 .../hwtracing/coresight/coresight-etm-perf.h  |   2 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   1 -
 .../coresight/coresight-etm3x-core.c          |  54 ++-------
 .../coresight/coresight-etm4x-core.c          |  54 ++-------
 drivers/hwtracing/coresight/coresight-etm4x.h |   1 -
 drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   3 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  17 ++-
 drivers/hwtracing/coresight/coresight-tpdm.c  |   3 +-
 include/linux/coresight.h                     |  12 +-
 13 files changed, 143 insertions(+), 157 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6cad777757f3..3bdd6ebd4b6e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -76,14 +76,14 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
-static struct coresight_device *coresight_get_source(struct list_head *path)
+static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
+	csdev = list_first_entry(path->path_list, struct coresight_node, link)->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -332,12 +332,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
 	return helper_ops(csdev)->enable(csdev, mode, data);
 }
 
-static void coresight_disable_helper(struct coresight_device *csdev)
+static void coresight_disable_helper(struct coresight_device *csdev, void *data)
 {
-	helper_ops(csdev)->disable(csdev, NULL);
+	helper_ops(csdev)->disable(csdev, data);
 }
 
-static void coresight_disable_helpers(struct coresight_device *csdev)
+static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
 {
 	int i;
 	struct coresight_device *helper;
@@ -345,7 +345,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper);
+			coresight_disable_helper(helper, data);
 	}
 }
 
@@ -362,7 +362,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev);
+	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -371,16 +371,16 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
  * disabled.
  */
-static void coresight_disable_path_from(struct list_head *path,
+static void coresight_disable_path_from(struct coresight_path *path,
 					struct coresight_node *nd)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
 
 	if (!nd)
-		nd = list_first_entry(path, struct coresight_node, link);
+		nd = list_first_entry(path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, path, link) {
+	list_for_each_entry_continue(nd, path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -418,11 +418,11 @@ static void coresight_disable_path_from(struct list_head *path,
 		}
 
 		/* Disable all helpers adjacent along the path last */
-		coresight_disable_helpers(csdev);
+		coresight_disable_helpers(csdev, path);
 	}
 }
 
-void coresight_disable_path(struct list_head *path)
+void coresight_disable_path(struct coresight_path *path)
 {
 	coresight_disable_path_from(path, NULL);
 }
@@ -447,7 +447,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			  void *sink_data)
 {
 	int ret = 0;
@@ -457,12 +457,12 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 	struct coresight_device *source;
 
 	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, path, link) {
+	list_for_each_entry_reverse(nd, path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
 		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, sink_data);
+		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
 			goto err;
 		/*
@@ -510,20 +510,21 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 	goto out;
 }
 
-struct coresight_device *coresight_get_sink(struct list_head *path)
+struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(path, struct coresight_node, link)->csdev;
+	csdev = list_last_entry(path->path_list, struct coresight_node, link)->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
@@ -654,6 +655,51 @@ static void coresight_drop_device(struct coresight_device *csdev)
 	}
 }
 
+/**
+ * Links or sources will read their existing or alloc a trace ID, if their ID
+ * callback is set.
+ */
+static int coresight_get_trace_id(struct coresight_device *csdev,
+				  enum cs_mode mode,
+				  struct coresight_device *sink)
+{
+	if (csdev->type == CORESIGHT_DEV_TYPE_LINK && link_ops(csdev)->trace_id)
+		return link_ops(csdev)->trace_id(csdev, mode, sink);
+
+	if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE && source_ops(csdev)->trace_id)
+		return source_ops(csdev)->trace_id(csdev, mode, sink);
+
+	return 0;
+}
+
+/**
+ * Call this after creating the path and before enabling it. This leaves
+ * the trace ID set on the path and returns the ID, or an error if it
+ * couldn't be assigned.
+ */
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				   enum cs_mode mode)
+{
+	struct coresight_device *sink = coresight_get_sink(path);
+	struct coresight_node *nd;
+	int ret;
+
+	list_for_each_entry(nd, path->path_list, link) {
+		/* Assign a trace ID to the path for the first device that wants to do it */
+		ret = coresight_get_trace_id(nd->csdev, mode, sink);
+
+		/*
+		 * 0 in this context is that it didn't want to assign so keep searching.
+		 * Non 0 is either success or fail, return it either way.
+		 */
+		if (ret != 0) {
+			path->trace_id = ret;
+			return ret;
+		}
+	}
+	return 0;
+}
+
 /**
  * _coresight_build_path - recursively build a path from a @csdev to a sink.
  * @csdev:	The device to start from.
@@ -669,7 +715,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *source,
 				 struct coresight_device *sink,
-				 struct list_head *path)
+				 struct coresight_path *path)
 {
 	int i, ret;
 	bool found = false;
@@ -722,28 +768,37 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		return -ENOMEM;
 
 	node->csdev = csdev;
-	list_add(&node->link, path);
+	list_add(&node->link, path->path_list);
 
 	return 0;
 }
 
-struct list_head *coresight_build_path(struct coresight_device *source,
+struct coresight_path *coresight_build_path(struct coresight_device *source,
 				       struct coresight_device *sink)
 {
-	struct list_head *path;
+	struct coresight_path *path;
+	struct list_head *path_list;
 	int rc;
 
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
-	path = kzalloc(sizeof(struct list_head), GFP_KERNEL);
+	path = kzalloc(sizeof(struct coresight_path), GFP_KERNEL);
 	if (!path)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_LIST_HEAD(path);
+	path_list = kzalloc(sizeof(struct list_head), GFP_KERNEL);
+	if (!path_list) {
+		kfree(path);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_LIST_HEAD(path_list);
+	path->path_list = path_list;
 
 	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
+		kfree(path_list);
 		kfree(path);
 		return ERR_PTR(rc);
 	}
@@ -758,12 +813,12 @@ struct list_head *coresight_build_path(struct coresight_device *source,
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct list_head *path)
+void coresight_release_path(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
-	list_for_each_entry_safe(nd, next, path, link) {
+	list_for_each_entry_safe(nd, next, path->path_list, link) {
 		csdev = nd->csdev;
 
 		coresight_drop_device(csdev);
@@ -771,6 +826,7 @@ void coresight_release_path(struct list_head *path)
 		kfree(nd);
 	}
 
+	kfree(path->path_list);
 	kfree(path);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index c47f0382b943..d9a811d44885 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -22,9 +22,8 @@ struct dummy_drvdata {
 DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
 DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
 
-static int dummy_source_enable(struct coresight_device *csdev,
-			       struct perf_event *event, enum cs_mode mode,
-			       __maybe_unused struct coresight_trace_id_map *id_map)
+static int dummy_source_enable(struct coresight_device *csdev, struct perf_event *event,
+			       enum cs_mode mode, struct coresight_path *path)
 {
 	if (!coresight_take_mode(csdev, mode))
 		return -EBUSY;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index ad6a8f4b70b6..0a09a9961197 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -136,13 +136,13 @@ static const struct attribute_group *etm_pmu_attr_groups[] = {
 	NULL,
 };
 
-static inline struct list_head **
+static inline struct coresight_path **
 etm_event_cpu_path_ptr(struct etm_event_data *data, int cpu)
 {
 	return per_cpu_ptr(data->path, cpu);
 }
 
-static inline struct list_head *
+static inline struct coresight_path *
 etm_event_cpu_path(struct etm_event_data *data, int cpu)
 {
 	return *etm_event_cpu_path_ptr(data, cpu);
@@ -226,7 +226,7 @@ static void free_event_data(struct work_struct *work)
 		cscfg_deactivate_config(event_data->cfg_hash);
 
 	for_each_cpu(cpu, mask) {
-		struct list_head **ppath;
+		struct coresight_path **ppath;
 
 		ppath = etm_event_cpu_path_ptr(event_data, cpu);
 		if (!(IS_ERR_OR_NULL(*ppath))) {
@@ -276,7 +276,7 @@ static void *alloc_event_data(int cpu)
 	 * unused memory when dealing with single CPU trace scenarios is small
 	 * compared to the cost of searching through an optimized array.
 	 */
-	event_data->path = alloc_percpu(struct list_head *);
+	event_data->path = alloc_percpu(struct coresight_path *);
 
 	if (!event_data->path) {
 		kfree(event_data);
@@ -352,7 +352,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 * CPUs, we can handle it and fail the session.
 	 */
 	for_each_cpu(cpu, mask) {
-		struct list_head *path;
+		struct coresight_path *path;
 		struct coresight_device *csdev;
 
 		csdev = per_cpu(csdev_src, cpu);
@@ -405,15 +405,15 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
-
 		/* ensure we can allocate a trace ID for this CPU */
-		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
-		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
+		trace_id = coresight_path_assign_trace_id(path, CS_MODE_PERF);
+
+		/* Can be 0 and valid, ETE doesn't need an ID */
+		if (trace_id < 0) {
 			cpumask_clear_cpu(cpu, mask);
 			coresight_release_path(path);
 			continue;
 		}
-
 		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
 		*etm_event_cpu_path_ptr(event_data, cpu) = path;
 	}
@@ -458,9 +458,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
-	struct list_head *path;
+	struct coresight_path *path;
 	u64 hw_id;
-	u8 trace_id;
 
 	if (!csdev)
 		goto fail;
@@ -503,8 +502,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
-				      &sink->perf_sink_id_map))
+	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
@@ -514,13 +512,11 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
 		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
 
-		trace_id = coresight_trace_id_read_cpu_id_map(cpu, &sink->perf_sink_id_map);
-
 		hw_id = FIELD_PREP(CS_AUX_HW_ID_MAJOR_VERSION_MASK,
 				CS_AUX_HW_ID_MAJOR_VERSION);
 		hw_id |= FIELD_PREP(CS_AUX_HW_ID_MINOR_VERSION_MASK,
 				CS_AUX_HW_ID_MINOR_VERSION);
-		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, trace_id);
+		hw_id |= FIELD_PREP(CS_AUX_HW_ID_TRACE_ID_MASK, path->trace_id);
 		hw_id |= FIELD_PREP(CS_AUX_HW_ID_SINK_ID_MASK, coresight_get_sink_id(sink));
 
 		perf_report_aux_output_id(event, hw_id);
@@ -558,7 +554,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct etm_event_data *event_data;
-	struct list_head *path;
+	struct coresight_path *path;
 
 	/*
 	 * If we still have access to the event_data via handle,
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 744531158d6b..5febbcdb8696 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -59,7 +59,7 @@ struct etm_event_data {
 	cpumask_t aux_hwid_done;
 	void *snk_config;
 	u32 cfg_hash;
-	struct list_head * __percpu *path;
+	struct coresight_path * __percpu *path;
 };
 
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
diff --git a/drivers/hwtracing/coresight/coresight-etm.h b/drivers/hwtracing/coresight/coresight-etm.h
index e02c3ea972c9..171f1384f7c0 100644
--- a/drivers/hwtracing/coresight/coresight-etm.h
+++ b/drivers/hwtracing/coresight/coresight-etm.h
@@ -284,6 +284,5 @@ extern const struct attribute_group *coresight_etm_groups[];
 void etm_set_default(struct etm_config *config);
 void etm_config_trace_mode(struct etm_config *config);
 struct etm_config *get_etm_config(struct etm_drvdata *drvdata);
-int etm_read_alloc_trace_id(struct etm_drvdata *drvdata);
 void etm_release_trace_id(struct etm_drvdata *drvdata);
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a38e72ef8e79..cb8a30a3b48e 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -455,26 +455,6 @@ static int etm_cpu_id(struct coresight_device *csdev)
 	return drvdata->cpu;
 }
 
-int etm_read_alloc_trace_id(struct etm_drvdata *drvdata)
-{
-	int trace_id;
-
-	/*
-	 * This will allocate a trace ID to the cpu,
-	 * or return the one currently allocated.
-	 *
-	 * trace id function has its own lock
-	 */
-	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
-	if (IS_VALID_CS_TRACE_ID(trace_id))
-		drvdata->traceid = (u8)trace_id;
-	else
-		dev_err(&drvdata->csdev->dev,
-			"Failed to allocate trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-	return trace_id;
-}
-
 void etm_release_trace_id(struct etm_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -482,38 +462,22 @@ void etm_release_trace_id(struct etm_drvdata *drvdata)
 
 static int etm_enable_perf(struct coresight_device *csdev,
 			   struct perf_event *event,
-			   struct coresight_trace_id_map *id_map)
+			   struct coresight_path *path)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	int trace_id;
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id()))
 		return -EINVAL;
 
 	/* Configure the tracer based on the session's specifics */
 	etm_parse_event_config(drvdata, event);
-
-	/*
-	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
-	 * the allocated ID. This reads the current version without allocation.
-	 *
-	 * This does not use the trace id lock to prevent lock_dep issues
-	 * with perf locks - we know the ID cannot change until perf shuts down
-	 * the session
-	 */
-	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
-		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-		return -EINVAL;
-	}
-	drvdata->traceid = (u8)trace_id;
+	drvdata->traceid = path->trace_id;
 
 	/* And enable it */
 	return etm_enable_hw(drvdata);
 }
 
-static int etm_enable_sysfs(struct coresight_device *csdev)
+static int etm_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
 {
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etm_enable_arg arg = { };
@@ -521,10 +485,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 
 	spin_lock(&drvdata->spinlock);
 
-	/* sysfs needs to allocate and set a trace ID */
-	ret = etm_read_alloc_trace_id(drvdata);
-	if (ret < 0)
-		goto unlock_enable_sysfs;
+	drvdata->traceid = path->trace_id;
 
 	/*
 	 * Configure the ETM only if the CPU is online.  If it isn't online
@@ -545,7 +506,6 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		etm_release_trace_id(drvdata);
 
-unlock_enable_sysfs:
 	spin_unlock(&drvdata->spinlock);
 
 	if (!ret)
@@ -554,7 +514,7 @@ static int etm_enable_sysfs(struct coresight_device *csdev)
 }
 
 static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode, struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	int ret;
 	struct etm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -566,10 +526,10 @@ static int etm_enable(struct coresight_device *csdev, struct perf_event *event,
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		ret = etm_enable_sysfs(csdev);
+		ret = etm_enable_sysfs(csdev, path);
 		break;
 	case CS_MODE_PERF:
-		ret = etm_enable_perf(csdev, event, id_map);
+		ret = etm_enable_perf(csdev, event, path);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 1a993d5380e7..3d0fc25085ea 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -233,25 +233,6 @@ static int etm4_cpu_id(struct coresight_device *csdev)
 	return drvdata->cpu;
 }
 
-int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata)
-{
-	int trace_id;
-
-	/*
-	 * This will allocate a trace ID to the cpu,
-	 * or return the one currently allocated.
-	 * The trace id function has its own lock
-	 */
-	trace_id = coresight_trace_id_get_cpu_id(drvdata->cpu);
-	if (IS_VALID_CS_TRACE_ID(trace_id))
-		drvdata->trcid = (u8)trace_id;
-	else
-		dev_err(&drvdata->csdev->dev,
-			"Failed to allocate trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-	return trace_id;
-}
-
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata)
 {
 	coresight_trace_id_put_cpu_id(drvdata->cpu);
@@ -788,9 +769,9 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 
 static int etm4_enable_perf(struct coresight_device *csdev,
 			    struct perf_event *event,
-			    struct coresight_trace_id_map *id_map)
+			    struct coresight_path *path)
 {
-	int ret = 0, trace_id;
+	int ret = 0;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
 	if (WARN_ON_ONCE(drvdata->cpu != smp_processor_id())) {
@@ -803,22 +784,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	if (ret)
 		goto out;
 
-	/*
-	 * perf allocates cpu ids as part of _setup_aux() - device needs to use
-	 * the allocated ID. This reads the current version without allocation.
-	 *
-	 * This does not use the trace id lock to prevent lock_dep issues
-	 * with perf locks - we know the ID cannot change until perf shuts down
-	 * the session
-	 */
-	trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
-	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
-		dev_err(&drvdata->csdev->dev, "Failed to set trace ID for %s on CPU%d\n",
-			dev_name(&drvdata->csdev->dev), drvdata->cpu);
-		ret = -EINVAL;
-		goto out;
-	}
-	drvdata->trcid = (u8)trace_id;
+	drvdata->trcid = path->trace_id;
 
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
@@ -827,7 +793,7 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	return ret;
 }
 
-static int etm4_enable_sysfs(struct coresight_device *csdev)
+static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_path *path)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etm4_enable_arg arg = { };
@@ -844,10 +810,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 
 	spin_lock(&drvdata->spinlock);
 
-	/* sysfs needs to read and allocate a trace ID */
-	ret = etm4_read_alloc_trace_id(drvdata);
-	if (ret < 0)
-		goto unlock_sysfs_enable;
+	drvdata->trcid = path->trace_id;
 
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
@@ -864,7 +827,6 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		etm4_release_trace_id(drvdata);
 
-unlock_sysfs_enable:
 	spin_unlock(&drvdata->spinlock);
 
 	if (!ret)
@@ -873,7 +835,7 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 }
 
 static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
-		       enum cs_mode mode, struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	int ret;
 
@@ -884,10 +846,10 @@ static int etm4_enable(struct coresight_device *csdev, struct perf_event *event,
 
 	switch (mode) {
 	case CS_MODE_SYSFS:
-		ret = etm4_enable_sysfs(csdev);
+		ret = etm4_enable_sysfs(csdev, path);
 		break;
 	case CS_MODE_PERF:
-		ret = etm4_enable_perf(csdev, event, id_map);
+		ret = etm4_enable_perf(csdev, event, path);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 1119762b5cec..2b92de17b5a2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1066,6 +1066,5 @@ static inline bool etm4x_is_ete(struct etmv4_drvdata *drvdata)
 	return drvdata->arch >= ETM_ARCH_ETE;
 }
 
-int etm4_read_alloc_trace_id(struct etmv4_drvdata *drvdata);
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata);
 #endif
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 76403530f33e..c10dd3643854 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -132,16 +132,16 @@ static inline void CS_UNLOCK(void __iomem *addr)
 	} while (0);
 }
 
-void coresight_disable_path(struct list_head *path);
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
+void coresight_disable_path(struct coresight_path *path);
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			  void *sink_data);
-struct coresight_device *coresight_get_sink(struct list_head *path);
+struct coresight_device *coresight_get_sink(struct coresight_path *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
 coresight_find_default_sink(struct coresight_device *csdev);
-struct list_head *coresight_build_path(struct coresight_device *csdev,
+struct coresight_path *coresight_build_path(struct coresight_device *csdev,
 				       struct coresight_device *sink);
-void coresight_release_path(struct list_head *path);
+void coresight_release_path(struct coresight_path *path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
@@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
 u32 coresight_get_sink_id(struct coresight_device *csdev);
+int coresight_path_assign_trace_id(struct coresight_path *path,
+				  enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 64fcfa916562..0d4a9d325df4 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -194,8 +194,7 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
 }
 
 static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode,
-		      __maybe_unused struct coresight_trace_id_map *trace_id)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a01c9e54e2ed..c2b0a1f59d1a 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -22,7 +22,7 @@ static DEFINE_IDR(path_idr);
  * When operating Coresight drivers from the sysFS interface, only a single
  * path can exist from a tracer (associated to a CPU) to a sink.
  */
-static DEFINE_PER_CPU(struct list_head *, tracer_path);
+static DEFINE_PER_CPU(struct coresight_path *, tracer_path);
 
 ssize_t coresight_simple_show_pair(struct device *_dev,
 			      struct device_attribute *attr, char *buf)
@@ -53,7 +53,8 @@ ssize_t coresight_simple_show32(struct device *_dev,
 EXPORT_SYMBOL_GPL(coresight_simple_show32);
 
 static int coresight_enable_source_sysfs(struct coresight_device *csdev,
-					 enum cs_mode mode, void *data)
+					 enum cs_mode mode,
+					 struct coresight_path *path)
 {
 	int ret;
 
@@ -64,7 +65,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 	 */
 	lockdep_assert_held(&coresight_mutex);
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
-		ret = source_ops(csdev)->enable(csdev, data, mode, NULL);
+		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
 		if (ret)
 			return ret;
 	}
@@ -167,7 +168,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret = 0;
 	struct coresight_device *sink;
-	struct list_head *path;
+	struct coresight_path *path;
 	enum coresight_dev_subtype_source subtype;
 	u32 hash;
 
@@ -209,11 +210,15 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
+	ret = coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
+	if (ret < 0)
+		goto err_path;
+
 	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
 
-	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
 	if (ret)
 		goto err_source;
 
@@ -262,7 +267,7 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
 void coresight_disable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret;
-	struct list_head *path = NULL;
+	struct coresight_path *path = NULL;
 	u32 hash;
 
 	mutex_lock(&coresight_mutex);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index c38f9701665e..f0880a62028f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -439,8 +439,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 }
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
-		       enum cs_mode mode,
-		       __maybe_unused struct coresight_trace_id_map *id_map)
+		      enum cs_mode mode, struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 70407d61262e..03d833a15726 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
 
 #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
 
+/**
+ * struct coresight_path - data needed by enable/disable path
+ * @path:		path from source to sink.
+ * @trace_id:		trace_id of the whole path.
+ */
+struct coresight_path {
+	struct list_head		*path_list;
+	u8				trace_id;
+};
+
 enum cs_mode {
 	CS_MODE_DISABLED,
 	CS_MODE_SYSFS,
@@ -393,7 +403,7 @@ struct coresight_ops_link {
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
 	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
+		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
 	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
-- 
2.34.1


