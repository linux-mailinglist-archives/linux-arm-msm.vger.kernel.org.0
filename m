Return-Path: <linux-arm-msm+bounces-49406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A28A45473
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFDDC3AAC4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2505267393;
	Wed, 26 Feb 2025 04:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZQKUWuyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B9260A53;
	Wed, 26 Feb 2025 04:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740543295; cv=none; b=B6QE+WyPHMPeslPZhRhcMk4wVAXNsdIG7ECnT/sAQIl4JgHgZjbf7aVPQf3yq6WtJH/DWB45KsldK2gqaaTDRMTLaa9ehzvnKXdpsO5Gov9mJr880LiBM0TH4dIdbnm09cJmjretu+WjrMqPxqgunsbjRNzGXCa6PMxOfVC0+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740543295; c=relaxed/simple;
	bh=w4599f7LGkI+L4vpdVojy1e1AZHo4RgI4o0GldKp0sI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ADjxiGygAZWMNROD5ESWBoEr49c6k5UsSj5UWfzdreHUsCInAMoFJK4PyPlNuzgFDA+y0X7z1N0TZymxq1x13xCi+ISm+ULL9ig/5gi94DwBfGCjHuGweFn/B+1ydp0Zlmmglgfcqs0ErmlxfsHbkp6tC5LST4hET8MvQFTHOEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZQKUWuyJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWqTn011761;
	Wed, 26 Feb 2025 04:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfSFcWfa6ezTimO1/jNj4dZcW5ADuPMOfL/fo3PVBGA=; b=ZQKUWuyJ/OQdlvoi
	7dAP+Vx8J2m1ophISgit5Q0LTSzazh82bAmFl2rOhaZwXcvQmnjhKNRI5Vhj9M65
	kwlNybB6n9oxsyLsMxEvwjnadGQZa4QLX7BfnUVbtx8Q2kJjto5dPEToio6S8vvd
	XEKmJ9W9JWe2x3gx8nnfze4wgzrg61Yf/y7zVIMLGwmKBT8X3AuZM82O5Ol/lbXo
	TfpDcs0sp9H8DHRX17VEnBGZXtH7wdHvdmp1p4uqfb7s46eZ5XmOefFZl2UDf0iT
	zuvZuHkeM7Y1j/4wIjGmvFhWpUT5sipuLdUdU5H6YPvsDCXuuVrv1mPLKqKYG3Al
	YCa9hA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgp2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q4Ect7031290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:38 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 20:14:32 -0800
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
Subject: [PATCH v14 06/10] Coresight: Change to read the trace ID from coresight_path
Date: Wed, 26 Feb 2025 12:13:38 +0800
Message-ID: <20250226041342.53933-7-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VM20HspqsoCE2-osMIOIUSk2LP8V3aAz
X-Proofpoint-GUID: VM20HspqsoCE2-osMIOIUSk2LP8V3aAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260031

The source device can directly read the trace ID from the coresight_path
which result in etm_read_alloc_trace_id and etm4_read_alloc_trace_id being
deleted.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-dummy.c |  2 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  8 +--
 drivers/hwtracing/coresight/coresight-etm.h   |  1 -
 .../coresight/coresight-etm3x-core.c          | 54 +++----------------
 .../coresight/coresight-etm4x-core.c          | 54 +++----------------
 drivers/hwtracing/coresight/coresight-etm4x.h |  1 -
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 drivers/hwtracing/coresight/coresight-sysfs.c |  7 +--
 drivers/hwtracing/coresight/coresight-tpdm.c  |  2 +-
 include/linux/coresight.h                     |  2 +-
 10 files changed, 25 insertions(+), 108 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index b5692ba358c1..aaa92b5081e3 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -24,7 +24,7 @@ DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
 
 static int dummy_source_enable(struct coresight_device *csdev,
 			       struct perf_event *event, enum cs_mode mode,
-			       __maybe_unused struct coresight_trace_id_map *id_map)
+			       __maybe_unused struct coresight_path *path)
 {
 	if (!coresight_take_mode(csdev, mode))
 		return -EBUSY;
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 134290ab622e..300305d67a1d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -461,7 +461,6 @@ static void etm_event_start(struct perf_event *event, int flags)
 	struct coresight_device *sink, *csdev = per_cpu(csdev_src, cpu);
 	struct coresight_path *path;
 	u64 hw_id;
-	u8 trace_id;
 
 	if (!csdev)
 		goto fail;
@@ -504,8 +503,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF,
-				      &sink->perf_sink_id_map))
+	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
@@ -515,13 +513,11 @@ static void etm_event_start(struct perf_event *event, int flags)
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
index c1dda4bc4a2f..8927bfaf3af2 100644
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
index cfd116b87460..1ed957f5df61 100644
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
+		       enum cs_mode mode, struct coresight_path *path)
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
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index aca25b5e3be2..26f9339f38b9 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -195,7 +195,7 @@ static void stm_enable_hw(struct stm_drvdata *drvdata)
 
 static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      enum cs_mode mode,
-		      __maybe_unused struct coresight_trace_id_map *trace_id)
+		      __maybe_unused struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index d03751bf3d8a..3ac5b52413a6 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
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
@@ -217,7 +218,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		goto err_path;
 
-	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
 	if (ret)
 		goto err_source;
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index c38f9701665e..fec49a537658 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -440,7 +440,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		       enum cs_mode mode,
-		       __maybe_unused struct coresight_trace_id_map *id_map)
+		       __maybe_unused struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 00404ba19352..8f76e7c45b38 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -400,7 +400,7 @@ struct coresight_ops_link {
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
 	int (*enable)(struct coresight_device *csdev, struct perf_event *event,
-		      enum cs_mode mode, struct coresight_trace_id_map *id_map);
+		      enum cs_mode mode, struct coresight_path *path);
 	void (*disable)(struct coresight_device *csdev,
 			struct perf_event *event);
 };
-- 
2.34.1


