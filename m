Return-Path: <linux-arm-msm+bounces-34026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B858999CF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D20A1C21486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD5A209660;
	Fri, 11 Oct 2024 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lji4+oXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4ED1E7C32;
	Fri, 11 Oct 2024 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629278; cv=none; b=k1CjO/3NjMwn4tncAT4jdMwjUZ7JDsVZHyTc4sTCYij2vjqxd0UZwBxq2jEoel1fQ/b3TnH0VlABHP7JR+/jMe3Q8++2Ac3Fql+vXpLUFagjaYAiP7fnEvURoEL4Z6EiNrEQ537razpn/ZoF4vddlMS3xwrLj8EGPjX1dopk0Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629278; c=relaxed/simple;
	bh=j/qqoaP2Ts2RaKuG5GsQ5eT2iFTCliSXS21i8J6+44Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fX7sDu8l5hxF3mp6GSiUjnkEYrWLVCkAtUCIQJlfgs8RN8i0T9q9Z8971FYodwyhVd5S7QeXoZvTZ0DJh0sjQtkCDmpTli7G2wD9ou+j97c8QA0VHOtIMJV6fUPxQ0d54732u43J/FhQOcRVieKTZpSbqJFQ/RP6w77b6Ms+Ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lji4+oXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B0AdOh020039;
	Fri, 11 Oct 2024 06:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	401lCX+iTRy8qVlbpmj2vCDKEU9r/KC10EeWPSR3iz4=; b=Lji4+oXmnFBGLM6g
	xCYs89frE/xyfRnX9jNnKMFlXgnGm2VfFPRutE59dUVcv0yMKLRcq7hj8l1jrDq2
	pjWQOMNM2gVS4W9ad2iOD+0hdGlgEMi+mhoR93HpWEuRd1tVLXnKH32+ZnR3rekx
	40sn8nOEgucmjkSD5fJ6WTMwsWMFhE8fNC3anwlkY6+zyOI+dhM6QrRYulLSitOI
	k3FZbIU8GfI7PpKRXtL5oGGjRHSBs1YxyJobEufPF5HPREHBmKK5ZvrNkEyq/Nir
	wAG9qs1XJ6412QfJZgXe3e7fXD9f+D1TD54VEsFlRYwpBo2pL4AWBhENP/RtBjo2
	kl9cYw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7jp5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6ljJK023471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:47:45 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:47:44 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Tao Zhang <quic_taozha@quicinc.com>
Subject: [PATCH v1 RESEND 1/3] coresight-tpdm: Add MCMB dataset support
Date: Thu, 10 Oct 2024 23:47:28 -0700
Message-ID: <20241011064732.8480-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
References: <20241011064732.8480-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9niniSnsEy0ukyquojBJ4bhhWaEhlos6
X-Proofpoint-GUID: 9niniSnsEy0ukyquojBJ4bhhWaEhlos6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1011 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110043

MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit TPDM has the same number and usage of registers as CMB
subunit TPDM. MCMB subunit can be enabled for data collection by
writing 1 to the first bit of CMB_CR register. The difference is
that MCMB subunit TPDM needs to select the lane and enable it in
using it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c |  5 ++-
 drivers/hwtracing/coresight/coresight-tpdm.c | 41 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tpdm.h | 26 ++++++++++++-
 3 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..e063a31ff88a 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -72,7 +72,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
 	}
-	if (tpdm_has_cmb_dataset(tpdm_data)) {
+
+	if (tpdm_has_cmb_dataset(tpdm_data) || tpdm_has_mcmb_dataset(tpdm_data)) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 0726f8842552..58f8c3e804c1 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -198,7 +198,8 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (drvdata && tpdm_has_cmb_dataset(drvdata))
+	if (drvdata && (tpdm_has_cmb_dataset(drvdata) ||
+			tpdm_has_mcmb_dataset(drvdata)))
 		return attr->mode;
 
 	return 0;
@@ -246,8 +247,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
 		drvdata->dsb->trig_type = false;
 	}
 
-	if (drvdata->cmb)
+	if (drvdata->cmb) {
 		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
+		drvdata->cmb->trig_ts = true;
+	}
 }
 
 static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
