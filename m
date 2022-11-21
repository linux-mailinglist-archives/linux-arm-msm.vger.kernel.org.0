Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9CD631B43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 09:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiKUIXh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 03:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiKUIXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 03:23:21 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BCEE0D2;
        Mon, 21 Nov 2022 00:23:03 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AL7V7Q6024892;
        Mon, 21 Nov 2022 08:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Nm7prWyI8I4hMAjDNiVdd7os7xRsIdhNpdZLoR5yfWQ=;
 b=M+qfbA/4MrF21PxgTYa6ANjM4QbwJneO9sb6tcl4cVlPp6D1sORyx14gdKq0Y5vybmih
 0n48WwumdNEVhBDMTIzIy9bSJx2RqLb7j/r3ueNoHNhaVgjsHLSlvCe2Xuzgl2whdBFs
 497g0wUA8imu4Qp9a0GAgfFob+xzhygkMi/FgO0oA20Ac/z0HHwEK2kRR3H0wRHrEIYE
 RGnAK3HUMukWjIsy0idSmo5mLJ3iH/MxU9aQ3dkgAzbL7STZJ57u1TPSpek6l13vPQ2g
 RywU3Thld9hNX2rwqFbTncuBGfC0WgqLVITTjIXM0sfHk2H7i+5JUfctt8ZttD+LTYq1 EA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrut3uu8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 08:22:52 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AL8Mp5K028393
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Nov 2022 08:22:51 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 21 Nov 2022 00:22:46 -0800
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
        <linux-arm-msm@vger.kernel.org>, <bjorn.andersson@linaro.org>
Subject: [PATCH v1 7/9] coresight-tpdm: Add nodes for dsb element creation
Date:   Mon, 21 Nov 2022 16:21:11 +0800
Message-ID: <1669018873-4718-8-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669018873-4718-1-git-send-email-quic_taozha@quicinc.com>
References: <1669018873-4718-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GPHhk3FlcbuEXN2DajPSvf86It0FioF7
X-Proofpoint-ORIG-GUID: GPHhk3FlcbuEXN2DajPSvf86It0FioF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_05,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211210065
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the nodes to set value for DSB edge control and DSB edge
control mask. Each DSB subunit TPDM has maximum of n(n<16) EDCR
resgisters to configure edge control. DSB edge detection control
00: Rising edge detection
01: Falling edge detection
10: Rising and falling edge detection (toggle detection)
And each DSB subunit TPDM has maximum of m(m<8) ECDMR registers to
configure mask. Eight 32 bit registers providing DSB interface
edge detection mask control.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 142 ++++++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h |  14 +++
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 8872e3a..b0cc161 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -39,7 +39,14 @@ static umode_t tpdm_dsb_is_visible(struct kobject *kobj,
 
 static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 {
-	u32 val, mode;
+	u32 val, mode, i;
+
+	for (i = 0; i < TPDM_DSB_MAX_EDCR; i++)
+		writel_relaxed(drvdata->dsb->edge_ctrl[i],
+			   drvdata->base + TPDM_DSB_EDCR(i));
+	for (i = 0; i < TPDM_DSB_MAX_EDCMR; i++)
+		writel_relaxed(drvdata->dsb->edge_ctrl_mask[i],
+			   drvdata->base + TPDM_DSB_EDCMR(i));
 
 	val = readl_relaxed(drvdata->base + TPDM_DSB_TIER);
 	/* Set trigger timestamp */
@@ -299,6 +306,137 @@ static ssize_t dsb_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(dsb_mode);
 
+static ssize_t dsb_edge_ctrl_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	ssize_t size = 0;
+	int i;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = 0; i < TPDM_DSB_MAX_EDCR; i++) {
+		size += sysfs_emit_at(buf, size,
+				  "Index:0x%x Val:0x%x\n", i,
+				  drvdata->dsb->edge_ctrl[i]);
+	}
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+
+/*
+ * value 1: Start EDCR register number
+ * value 2: End EDCR register number
+ * value 3: The value need to be written
+ * The EDCR registers can include up to 16 32-bit registers, and each
+ * one can be configured to control up to 16 edge detections(2 bits
+ * control one edge detection). So a total 256 edge detections can be
+ * configured. So the starting number(value 1) and ending number(value 2)
+ * cannot be greater than 256, and value 1 should be less than value 2.
+ * The following values are the rage of value 3.
+ * 0 - Rising edge detection
+ * 1 - Falling edge detection
+ * 2 - Rising and falling edge detection (toggle detection)
+ */
+static ssize_t dsb_edge_ctrl_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf,
+					size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long start, end, edge_ctrl;
+	uint32_t val;
+	int i, index, bit, reg;
+
+	if (sscanf(buf, "%lx %lx %lx", &start, &end, &edge_ctrl) != 3)
+		return -EINVAL;
+	if ((start >= TPDM_DSB_MAX_LINES) || (end >= TPDM_DSB_MAX_LINES) ||
+	    edge_ctrl > 0x2)
+		return -EPERM;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = start; i <= end; i++) {
+		/*
+		 * The 32-bit register has 32 bits(NUM_OF_BITS).
+		 * Each one register can be configured to control 16
+		 * (NUM_OF_BITS / 2) edge detectioins.
+		 */
+		reg = i / (NUM_OF_BITS / 2);
+		index = i % (NUM_OF_BITS / 2);
+		bit = index * 2;
+
+		val = drvdata->dsb->edge_ctrl[reg];
+		val &= ~GENMASK((bit + 1), bit);
+		val |= (edge_ctrl << bit);
+		drvdata->dsb->edge_ctrl[reg] = val;
+	}
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_edge_ctrl);
+
+static ssize_t dsb_edge_ctrl_mask_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	ssize_t size = 0;
+	int i;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = 0; i < TPDM_DSB_MAX_EDCR / 2; i++) {
+		size += sysfs_emit_at(buf, size,
+				  "Index:0x%x Val:0x%x\n", i,
+				  drvdata->dsb->edge_ctrl_mask[i]);
+	}
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+
+/*
+ * value 1: Start EDCMR register number
+ * value 2: End EDCMR register number
+ * value 3: The value need to be written
+ */
+static ssize_t dsb_edge_ctrl_mask_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf,
+					     size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long start, end, val;
+	u32 set;
+	int i, index, reg;
+
+	if (sscanf(buf, "%lx %lx %lx", &start, &end, &val) != 3)
+		return -EINVAL;
+	if ((start >= TPDM_DSB_MAX_LINES) || (end >= TPDM_DSB_MAX_LINES)
+		|| (val < 0) || (val > 1))
+		return -EPERM;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = start; i <= end; i++) {
+		/*
+		 * The 32-bit register has 32 bits(NUM_OF_BITS).
+		 * Each one register can be configured to control 32
+		 * (NUM_OF_BITS) edge detectioin masks.
+		 */
+		reg = i / NUM_OF_BITS;
+		index = (i % NUM_OF_BITS);
+
+		set = drvdata->dsb->edge_ctrl_mask[reg];
+		if (val)
+			set |= BIT(index);
+		else
+			set &= ~BIT(index);
+		drvdata->dsb->edge_ctrl_mask[reg] = set;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_edge_ctrl_mask);
+
 static ssize_t dsb_trig_type_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
