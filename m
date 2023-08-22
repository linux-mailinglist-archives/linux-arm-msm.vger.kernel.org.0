Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19316783958
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 07:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjHVF2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 01:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjHVF2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 01:28:40 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73923196;
        Mon, 21 Aug 2023 22:28:13 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M4sMFd027352;
        Tue, 22 Aug 2023 05:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=EFSYw29FSHvQluW4DWmKtV6V8Ljytm9aQK9VFRsRhuY=;
 b=Z0/b011YvLFKfrov54rejV0279EhMJ8wemOHJ46fsfrnlskeCeQ5W1C3WiCPsxEqLgKw
 ox0X+EM31R5htc0Jpn5iaVPGuTVgmtbMabp8OFyT/eWFjxtbVYDTr1F4xnHlHEUonQXP
 zzNrldaHBNLV2b0kLHawbUfGjXJaoh7+cn+UXo8c1gDgXr7T7yLlk9yVZf6m8n01pDlG
 rnhMOOIpkNuK1ZGHGjZno4DfLEvk0GldCkN1qJqXZnIY0NB+ow721nXa6ckNXIZpQhf5
 EvEP0iTS0nA90/VWzp1ODADW8ChOF51/4dXr+h8lNBcg9QKF7vjT7x/1wltGULgt7H2j sQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sm6uuj1kk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 05:27:32 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37M5RVTl007772
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Aug 2023 05:27:31 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 21 Aug 2023 22:27:26 -0700
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
Subject: [PATCH v8 11/13] coresight-tpdm: Add nodes for timestamp request
Date:   Tue, 22 Aug 2023 13:26:11 +0800
Message-ID: <1692681973-20764-12-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1692681973-20764-1-git-send-email-quic_taozha@quicinc.com>
References: <1692681973-20764-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kE6169_OaS62012Jc3lqQdwu0Pny7cgt
X-Proofpoint-GUID: kE6169_OaS62012Jc3lqQdwu0Pny7cgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_03,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308220043
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   |  40 ++++++-
 drivers/hwtracing/coresight/coresight-tpdm.c       | 133 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h       |  24 ++++
 3 files changed, 191 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index f5cd302..46a5535 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -123,4 +123,42 @@ KernelVersion	6.5
 Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
 Description:
 		(RW) Set/Get the mask of the trigger pattern for the DSB
-		subunit TPDM.
\ No newline at end of file
+		subunit TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpr[0:7]
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get the value of the pattern for the DSB subunit TPDM.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_patt/tpmr[0:7]
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(RW) Set/Get the mask of the pattern for the DSB subunit TPDM.
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
index 6521019..9b0e060 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -45,6 +45,12 @@ static ssize_t tpdm_simple_dataset_show(struct device *dev,
 	case DSB_TRIG_PATT_MASK:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->dsb->trig_patt_mask[tpdm_attr->idx]);
+	case DSB_PATT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->dsb->patt_val[tpdm_attr->idx]);
+	case DSB_PATT_MASK:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->dsb->patt_mask[tpdm_attr->idx]);
 	default:
 		return -EINVAL;
 	}
