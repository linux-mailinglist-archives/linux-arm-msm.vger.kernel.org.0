Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71D672B8C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 09:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbjFLHjb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 03:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbjFLHja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 03:39:30 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFCE109;
        Mon, 12 Jun 2023 00:38:46 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C6K3Zq015214;
        Mon, 12 Jun 2023 07:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=mztJbhyh0oLqPj0dH/aNfX5v2+epQ9BWtoUI9j1lsLY=;
 b=QBdXVde+iHYyRvUEnw+eHz2hmgMPT+4Nz1mn6mK8X5o0o4wADgIig+UnRDkOJlhLlARE
 7r6O3lfCSBhUxVCIgtdgfcTcaaAcrH71BJ/ww1l2EwSoy/6soljTiOkj1Wz/EpdO0H75
 Vxxu8wlWQxXH4k9ri7MA5LgRE7WjnpG4zMjjMWyCPe9IfnAGZxjtdiOtCBPFZPitwpEQ
 gIt9Q38zOdIoCoa5tVAWoTUDq1xJuPL23XbcjkKV/76ixq14DTRa8w3AD97nXUkhNVb/
 9gvZY5yf9NDiAtQ8ZQXXHx1DoXB3zGwQfX9Cd757nRgmFTSov1H4ITGcwREnuaRaBGYz hw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4hjbtk1c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 07:09:13 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35C79CfM007232
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 07:09:12 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 12 Jun 2023 00:09:06 -0700
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
Subject: [PATCH v5 11/13] coresight-tpdm: Add nodes for timestamp request
Date:   Mon, 12 Jun 2023 15:07:44 +0800
Message-ID: <1686553666-5811-12-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1686553666-5811-1-git-send-email-quic_taozha@quicinc.com>
References: <1686553666-5811-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qZrCPVLdwxra-ZZaTydYwrFYgM6BwWkf
X-Proofpoint-GUID: qZrCPVLdwxra-ZZaTydYwrFYgM6BwWkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_04,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306120060
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes to configure the timestamp request based on input
pattern match. Each TPDM that support DSB subunit has maximum of
n(n<7) TPR registers to configure value for timestamp request
based on input pattern match. Eight 32 bit registers providing
DSB interface timestamp request  pattern match comparison. And
each TPDM that support DSB subunit has maximum of m(m<7) TPMR
registers to configure pattern mask for timestamp request. Eight
32 bit registers providing DSB interface timestamp request
pattern match mask generation. Add nodes to enable/disable
pattern timestamp and set pattern timestamp type.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |  46 +++++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 187 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h       |  14 ++
 3 files changed, 242 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index 55ec81d..6e1b246 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -120,3 +120,49 @@ Description:
 
 		Where:
 		<integer1> : Index number of XPMR register,  the range is 0 to 7
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt_val
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the pattern value of DSB tpdm. Read
+		the pattern value of DSB tpdm.
+
+		Accepts the following two values.
+		value 1: Index number of TPR register, the range is 0 to 7
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt_mask
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the pattern mask of DSB tpdm. Read
+		the pattern mask of DSB tpdm.
+
+		Accepts the following two values.
+		value 1: Index number of TPMR register, the range is 0 to 7
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt_ts
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the pattern timestamp of DSB tpdm. Read
+		the pattern timestamp of DSB tpdm.
+
+		Accepts only one of the 2 values -  0 or 1.
+		0 : Disable DSB pattern timestamp.
+		1 : Enable DSB pattern timestamp.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt_type
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the pattern type of DSB tpdm. Read
+		the pattern type of DSB tpdm.
+
+		Accepts only one of the 2 values -  0 or 1.
+		0 : Set the DSB pattern type to value.
+		1 : Set the DSB pattern type to toggle.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 974e63f..1aff244 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -69,6 +69,27 @@ static void set_dsb_perf_mode(struct tpdm_drvdata *drvdata, u32 *val)
 		*val &= ~TPDM_DSB_CR_MODE;
 }
 
