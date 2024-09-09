Return-Path: <linux-arm-msm+bounces-31234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB6970C50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 05:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD081C21B05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 03:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3321E1ACE1F;
	Mon,  9 Sep 2024 03:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SI22xZdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1218AEA;
	Mon,  9 Sep 2024 03:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725852961; cv=none; b=JNnUoL8HPi+V5DytdkSm3y1fMoLycA5BFuAXqMJY0Hz0cBoh3Em5wLtqdjE8CKmFxjKCltxtCJtxxbEX9CNtIyHzNCqRfTU5WBLankoxh2GeELvCSGnifHAnT6hZlXdxsox0bfZIvfcAtSaJhtpjTfuZKzb31bVBzxmnQhUQtkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725852961; c=relaxed/simple;
	bh=YzlLYgQNMQsRCYBqt2nthluRVMWYhNj8fhQIEuOvPEI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJQB0+fk8V8S69eLZtX2L5o3wsPxRlAKhRogPqMdfo/c9eXCszUrzwaJ+3Uxn1pkOdleJmSj4sQ1G3GrqEVubFI1QBY0h342xS6E78jfVdaA8Dkbx2l5z8zSxcqz+dfTTWZgX6YM/ZFb+cjB08cOkUAvnzXXx/ms4BmQK1u72H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SI22xZdH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 488MSefJ010982;
	Mon, 9 Sep 2024 03:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTAVsJNMtBUHJFJnsWQCbyFT+QeZjAsFI4J74CVPKiw=; b=SI22xZdHDqFhIC7S
	bn9+oHnhzeLqAeKk01Cbe2GrC6uKhgzJVhQotpE80NeQ3N3f/NRMzbXWVaNP2lJv
	u6Z9JVyYhtjlWFk5E8sLlaNArTyQ9q6DVUYXh7T7knxjUM3SW0pNSBbWPLS/KYM9
	dDaRrfat8hkdqoCaew9G16vjBVLCp6yrr4+1IbM6/ty4AgcIlYmanfni0JuYLfro
	D2PVXFTtIDfCM1WgSqu8TAlc45we1DzL67TMlN7EPdEDkqDOG98XHVGaIlhjpS0h
	ze8uLfYZrtq15u3lZkyZHkcyYQoxqCGjdDxY1ISF6DE+gG8xrobfonexyePxBlKq
	+QOLOw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy8nsjk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 03:35:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4893ZUdT001137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 03:35:30 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 20:35:24 -0700
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v5 2/5] Coresight: Add trace_id function to retrieving the trace ID
Date: Mon, 9 Sep 2024 11:34:55 +0800
Message-ID: <20240909033458.3118238-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
References: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: SmNZA01q608ELC1p4P6bX1Tu_bdlTIWd
X-Proofpoint-ORIG-GUID: SmNZA01q608ELC1p4P6bX1Tu_bdlTIWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090027

Add 'trace_id' function pointer in ops. It's responsible for
retrieving the device's trace ID.

Add 'struct cs_sink_data' to store the data that is needed by
coresight_enable_path/coresight_disable_path. The structure
will be transmitted to the helper and sink device to enable
related funcationalities.

Depends-on: commit 743e3154674f ("coresight: Use per-sink trace ID maps
for Perf sessions")
Depends-on: commit 4b5809ca2a8b ("coresight: Make CPU id map a property
of a trace ID map")
Depends-on: commit ef050fc3606e ("coresight: Expose map arguments in
trace ID API")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 59 +++++++++++++++----
 drivers/hwtracing/coresight/coresight-etb10.c |  3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  | 37 ++++++++++--
 .../coresight/coresight-etm3x-core.c          | 30 ++++++++++
 .../coresight/coresight-etm4x-core.c          | 29 +++++++++
 drivers/hwtracing/coresight/coresight-priv.h  | 13 +++-
 drivers/hwtracing/coresight/coresight-stm.c   | 22 +++++++
 drivers/hwtracing/coresight/coresight-sysfs.c | 24 +++++++-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  6 +-
 drivers/hwtracing/coresight/coresight-tpda.c  | 20 +++++++
 drivers/hwtracing/coresight/coresight-trbe.c  |  4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  3 +-
 include/linux/coresight.h                     |  6 ++
 14 files changed, 234 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ea38ecf26fcb..ac5dd4a43798 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -23,6 +23,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
+#include "coresight-trace-id.h"
 
 /*
  * Mutex used to lock all sysfs enable and disable actions and loading and
@@ -297,12 +298,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
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
@@ -310,7 +311,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper);
+			coresight_disable_helper(helper, data);
 	}
 }
 
@@ -327,7 +328,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev);
+	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -337,7 +338,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
  * disabled.
  */
 static void coresight_disable_path_from(struct list_head *path,
-					struct coresight_node *nd)
+					struct coresight_node *nd,
+					void *sink_data)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
@@ -382,13 +384,13 @@ static void coresight_disable_path_from(struct list_head *path,
 		}
 
 		/* Disable all helpers adjacent along the path last */
-		coresight_disable_helpers(csdev);
+		coresight_disable_helpers(csdev, sink_data);
 	}
 }
 
