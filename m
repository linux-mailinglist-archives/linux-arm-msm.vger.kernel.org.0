Return-Path: <linux-arm-msm+bounces-46041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0EEA1B0DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDCE6188E97E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764BA1DB52D;
	Fri, 24 Jan 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qo23OrOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C21D9A51;
	Fri, 24 Jan 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737703603; cv=none; b=LbO4DD1/RVp/woj89p622NsEndld/dFdSG251tc5h5VmkVirqVlp8zYCnDqXT3PDMnFM+RXBVRGTelOfSgCA1UIBshhk4C3+hUoAoBeg/dtERe0AHDqA0hoSLh0mVTpQHdpd8Buro9laxwQc+EvB8yW+vByI9zUkDZDXE642Fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737703603; c=relaxed/simple;
	bh=MNYRfOHrlpFR+ETeSYXpNqCLw974Icu+rDo3/u3aZsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O832N0y5GWBHkSSqC4dnKqZxnyALafEsVRHFoEHVnL6EVElMaew7nHTgKQv3jElfWCOmn3S+HGKPa1EXTDDMiBVaRrifxZ7yxrMSlilJm2jgdMjnwlHUqlyxdEPA/O31wrq+ORWaC01zSI484juwrW81Q09CQEc5hfTsIXU9PJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qo23OrOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O6lbUw027922;
	Fri, 24 Jan 2025 07:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5p3Ff4YiUHtjbp8w897unVCLoLR/p2fMJua2sbAmBo=; b=Qo23OrOKeqUvnT+N
	hvQGzKBKxAplRHuBW0TK5HZoUxIv8n30k+qdY+tKDDVFFkf1yn6W7tPFmUbq/8T+
	i4Z4nKQ5ADOMYLEH88kKdPlsgCmczLKPD1Tp0rWAbPtP40K/TRWUpkXQMxBp1cbt
	lvrD0/fByopHV8Uos+tE8TOMHdwPUMYThNDcSjzhScEGft/BiJGpNJsOX4alHmZj
	c5YK7gefjIGQI0q/qRsRFyQZ7XRNLyxnIHlhVERZhmikreAWD4kMhE8w6EPBpaM7
	S+2BJa4Icr6FvDHP1NDNbmE2JlQ4w/cZOoyYq6rP1BehwtMANBzuMBm6RA9pBsfC
	8dtLjQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c5wfg2dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 07:26:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O7QMRL032057
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 07:26:22 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 23:26:16 -0800
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
Subject: [PATCH v9 3/6] Coresight: Introduce a new struct coresight_path
Date: Fri, 24 Jan 2025 15:25:34 +0800
Message-ID: <20250124072537.1801030-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: JcM-RNwdjBeDNX-nV-HU_JtIucLCbOe4
X-Proofpoint-ORIG-GUID: JcM-RNwdjBeDNX-nV-HU_JtIucLCbOe4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240052

Add 'struct coresight_path' to store the data that is needed by
coresight_enable_path/coresight_disable_path. The structure
will be transmitted to the helper and sink device to enable
related funcationalities.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 87 ++++++++++++++-----
 drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  | 52 ++++++-----
 .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h  | 21 +++--
 drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++----
 .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
 drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
 10 files changed, 137 insertions(+), 76 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..11d5d5320b1a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -23,6 +23,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
+#include "coresight-trace-id.h"
 
 /*
  * Mutex used to lock all sysfs enable and disable actions and loading and
@@ -331,12 +332,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
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
@@ -344,7 +345,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper);
+			coresight_disable_helper(helper, data);
 	}
 }
 
@@ -361,7 +362,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev);
+	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -370,11 +371,12 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
  * disabled.
  */
-static void coresight_disable_path_from(struct list_head *path,
+static void coresight_disable_path_from(struct coresight_path *cs_path,
 					struct coresight_node *nd)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
+	struct list_head *path = cs_path->path;
 
 	if (!nd)
 		nd = list_first_entry(path, struct coresight_node, link);
@@ -417,13 +419,13 @@ static void coresight_disable_path_from(struct list_head *path,
 		}
 
 		/* Disable all helpers adjacent along the path last */
-		coresight_disable_helpers(csdev);
+		coresight_disable_helpers(csdev, cs_path);
 	}
 }
 
