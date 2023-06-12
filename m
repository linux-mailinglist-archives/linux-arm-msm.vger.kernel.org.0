Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6734C72B968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 09:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjFLH7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 03:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjFLH6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 03:58:49 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E10E7B;
        Mon, 12 Jun 2023 00:57:59 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35C5PJlG017081;
        Mon, 12 Jun 2023 07:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ygdpq5pE7M/kC6W2l6guKKRQ9h7KDDoYJZzbvOUWF+c=;
 b=DJRRYQ/kvxDUbyGEj999ELWOcMbO2Ofj6gH0x1w0zsaDSwZE10C1b8+Vp8c3iRomoFyZ
 ki/U4NLphDnV1AcWEcl9A92w27pz9NQ4bQj6+TMiLo1IjIq0wzOLLnQWneKQSEru/15m
 chk3xWFrBq2Jl+PcitxugXsB4Zk609pNCin+IwM3ng2MuoauSS7FOAfvPdpZdq6Vw+BX
 Kf+5oRDEEILW34moFOJhsb1yUWmtESTFnOu8YFkKllZxcs0ThZVBRS17/cODAgKihfce
 8pOgWOjHeZopZvmmHAJek3pcpoMtLmi1PSEi+rw+V4D0dxdxJE5geZcqv1HZCWv3DPb+ wQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r4evmas01-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 07:09:26 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35C79NDq021574
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jun 2023 07:09:23 GMT
Received: from taozha-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 12 Jun 2023 00:09:17 -0700
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
Subject: [PATCH v5 13/13] coresight-tpdm: Add nodes for dsb msr support
Date:   Mon, 12 Jun 2023 15:07:46 +0800
Message-ID: <1686553666-5811-14-git-send-email-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1686553666-5811-1-git-send-email-quic_taozha@quicinc.com>
References: <1686553666-5811-1-git-send-email-quic_taozha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o549iGzIhE3rO3dIi4GJKFbtny0BWsFH
X-Proofpoint-ORIG-GUID: o549iGzIhE3rO3dIi4GJKFbtny0BWsFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_04,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120061
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the nodes for DSB subunit MSR(mux select register) support.
The TPDM MSR (mux select register) interface is an optional
interface and associated bank of registers per TPDM subunit.
The intent of mux select registers is to control muxing structures
driving the TPDM’s’ various subunit interfaces.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpdm   | 14 +++++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 71 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpdm.h       |  5 ++
 3 files changed, 90 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
index 6e1b246..aaf02a6 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
@@ -166,3 +166,17 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : Set the DSB pattern type to value.
 		1 : Set the DSB pattern type to toggle.
+
+What:		/sys/bus/coresight/devices/<tpdm-name>/dsb_msr
+Date:		March 2023
+KernelVersion	6.5
+Contact:	Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Tao Zhang (QUIC) <quic_taozha@quicinc.com>
+Description:
+		(Write) Set the MSR(mux select register) of DSB tpdm. Read
+		the MSR(mux select register) of DSB tpdm.
+
+		Expected format is the following:
+		<integer1> <integer2>
+
+		Where:
+		<integer1> : Index number of MSR register, the range is 0 to 31
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 1aff244..9c5782f 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -90,6 +90,18 @@ static void set_dsb_tier(struct tpdm_drvdata *drvdata, u32 *val)
 
 }
 
+static void set_dsb_msr(struct tpdm_drvdata *drvdata)
+{
+	int i;
+
+	if (drvdata->dsb->msr_num == 0)
+		return;
+
+	for (i = 0; i < drvdata->dsb->msr_num; i++)
+		writel_relaxed(drvdata->dsb->msr[i],
+			   drvdata->base + TPDM_DSB_MSR(i));
+}
+
 static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 {
 	u32 val, i;
@@ -116,6 +128,8 @@ static void tpdm_enable_dsb(struct tpdm_drvdata *drvdata)
 	set_dsb_tier(drvdata, &val);
 	writel_relaxed(val, drvdata->base + TPDM_DSB_TIER);
 
+	set_dsb_msr(drvdata);
+
 	val = readl_relaxed(drvdata->base + TPDM_DSB_CR);
 	/* Set the test accurate mode */
 	set_dsb_test_mode(drvdata, &val);
@@ -234,6 +248,14 @@ static int tpdm_datasets_setup(struct tpdm_drvdata *drvdata)
 			if (!drvdata->dsb)
 				return -ENOMEM;
 		}