@@ -370,6 +508,8 @@ static ssize_t dsb_trig_ts_store(struct device *dev,
 static DEVICE_ATTR_RW(dsb_trig_ts);
 static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
+	&dev_attr_dsb_edge_ctrl.attr,
+	&dev_attr_dsb_edge_ctrl_mask.attr,
 	&dev_attr_dsb_trig_ts.attr,
 	&dev_attr_dsb_trig_type.attr,
 	NULL,
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index de1492c..bd9d006 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -12,6 +12,8 @@
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
+#define TPDM_DSB_EDCR(n)	(0x808 + (n * 4))
+#define TPDM_DSB_EDCMR(n)	(0x848 + (n * 4))
 
 /* Enable bit for DSB subunit */
 #define TPDM_DSB_CR_ENA		BIT(0)
@@ -30,6 +32,8 @@
 #define TPDM_DSB_TEST_MODE		GENMASK(11, 9)
 #define TPDM_DSB_HPSEL		GENMASK(6, 2)
 
+#define NUM_OF_BITS		32
+
 /* TPDM integration test registers */
 #define TPDM_ITATBCNTRL		(0xEF0)
 #define TPDM_ITCNTRL		(0xF00)
@@ -56,14 +60,24 @@
 #define TPDM_PIDR0_DS_IMPDEF	BIT(0)
 #define TPDM_PIDR0_DS_DSB	BIT(1)
 
+#define TPDM_DSB_MAX_LINES	256
+/* MAX number of EDCR registers */
+#define TPDM_DSB_MAX_EDCR	16
+/* MAX number of EDCMR registers */
+#define TPDM_DSB_MAX_EDCMR	8
+
 /**
  * struct dsb_dataset - specifics associated to dsb dataset
  * @mode:             DSB programming mode
+ * @edge_ctrl:        Save value for edge control
+ * @edge_ctrl_mask:   Save value for edge control mask
  * @trig_ts:          Enable/Disable trigger timestamp.
  * @trig_type:        Enable/Disable trigger type.
  */
 struct dsb_dataset {
 	u32				mode;
+	u32				edge_ctrl[TPDM_DSB_MAX_EDCR];
+	u32				edge_ctrl_mask[TPDM_DSB_MAX_EDCMR];
 	bool			trig_ts;
 	bool			trig_type;
 };
-- 
2.7.4