-void coresight_disable_path(struct list_head *path)
+void coresight_disable_path(struct list_head *path, void *sink_data)
 {
-	coresight_disable_path_from(path, NULL);
+	coresight_disable_path_from(path, NULL, sink_data);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_path);
 
@@ -468,10 +470,47 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 out:
 	return ret;
 err:
-	coresight_disable_path_from(path, nd);
+	coresight_disable_path_from(path, nd, sink_data);
 	goto out;
 }
 
+int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
+			   struct coresight_trace_id_map *id_map)
+{
+	int trace_id, type;
+	struct coresight_device *csdev;
+	struct coresight_node *nd;
+
+	list_for_each_entry(nd, path, link) {
+		csdev = nd->csdev;
+		type = csdev->type;
+
+		switch (type) {
+		case CORESIGHT_DEV_TYPE_SOURCE:
+			if (source_ops(csdev)->trace_id != NULL) {
+				trace_id = source_ops(csdev)->trace_id(csdev,
+								       mode,
+								       id_map);
+				if (IS_VALID_CS_TRACE_ID(trace_id))
+					goto out;
+			}
+			break;
+		case CORESIGHT_DEV_TYPE_LINK:
+			if (link_ops(csdev)->trace_id != NULL) {
+				trace_id = link_ops(csdev)->trace_id(csdev);
+				if (IS_VALID_CS_TRACE_ID(trace_id))
+					goto out;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+	return -EINVAL;
+out:
+	return trace_id;
+}
+
 struct coresight_device *coresight_get_sink(struct list_head *path)
 {
 	struct coresight_device *csdev;
diff --git a/drivers/hwtracing/coresight/coresight-etb10.c b/drivers/hwtracing/coresight/coresight-etb10.c
index 7edd3f1d0d46..05e620529c14 100644
--- a/drivers/hwtracing/coresight/coresight-etb10.c
+++ b/drivers/hwtracing/coresight/coresight-etb10.c
@@ -173,7 +173,8 @@ static int etb_enable_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct etb_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index ad6a8f4b70b6..e676edd42ddc 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -459,6 +459,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
 	struct list_head *path;
+	struct cs_sink_data *sink_data = NULL;
 	u64 hw_id;
 	u8 trace_id;
 
@@ -498,9 +499,20 @@ static void etm_event_start(struct perf_event *event, int flags)
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
+	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
+	if (!sink_data)
+		goto fail_end_stop;
+
+	sink_data->sink = sink;
+	sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
+						    &sink->perf_sink_id_map);
+	sink_data->handle = handle;
+
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(path, CS_MODE_PERF, handle))
+	if (coresight_enable_path(path, CS_MODE_PERF, sink_data)) {
+		kfree(sink_data);
 		goto fail_end_stop;
+	}
 
 	/* Finally enable the tracer */
 	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
@@ -526,6 +538,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		perf_report_aux_output_id(event, hw_id);
 	}
 
+	kfree(sink_data);
 out:
 	/* Tell the perf core the event is alive */
 	event->hw.state = 0;
@@ -534,7 +547,8 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 
 fail_disable_path:
-	coresight_disable_path(path);
+	coresight_disable_path(path, sink_data);
+	kfree(sink_data);
 fail_end_stop:
 	/*
 	 * Check if the handle is still associated with the event,
@@ -559,6 +573,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct etm_event_data *event_data;
 	struct list_head *path;
+	struct cs_sink_data *sink_data = NULL;
 
 	/*
 	 * If we still have access to the event_data via handle,
@@ -603,6 +618,10 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	if (!sink)
 		return;
 
+	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
+	if (!sink_data)
+		return;
+
 	/* stop tracer */
 	coresight_disable_source(csdev, event);
 
@@ -616,12 +635,16 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 * have to do anything here.
 	 */
 	if (handle->event && (mode & PERF_EF_UPDATE)) {
-		if (WARN_ON_ONCE(handle->event != event))
+		if (WARN_ON_ONCE(handle->event != event)) {
+			kfree(sink_data);
 			return;
+		}
 
 		/* update trace information */
-		if (!sink_ops(sink)->update_buffer)
+		if (!sink_ops(sink)->update_buffer) {
+			kfree(sink_data);
 			return;
+		}
 
 		size = sink_ops(sink)->update_buffer(sink, handle,
 					      event_data->snk_config);
@@ -642,8 +665,12 @@ static void etm_event_stop(struct perf_event *event, int mode)
 			WARN_ON(size);
 	}
 
+	sink_data->sink = sink;
+	sink_data->traceid = coresight_read_traceid(path, CS_MODE_PERF,
+						    &sink->perf_sink_id_map);
 	/* Disabling the path make its elements available to other sessions */
-	coresight_disable_path(path);
+	coresight_disable_path(path, sink_data);
+	kfree(sink_data);
 }
 
 static int etm_event_add(struct perf_event *event, int mode)
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..0f095fab7e0a 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -697,10 +697,40 @@ static void etm_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm_trace_id(struct coresight_device *csdev,
+			enum cs_mode mode,
+			struct coresight_trace_id_map *id_map)
+{
+	int trace_id;
+	struct etm_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = etm_read_alloc_trace_id(drvdata);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->traceid = (u8)trace_id;
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	return trace_id;
+}
+
+
 static const struct coresight_ops_source etm_source_ops = {
 	.cpu_id		= etm_cpu_id,
 	.enable		= etm_enable,
 	.disable	= etm_disable,
+	.trace_id	= etm_trace_id,
 };
 
 static const struct coresight_ops etm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..665611ab57a9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1025,10 +1025,39 @@ static void etm4_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm4_trace_id(struct coresight_device *csdev,
+			 enum cs_mode mode,
+			 struct coresight_trace_id_map *id_map)
+{
+	int trace_id;
+	struct etmv4_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = etm4_read_alloc_trace_id(drvdata);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_read_cpu_id_map(drvdata->cpu, id_map);
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->trcid = (u8)trace_id;
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	return trace_id;
+}
+
 static const struct coresight_ops_source etm4_source_ops = {
 	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
+	.trace_id	= etm4_trace_id,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 05f891ca6b5c..6a95a3ba9339 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -105,6 +105,15 @@ struct cs_buffers {
 	void			**data_pages;
 };
 
+/**
+ * struct cs_sink_data - data used by coresight_enable_path/coresight_disable_path
+ */
+struct cs_sink_data {
+	struct perf_output_handle	*handle;
+	struct coresight_device		*sink;
+	u8				traceid;
+};
+
 static inline void coresight_insert_barrier_packet(void *buf)
 {
 	if (buf)
@@ -129,9 +138,11 @@ static inline void CS_UNLOCK(void __iomem *addr)
 	} while (0);
 }
 
