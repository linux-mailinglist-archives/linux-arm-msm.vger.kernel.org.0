Return-Path: <linux-arm-msm+bounces-49404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCBA4546F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD8817C0D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0752686B8;
	Wed, 26 Feb 2025 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pky5kA6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF684267709;
	Wed, 26 Feb 2025 04:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740543286; cv=none; b=RpCh7pREV8oLbwZUw4LBUe5stKdGUdWxzoTFp6SbCTxdgMEgyCIbF9ATvebgzHtX9BVC5oTK4ejnwfl9fWrtpcoqG0ASVJ9LmubG6zOQKOgpgWWXb2Gnk6fzPlV0qml79rRQm+i+74Ohonn25TLwYmQnkculvWZXheRjakuhk4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740543286; c=relaxed/simple;
	bh=+IQVYAwyWJKNhTYDndNTSQX0FSeCf74KhGopBm/TzeI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IIwQC0pbJF/7UzmhV92WN1GpAM2ofgPO8sQDt8BmDBPYmbc3t9zXNzoegaeGNPI66K96eFVQ0ggs0atbAGYbnTfqzum6CuA741bgmgkL8dGG1uZ1yUJ9U0yehY8N5HIgf6yRVJa6zw7iA5g4TZu+p/m41X9/IFzulsqs6eHpuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pky5kA6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXN2g008490;
	Wed, 26 Feb 2025 04:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eB5NRc0KxfruKQSb7TzkawpegiIZlyjKAz6VbMEbflw=; b=Pky5kA6XCwaodCdj
	YRJazIXhHZNviQehpMuxGv+wJjObkAczkHS9odt+GUzw+HLnqMfR3vECi5tBsfA6
	KVYuv7Or1HKH14hLH5c/PlLEFZGKTS4oAiFQ8nivap9rilzPFlW5tATSq+ym+StV
	2dkJz9Q8YNNXWZI0WXJ4xQmNjcnWXIFuPqG4DJd3EJs5hGk2DFDsz4uPk7xYxiJl
	NuJb5PTqPUaTaHUqR9tXtrdoTSVe49RlOYhzkYkxOPcNIsAQhkb7WiAwEjtiABam
	SvENDAOWc7nZz4kZ0o3GVdM4dGm0ez60omrfJXFiqbPoQHUvCfT2GVmEBwAL/xE+
	g/IATQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmrnud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q4EQ7u002031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:26 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 20:14:21 -0800
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
Subject: [PATCH v14 04/10] Coresight: Introduce a new struct coresight_path
Date: Wed, 26 Feb 2025 12:13:36 +0800
Message-ID: <20250226041342.53933-5-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226041342.53933-1-quic_jiegan@quicinc.com>
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E5NfrUz_fbZx5ke2x2ihaP3Vm5iU-5__
X-Proofpoint-ORIG-GUID: E5NfrUz_fbZx5ke2x2ihaP3Vm5iU-5__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260031

Introduce a new strcuture, 'struct coresight_path', to store the data that
utilized by the devices in the path. The coresight_path will be built/released
by coresight_build_path/coresight_release_path functions.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 16 +++++-----
 .../hwtracing/coresight/coresight-etm-perf.c  | 30 ++++++++++---------
 .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |  6 ++--
 drivers/hwtracing/coresight/coresight-sysfs.c | 12 ++++----
 include/linux/coresight.h                     | 10 +++++++
 6 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6cad777757f3..9c2a088a28d8 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -669,7 +669,7 @@ static void coresight_drop_device(struct coresight_device *csdev)
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *source,
 				 struct coresight_device *sink,