@@ -72,6 +78,12 @@ static ssize_t tpdm_simple_dataset_store(struct device *dev,
 	case DSB_TRIG_PATT_MASK:
 		drvdata->dsb->trig_patt_mask[tpdm_attr->idx] = val;
 		break;
+	case DSB_PATT:
+		drvdata->dsb->patt_val[tpdm_attr->idx] = val;
+		break;
+	case DSB_PATT_MASK:
+		drvdata->dsb->patt_mask[tpdm_attr->idx] = val;
+		break;
 	default:
 		spin_unlock(&drvdata->spinlock);
 		return -EINVAL;
@@ -129,6 +141,27 @@ static void set_dsb_mode(struct tpdm_drvdata *drvdata, u32 *val)
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
@@ -140,17 +173,17 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 		writel_relaxed(drvdata->dsb->edge_ctrl_mask[i],
 			   drvdata->base + TPDM_DSB_EDCMR(i));
 	for (i = 0; i < TPDM_DSB_MAX_PATT; i++) {
+		writel_relaxed(drvdata->dsb->patt_val[i],
+			    drvdata->base + TPDM_DSB_TPR(i));
+		writel_relaxed(drvdata->dsb->patt_mask[i],
+			    drvdata->base + TPDM_DSB_TPMR(i));
 		writel_relaxed(drvdata->dsb->trig_patt[i],
 			    drvdata->base + TPDM_DSB_XPR(i));
 		writel_relaxed(drvdata->dsb->trig_patt_mask[i],
 			    drvdata->base + TPDM_DSB_XPMR(i));
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
@@ -471,6 +504,67 @@ static ssize_t ctrl_mask_store(struct device *dev,
 }
 static DEVICE_ATTR_WO(ctrl_mask);
 
+static ssize_t dsb_patt_ts_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
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
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t size)
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
+					  struct device_attribute *attr,
+					  char *buf)
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
+					  struct device_attribute *attr,
+					  const char *buf, size_t size)
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
 static ssize_t dsb_trig_type_show(struct device *dev,
 		  struct device_attribute *attr, char *buf)
 {
@@ -593,8 +687,30 @@ static struct attribute *tpdm_dsb_trig_patt_attrs[] = {
 	NULL,
 };
 
+static struct attribute *tpdm_dsb_patt_attrs[] = {
+	DSB_PATT_ATTR(0),
+	DSB_PATT_ATTR(1),
+	DSB_PATT_ATTR(2),
+	DSB_PATT_ATTR(3),
+	DSB_PATT_ATTR(4),
+	DSB_PATT_ATTR(5),
+	DSB_PATT_ATTR(6),
+	DSB_PATT_ATTR(7),
+	DSB_PATT_MASK_ATTR(0),
+	DSB_PATT_MASK_ATTR(1),
+	DSB_PATT_MASK_ATTR(2),
+	DSB_PATT_MASK_ATTR(3),
+	DSB_PATT_MASK_ATTR(4),
+	DSB_PATT_MASK_ATTR(5),
+	DSB_PATT_MASK_ATTR(6),
+	DSB_PATT_MASK_ATTR(7),
+	NULL,
+};
+
 static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
+	&dev_attr_dsb_patt_ts.attr,
+	&dev_attr_dsb_patt_type.attr,
 	&dev_attr_dsb_trig_ts.attr,
 	&dev_attr_dsb_trig_type.attr,
 	NULL,
@@ -617,11 +733,18 @@ static struct attribute_group tpdm_dsb_trig_patt_grp = {
 	.name = "dsb_trig_patt",
 };
 
+static struct attribute_group tpdm_dsb_patt_grp = {
+	.attrs = tpdm_dsb_patt_attrs,
+	.is_visible = tpdm_dsb_is_visible,
+	.name = "dsb_patt",
+};
+
 static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_attr_grp,
 	&tpdm_dsb_attrs_grp,
 	&tpdm_dsb_edge_grp,
 	&tpdm_dsb_trig_patt_grp,
+	&tpdm_dsb_patt_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 9e1b0a4..9173e80 100644
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
@@ -28,8 +30,12 @@
 /* Data bits for DSB test mode */
 #define TPDM_DSB_CR_TEST_MODE		GENMASK(10, 9)
 
+/* Enable bit for DSB subunit pattern timestamp */
+#define TPDM_DSB_TIER_PATT_TSENAB		BIT(0)
 /* Enable bit for DSB subunit trigger timestamp */
 #define TPDM_DSB_TIER_XTRIG_TSENAB		BIT(1)
+/* Bit for DSB subunit pattern type */
+#define TPDM_DSB_TIER_PATT_TYPE		BIT(2)
 
 /* DSB programming modes */
 /* DSB mode bits mask */
@@ -122,14 +128,26 @@
 		tpdm_simple_dataset_rw(xpmr##nr,		\
 		DSB_TRIG_PATT_MASK, nr, TPDM_DSB_MAX_PATT)
 
+#define DSB_PATT_ATTR(nr)						\
+		tpdm_simple_dataset_rw(tpr##nr,			\
+		DSB_PATT, nr, TPDM_DSB_MAX_PATT)
+
+#define DSB_PATT_MASK_ATTR(nr)					\
+		tpdm_simple_dataset_rw(tpmr##nr,		\
+		DSB_PATT_MASK, nr, TPDM_DSB_MAX_PATT)
+
 /**
  * struct dsb_dataset - specifics associated to dsb dataset
  * @mode:             DSB programming mode
  * @edge_ctrl_idx     Index number of the edge control
  * @edge_ctrl:        Save value for edge control
  * @edge_ctrl_mask:   Save value for edge control mask
+ * @patt_val:         Save value for pattern
+ * @patt_mask:        Save value for pattern mask
  * @trig_patt:        Save value for trigger pattern
  * @trig_patt_mask:   Save value for trigger pattern mask
+ * @patt_ts:          Enable/Disable pattern timestamp
+ * @patt_type:        Set pattern type
  * @trig_ts:          Enable/Disable trigger timestamp.
  * @trig_type:        Enable/Disable trigger type.
  */
@@ -138,8 +156,12 @@ struct dsb_dataset {
 	u32				edge_ctrl_idx;
 	u32				edge_ctrl[TPDM_DSB_MAX_EDCR];
 	u32				edge_ctrl_mask[TPDM_DSB_MAX_EDCMR];
+	u32				patt_val[TPDM_DSB_MAX_PATT];
+	u32				patt_mask[TPDM_DSB_MAX_PATT];
 	u32				trig_patt[TPDM_DSB_MAX_PATT];
 	u32				trig_patt_mask[TPDM_DSB_MAX_PATT];
+	bool			patt_ts;
+	bool			patt_type;
 	bool			trig_ts;
 	bool			trig_type;
 };
@@ -171,6 +193,8 @@ enum dataset_mem {
 	DSB_EDGE_CTRL_MASK,
 	DSB_TRIG_PATT,
 	DSB_TRIG_PATT_MASK,
+	DSB_PATT,
+	DSB_PATT_MASK,
 };
 
 /**
-- 
2.7.4