+		if (!of_property_read_u32(drvdata->dev->of_node,
+			   "qcom,dsb_msr_num", &drvdata->dsb->msr_num)) {
+			drvdata->dsb->msr = devm_kzalloc(drvdata->dev,
+				   (drvdata->dsb->msr_num * sizeof(*drvdata->dsb->msr)),
+				   GFP_KERNEL);
+			if (!drvdata->dsb->msr)
+				return -ENOMEM;
+		}
 	}
 
 	return 0;
@@ -775,6 +797,54 @@ static ssize_t dsb_trig_ts_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(dsb_trig_ts);
 
+static ssize_t dsb_msr_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned int i;
+	unsigned long bytes;
+	ssize_t size = 0;
+
+	if (drvdata->dsb->msr_num == 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	for (i = 0; i < drvdata->dsb->msr_num; i++) {
+		bytes = sysfs_emit_at(buf, size,
+				  "%u 0x%x\n", i, drvdata->dsb->msr[i]);
+		if (bytes <= 0)
+			break;
+		size += bytes;
+	}
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+
+static ssize_t dsb_msr_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t size)
+{
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned int num, val;
+	int nval;
+
+	if (drvdata->dsb->msr_num == 0)
+		return -EINVAL;
+
+	nval = sscanf(buf, "%u %x", &num, &val);
+	if ((nval != 2) || (num >= drvdata->dsb->msr_num))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	drvdata->dsb->msr[num] = val;
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(dsb_msr);
+
 static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_mode.attr,
 	&dev_attr_dsb_edge_ctrl.attr,
@@ -787,6 +857,7 @@ static struct attribute *tpdm_dsb_attrs[] = {
 	&dev_attr_dsb_trig_patt_mask.attr,
 	&dev_attr_dsb_trig_ts.attr,
 	&dev_attr_dsb_trig_type.attr,
+	&dev_attr_dsb_msr.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 3169fb5..5372093 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -18,6 +18,7 @@
 #define TPDM_DSB_XPMR(n)	(0x7E8 + (n * 4))
 #define TPDM_DSB_EDCR(n)	(0x808 + (n * 4))
 #define TPDM_DSB_EDCMR(n)	(0x848 + (n * 4))
+#define TPDM_DSB_MSR(n)		(0x980 + (n * 4))
 
 /* Enable bit for DSB subunit */
 #define TPDM_DSB_CR_ENA		BIT(0)
@@ -97,6 +98,8 @@
  * @patt_mask:        Save value for pattern mask
  * @trig_patt_val:    Save value for trigger pattern
  * @trig_patt_mask:   Save value for trigger pattern mask
+ * @msr_num           Number of MSR supported by DSB TPDM
+ * @msr               Save value for MSR
  * @patt_ts:          Enable/Disable pattern timestamp
  * @patt_type:        Set pattern type
  * @trig_ts:          Enable/Disable trigger timestamp.
@@ -110,6 +113,8 @@ struct dsb_dataset {
 	u32				patt_mask[TPDM_DSB_MAX_PATT];
 	u32				trig_patt_val[TPDM_DSB_MAX_PATT];
 	u32				trig_patt_mask[TPDM_DSB_MAX_PATT];
+	u32				msr_num;
+	u32				*msr;
 	bool			patt_ts;
 	bool			patt_type;
 	bool			trig_ts;
-- 
2.7.4