-void coresight_disable_path(struct list_head *path);
+void coresight_disable_path(struct list_head *path, void *sink_data);
 int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 			  void *sink_data);
+int coresight_read_traceid(struct list_head *path, enum cs_mode mode,
+			   struct coresight_trace_id_map *id_map);
 struct coresight_device *coresight_get_sink(struct list_head *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index cb3e04755c99..4975c1981f5d 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -281,9 +281,31 @@ static void stm_disable(struct coresight_device *csdev,
 	}
 }
 
+static int stm_trace_id(struct coresight_device *csdev,
+			enum cs_mode mode,
+			struct coresight_trace_id_map *id_map)
+{
+	int trace_id;
+	struct stm_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	trace_id = drvdata->traceid;
+	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
+		trace_id = coresight_trace_id_get_system_id();
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->traceid = (u8)trace_id;
+	}
+
+	return trace_id;
+}
+
 static const struct coresight_ops_source stm_source_ops = {
 	.enable		= stm_enable,
 	.disable	= stm_disable,
+	.trace_id	= stm_trace_id,
 };
 
 static const struct coresight_ops stm_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index a01c9e54e2ed..8816bccba374 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -168,6 +168,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	int cpu, ret = 0;
 	struct coresight_device *sink;
 	struct list_head *path;
+	struct cs_sink_data *sink_data;
 	enum coresight_dev_subtype_source subtype;
 	u32 hash;
 
@@ -209,7 +210,14 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
-	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
+	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
+	if (!sink_data) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, NULL);
+	sink_data->sink = sink;
+	ret = coresight_enable_path(path, CS_MODE_SYSFS, sink_data);
 	if (ret)
 		goto err_path;
 
@@ -246,15 +254,17 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		break;
 	}
 
