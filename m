Return-Path: <linux-arm-msm+bounces-49958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F036A4B69E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 04:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 091B93A610C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 03:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419F71E1C1A;
	Mon,  3 Mar 2025 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gM4/oKN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846911D54FE;
	Mon,  3 Mar 2025 03:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972642; cv=none; b=FkpBknWKFrspKuS/KLV6ffW+5CQ/lCcOx+4L+rDwSq0Pno3dh3rLLcts3tNJLIjao8S2WPzqLUeiZcPlQCiZKjREEAesSO2x91a42RUQlvvGMvUulgBUw37BACFnL3Da9CS0cj9KlAXDl2PIKS+qPs9E3ffxA65xdAYd8LB0atw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972642; c=relaxed/simple;
	bh=K51Xl5hMmjXiPFrmLwKmRiX+OX/c1xQOYKqtEc0k29o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8fKTsvlLHBAY2x2sPVjqqNcz0Jr8ZZkGSgzYvk9qSmUhOx1ZyikWdv2REgjENC70t8D8w+KgUZ+0vjWnb7A6eq55sqKP7LJd4c0RHMDoqWo/BUlMZdQLjJ2cBW53bqnUAVb8K0ZYXVZM31ZKL4KF2mghvhm6vHty1rEbWDgQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gM4/oKN7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522NR1cb028826;
	Mon, 3 Mar 2025 03:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSMMnQ88G3OKGmS1FV5CXctKrwfJp0pz/vCfXbQnR2c=; b=gM4/oKN73hyZkHKZ
	dIp3TYVyYmzT5ixyQmIXI05yHEJefSLYe3QTKVNaksHdio/9yr9o3h7c4g/8bbZO
	vtHhD4pVYq05SM8r6IixUGceWu/V/Hm9jhMZHecTyaSOTKgiE0H24qxID09XpRzP
	UFOeqbxL1DI71VNJq6dWXGmKhNccsRSVDM18Eayogg3XOUdik7v618K2zULcZNvO
	rq2SVhWBDpjaZL1pTlG5RwB1Vy9ONHFX2S1YENBD8LmvmpHDcpI570V/b9gzp+PM
	dEEqF18E0XfLmGszRiMX9ihKFjaaEK3IdTh+Ly9MuJ7gh3QM+iwdHk74FD7/odLa
	dg59dA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5kfkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:30:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233UQRE032338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 03:30:26 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:30:20 -0800
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
Subject: [PATCH v15 05/10] Coresight: Allocate trace ID after building the path
Date: Mon, 3 Mar 2025 11:29:26 +0800
Message-ID: <20250303032931.2500935-6-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 6zj0jD4ZYpaRwscAWzsXZ3PvWX2IBtmU
X-Proofpoint-GUID: 6zj0jD4ZYpaRwscAWzsXZ3PvWX2IBtmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030026

The trace_id will be stored in coresight_path instead of being declared
everywhere and allocated after building the path.

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 44 +++++++++++++++++++
 .../hwtracing/coresight/coresight-etm-perf.c  |  5 +--
 drivers/hwtracing/coresight/coresight-priv.h  |  2 +
 drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++
 4 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ed0e9368324d..6adc06995d76 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -655,6 +655,50 @@ static void coresight_drop_device(struct coresight_device *csdev)
 	}
 }
 
+/*
+ * coresight device will read their existing or alloc a trace ID, if their trace_id
+ * callback is set.
+ *
+ * Return 0 if the trace_id callback is not set.
+ * Return the result of the trace_id callback if it is set. The return value
+ * will be the trace_id if successful, and an error number if it fails.
+ */
+static int coresight_get_trace_id(struct coresight_device *csdev,
+				  enum cs_mode mode,
+				  struct coresight_device *sink)
+{
+	if (coresight_ops(csdev)->trace_id)
+		return coresight_ops(csdev)->trace_id(csdev, mode, sink);
+
+	return 0;
+}
+
+/*
+ * Call this after creating the path and before enabling it. This leaves
+ * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
+ */
+void coresight_path_assign_trace_id(struct coresight_path *path,
+				    enum cs_mode mode)
+{
+	struct coresight_device *sink = coresight_get_sink(&path->path_list);
+	struct coresight_node *nd;
+	int trace_id;
+
+	list_for_each_entry(nd, &path->path_list, link) {
+		/* Assign a trace ID to the path for the first device that wants to do it */
+		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
+
+		/*
+		 * 0 in this context is that it didn't want to assign so keep searching.
+		 * Non 0 is either success or fail.
+		*/
+		if (trace_id != 0) {
+			path->trace_id = trace_id;
+			return;
+		}
+	}
+}
+
 /**
  * _coresight_build_path - recursively build a path from a @csdev to a sink.
  * @csdev:	The device to start from.
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index b0426792f08a..134290ab622e 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -319,7 +319,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 {
 	u32 id, cfg_hash;
 	int cpu = event->cpu;
-	int trace_id;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
 	struct coresight_device *user_sink = NULL, *last_sink = NULL;
@@ -409,8 +408,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 		}
 
 		/* ensure we can allocate a trace ID for this CPU */
-		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
-		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
+		coresight_path_assign_trace_id(path, CS_MODE_PERF);
+		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
 			cpumask_clear_cpu(cpu, mask);
 			coresight_release_path(path);
 			continue;
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 27b7dc348d4a..2bea35bae0d4 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
 void coresight_remove_links(struct coresight_device *orig,
 			    struct coresight_connection *conn);
 u32 coresight_get_sink_id(struct coresight_device *csdev);
+void coresight_path_assign_trace_id(struct coresight_path *path,
+				   enum cs_mode mode);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 extern int etm_readl_cp14(u32 off, unsigned int *val);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index cb4c39732d26..d03751bf3d8a 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -209,6 +209,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 		goto out;
 	}
 
+	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
+	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
+		goto err_path;
+
 	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
-- 
2.34.1


