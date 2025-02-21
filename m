Return-Path: <linux-arm-msm+bounces-48799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17384A3EC9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43633AE409
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 06:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DE81FE443;
	Fri, 21 Feb 2025 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8fmKWV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCC1FCFE9;
	Fri, 21 Feb 2025 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740117997; cv=none; b=iXmdPH8nr3UlrIlIXErsn7zHIhY9lLyrxz7EdjdKaRaCEA+Qzun6uU2opHHMCCKr0mxnEkgMaZakdCoYWLTYrFF/gdKtkYPxLtaqGFhrKKOIwm/FViRYzijRc8ac2d7mTtf/GaKTITvkMpf2mYVSofQqCxvjMgKns87BFAG4o/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740117997; c=relaxed/simple;
	bh=Yi6uJB/X0TPkspG5zboHUjDTtvWR8kZKlDe4whglfHM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDVUDRcWjXumFHB4Id5yDDHvIYXuJBGNLnYdbAPXsU+VoNf2frLjGSfaaPuFI1pOxfC/Zj2RgB0TCfzkO+Z8wihcbmR7GZuc1priJrmN/OeHT1GlheHy1jH5pcG1Nxq/v5x+ga/LyFsXptvjSHqe53a2PYJD/O0H1+w6dn+52r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8fmKWV8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5c5Dr001819;
	Fri, 21 Feb 2025 06:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	axKp4o1jJc/Pq6RiX+tIoTVzrpQ00apZ1RLBzcZ/kW0=; b=h8fmKWV8m7LviQWF
	oDG//0DRQdz4XW81Zn+2ZoPxGH3PSKXqz5xQqpnkNWjb2PpeV4IxRkO4VcSZJcLW
	R5hsMMNPqkUJG3vmYppj/15cW2B+wFkX+Bo30Ja+/8o2b5rffQQ0Y9do/hNDDDW2
	xwkveU65pC4LY7s/2kl/0u4q+WmCKFB0KvRQyNaHSqFOaPs1Ki607UmXEekweubB
	sKFGnL0/bvOsOHo2ghIv3YB0dFc0rG4xfCrbnemYHuTsQhLAv5uM8o99FJvx30os
	HQSbb/VJfCQ4Wo0LSNDmVJfK2bmqWvV3z/V1KrNZQX++jiCqq6cXILqCxTl1n/Vv
	xj2PGQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2gp74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L66I70004749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:18 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 22:06:13 -0800
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
Subject: [PATCH v13 2/7] Coresight: Add trace_id function to retrieving the trace ID
Date: Fri, 21 Feb 2025 14:05:38 +0800
Message-ID: <20250221060543.2898845-3-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
References: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ko0rsIkhD34vGdAkR8B5dl17CrLr74CO
X-Proofpoint-GUID: ko0rsIkhD34vGdAkR8B5dl17CrLr74CO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210044

Add 'trace_id' function pointer in coresight_ops. It's responsible for retrieving
the device's trace ID.

Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 27 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-dummy.c | 13 ++++++++-
 .../coresight/coresight-etm3x-core.c          |  1 +
 .../coresight/coresight-etm4x-core.c          |  1 +
 drivers/hwtracing/coresight/coresight-stm.c   | 11 ++++++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 11 ++++++++
 include/linux/coresight.h                     |  5 ++++
 7 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 0a9380350fb5..6cad777757f3 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -23,6 +23,7 @@
 #include "coresight-etm-perf.h"
 #include "coresight-priv.h"
 #include "coresight-syscfg.h"
