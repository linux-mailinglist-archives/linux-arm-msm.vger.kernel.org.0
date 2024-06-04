Return-Path: <linux-arm-msm+bounces-21545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19F28FA860
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 04:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E7541C22653
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 02:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0D013D608;
	Tue,  4 Jun 2024 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kn0hlNw6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D6E2AEE9;
	Tue,  4 Jun 2024 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717469311; cv=none; b=MlqqCg1UwqVBvKnNLI9IZyB5Tpyb9yTDtKEt+zcU96fAX0fh2ujxfys7A/pUAkDRRt44HbIOlnknZUpuHqEMyrGufHVbmBh/O7CvrX70Hzfr97U1It9FnZ+FnJ6Hx1gsRl4fl9dMjNpmHCqd1WUEOzFMaXMKOgvzL9YdkdjAMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717469311; c=relaxed/simple;
	bh=ElWhTrTv6vqrk3Bk/ev8GKt9yQ3nsC+69+v+r5dNfV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrHkfxa0cOUxwAEDSAiWxz4yEUav1DBDZvp+CnVjVIZgfhv8ifeK4DTqxQpq2fRXWbr6DiMKU/vkdZjLJitwqLH/ZrvlkZt24TQWJ9qm0wIoL/lCUlvV4IkgPmY0Uh+tnN7H3rg2Y29jH+oC+6Wx6WeTf81TX5vub2bR0D5XzO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kn0hlNw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4540CwXW022087;
	Tue, 4 Jun 2024 02:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eOplyUkiGyLLrNguAbbzWx2E
	dMmNIm0LngHxKECtTM0=; b=kn0hlNw60CchEr75bKtweT+OqewlnP2i9CfjFwRF
	iPTjTED63GBV6X0R7MGSkb8EYcbqHZ+Dgddr/L9IYN4V16MeKQD8aLrvqxaXp1yP
	nFri4AowoGWqg/od700DQXKJtiNVGfv9U1q4kngYX7zICXnNRPq6+won1KJsrglq
	LCa1VZAokmZ3jq0JFodsbRsSwQ/f6rue7zavvCx9h6lqOOhWHtrF/wB+8BwCWOHT
	HH8Mrruw35XTQ4oGJb96AEbTFrhNvySq6uH/sk1Tvyy6VEQoWBTluyP/VxHVLvtB
	w3csHKAAWIKwTux9XyUxDBWLAjZwwdoao4qHACdyfzgFCw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wnhgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 02:48:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4542mJol017702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 02:48:19 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 19:48:16 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Jie Gan
	<quic_jiegan@quicinc.com>
Subject: [PATCH 1/3] coresight-tpdm: Add MCMB dataset support
Date: Tue, 4 Jun 2024 10:47:39 +0800
Message-ID: <20240604024741.3550-2-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240604024741.3550-1-quic_taozha@quicinc.com>
References: <20240604024741.3550-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 79-8iSfLcaYi5WlYQHzhLu_foF5jdum_
X-Proofpoint-ORIG-GUID: 79-8iSfLcaYi5WlYQHzhLu_foF5jdum_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040021

MCMB (Multi-lane CMB) is a special form of CMB dataset type. MCMB
subunit TPDM has the same number and usage of registers as CMB
subunit TPDM. MCMB subunit can be enabled for data collection by
writing 1 to the first bit of CMB_CR register. The difference is
that MCMB subunit TPDM needs to select the lane and enable it in
using it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c |  4 +-
 drivers/hwtracing/coresight/coresight-tpdm.c | 39 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-tpdm.h | 27 +++++++++++++-
 3 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 2d35059ec697..e144e3466bea 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/amba/bus.h>
@@ -72,7 +72,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 		rc = fwnode_property_read_u8(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-size", &drvdata->dsb_esize);
 	}
-	if (tpdm_has_cmb_dataset(tpdm_data)) {
+	if (tpdm_has_cmb_dataset(tpdm_data) || tpdm_has_mcmb_dataset(tpdm_data)) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index a9708ab0d488..2989fa4787fe 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
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
@@ -541,6 +559,17 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 		if (!drvdata->cmb)
 			return -ENOMEM;
 	}
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
 	tpdm_reset_datasets(drvdata);
 
 	return 0;
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index f3a8f56d0fe7..0c4e216790e3 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
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
@@ -244,6 +250,16 @@ struct dsb_dataset {
 	bool			trig_type;
 };
 
+/**
+ * struct mcmb_dataset
+ * @mcmb_trig_lane:       Save data for trigger lane
+ * @mcmb_lane_select:     Save data for lane enablement
+ */
+struct mcmb_dataset {
+	uint8_t		mcmb_trig_lane;
+	uint8_t		mcmb_lane_select;
+};
+
 /**
  * struct cmb_dataset
  * @trace_mode:       Dataset collection mode
@@ -255,6 +271,7 @@ struct dsb_dataset {
  * @patt_ts:          Indicates if pattern match for timestamp is enabled.
  * @trig_ts:          Indicates if CTI trigger for timestamp is enabled.
  * @ts_all:           Indicates if timestamp is enabled for all packets.
+ * @mcmb:             Save data for mcmb tpdm
  */
 struct cmb_dataset {
 	u32			trace_mode;
@@ -266,6 +283,7 @@ struct cmb_dataset {
 	bool			patt_ts;
 	bool			trig_ts;
 	bool			ts_all;
+	struct mcmb_dataset	*mcmb;
 };
 
 /**
@@ -333,4 +351,9 @@ static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
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
2.17.1