+static void set_dsb_tier(struct tpdm_drvdata *drvdata, u32 *val)
+{
+	/* Set pattern timestamp type and enablement */
+	if (drvdata->dsb->patt_ts) {
+		*val |= TPDM_DSB_TIER_PATT_TSENAB;
+		if (drvdata->dsb->patt_type)
+			*val |= TPDM_DSB_TIER_PATT_TYPE;
+		else
+			*val &= ~TPDM_DSB_TIER_PATT_TYPE;
+	} else {
+		*val &= ~TPDM_DSB_TIER_PATT_TSENAB;
+	}
+
+	/* Set trigger timestamp */
+	if (drvdata->dsb->trig_ts)
+		*val |= TPDM_DSB_TIER_XTRIG_TSENAB;
+	else
+		*val &= ~TPDM_DSB_TIER_XTRIG_TSENAB;
+
+}
+
 static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
@@ -81,6 +102,10 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 			   drvdata->base + TPDM_DSB_EDCMR(i));
 
 	for (i = 0; i < TPDM_DSB_MAX_PATT; i++) {
+		writel_relaxed(drvdata->dsb->patt_val[i],
+			    drvdata->base + TPDM_DSB_TPR(i));
+		writel_relaxed(drvdata->dsb->patt_mask[i],
+			    drvdata->base + TPDM_DSB_TPMR(i));
 		writel_relaxed(drvdata->dsb->trig_patt_val[i],
 			    drvdata->base + TPDM_DSB_XPR(i));
 		writel_relaxed(drvdata->dsb->trig_patt_mask[i],
@@ -88,11 +113,7 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 	}
 
 	val = readl_relaxed(drvdata->base + TPDM_DSB_TIER);
-	/* Set trigger timestamp */
-	if (drvdata->dsb->trig_ts)
-		val |= TPDM_DSB_TIER_XTRIG_TSENAB;
-	else
-		val &= ~TPDM_DSB_TIER_XTRIG_TSENAB;
+	set_dsb_tier(drvdata, &val);
 	writel_relaxed(val, drvdata->base + TPDM_DSB_TIER);
 
 	val = readl_relaxed(drvdata->base + TPDM_DSB_CR);
@@ -448,6 +469,158 @@ static ssize_t dsb_edge_ctrl_mask_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(dsb_edge_ctrl_mask);
 
+static ssize_t dsb_patt_val_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	ssize_t size = 0;
+	unsigned long bytes;
+	int i = 0;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = 0; i < TPDM_DSB_MAX_PATT; i++) {
+		bytes = sysfs_emit_at(buf, size,
+				  "Index: 0x%x Value: 0x%x\n", i,
+				  drvdata->dsb->patt_val[i]);
+		if (bytes <= 0)
+			break;
+		size += bytes;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+
+/*
+ * value 1: Index of TPR register
+ * value 2: Value need to be written
+ */
+static ssize_t dsb_patt_val_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long index, val;
+
+	if (sscanf(buf, "%lx %lx", &index, &val) != 2)
+		return -EINVAL;
+	if (index >= TPDM_DSB_MAX_PATT)
+		return -EPERM;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->patt_val[index] = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_patt_val);
+
+static ssize_t dsb_patt_mask_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	ssize_t size = 0;
+	unsigned long bytes;
+	int i = 0;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = 0; i < TPDM_DSB_MAX_PATT; i++) {
+		bytes = sysfs_emit_at(buf, size,
+				  "Index: 0x%x Value: 0x%x\n", i,
+				  drvdata->dsb->patt_mask[i]);
+		if (bytes <= 0)
+			break;
+		size += bytes;
+	}
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+
+/*
+ * value 1: Index of TPMR register
+ * value 2: Value need to be written
+ */
+static ssize_t dsb_patt_mask_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long index, val;
+
+	if (sscanf(buf, "%lx %lx", &index, &val) != 2)
+		return -EINVAL;
+	if (index >= TPDM_DSB_MAX_PATT)
+		return -EPERM;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->patt_mask[index] = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_patt_mask);
+
+static ssize_t dsb_patt_ts_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			 (unsigned int)drvdata->dsb->patt_ts);
+}
+
+/*
+ * value 1: Enable/Disable DSB pattern timestamp
+ */
+static ssize_t dsb_patt_ts_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if ((kstrtoul(buf, 0, &val)) || (val & ~1UL))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->patt_ts = !!val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_patt_ts);
+
+static ssize_t dsb_patt_type_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n",
+			 (unsigned int)drvdata->dsb->patt_type);
+}
+
+/*
+ * value 1: Set DSB pattern type
+ */
+static ssize_t dsb_patt_type_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if ((kstrtoul(buf, 0, &val)) || (val & ~1UL))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->patt_type = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_patt_type);
+
 static ssize_t dsb_trig_patt_val_show(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
@@ -606,6 +779,10 @@ static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
 	&dev_attr_dsb_edge_ctrl.attr,
 	&dev_attr_dsb_edge_ctrl_mask.attr,
+	&dev_attr_dsb_patt_val.attr,
+	&dev_attr_dsb_patt_mask.attr,
+	&dev_attr_dsb_patt_ts.attr,
+	&dev_attr_dsb_patt_type.attr,
 	&dev_attr_dsb_trig_patt_val.attr,
 	&dev_attr_dsb_trig_patt_mask.attr,
 	&dev_attr_dsb_trig_ts.attr,
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 87d946e..3169fb5 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -12,6 +12,8 @@
 /* DSB Subunit Registers */
 #define TPDM_DSB_CR		(0x780)
 #define TPDM_DSB_TIER		(0x784)
+#define TPDM_DSB_TPR(n)		(0x788 + (n * 4))
+#define TPDM_DSB_TPMR(n)	(0x7A8 + (n * 4))
 #define TPDM_DSB_XPR(n)		(0x7C8 + (n * 4))
 #define TPDM_DSB_XPMR(n)	(0x7E8 + (n * 4))
 #define TPDM_DSB_EDCR(n)	(0x808 + (n * 4))
@@ -24,8 +26,12 @@
 /* Enable bit for DSB subunit trigger type */
 #define TPDM_DSB_CR_TRIG_TYPE		BIT(12)
 
+/* Enable bit for DSB subunit pattern timestamp */
+#define TPDM_DSB_TIER_PATT_TSENAB		BIT(0)
 /* Enable bit for DSB subunit trigger timestamp */
 #define TPDM_DSB_TIER_XTRIG_TSENAB		BIT(1)
+/* Bit for DSB subunit pattern type */
+#define TPDM_DSB_TIER_PATT_TYPE		BIT(2)
 
 /* DSB programming modes */
 /* Test mode control bit*/
@@ -87,8 +93,12 @@
  * @mode:             DSB programming mode
  * @edge_ctrl:        Save value for edge control
  * @edge_ctrl_mask:   Save value for edge control mask
+ * @patt_val:         Save value for pattern
+ * @patt_mask:        Save value for pattern mask
  * @trig_patt_val:    Save value for trigger pattern
  * @trig_patt_mask:   Save value for trigger pattern mask
+ * @patt_ts:          Enable/Disable pattern timestamp
+ * @patt_type:        Set pattern type
  * @trig_ts:          Enable/Disable trigger timestamp.
  * @trig_type:        Enable/Disable trigger type.
  */
@@ -96,8 +106,12 @@ struct dsb_dataset {
 	u32				mode;
 	u32				edge_ctrl[TPDM_DSB_MAX_EDCR];
 	u32				edge_ctrl_mask[TPDM_DSB_MAX_EDCMR];
+	u32				patt_val[TPDM_DSB_MAX_PATT];
+	u32				patt_mask[TPDM_DSB_MAX_PATT];
 	u32				trig_patt_val[TPDM_DSB_MAX_PATT];
 	u32				trig_patt_mask[TPDM_DSB_MAX_PATT];
+	bool			patt_ts;
+	bool			patt_type;
 	bool			trig_ts;
 	bool			trig_type;
 };
-- 
2.7.4