+#include "coresight-trace-id.h"
 
 /*
  * Mutex used to lock all sysfs enable and disable actions and loading and
@@ -1515,6 +1516,32 @@ void coresight_remove_driver(struct amba_driver *amba_drv,
 }
 EXPORT_SYMBOL_GPL(coresight_remove_driver);
 
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink)
+{
+	int trace_id;
+	int cpu = source_ops(csdev)->cpu_id(csdev);
+
+	switch (mode) {
+	case CS_MODE_SYSFS:
+		trace_id = coresight_trace_id_get_cpu_id(cpu);
+		break;
+	case CS_MODE_PERF:
+		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
+		break;
+	default:
+		trace_id = -EINVAL;
+		break;
+	}
+
+	if (!IS_VALID_CS_TRACE_ID(trace_id))
+		dev_err(&csdev->dev,
+			"Failed to allocate trace ID on CPU%d\n", cpu);
+
+	return trace_id;
+}
+EXPORT_SYMBOL_GPL(coresight_etm_get_trace_id);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Pratik Patel <pratikp@codeaurora.org>");
 MODULE_AUTHOR("Mathieu Poirier <mathieu.poirier@linaro.org>");
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index 9be53be8964b..b5692ba358c1 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -41,6 +41,16 @@ static void dummy_source_disable(struct coresight_device *csdev,
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
+static int dummy_source_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+				 __maybe_unused struct coresight_device *sink)
+{
+	struct dummy_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
 static int dummy_sink_enable(struct coresight_device *csdev, enum cs_mode mode,
 				void *data)
 {
@@ -62,7 +72,8 @@ static const struct coresight_ops_source dummy_source_ops = {
 };
 
 static const struct coresight_ops dummy_source_cs_ops = {
-	.source_ops = &dummy_source_ops,
+	.trace_id	= dummy_source_trace_id,
+	.source_ops	= &dummy_source_ops,
 };
 
 static const struct coresight_ops_sink dummy_sink_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index c103f4c70f5d..c1dda4bc4a2f 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -704,6 +704,7 @@ static const struct coresight_ops_source etm_source_ops = {
 };
 
 static const struct coresight_ops etm_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2c1a60577728..cfd116b87460 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1067,6 +1067,7 @@ static const struct coresight_ops_source etm4_source_ops = {
 };
 
 static const struct coresight_ops etm4_cs_ops = {
+	.trace_id	= coresight_etm_get_trace_id,
 	.source_ops	= &etm4_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index b581a30a1cd9..aca25b5e3be2 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -281,12 +281,23 @@ static void stm_disable(struct coresight_device *csdev,
 	}
 }
 
+static int stm_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			__maybe_unused struct coresight_device *sink)
+{
+	struct stm_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->traceid;
+}
+
 static const struct coresight_ops_source stm_source_ops = {
 	.enable		= stm_enable,
 	.disable	= stm_disable,
 };
 
 static const struct coresight_ops stm_cs_ops = {
+	.trace_id	= stm_trace_id,
 	.source_ops	= &stm_source_ops,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 189a4abc2561..68079169b11b 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -241,12 +241,23 @@ static void tpda_disable(struct coresight_device *csdev,
 	dev_dbg(drvdata->dev, "TPDA inport %d disabled\n", in->dest_port);
 }
 
+static int tpda_trace_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
+			 __maybe_unused struct coresight_device *sink)
+{
+	struct tpda_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	return drvdata->atid;
+}
+
 static const struct coresight_ops_link tpda_link_ops = {
 	.enable		= tpda_enable,
 	.disable	= tpda_disable,
 };
 
 static const struct coresight_ops tpda_cs_ops = {
+	.trace_id	= tpda_trace_id,
 	.link_ops	= &tpda_link_ops,
 };
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 157c4bd009a1..ce89ad24c2a2 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -335,6 +335,7 @@ enum cs_mode {
 	CS_MODE_PERF,
 };
 
+#define coresight_ops(csdev)	csdev->ops
 #define source_ops(csdev)	csdev->ops->source_ops
 #define sink_ops(csdev)		csdev->ops->sink_ops
 #define link_ops(csdev)		csdev->ops->link_ops
@@ -410,6 +411,8 @@ struct coresight_ops_helper {
 };
 
 struct coresight_ops {
+	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
+			struct coresight_device *sink);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;
@@ -697,4 +700,6 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
+int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
+			       struct coresight_device *sink);
 #endif		/* _LINUX_COREISGHT_H */
-- 
2.34.1