@@ -388,7 +391,8 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!(tpdm_has_cmb_dataset(drvdata) ||
+		tpdm_has_mcmb_dataset(drvdata)))
 		return;
 
 	/* Configure pattern registers */
@@ -415,6 +419,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 		val |= TPDM_CMB_CR_MODE;
 	else
 		val &= ~TPDM_CMB_CR_MODE;
+
+	if (tpdm_has_mcmb_dataset(drvdata)) {
+		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
+		/*Set the lane participates in tghe output pattern*/
+		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
+			drvdata->cmb->mcmb->mcmb_trig_lane);
+
+		/* Set the enablement of the lane */
+		val &= ~TPDM_CMB_CR_E_LN;
+		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
+			drvdata->cmb->mcmb->mcmb_lane_select);
+	}
+
 	/* Set the enable bit of CMB control register to 1 */
 	val |= TPDM_CMB_CR_ENA;
 	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
@@ -474,7 +491,8 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!(tpdm_has_cmb_dataset(drvdata) ||
+		tpdm_has_mcmb_dataset(drvdata)))
 		return;
 
 	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
@@ -541,6 +559,19 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 		if (!drvdata->cmb)
 			return -ENOMEM;
 	}
+
+	if (tpdm_has_mcmb_dataset(drvdata) && (!drvdata->cmb)) {
+		drvdata->cmb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->cmb), GFP_KERNEL);
+		if (!drvdata->cmb)
+			return -ENOMEM;
+		drvdata->cmb->mcmb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->cmb->mcmb),
+						GFP_KERNEL);
+		if (!drvdata->cmb->mcmb)
+			return -ENOMEM;
+	}
+
 	tpdm_reset_datasets(drvdata);
 
 	return 0;
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index e08d212642e3..2e84daad1a58 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDM_H
@@ -9,7 +9,7 @@
 /* The max number of the datasets that TPDM supports */
 #define TPDM_DATASETS       7
 
-/* CMB Subunit Registers */
+/* CMB/MCMB Subunit Registers */
 #define TPDM_CMB_CR		(0xA00)
 /* CMB subunit timestamp insertion enable register */
 #define TPDM_CMB_TIER		(0xA04)
@@ -34,6 +34,10 @@
 #define TPDM_CMB_TIER_XTRIG_TSENAB	BIT(1)
 /* For timestamp fo all trace */
 #define TPDM_CMB_TIER_TS_ALL		BIT(2)
+/* MCMB trigger lane select */
+#define TPDM_CMB_CR_XTRIG_LNSEL		GENMASK(20, 18)
+/* MCMB lane enablement */
+#define TPDM_CMB_CR_E_LN		GENMASK(17, 10)
 
 /* Patten register number */
 #define TPDM_CMB_MAX_PATT		2
@@ -112,11 +116,13 @@
  * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
  * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
  * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
+ * PERIPHIDR0[6] : Fix to 1 if MCMB subunit present, else 0
  */
 
 #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
 #define TPDM_PIDR0_DS_DSB	BIT(1)
 #define TPDM_PIDR0_DS_CMB	BIT(2)
+#define TPDM_PIDR0_DS_MCMB	BIT(6)
 
 #define TPDM_DSB_MAX_LINES	256
 /* MAX number of EDCR registers */
@@ -245,6 +251,16 @@ struct dsb_dataset {
 	bool			trig_type;
 };
 
+/**
+ * struct mcmb_dataset
+ * @mcmb_trig_lane:       Save data for trigger lane
+ * @mcmb_lane_select:     Save data for lane enablement
+ */
+struct mcmb_dataset {
+	u8		mcmb_trig_lane;
+	u8		mcmb_lane_select;
+};
+
 /**
  * struct cmb_dataset
  * @trace_mode:       Dataset collection mode
@@ -267,6 +283,7 @@ struct cmb_dataset {
 	bool			patt_ts;
 	bool			trig_ts;
 	bool			ts_all;
+	struct mcmb_dataset	*mcmb;
 };
 
 /**
@@ -334,4 +351,9 @@ static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
 {
 	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
 }
+
+static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
+}
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
-- 
2.46.0


