Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E00AB78393A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 07:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjHVF13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 01:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbjHVF11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 01:27:27 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D4818F;
        Mon, 21 Aug 2023 22:27:24 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M4DRUD027808;
        Tue, 22 Aug 2023 05:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8I8dvjRKFxdYOty8DWONS1DQJCy1ikvW6teu8kFaMuY=;
 b=NqEn8SZbR1RnhLZIUyUthZnEOa2TWNUC4YTIpOcxPavwlnv4jt+hDmiM37fIzwONplnb
 PJe6zGZ1OhNpCATLJera3Py60xpRCc3xbevtWArDhw4tLM3eQYGX1aW2qVE2vGjod2SM
 b28MKvMyjCK0ySgxVrzdUthpjhThEgGNDh+RIM/mltDJqnC6HjfR8SiajPs4IwcPH4PQ
 5RQjEuDWdLL8KTWAqYOx+SdxY3B8MhUdeZM8lGmqMVM5ZmPT0tFal+4QHlGjjE6hSXU5
 Mu51Vpx9J+mRn+FwF2BHOGsWFybkehuZgMyX5ivEXNKEypsy1AEurVMlFSxu6ggZk5O2 iw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sm3xvak27-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 05:27:03 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37M5R3Zv010494
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 05:27:03 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 21 Aug 2023 22:26:58 -0700
From:   Tao Zhang <quic_taozha@quicinc.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Tao Zhang <quic_taozha@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>
Subject: [PATCH v8 05/13] coresight-tpdm: Initialize DSB subunit configuration
Date:   Tue, 22 Aug 2023 13:26:05 +0800
Message-ID: <1692681973-20764-6-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692681973-20764-1-git-send-email-quic_taozha@quicinc.com>
References: <1692681973-20764-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rl9FzhaxfQuegbuUnTpDvGovxCJUD91u
X-Proofpoint-ORIG-GUID: Rl9FzhaxfQuegbuUnTpDvGovxCJUD91u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_03,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308220043
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DSB is used for monitoring “events”. Events are something that
occurs at some point in time. It could be a state decode, the
act of writing/reading a particular address, a FIFO being empty,
etc. This decoding of the event desired is done outside TPDM.
DSB subunit need to be configured in enablement and disablement.
A struct that specifics associated to dsb dataset is needed. It
saves the configuration and parameters of the dsb datasets. This
change is to add this struct and initialize the configuration of
DSB subunit.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 64 ++++++++++++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h | 18 ++++++++
 2 files changed, 74 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index abaff0b..951ad4d 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -20,23 +20,57 @@
 
 DEFINE_CORESIGHT_DEVLIST(tpdm_devs, "tpdm");
 
+static bool tpdm_has_dsb_dataset(struct tpdm_drvdata *drvdata)
+{
+	return (drvdata->datasets & TPDM_PIDR0_DS_DSB);
+}
+
+static void tpdm_reset_datasets(struct tpdm_drvdata *drvdata)
+{
+	if (tpdm_has_dsb_dataset(drvdata)) {
+		memset(drvdata->dsb, 0, sizeof(struct dsb_dataset));
+
+		drvdata->dsb->trig_ts = true;
+		drvdata->dsb->trig_type = false;
+	}
+}
+
 static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 {
 	u32 val;
 
-	/* Set the enable bit of DSB control register to 1 */
+	val = readl_relaxed(drvdata->base + TPDM_DSB_TIER);
+	/* Set trigger timestamp */
+	if (drvdata->dsb->trig_ts)
+		val |= TPDM_DSB_TIER_XTRIG_TSENAB;
+	else
+		val &= ~TPDM_DSB_TIER_XTRIG_TSENAB;
+	writel_relaxed(val, drvdata->base + TPDM_DSB_TIER);
+
 	val = readl_relaxed(drvdata->base + TPDM_DSB_CR);
+	/* Set trigger type */
+	if (drvdata->dsb->trig_type)
+		val |= TPDM_DSB_CR_TRIG_TYPE;
+	else
+		val &= ~TPDM_DSB_CR_TRIG_TYPE;
+	/* Set the enable bit of DSB control register to 1 */
 	val |= TPDM_DSB_CR_ENA;
 	writel_relaxed(val, drvdata->base + TPDM_DSB_CR);
 }
 
