Return-Path: <linux-arm-msm+bounces-37056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995B9BCCE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7AD6B21BBD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8861D5AB7;
	Tue,  5 Nov 2024 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YSZtjycS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F61D54E1;
	Tue,  5 Nov 2024 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730810414; cv=none; b=GFW6FD8RMfrpZoeBRnXYITJRILUP5OlA87sF2pPrpnNyiTVV1HtwS+G9v0+Y/qjoysb+OoXbZRbWmEdSsDLAEN9nCAEyhb4BRTCiWpiXP3PlS8aTi78RviKpmw0Mg/tpIVW4oj++IdgP3aOooLpvDkGJVa19Cqv0bra6Xb4Jmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730810414; c=relaxed/simple;
	bh=Z5U7mBAiBwO+/Grm2ySEUqmKw1e0t75dOcNpvSmCcr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKMTj/bTNgnAbUJuubiVD/50aHcQqhC0iyAxRQlAr0H+0z6lGDBY7TXNRMp3Sa+I8EYf4Qu43uavguqa9UTs4YykVVN51r3AF126gIzUyZJFUuQOn7S5ltd2224/VUtFiSJQvQVHj/ko/1MqKF4gUPKEZjQdam6Bbu6i5tc1UU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YSZtjycS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5A8nk0003788;
	Tue, 5 Nov 2024 12:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FEG5iix1sVuBfgl3Hf8RqaPV
	NQ8l5Lm3gIyKyMELk+U=; b=YSZtjycS73s5JhDo6w9IIVEoMPRAj/Mf/dIctQ4W
	BAOr25weHAoOIwUutvy6yx3O8axEWTjqREhQXIyjt41yHIWsQM09nNpT29K4Cjaa
	uZCKhC/1CMiBllFoqoZVzE3G3implLxEmy0q4zk6+pkyb15aq5PuaUxW5aKMhrny
	KOCyFfj7039l9AUXS2DiNmx3VaxDNhxCesOLfk3IN9w+JC9tqrwXzUSxofknaLPx
	Vg8k6o3CTT8WmTLwS+mHBC1XMKv90GhZUMvX21wbBA3+kH6Xqbw6xep/qY4MavgY
	gLuBgKLqrfzRxTIgDB8shXIHovgYzKPlJpQcotbeTMkfBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbu8eax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 12:40:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5Ce2Z6026088
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 12:40:02 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 04:39:59 -0800
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
Subject: [PATCH v2 1/3] coresight-tpdm: Add MCMB dataset support
Date: Tue, 5 Nov 2024 20:39:38 +0800
Message-ID: <20241105123940.39602-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
References: <20241105123940.39602-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7v60FBxxm7wStdy_tABXgkFSuqRWVBM2
X-Proofpoint-GUID: 7v60FBxxm7wStdy_tABXgkFSuqRWVBM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050097

MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit TPDM has the same number and usage of registers as CMB
subunit TPDM. MCMB subunit can be enabled for data collection by
writing 1 to the first bit of CMB_CR register. The difference is
that MCMB subunit TPDM needs to select the lane and enable it in
using it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c |  7 ++--
 drivers/hwtracing/coresight/coresight-tpdm.c | 44 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tpdm.h | 27 ++++++------
 3 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..4b61b9840740 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -68,11 +68,12 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	int rc = -EINVAL;
 	struct tpdm_drvdata *tpdm_data = dev_get_drvdata(csdev->dev.parent);
 
-	if (tpdm_has_dsb_dataset(tpdm_data)) {
+	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
 	}
-	if (tpdm_has_cmb_dataset(tpdm_data)) {
+
+	if (tpdm_data->cmb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index b7d99e91ab84..0529858586c1 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -21,6 +21,21 @@
 
 DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
 
+static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
+}
+
+static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
+}
+
+static bool tpdm_has_mcmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_MCMB);
+}
+
 /* Read dataset array member with the index number */
 static ssize_t tpdm_simple_dataset_show(struct device *dev,
 					struct device_attribute *attr,
@@ -198,7 +213,7 @@ static umode_t tpdm_cmb_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (drvdata && tpdm_has_cmb_dataset(drvdata))
+	if (drvdata && drvdata->cmb)
 		return attr->mode;
 
 	return 0;
@@ -246,8 +261,10 @@ static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
 		drvdata->dsb->trig_type = false;
 	}
 
-	if (drvdata->cmb)
+	if (drvdata->cmb) {
 		memset(drvdata->cmb, 0, sizeof(struct cmb_dataset));
+		drvdata->cmb->trig_ts = true;
+	}
 }
 
 static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
@@ -388,7 +405,7 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	/* Configure pattern registers */
@@ -415,6 +432,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 		val |= TPDM_CMB_CR_MODE;
 	else
 		val &= ~TPDM_CMB_CR_MODE;
+
+	if (tpdm_has_mcmb_dataset(drvdata)) {
+		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
+		/* Set the lane participates in tghe output pattern */
+		val |= FIELD_PREP(TPDM_CMB_CR_XTRIG_LNSEL,
+			drvdata->cmb->mcmb.trig_lane);
+
+		/* Set the enablement of the lane */
+		val &= ~TPDM_CMB_CR_E_LN;
+		val |= FIELD_PREP(TPDM_CMB_CR_E_LN,
+			drvdata->cmb->mcmb.lane_select);
+	}
+
 	/* Set the enable bit of CMB control register to 1 */
 	val |= TPDM_CMB_CR_ENA;
 	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
@@ -480,7 +510,7 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
@@ -542,12 +572,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 		if (!drvdata->dsb)
 			return -ENOMEM;
 	}
-	if (tpdm_has_cmb_dataset(drvdata) && (!drvdata->cmb)) {
+	if ((tpdm_has_cmb_dataset(drvdata) || tpdm_has_mcmb_dataset(drvdata))
+			&& (!drvdata->cmb)) {
 		drvdata->cmb = devm_kzalloc(drvdata->dev,
 						sizeof(*drvdata->cmb), GFP_KERNEL);
 		if (!drvdata->cmb)
 			return -ENOMEM;
 	}
+
 	tpdm_reset_datasets(drvdata);
 
 	return 0;
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index e08d212642e3..fd9153b92335 100644
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
@@ -256,6 +262,9 @@ struct dsb_dataset {
  * @patt_ts:          Indicates if pattern match for timestamp is enabled.
  * @trig_ts:          Indicates if CTI trigger for timestamp is enabled.
  * @ts_all:           Indicates if timestamp is enabled for all packets.
+ * struct mcmb_dataset
+ * @mcmb_trig_lane:       Save data for trigger lane
+ * @mcmb_lane_select:     Save data for lane enablement
  */
 struct cmb_dataset {
 	u32			trace_mode;
@@ -267,6 +276,10 @@ struct cmb_dataset {
 	bool			patt_ts;
 	bool			trig_ts;
 	bool			ts_all;
+	struct {
+		u8		trig_lane;
+		u8		lane_select;
+	} mcmb;
 };
 
 /**
@@ -324,14 +337,4 @@ struct tpdm_dataset_attribute {
 	enum dataset_mem mem;
 	u32 idx;
 };
-
-static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
-{
-	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
-}
-
-static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
-{
-	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
-}
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
-- 
2.17.1