-				 struct list_head *path)
+				 struct coresight_path *path)
 {
 	int i, ret;
 	bool found = false;
@@ -722,25 +722,25 @@ static int _coresight_build_path(struct coresight_device *csdev,
 		return -ENOMEM;
 
 	node->csdev = csdev;
-	list_add(&node->link, path);
+	list_add(&node->link, &path->path_list);
 
 	return 0;
 }
 
-struct list_head *coresight_build_path(struct coresight_device *source,
+struct coresight_path *coresight_build_path(struct coresight_device *source,
 				       struct coresight_device *sink)
 {
-	struct list_head *path;
+	struct coresight_path *path;
 	int rc;
 
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
-	path = kzalloc(sizeof(struct list_head), GFP_KERNEL);
+	path = kzalloc(sizeof(struct coresight_path), GFP_KERNEL);
 	if (!path)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_LIST_HEAD(path);
+	INIT_LIST_HEAD(&path->path_list);
 
 	rc = _coresight_build_path(source, source, sink, path);
 	if (rc) {
@@ -758,12 +758,12 @@ struct list_head *coresight_build_path(struct coresight_device *source,
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct list_head *path)
+void coresight_release_path(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
-	list_for_each_entry_safe(nd, next, path, link) {
+	list_for_each_entry_safe(nd, next, &path->path_list, link) {
 		csdev = nd->csdev;
 
 		coresight_drop_device(csdev);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index ad6a8f4b70b6..b0426792f08a 100644
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
@@ -197,6 +197,7 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 	int cpu;
 	cpumask_t *mask = &event_data->mask;
 	struct coresight_device *sink;
+	struct coresight_path *path;
 
 	if (!event_data->snk_config)
 		return;
@@ -205,7 +206,8 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 		return;
 
 	cpu = cpumask_first(mask);
-	sink = coresight_get_sink(etm_event_cpu_path(event_data, cpu));
+	path = etm_event_cpu_path(event_data, cpu);
+	sink = coresight_get_sink(&path->path_list);
 	sink_ops(sink)->free_buffer(event_data->snk_config);
 }
 
@@ -226,11 +228,11 @@ static void free_event_data(struct work_struct *work)
 		cscfg_deactivate_config(event_data->cfg_hash);
 
 	for_each_cpu(cpu, mask) {
-		struct list_head **ppath;
+		struct coresight_path **ppath;
 
 		ppath = etm_event_cpu_path_ptr(event_data, cpu);
 		if (!(IS_ERR_OR_NULL(*ppath))) {
-			struct coresight_device *sink = coresight_get_sink(*ppath);
+			struct coresight_device *sink = coresight_get_sink(&((*ppath)->path_list));
 
 			/*
 			 * Mark perf event as done for trace id allocator, but don't call
@@ -276,7 +278,7 @@ static void *alloc_event_data(int cpu)
 	 * unused memory when dealing with single CPU trace scenarios is small
 	 * compared to the cost of searching through an optimized array.
 	 */
-	event_data->path = alloc_percpu(struct list_head *);
+	event_data->path = alloc_percpu(struct coresight_path *);
 
 	if (!event_data->path) {
 		kfree(event_data);
@@ -352,7 +354,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 * CPUs, we can handle it and fail the session.
 	 */
 	for_each_cpu(cpu, mask) {
-		struct list_head *path;
+		struct coresight_path *path;
 		struct coresight_device *csdev;
 
 		csdev = per_cpu(csdev_src, cpu);
@@ -458,7 +460,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
-	struct list_head *path;
+	struct coresight_path *path;
 	u64 hw_id;
 	u8 trace_id;
 
@@ -494,12 +496,12 @@ static void etm_event_start(struct perf_event *event, int flags)
 
 	path = etm_event_cpu_path(event_data, cpu);
 	/* We need a sink, no need to continue without one */
-	sink = coresight_get_sink(path);
+	sink = coresight_get_sink(&path->path_list);
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(path, CS_MODE_PERF, handle))
+	if (coresight_enable_path(&path->path_list, CS_MODE_PERF, handle))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
@@ -534,7 +536,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 
 fail_disable_path:
-	coresight_disable_path(path);
+	coresight_disable_path(&path->path_list);
 fail_end_stop:
 	/*
 	 * Check if the handle is still associated with the event,
@@ -558,7 +560,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct etm_event_data *event_data;
-	struct list_head *path;
+	struct coresight_path *path;
 
 	/*
 	 * If we still have access to the event_data via handle,
@@ -599,7 +601,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	if (!path)
 		return;
 
-	sink = coresight_get_sink(path);
+	sink = coresight_get_sink(&path->path_list);
 	if (!sink)
 		return;
 
@@ -643,7 +645,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	}
 
 	/* Disabling the path make its elements available to other sessions */
-	coresight_disable_path(path);
+	coresight_disable_path(&path->path_list);
 }
 
 static int etm_event_add(struct perf_event *event, int mode)
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
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 76403530f33e..27b7dc348d4a 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -139,9 +139,9 @@ struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
 coresight_find_default_sink(struct coresight_device *csdev);
-struct list_head *coresight_build_path(struct coresight_device *csdev,
-				       struct coresight_device *sink);
-void coresight_release_path(struct list_head *path);
+struct coresight_path *coresight_build_path(struct coresight_device *csdev,
+					    struct coresight_device *sink);
+void coresight_release_path(struct coresight_path *path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a01c9e54e2ed..cb4c39732d26 100644
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
@@ -167,7 +167,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret = 0;
 	struct coresight_device *sink;
-	struct list_head *path;
+	struct coresight_path *path;
 	enum coresight_dev_subtype_source subtype;
 	u32 hash;
 
@@ -209,7 +209,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
 
@@ -251,7 +251,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 
 err_source:
-	coresight_disable_path(path);
+	coresight_disable_path(&path->path_list);
 
 err_path:
 	coresight_release_path(path);
@@ -262,7 +262,7 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
 void coresight_disable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret;
-	struct list_head *path = NULL;
+	struct coresight_path *path = NULL;
 	u32 hash;
 
 	mutex_lock(&coresight_mutex);
@@ -297,7 +297,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		break;
 	}
 
-	coresight_disable_path(path);
+	coresight_disable_path(&path->path_list);
 	coresight_release_path(path);
 
 out:
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index ce89ad24c2a2..00404ba19352 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
 
 #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
 
+/**
+ * struct coresight_path - data needed by enable/disable path
+ * @path:              path from source to sink.
+ * @trace_id:          trace_id of the whole path.
+ */
+struct coresight_path {
+	struct list_head	path_list;
+	u8			trace_id;
+};
+
 enum cs_mode {
 	CS_MODE_DISABLED,
 	CS_MODE_SYSFS,
-- 
2.34.1