+	kfree(sink_data);
 out:
 	mutex_unlock(&coresight_mutex);
 	return ret;
 
 err_source:
-	coresight_disable_path(path);
+	coresight_disable_path(path, sink_data);
 
 err_path:
 	coresight_release_path(path);
+	kfree(sink_data);
 	goto out;
 }
 EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
@@ -263,6 +273,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 {
 	int cpu, ret;
 	struct list_head *path = NULL;
+	struct cs_sink_data *sink_data = NULL;
 	u32 hash;
 
 	mutex_lock(&coresight_mutex);
@@ -274,6 +285,10 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 	if (!coresight_disable_source_sysfs(csdev, NULL))
 		goto out;
 
+	sink_data = kzalloc(sizeof(*sink_data), GFP_KERNEL);
+	if (!sink_data)
+		goto out;
+
 	switch (csdev->subtype.source_subtype) {
 	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
 		cpu = source_ops(csdev)->cpu_id(csdev);
@@ -297,8 +312,11 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		break;
 	}
 
-	coresight_disable_path(path);
+	sink_data->sink = coresight_find_activated_sysfs_sink(csdev);
+	sink_data->traceid = coresight_read_traceid(path, CS_MODE_SYSFS, NULL);
+	coresight_disable_path(path, sink_data);
 	coresight_release_path(path);
+	kfree(sink_data);
 
 out:
 	mutex_unlock(&coresight_mutex);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d4f641cd9de6..7dc536eba3e2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -250,7 +250,8 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 8962fc27d04f..73bb722e88b0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1254,7 +1254,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data)
 {
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
@@ -1648,7 +1649,8 @@ static int tmc_enable_etr_sink_perf(struct coresight_device *csdev, void *data)
 	pid_t pid;
 	unsigned long flags;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct etr_perf_buffer *etr_perf = etm_perf_sink_config(handle);
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..0f47f85811f4 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -232,9 +232,29 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
+static int tpda_trace_id(struct coresight_device *csdev)
+{
+	int trace_id;
+	struct tpda_drvdata *drvdata;
+
+	if (csdev == NULL)
+		return -EINVAL;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+	trace_id = drvdata->atid;
+	if (!IS_VALID_CS_TRACE_ID(trace_id)) {
+		trace_id = coresight_trace_id_get_system_id();
+		if (IS_VALID_CS_TRACE_ID(trace_id))
+			drvdata->atid = (u8)trace_id;
+	}
+
+	return trace_id;
+}
+
 static const struct coresight_ops_link tpda_link_ops = {
 	.enable		= tpda_enable,
 	.disable	= tpda_disable,
+	.trace_id	= tpda_trace_id,
 };
 
 static const struct coresight_ops tpda_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 96a32b213669..7f4560b067a8 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -21,6 +21,7 @@
 
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
+#include "coresight-priv.h"
 
 #define PERF_IDX2OFF(idx, buf) ((idx) % ((buf)->nr_pages << PAGE_SHIFT))
 
@@ -1012,7 +1013,8 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 {
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.c b/drivers/hwtracing/coresight/ultrasoc-smb.c
index f9ebf20c91e6..92d8a9fb844e 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.c
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.c
@@ -217,7 +217,8 @@ static void smb_enable_sysfs(struct coresight_device *csdev)
 static int smb_enable_perf(struct coresight_device *csdev, void *data)
 {
 	struct smb_drv_data *drvdata = dev_get_drvdata(csdev->dev.parent);
-	struct perf_output_handle *handle = data;
+	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
+	struct perf_output_handle *handle = sink_data->handle;
 	struct cs_buffers *buf = etm_perf_sink_config(handle);
 	pid_t pid;
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 497d2206419d..22b977908f4f 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -363,6 +363,7 @@ struct coresight_ops_sink {
  * Operations available for links.
  * @enable:	enables flow between iport and oport.
  * @disable:	disables flow between iport and oport.
+ * @trace_id:	Collect the traceid.
  */
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
@@ -371,6 +372,7 @@ struct coresight_ops_link {
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);
+	int (*trace_id)(struct coresight_device *csdev);
 };
 
 /**
@@ -380,6 +382,7 @@ struct coresight_ops_link {
  *		is associated to.
  * @enable:	enables tracing for a source.
  * @disable:	disables tracing for a source.
+ * @trace_id:	collect the traceid.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -387,6 +390,9 @@ struct coresight_ops_source {
 		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
+	int (*trace_id)(struct coresight_device *csdev,
+			enum cs_mode mode,
+			struct coresight_trace_id_map *id_map);
 };
 
 /**
-- 
2.34.1