-/* TPDM enable operations */
+/*
+ * TPDM enable operations
+ * The TPDM or Monitor serves as data collection component for various
+ * dataset types. It covers Basic Counts(BC), Tenure Counts(TC),
+ * Continuous Multi-Bit(CMB), Multi-lane CMB(MCMB) and Discrete Single
+ * Bit(DSB). This function will initialize the configuration according
+ * to the dataset type supported by the TPDM.
+ */
 static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	/* Check if DSB datasets is present for TPDM. */
-	if (drvdata->datasets & TPDM_PIDR0_DS_DSB)
+	if (tpdm_has_dsb_dataset(drvdata))
 		tpdm_enable_dsb(drvdata);
 
 	CS_LOCK(drvdata->base);
@@ -76,8 +110,7 @@ static void __tpdm_disable(struct tpdm_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
-	/* Check if DSB datasets is present for TPDM. */
-	if (drvdata->datasets & TPDM_PIDR0_DS_DSB)
+	if (tpdm_has_dsb_dataset(drvdata))
 		tpdm_disable_dsb(drvdata);
 
 	CS_LOCK(drvdata->base);
@@ -110,13 +143,23 @@ static const struct coresight_ops tpdm_cs_ops = {
 	.source_ops	= &tpdm_source_ops,
 };
 
-static void tpdm_init_default_data(struct tpdm_drvdata *drvdata)
+static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 {
 	u32 pidr;
 
 	/*  Get the datasets present on the TPDM. */
 	pidr = readl_relaxed(drvdata->base + CORESIGHT_PERIPHIDR0);
 	drvdata->datasets |= pidr & GENMASK(TPDM_DATASETS - 1, 0);
+
+	if (tpdm_has_dsb_dataset(drvdata) && (!drvdata->dsb)) {
+		drvdata->dsb = devm_kzalloc(drvdata->dev,
+						sizeof(*drvdata->dsb), GFP_KERNEL);
+		if (!drvdata->dsb)
+			return -ENOMEM;
+	}
+	tpdm_reset_datasets(drvdata);
+
+	return 0;
 }
 
 /*
@@ -179,6 +222,7 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_platform_data *pdata;
 	struct tpdm_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret;
 
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata))
@@ -198,6 +242,10 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->base = base;
 
+	ret = tpdm_datasets_setup(drvdata);
+	if (ret)
+		return ret;
+
 	/* Set up coresight component description */
 	desc.name = coresight_alloc_device_name(&tpdm_devs, dev);
 	if (!desc.name)
@@ -214,7 +262,7 @@ static int tpdm_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(drvdata->csdev);
 
 	spin_lock_init(&drvdata->spinlock);
-	tpdm_init_default_data(drvdata);
+
 	/* Decrease pm refcount when probe is done.*/
 	pm_runtime_put(&adev->dev);
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 5438540..f59e751 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -11,8 +11,14 @@
 
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
+#define TPDM_DSB_TIER		(0x784)
+
 /* Enable bit for DSB subunit */
 #define TPDM_DSB_CR_ENA		BIT(0)
+/* Enable bit for DSB subunit trigger type */
+#define TPDM_DSB_CR_TRIG_TYPE		BIT(12)
+/* Enable bit for DSB subunit trigger timestamp */
+#define TPDM_DSB_TIER_XTRIG_TSENAB		BIT(1)
 
 /* TPDM integration test registers */
 #define TPDM_ITATBCNTRL		(0xEF0)
@@ -41,6 +47,16 @@
 #define TPDM_PIDR0_DS_DSB	BIT(1)
 
 /**
+ * struct dsb_dataset - specifics associated to dsb dataset
+ * @trig_ts:          Enable/Disable trigger timestamp.
+ * @trig_type:        Enable/Disable trigger type.
+ */
+struct dsb_dataset {
+	bool			trig_ts;
+	bool			trig_type;
+};
+
+/**
  * struct tpdm_drvdata - specifics associated to an TPDM component
  * @base:       memory mapped base address for this component.
  * @dev:        The device entity associated to this component.
@@ -48,6 +64,7 @@
  * @spinlock:   lock for the drvdata value.
  * @enable:     enable status of the component.
  * @datasets:   The datasets types present of the TPDM.
+ * @dsb         Specifics associated to TPDM DSB.
  */
 
 struct tpdm_drvdata {
@@ -57,6 +74,7 @@ struct tpdm_drvdata {
 	spinlock_t		spinlock;
 	bool			enable;
 	unsigned long		datasets;
+	struct dsb_dataset	*dsb;
 };
 
 #endif  /* _CORESIGHT_CORESIGHT_TPDM_H */
-- 
2.7.4