-void coresight_disable_path(struct list_head *path)
+void coresight_disable_path(struct coresight_path *cs_path)
 {
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from(cs_path, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -446,14 +448,14 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
-			  void *sink_data)
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode)
 {
 	int ret = 0;
 	u32 type;
 	struct coresight_node *nd;
 	struct coresight_device *csdev, *parent, *child;
 	struct coresight_device *source;
+	struct list_head *path = cs_path->path;
 
 	source = coresight_get_source(path);
 	list_for_each_entry_reverse(nd, path, link) {
@@ -461,7 +463,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 		type = csdev->type;
 
 		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, sink_data);
+		ret = coresight_enable_helpers(csdev, mode, cs_path);
 		if (ret)
 			goto err;
 		/*
@@ -477,7 +479,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
-			ret = coresight_enable_sink(csdev, mode, sink_data);
+			ret = coresight_enable_sink(csdev, mode, cs_path);
 			/*
 			 * Sink is the first component turned on. If we
 			 * failed to enable the sink, there are no components
@@ -505,7 +507,7 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 out:
 	return ret;
 err:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from(cs_path, nd);
 	goto out;
 }
 
@@ -668,11 +670,12 @@ static void coresight_drop_device(struct coresight_device *csdev)
 static int _coresight_build_path(struct coresight_device *csdev,
 				 struct coresight_device *source,
 				 struct coresight_device *sink,
-				 struct list_head *path)
+				 struct coresight_path *cs_path)
 {
 	int i, ret;
 	bool found = false;
 	struct coresight_node *node;
+	struct list_head *path = cs_path->path;
 
 	/* The sink has been found.  Enqueue the element */
 	if (csdev == sink)
@@ -680,12 +683,21 @@ static int _coresight_build_path(struct coresight_device *csdev,
 
 	if (coresight_is_percpu_source(csdev) && coresight_is_percpu_sink(sink) &&
 	    sink == per_cpu(csdev_sink, source_ops(csdev)->cpu_id(csdev))) {
-		if (_coresight_build_path(sink, source, sink, path) == 0) {
+		if (_coresight_build_path(sink, source, sink, cs_path) == 0) {
 			found = true;
 			goto out;
 		}
 	}
 
+	/* Attempt to read the trace_id from TPDA device */
+	if (!IS_VALID_CS_TRACE_ID(cs_path->trace_id) &&
+	    (csdev->type == CORESIGHT_DEV_TYPE_LINK) &&
+	    (link_ops(csdev)->trace_id != NULL)) {
+		ret = link_ops(csdev)->trace_id(csdev);
+		if (IS_VALID_CS_TRACE_ID(ret))
+			cs_path->trace_id = ret;
+	}
+
 	/* Not a sink - recursively explore each port found on this element */
 	for (i = 0; i < csdev->pdata->nr_outconns; i++) {
 		struct coresight_device *child_dev;
@@ -696,7 +708,7 @@ static int _coresight_build_path(struct coresight_device *csdev,
 			continue;
 
 		if (child_dev &&
-		    _coresight_build_path(child_dev, source, sink, path) == 0) {
+		    _coresight_build_path(child_dev, source, sink, cs_path) == 0) {
 			found = true;
 			break;
 		}
@@ -726,28 +738,53 @@ static int _coresight_build_path(struct coresight_device *csdev,
 	return 0;
 }
 
-struct list_head *coresight_build_path(struct coresight_device *source,
+struct coresight_path *coresight_build_path(struct coresight_device *source,
 				       struct coresight_device *sink)
 {
+	struct coresight_path *cs_path;
 	struct list_head *path;
 	int rc;
 
 	if (!sink)
 		return ERR_PTR(-EINVAL);
 
+	cs_path = kzalloc(sizeof(struct coresight_path), GFP_KERNEL);
+	if (!cs_path)
+		return ERR_PTR(-ENOMEM);
+
 	path = kzalloc(sizeof(struct list_head), GFP_KERNEL);
-	if (!path)
+	if (!path) {
+		kfree(cs_path);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	INIT_LIST_HEAD(path);
+	cs_path->path = path;
+	/*
+	 * Since not all source devices have a defined trace_id function,
+	 * make sure to check for it before use.
+	 *
+	 * Assert the mode is CS_MODE_SYSFS, the trace_id will be assigned
+	 * again later if the mode is CS_MODE_PERF.
+	 */
+	if (source_ops(source)->trace_id != NULL) {
+		rc = source_ops(source)->trace_id(source, CS_MODE_SYSFS, NULL);
+		if(IS_VALID_CS_TRACE_ID(rc))
+			cs_path->trace_id = rc;
+		else 
+			cs_path->trace_id = 0;
+	}
+	else
+		cs_path->trace_id = 0;
 
-	rc = _coresight_build_path(source, source, sink, path);
+	rc = _coresight_build_path(source, source, sink, cs_path);
 	if (rc) {
 		kfree(path);
+		kfree(cs_path);
 		return ERR_PTR(rc);
 	}
 
-	return path;
+	return cs_path;
 }
 
 /**
@@ -757,12 +794,12 @@ struct list_head *coresight_build_path(struct coresight_device *source,
  * Go through all the elements of a path and 1) removed it from the list and
  * 2) free the memory allocated for each node.
  */
-void coresight_release_path(struct list_head *path)
+void coresight_release_path(struct coresight_path *cs_path)
 {
 	struct coresight_device *csdev;
 	struct coresight_node *nd, *next;
 
-	list_for_each_entry_safe(nd, next, path, link) {
+	list_for_each_entry_safe(nd, next, cs_path->path, link) {
 		csdev = nd->csdev;
 
 		coresight_drop_device(csdev);
@@ -770,7 +807,9 @@ void coresight_release_path(struct list_head *path)
 		kfree(nd);
 	}
 
-	kfree(path);
+	cs_path->handle = NULL;
+	kfree(cs_path->path);
+	kfree(cs_path);
 }
 
 /* return true if the device is a suitable type for a default sink */
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index aea9ac9c4bd0..05430d8931d1 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -173,7 +173,8 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path = (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index ad6a8f4b70b6..b6765abb0a26 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -136,13 +136,13 @@ static const struct attribute_group *etm_pmu_attr_groups[] = {
 	NULL,
 };
 
-static inline struct list_head **
+static inline struct coresight_path **
 etm_event_cpu_path_ptr(struct etm_event_data *data, int cpu)
 {
-	return per_cpu_ptr(data->path, cpu);
+	return per_cpu_ptr(data->cs_path, cpu);
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
+	struct coresight_path *cs_path;
 
 	if (!event_data->snk_config)
 		return;
@@ -205,7 +206,8 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 		return;
 
 	cpu = cpumask_first(mask);
-	sink = coresight_get_sink(etm_event_cpu_path(event_data, cpu));
+	cs_path = etm_event_cpu_path(event_data, cpu);
+	sink = coresight_get_sink(cs_path->path);
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
+			struct coresight_device *sink = coresight_get_sink((*ppath)->path);
 
 			/*
 			 * Mark perf event as done for trace id allocator, but don't call
@@ -247,7 +249,7 @@ static void free_event_data(struct work_struct *work)
 		*ppath = NULL;
 	}
 
-	free_percpu(event_data->path);
+	free_percpu(event_data->cs_path);
 	kfree(event_data);
 }
 
@@ -276,9 +278,9 @@ static void *alloc_event_data(int cpu)
 	 * unused memory when dealing with single CPU trace scenarios is small
 	 * compared to the cost of searching through an optimized array.
 	 */
-	event_data->path = alloc_percpu(struct list_head *);
+	event_data->cs_path = alloc_percpu(struct coresight_path *);
 
-	if (!event_data->path) {
+	if (!event_data->cs_path) {
 		kfree(event_data);
 		return NULL;
 	}
@@ -352,7 +354,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 * CPUs, we can handle it and fail the session.
 	 */
 	for_each_cpu(cpu, mask) {
-		struct list_head *path;
+		struct coresight_path *cs_path;
 		struct coresight_device *csdev;
 
 		csdev = per_cpu(csdev_src, cpu);
@@ -400,8 +402,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		 * list of devices from source to sink that can be
 		 * referenced later when the path is actually needed.
 		 */
-		path = coresight_build_path(csdev, sink);
-		if (IS_ERR(path)) {
+		cs_path = coresight_build_path(csdev, sink);
+		if (IS_ERR(cs_path)) {
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
@@ -410,12 +412,13 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
 		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
 			cpumask_clear_cpu(cpu, mask);
-			coresight_release_path(path);
+			coresight_release_path(cs_path);
 			continue;
 		}
 
 		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
-		*etm_event_cpu_path_ptr(event_data, cpu) = path;
+		cs_path->trace_id = trace_id;
+		*etm_event_cpu_path_ptr(event_data, cpu) = cs_path;
 	}
 
 	/* no sink found for any CPU - cannot trace */
@@ -458,7 +461,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
-	struct list_head *path;
+	struct coresight_path *cs_path;
 	u64 hw_id;
 	u8 trace_id;
 
@@ -492,14 +495,15 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (!cpumask_test_cpu(cpu, &event_data->mask))
 		goto out;
 
-	path = etm_event_cpu_path(event_data, cpu);
+	cs_path = etm_event_cpu_path(event_data, cpu);
 	/* We need a sink, no need to continue without one */
-	sink = coresight_get_sink(path);
+	sink = coresight_get_sink(cs_path->path);
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
+	cs_path->handle = handle;
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(path, CS_MODE_PERF, handle))
+	if (coresight_enable_path(cs_path, CS_MODE_PERF))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
@@ -534,7 +538,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 
 fail_disable_path:
-	coresight_disable_path(path);
+	coresight_disable_path(cs_path);
 fail_end_stop:
 	/*
 	 * Check if the handle is still associated with the event,
@@ -558,7 +562,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct etm_event_data *event_data;
-	struct list_head *path;
+	struct coresight_path *cs_path;
 
 	/*
 	 * If we still have access to the event_data via handle,
@@ -595,11 +599,11 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	if (!csdev)
 		return;
 
-	path = etm_event_cpu_path(event_data, cpu);
-	if (!path)
+	cs_path = etm_event_cpu_path(event_data, cpu);
+	if (!cs_path)
 		return;
 
-	sink = coresight_get_sink(path);
+	sink = coresight_get_sink(cs_path->path);
 	if (!sink)
 		return;
 
@@ -643,7 +647,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	}
 
 	/* Disabling the path make its elements available to other sessions */
-	coresight_disable_path(path);
+	coresight_disable_path(cs_path);
 }
 
 static int etm_event_add(struct perf_event *event, int mode)
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index 744531158d6b..ff92421bb97f 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -59,7 +59,7 @@ struct etm_event_data {
 	cpumask_t aux_hwid_done;
 	void *snk_config;
 	u32 cfg_hash;
-	struct list_head * __percpu *path;
+	struct coresight_path * __percpu *cs_path;
 };
 
 int etm_perf_symlink(struct coresight_device *csdev, bool link);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 76403530f33e..6ed7aef6cb43 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -108,6 +108,18 @@ struct cs_buffers {
 	void			**data_pages;
 };
 
+/**
+ * struct coresight_path - data needed by enable/disable path
+ * @handle:		perf aux handle for ETM.
+ * @path:		path from source to sink.
+ * @trace_id:		trace_id of the whole path.
+ */
+struct coresight_path {
+	struct perf_output_handle	*handle;
+	struct list_head		*path;
+	u8				trace_id;
+};
+
 static inline void coresight_insert_barrier_packet(void *buf)
 {
 	if (buf)
@@ -132,16 +144,15 @@ static inline void CS_UNLOCK(void __iomem *addr)
 	} while (0);
 }
 
-void coresight_disable_path(struct list_head *path);
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
-			  void *sink_data);
+void coresight_disable_path(struct coresight_path *cs_path);
+int coresight_enable_path(struct coresight_path *cs_path, enum cs_mode mode);
 struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
 coresight_find_default_sink(struct coresight_device *csdev);
-struct list_head *coresight_build_path(struct coresight_device *csdev,
+struct coresight_path *coresight_build_path(struct coresight_device *csdev,
 				       struct coresight_device *sink);
-void coresight_release_path(struct list_head *path);
+void coresight_release_path(struct coresight_path *cs_path);
 int coresight_add_sysfs_link(struct coresight_sysfs_link *info);
 void coresight_remove_sysfs_link(struct coresight_sysfs_link *info);
 int coresight_create_conns_sysfs_group(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a01c9e54e2ed..04e76cc1bfdf 100644
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
+	struct coresight_path *cs_path;
 	enum coresight_dev_subtype_source subtype;
 	u32 hash;
 
@@ -202,14 +202,14 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	path = coresight_build_path(csdev, sink);
-	if (IS_ERR(path)) {
+	cs_path = coresight_build_path(csdev, sink);
+	if (IS_ERR(cs_path)) {
 		pr_err("building path(s) failed\n");
-		ret = PTR_ERR(path);
+		ret = PTR_ERR(cs_path);
 		goto out;
 	}
 
-	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_path(cs_path, CS_MODE_SYSFS);
 	if (ret)
 		goto err_path;
 
@@ -227,7 +227,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 * a per-cpu variable will do just fine.
 		 */
 		cpu = source_ops(csdev)->cpu_id(csdev);
-		per_cpu(tracer_path, cpu) = path;
+		per_cpu(tracer_path, cpu) = cs_path;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM:
@@ -237,7 +237,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		 * and map the ID to the pointer of the path.
 		 */
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
-		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
+		ret = idr_alloc_u32(&path_idr, cs_path, &hash, hash, GFP_KERNEL);
 		if (ret)
 			goto err_source;
 		break;
@@ -251,10 +251,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 
 err_source:
-	coresight_disable_path(path);
+	coresight_disable_path(cs_path);
 
 err_path:
-	coresight_release_path(path);
+	coresight_release_path(cs_path);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
@@ -262,7 +262,7 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
 void coresight_disable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret;
-	struct list_head *path = NULL;
+	struct coresight_path *cs_path = NULL;
 	u32 hash;
 
 	mutex_lock(&coresight_mutex);
@@ -277,7 +277,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 	switch (csdev->subtype.source_subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
 		cpu = source_ops(csdev)->cpu_id(csdev);
-		path = per_cpu(tracer_path, cpu);
+		cs_path = per_cpu(tracer_path, cpu);
 		per_cpu(tracer_path, cpu) = NULL;
 		break;
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
@@ -285,8 +285,8 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
 		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
 		/* Find the path by the hash. */
-		path = idr_find(&path_idr, hash);
-		if (path == NULL) {
+		cs_path = idr_find(&path_idr, hash);
+		if (cs_path == NULL) {
 			pr_err("Path is not found for %s\n", dev_name(&csdev->dev));
 			goto out;
 		}
@@ -297,8 +297,8 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		break;
 	}
 
-	coresight_disable_path(path);
-	coresight_release_path(path);
+	coresight_disable_path(cs_path);
+	coresight_release_path(cs_path);
 
 out:
 	mutex_unlock(&coresight_mutex);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..e6b07f917556 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -250,7 +250,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path= (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index a48bb85d0e7f..82a872882e24 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1254,7 +1254,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data)
 {
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path = (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1648,7 +1649,8 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path = (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index fff67aac8418..f9a9b96cce13 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -22,6 +22,7 @@
 
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
+#include "coresight-priv.h"
 
 #define PERF_IDX2OFF(idx, buf) ((idx) % ((buf)->nr_pages << PAGE_SHIFT))
 
@@ -1015,7 +1016,8 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path = (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index dc3c9504dd7c..9be88394b3bb 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -216,7 +216,8 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 static int smb_enable_perf(struct coresight_device *csdev, void *data)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct coresight_path *cs_path = (struct coresight_path *)data;
+	struct perf_output_handle *handle = cs_path->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
-- 
2.34.1


