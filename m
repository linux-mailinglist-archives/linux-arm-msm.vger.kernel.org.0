Return-Path: <linux-arm-msm+bounces-49477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C777FA45C9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BD5A173571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D3E215052;
	Wed, 26 Feb 2025 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f0fYu+wA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE22215050;
	Wed, 26 Feb 2025 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568005; cv=none; b=XKJ/7fFUB9zCEidNpXmOnhyZeBrjO9/rBUyyM0gbGAtVawceyXCQVZdtsfdOk97RPbiuMMfyopeX9Kiv1EgdZwSGjyxo5G0cYXKPj/Q7i2UrOMtHnb/dOpe/xZBz0RM9lDk9aon7Rt+u3464dGsZrm4fz5NT8HXgh8sc1HG6EvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568005; c=relaxed/simple;
	bh=BnF68B1pGiK7oAE8qulUM6632NSyt7v2mKd3U1BERVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Le0yQdkoQzkg8Mp2LnJNBb/JakudvvcsVs1xnHTe1/WS6rr67eAtdzqZ5X9LaQwszOiQ0lk35aBL+C9iK0cn4Ep6gY5+NQjFDbSEDi6Mn9F7ThEcaOWumN+oaUVBCOEqF0t4EG05zysjdgcWVg9AhMfOzem4nrVMsmDBZLaujfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f0fYu+wA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9EvU1015904;
	Wed, 26 Feb 2025 11:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SN1Q76Uw352PAd6KxuwKwqyTCpdw4v3WAoogBTyD7gs=; b=f0fYu+wA0ERbg8yx
	GxU5rovIXrBMdcwM14pQLBO3136L1zFofFCuM+VgUjBUN1fky3rQgxx46skOCkVk
	wXcUh4qOEXoJG8LjCNThVMi55P0tMysbNQCC9DvZVd9+Fbgg1puhmz1aD9vXPpPI
	mV2/3KbUeOBV6SB9/mzsHUj2QfPwvkWbY9p+lQhEKcasKlRlBkMmnqAVmOfkK+Zq
	pf+Jjr15GD0BF1OAn50XIelQdx1OXbMNHrp0yQYg6bQmMuFXw5HkRRujf1ElzC/X
	+HpM05M+0PewaSsP5lBCJY0I6S/adh4ag4+Ks6WCcNVbdgY18qcIrWnvzemkAvi2
	AdJnyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnhq98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QB6UiU021244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:30 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:06:24 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 26 Feb 2025 19:05:52 +0800
Subject: [PATCH v2 3/5] coresight-tnoc: add nodes to configure flush
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250226-trace-noc-driver-v2-3-8afc6584afc5@quicinc.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740567972; l=3879;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=BnF68B1pGiK7oAE8qulUM6632NSyt7v2mKd3U1BERVM=;
 b=MTDc4zGOzJltpus9WgV58RyWwa5ssYiEjsKi1DxkET8CqWFjXsFLpaVQaNCASHOjvmodak9p3
 AfTnHVNV7+5B0cpLN3Er5W5Vptp4abnY36sj3+W9AhfbFVSzjupSLlu
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8_gb5trJPzCBP8-Fx9UY9U5oEY_jBZVD
X-Proofpoint-ORIG-GUID: 8_gb5trJPzCBP8-Fx9UY9U5oEY_jBZVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260088

Two nodes for configure flush are added here:
1. flush_req: write 1 to initiates a flush sequence.

2. flush_state: read this node to get flush status. 0: sequence in
progress; 1: sequence has been completed.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 73 ++++++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h |  4 ++
 2 files changed, 77 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index fad8e61f05ef25989aba1be342c547f835e8953a..20231f28ddcb6a60d9b3c1ca3e0ca4d731dac39c 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -16,6 +16,78 @@
 #include "coresight-tnoc.h"
 #include "coresight-trace-id.h"
 
+static ssize_t flush_req_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	unsigned long val;
+	u32 reg;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	if (val != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+	reg = reg | TRACE_NOC_CTRL_FLUSHREQ;
+	writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
+
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_WO(flush_req);
+
+/*
+ * flush-sequence status:
+ * value 0: sequence in progress;
+ * value 1: sequence has been completed.
+ */
+static ssize_t flush_status_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	u32 val;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+	spin_unlock(&drvdata->spinlock);
+	return sysfs_emit(buf, "%lu\n", BMVAL(val, 2, 2));
+}
+static DEVICE_ATTR_RO(flush_status);
+
+static struct attribute *trace_noc_attrs[] = {
+	&dev_attr_flush_req.attr,
+	&dev_attr_flush_status.attr,
+	NULL,
+};
+
+static struct attribute_group trace_noc_attr_grp = {
+	.attrs = trace_noc_attrs,
+};
+
+static const struct attribute_group *trace_noc_attr_grps[] = {
+	&trace_noc_attr_grp,
+	NULL,
+};
+
 static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 {
 	u32 val;
@@ -142,6 +214,7 @@ static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
 		return ret;
 
 	desc.ops = &trace_noc_cs_ops;
+	desc.groups = trace_noc_attr_grps;
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
index b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8..d0fe8f52709ff4147d66dbf90987595012cfaa4e 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.h
+++ b/drivers/hwtracing/coresight/coresight-tnoc.h
@@ -10,6 +10,10 @@
 
 /* Enable generation of output ATB traffic.*/
 #define TRACE_NOC_CTRL_PORTEN	BIT(0)
+/* Writing 1 to initiate a flush sequence.*/
+#define TRACE_NOC_CTRL_FLUSHREQ	BIT(1)
+/* 0: sequence in progress; 1: sequence has been completed.*/
+#define TRACE_NOC_CTRL_FLUSHSTATUS	BIT(2)
 /* Writing 1 to issue a FREQ or FREQ_TS packet*/
 #define TRACE_NOC_CTRL_FREQTSREQ	BIT(5)
 /* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/

-- 
2.34.1


