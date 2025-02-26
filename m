Return-Path: <linux-arm-msm+bounces-49405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6949CA45470
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F1427A737F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18777269CF0;
	Wed, 26 Feb 2025 04:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k5oaiJyf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A502690CB;
	Wed, 26 Feb 2025 04:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740543289; cv=none; b=F7R2KDKfMERpcgqcN3lnmQ6S/CsXXFxuXujbfjwzik/FvDS3MBtvz63XOKEahMZGOZI/JCHdKutPOBZyYrgFL8A+0G522sNgRWQQr0PMnjsVQLMODptB1xZiz7SXF6PPYoLQ9BPSzTXEq+57no6cOwVXK1yWwrzZaUNfJ/6jeaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740543289; c=relaxed/simple;
	bh=cWvGsEIe/w8DhX3H2sGbeyXeEpekLGcBKP11PnDj5zE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx5M/WBHXBf0JWf9YhQFMf37/k4BtmgTs7TTVfiX33WV+aV1KOfzmuEqam1+V7TP0WYx7rrULZyx+ZtPqCMNp7LO6B9tysB2OLmIdMGD4hkdXk6H0Qf8hkr4oxJjV7nM0npzAaZl1ts+XB/NU7GmIfYLPgm2OQ9wggBHFaGYO9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k5oaiJyf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMWsKA011784;
	Wed, 26 Feb 2025 04:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tvd6PQOHZ0J27DnYpXhsT0IWck9Gufflc7RPhPz54ao=; b=k5oaiJyfrQ5iR8ge
	0lhQ4oT9Hko0ZLzfEuMUg1tJQc8GwoQ8agTP6JRr4FgLTnf/KIOCz0CROuiOQTbt
	Kll6HzR8qnUtIP1WsPvNYAOx3vgVQZ1P6i0ngyV5BWFxF6D5/J62SjJLH0kyD2ue
	oYqOKPEuJ6KW+OwCB04beKsjHC7JDByil4V6BrPgCL4zWllMMlPVJ738W/TjIH7c
	HiN3aiIjamQZi9wW4znCu0MdgVE3EZgUFk1E8vu3xOAD7a90AlrXiodRUu/9zVmH
	YmCzRCr1OgfP9n87qMJOPtGkUnPU5Pzn0Pu8bsUG7OU3V/CpzdLtvzxSoC/xtmC6
	rbAmfA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgp29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q4EWXl006603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:14:32 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 20:14:27 -0800
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
Subject: [PATCH v14 05/10] Coresight: Allocate trace ID after building the path
Date: Wed, 26 Feb 2025 12:13:37 +0800
Message-ID: <20250226041342.53933-6-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uhjetGmKCrHoEbEJA0dMGOAeTV5zi65L
X-Proofpoint-GUID: uhjetGmKCrHoEbEJA0dMGOAeTV5zi65L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260031

The trace_id will be stored in coresight_path instead of being declared
everywhere and allocated after building the path.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 44 +++++++++++++++++++
 .../hwtracing/coresight/coresight-etm-perf.c  |  5 +--
 drivers/hwtracing/coresight/coresight-priv.h  |  2 +
 drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++
 4 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 9c2a088a28d8..7d010d996f01 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -654,6 +654,50 @@ static void coresight_drop_device(struct coresight_device *csdev)
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


