Return-Path: <linux-arm-msm+bounces-1277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 251717F23DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 03:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1910B21A47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 02:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DB21548E;
	Tue, 21 Nov 2023 02:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pM4cicJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D63C8;
	Mon, 20 Nov 2023 18:25:45 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL1kDE3008226;
	Tue, 21 Nov 2023 02:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=AH2wMuiadUemMTkauS3+aY0/zK78h55v7GtpRW91DLQ=;
 b=pM4cicJrC870Vfsc9zJzArHtHoqIE+rRc3sx1IA/rNphiDf6sdYGtU/Wd6dVj6XgHouB
 CD4AOt2hzvGuZ3CzmPEBUdcFwNW+pgKyO/HTQ7CWoxxnQji7JP4gx4PJiVztEC+vkw48
 VDxOrvZLEVoB8EPdLOgJNnKuRMP0JlWraY8TnVtlUk9LTsNmL4/hVcGKeNNCvguLDEL+
 m4y1+E+YvsvXAkxPNxuknhM37+VLnAq2Iw76c6ljAsrRw1hjrPrUQsJ034cMeca25Kw9
 /zyreXpOcAu5PHAtFCD2ehAi3QjxKGvns02d4McnY+b+BcRofniV3XWQs8bQIWvumEdo ew== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugdxmgms9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:25:34 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL2PYE6029839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 02:25:34 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 18:25:29 -0800
From: Tao Zhang <quic_taozha@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <andersson@kernel.org>
Subject: [PATCH v3 3/8] coresight-tpdm: Add CMB dataset support
Date: Tue, 21 Nov 2023 10:24:49 +0800
Message-ID: <1700533494-19276-4-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700533494-19276-1-git-send-email-quic_taozha@quicinc.com>
References: <1700533494-19276-1-git-send-email-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: atfjSviKqLt4QLHPcS7ncDO7QfkiVKaI
X-Proofpoint-ORIG-GUID: atfjSviKqLt4QLHPcS7ncDO7QfkiVKaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311210015

CMB (continuous multi-bit) is one of TPDM's dataset type. CMB subunit
can be enabled for data collection by writing 1 to the first bit of
CMB_CR register. This change is to add enable/disable function for
CMB dataset by writing CMB_CR register.

Reviewed-by: James Clark <james.clark@arm.com>
Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
Signed-off-by: Jinlong Mao <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 31 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h |  8 +++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 97654aa4b772..c8bb38822e08 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -131,6 +131,11 @@ static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
 	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
 }
 
+static bool tpdm_has_cmb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_CMB);
+}
+
 static umode_t tpdm_dsb_is_visible(struct kobject *kobj,
 				   struct attribute *attr, int n)
 {
@@ -267,6 +272,17 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 	writel_relaxed(val, drvdata->base + TPDM_DSB_CR);
 }
 
+static void tpdm_enable_cmb(struct tpdm_drvdata *drvdata)
+{
+	u32 val;
+
+	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
+	val |= TPDM_CMB_CR_ENA;
+
+	/* Set the enable bit of CMB control register to 1 */
+	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
+}
+
 /*
  * TPDM enable operations
  * The TPDM or Monitor serves as data collection component for various
@@ -281,6 +297,8 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 
 	if (tpdm_has_dsb_dataset(drvdata))
 		tpdm_enable_dsb(drvdata);
+	if (tpdm_has_cmb_dataset(drvdata))
+		tpdm_enable_cmb(drvdata);
 
 	CS_LOCK(drvdata->base);
 }
@@ -314,6 +332,17 @@ static void tpdm_disable_dsb(struct tpdm_drvdata *drvdata)
 	writel_relaxed(val, drvdata->base + TPDM_DSB_CR);
 }
 
+static void tpdm_disable_cmb(struct tpdm_drvdata *drvdata)
+{
+	u32 val;
+
+	val = readl_relaxed(drvdata->base + TPDM_CMB_CR);
+	val &= ~TPDM_CMB_CR_ENA;
+
+	/* Set the enable bit of CMB control register to 0 */
+	writel_relaxed(val, drvdata->base + TPDM_CMB_CR);
+}
+
 /* TPDM disable operations */
 static void __tpdm_disable(struct tpdm_drvdata *drvdata)
 {
@@ -321,6 +350,8 @@ static void __tpdm_disable(struct tpdm_drvdata *drvdata)
 
 	if (tpdm_has_dsb_dataset(drvdata))
 		tpdm_disable_dsb(drvdata);
+	if (tpdm_has_cmb_dataset(drvdata))
+		tpdm_disable_cmb(drvdata);
 
 	CS_LOCK(drvdata->base);
 }
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 4115b2a17b8d..0098c58dfdd6 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -9,6 +9,12 @@
 /* The max number of the datasets that TPDM supports */
 #define TPDM_DATASETS       7
 
+/* CMB Subunit Registers */
+#define TPDM_CMB_CR		(0xA00)
+
+/* Enable bit for CMB subunit */
+#define TPDM_CMB_CR_ENA		BIT(0)
+
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
@@ -79,10 +85,12 @@
  *
  * PERIPHIDR0[0] : Fix to 1 if ImplDef subunit present, else 0
  * PERIPHIDR0[1] : Fix to 1 if DSB subunit present, else 0
+ * PERIPHIDR0[2] : Fix to 1 if CMB subunit present, else 0
  */
 
 #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
 #define TPDM_PIDR0_DS_DSB	BIT(1)
+#define TPDM_PIDR0_DS_CMB	BIT(2)
 
 #define TPDM_DSB_MAX_LINES	256
 /* MAX number of EDCR registers */
-- 
2.17.1


