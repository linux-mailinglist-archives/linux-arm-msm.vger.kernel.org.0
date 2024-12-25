Return-Path: <linux-arm-msm+bounces-43293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA89FC4D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 11:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24DA97A185A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 10:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7741ADFE3;
	Wed, 25 Dec 2024 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CIz/tSeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0619258B;
	Wed, 25 Dec 2024 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735123298; cv=none; b=Jqvxn3LIBN6cSOI+0F74UYoG5JplO8oKmMfz0iSHF/Re1htROG8j/EGyADcWJ5NN3NzU7c1GEXgbAG5/m9CfPsAKpCeW/oNs4DW8Vz8Xx9SEn7CWkewlrMRi5BAJ4jz9d7wbVC1r7dMLpnUDYmOrsa5fFai2CRQn5VUoTBeFfFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735123298; c=relaxed/simple;
	bh=rUqK90WbBEffME/3rQNV1gjnU/9RMDX62jLR1lx2TTI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQCNF2O6GeDuUJnJ90zBrYAtxiJ2pmsV793KCVdUeocaiRfOM8332gpzq5bsPaTzz0rU24rpF9SgNAy7iCMC4vN0pFMn2qKXrjgMKPRWiM/EFsc/zTTXlDK4G06PWByZNz9L+jkiQ1c9bg+rSAN5lhCAJAtcrSkLcp5oPJSnK5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CIz/tSeV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP3iU7i000530;
	Wed, 25 Dec 2024 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlOoiJCMGyMIEh0nKCSb1Xs9
	6ze5Oz0wkDgGwqcYxas=; b=CIz/tSeVzNCNN9vdLxlOwXn/V0HIwagMNqV/sxJ9
	enoSrpX13S6RlK2t7AjOmDkCxYO7SMMLSsAoWlFq6/nxp9K8eFsAmXIdqWseCc5W
	bd81chdQbThabDNBEkKdsniTOo/uCsF6mVAgLtDnhjgqlOzSzMkOhAx0PnhNFXvi
	veoeWisr5ko4U/kDYvpD3W912PDBDc2ddtVt7R12d78//yXVKMSgXpRN+VFN08O1
	x3Q26tVlFnz+y6AISOk+gPPduzeJibitoHPSZ16AYGnRBmrOFiDY9oKAC3+lgtDQ
	/yuBdC0DCU9sQxZn38Gw+ooQO03tTEcXTvNUhSg3xGhrxg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rad81p8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPAfQOp013300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 10:41:26 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 02:41:23 -0800
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
Subject: [PATCH v3 1/3] coresight-tpdm: Add MCMB dataset support
Date: Wed, 25 Dec 2024 18:41:05 +0800
Message-ID: <20241225104107.13425-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241225104107.13425-1-quic_jinlmao@quicinc.com>
References: <20241225104107.13425-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: Zxm-AwyLD1OUsrcyXJExgVmMyHStQcHI
X-Proofpoint-ORIG-GUID: Zxm-AwyLD1OUsrcyXJExgVmMyHStQcHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412250094

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
 drivers/hwtracing/coresight/coresight-tpdm.c | 40 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tpdm.h | 27 +++++++------
 3 files changed, 54 insertions(+), 20 deletions(-)

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
index b7d99e91ab84..525f671dd97d 100644
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
@@ -388,7 +403,7 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	/* Configure pattern registers */
@@ -415,6 +430,19 @@ static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
 		val |= TPDM_CMB_CR_MODE;
 	else
 		val &= ~TPDM_CMB_CR_MODE;
+
+	if (tpdm_has_mcmb_dataset(drvdata)) {
+		val &= ~TPDM_CMB_CR_XTRIG_LNSEL;
+		/* Set the lane participates in the output pattern */
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
@@ -480,7 +508,7 @@ static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
 {
 	u32 val;
 
-	if (!tpdm_has_cmb_dataset(drvdata))
+	if (!drvdata->cmb)
 		return;
 
 	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
@@ -542,12 +570,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
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
index e08d212642e3..0dac1a061ea4 100644
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
@@ -28,6 +28,10 @@
 #define TPDM_CMB_CR_ENA		BIT(0)
 /* Trace collection mode for CMB subunit */
 #define TPDM_CMB_CR_MODE	BIT(1)
+/* MCMB trigger lane select */
+#define TPDM_CMB_CR_XTRIG_LNSEL		GENMASK(20, 18)
+/* MCMB lane enablement */
+#define TPDM_CMB_CR_E_LN		GENMASK(17, 10)
 /* Timestamp control for pattern match */
 #define TPDM_CMB_TIER_PATT_TSENAB	BIT(0)
 /* CMB CTI timestamp request */
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


