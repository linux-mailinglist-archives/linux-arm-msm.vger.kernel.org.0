Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871B06C5F62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 07:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjCWGFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 02:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjCWGFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 02:05:31 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117DA27D6A;
        Wed, 22 Mar 2023 23:05:15 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32N5R2HK026440;
        Thu, 23 Mar 2023 06:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=yBdrDAGK6RvgHNOI0AC2BQtdfCDBR/i4Nml4F6ZZ1jg=;
 b=KNpP6AgwJLAjUOeSkQw696W5lHX5x7E7ZoMFMTsB4zvFcktbvfh6MQrA5o/QCnatTvSz
 O8yN5PtULK8c7AJt9+941uWcExMOAA4D+I5dNdctgq/tvXUxgfEoXuNxO6w4DJD5Iv3/
 5FonHw02Hvy+GFeRcBhIhm9lXf0i4Ny8kayAiMoC0Aa5erHHK6nz/38oGqnD+qEFkuzu
 hKm9vDBjQ4RAm8RDm55Q4x8gytRLi25BHK7LZ98TXQsn7HYF037DRsjjOSqNRn/QxZdB
 p0Rawb9Op8+/tj409p5TKp9rPg8Pk5qHTzne5xx3qwlXwv2rqG+IaECRpJHmmCyrY6aX jA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pgfv68506-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 06:05:05 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32N654o4028721
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Mar 2023 06:05:05 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 22 Mar 2023 23:05:00 -0700
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
Subject: [PATCH v3 06/11] coresight-tpdm: Add node to set dsb programming mode
Date:   Thu, 23 Mar 2023 14:04:03 +0800
Message-ID: <1679551448-19160-7-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1679551448-19160-1-git-send-email-quic_taozha@quicinc.com>
References: <1679551448-19160-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b64CTZQuXELtQYRld1EpfEQ45R7pM-as
X-Proofpoint-ORIG-GUID: b64CTZQuXELtQYRld1EpfEQ45R7pM-as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230046
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add node to set and show programming mode for TPDM DSB subunit.
Once the DSB programming mode is set, it will be written to the
register DSB_CR. Bit[10:9] of the DSB_CR register is used to set
the DSB test mode.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   | 10 ++++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 62 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h       | 13 +++++
 3 files changed, 85 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index 27ce681..f13e282 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -35,3 +35,13 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : Set the DSB trigger type to false
 		1 : Set the DSB trigger type to true
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_mode
+Date:		March 2023
+KernelVersion	6.3
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the mode of DSB tpdm. Read the mode of DSB
+		tpdm.
+
+		Accepts the value needs to be greater than 0.
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index e28cf10..8cd822f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/amba/bus.h>
+#include <linux/bitfield.h>
 #include <linux/bitmap.h>
 #include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
@@ -51,6 +52,32 @@ static int tpdm_init_datasets(struct tpdm_drvdata *drvdata)
 	return 0;
 }
 
+static void set_dsb_cycacc_mode(struct tpdm_drvdata *drvdata, u32 *val)
+{
+	u32 mode;
+
+	mode = TPDM_DSB_MODE_CYCACC(drvdata->dsb->mode);
+	*val &= ~TPDM_DSB_TEST_MODE;
+	*val |= FIELD_PREP(TPDM_DSB_TEST_MODE, mode);
+}
+
+static void set_dsb_hpsel_mode(struct tpdm_drvdata *drvdata, u32 *val)
+{
+	u32 mode;
+
+	mode = TPDM_DSB_MODE_HPBYTESEL(drvdata->dsb->mode);
+	*val &= ~TPDM_DSB_HPSEL;
+	*val |= FIELD_PREP(TPDM_DSB_HPSEL, mode);
+}
+
+static void set_dsb_perf_mode(struct tpdm_drvdata *drvdata, u32 *val)
+{
+	if (drvdata->dsb->mode & TPDM_DSB_MODE_PERF)
+		*val |= TPDM_DSB_CR_MODE;
+	else
+		*val &= ~TPDM_DSB_CR_MODE;
+}
+
 static void set_trigger_type(struct tpdm_drvdata *drvdata, u32 *val)
 {
 	if (drvdata->dsb->trig_type)
@@ -72,6 +99,12 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 	writel_relaxed(val, drvdata->base + TPDM_DSB_TIER);
 
 	val = readl_relaxed(drvdata->base + TPDM_DSB_CR);
+	/* Set the cycle accurate mode */
+	set_dsb_cycacc_mode(drvdata, &val);
+	/* Set the byte lane for high-performance mode */
+	set_dsb_hpsel_mode(drvdata, &val);
+	/* Set the performance mode */
+	set_dsb_perf_mode(drvdata, &val);
 	/* Set trigger type */
 	set_trigger_type(drvdata, &val);
 	/* Set the enable bit of DSB control register to 1 */
@@ -250,6 +283,34 @@ static struct attribute_group tpdm_attr_grp = {
 	.attrs = tpdm_attrs,
 };
 
+static ssize_t dsb_mode_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%lx\n",
+			 (unsigned long)drvdata->dsb->mode);
+}
+
+static ssize_t dsb_mode_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf,
+				   size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if ((kstrtoul(buf, 0, &val)) || val < 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->mode = val & TPDM_MODE_ALL;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_mode);
+
 static ssize_t dsb_trig_type_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
@@ -321,6 +382,7 @@ static ssize_t dsb_trig_ts_store(struct device *dev,
 static DEVICE_ATTR_RW(dsb_trig_ts);
 
 static struct attribute *tpdm_dsb_attrs[] = {
+	&dev_attr_dsb_mode.attr,
 	&dev_attr_dsb_trig_ts.attr,
 	&dev_attr_dsb_trig_type.attr,
 	NULL,
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 68f33bd..8fee562 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -15,11 +15,22 @@
 
 /* Enable bit for DSB subunit */
 #define TPDM_DSB_CR_ENA		BIT(0)
+/* Enable bit for DSB subunit perfmance mode */
+#define TPDM_DSB_CR_MODE		BIT(1)
 /* Enable bit for DSB subunit trigger type */
 #define TPDM_DSB_CR_TRIG_TYPE		BIT(12)
+
 /* Enable bit for DSB subunit trigger timestamp */
 #define TPDM_DSB_TIER_XTRIG_TSENAB		BIT(1)
 
+/* DSB programming modes */
+#define TPDM_DSB_MODE_CYCACC(val)	(val & GENMASK(2, 0))
+#define TPDM_DSB_MODE_PERF		BIT(3)
+#define TPDM_DSB_MODE_HPBYTESEL(val)	(val & GENMASK(8, 4))
+#define TPDM_MODE_ALL			(0xFFFFFFF)
+#define TPDM_DSB_TEST_MODE		GENMASK(11, 9)
+#define TPDM_DSB_HPSEL		GENMASK(6, 2)
+
 /* TPDM integration test registers */
 #define TPDM_ITATBCNTRL		(0xEF0)
 #define TPDM_ITCNTRL		(0xF00)
@@ -48,10 +59,12 @@
 
 /**
  * struct dsb_dataset - specifics associated to dsb dataset
+ * @mode:             DSB programming mode
  * @trig_ts:          Enable/Disable trigger timestamp.
  * @trig_type:        Enable/Disable trigger type.
  */
 struct dsb_dataset {
+	u32				mode;
 	bool			trig_ts;
 	bool			trig_type;
 };
-- 
2.7.4

