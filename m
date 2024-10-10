Return-Path: <linux-arm-msm+bounces-33805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1588997F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EC381C23D4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6F51F7060;
	Thu, 10 Oct 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E6t/+oCY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A501F4FB7;
	Thu, 10 Oct 2024 07:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728545999; cv=none; b=FEbHzLT6Qkbc7r+Jnz6XaEtFMGRdkjW0WHPHpZoXU3jnHYlMnoXwlu2XHtWsXToZCEXbttLEo/ZZ2NLlimr3OSAXnP1KzkCCeuoCH/cU4R8VUfseb/BB5JvWITe1nfdjvP7qXnofyJ4gFfGDNVXIl7KBtHFZ+SHwxU/3L32iN1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728545999; c=relaxed/simple;
	bh=zdd8YcKVkHoAkpDz4iPL1G3Yk3VioSVu9m6ZXruUTW4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FyvWqv5jXGihBC3u8H+A9IbAOk9XQjQEpxC4NJuEIb25aAwv+aKiOQqSJcxBTA7NuvRBbcafbc+sz+/a9mT2Gh42FYAtXtvnj6zc63BG/SaoerB9NwLpztUsNWCfp9z/W9UJJ+oMMR2DjfqIu4FYdP6ax7bLBMPESGOLI+Sk7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E6t/+oCY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1c04n028349;
	Thu, 10 Oct 2024 07:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1cJZFdkeCYXvNJ/0oCabD7O6XN3xHghdJsso11qprM=; b=E6t/+oCYRtazmUHm
	1HnSlYtGmYDMNVKzkWz6y6A3f2bcTqGl8ODyZ2SPwPSHsmIfC8YzZdEMoI719N0F
	P7L6mQDzPoULKOoxS2lt7diLFZjEC/Rg2iOi+ymwv+FOneswCvTTz304sId/ryA6
	Qb8/CrcsKTxAyMygzZ2A1CvlLc4pcTpiAiDOjeuE+FDqLdw/Y+ziT2CLAVZTrdq5
	fhRIt4z8fRD9UXtxKai/HfrJzqXKqlXHp7PuwUr7Y1CBmYZeOlaM3iEUMKmmdbib
	dWdGIaYAne9wmUW96Yy/pNsWdhzWaQBbhxxrrYfRgC9fJNyZXbtW2+Z2infPXmge
	vUpRgw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qw0db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A7daCI011943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:39:36 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 00:39:36 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Songwei Chai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 7/7] coresight-tgu: add reset node to initialize
Date: Thu, 10 Oct 2024 15:39:15 +0800
Message-ID: <20241010073917.16023-8-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010073917.16023-1-quic_songchai@quicinc.com>
References: <20241010073917.16023-1-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VgB04qOMXUnhI11kLJDVbvZP1J8-ZZSQ
X-Proofpoint-ORIG-GUID: VgB04qOMXUnhI11kLJDVbvZP1J8-ZZSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100048

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/coresight/coresight-tgu.c   | 79 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index e404e0d6f8f0..0c8ea23ce9a3 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion   6.10
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the counter value with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:           August 2024
+KernelVersion   6.10
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (Write) Reset the dataset for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 05456e23b852..bec8e94a2234 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -343,6 +343,84 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value))
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+
+	if (value) {
+		tgu_writel(drvdata, 0, TGU_CONTROL);
+
+		if (drvdata->value_table->priority)
+			memset(drvdata->value_table->priority, 0,
+			       MAX_PRIORITY * drvdata->max_step *
+				       drvdata->max_reg * sizeof(unsigned int));
+
+		if (drvdata->value_table->condition_decode)
+			memset(drvdata->value_table->condition_decode, 0,
+			       drvdata->max_condition_decode * drvdata->max_step *
+				       sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+		for (i = 0; i < drvdata->max_step; i++) {
+			for (j = 0; j < drvdata->max_condition_decode; j++) {
+				drvdata->value_table
+					->condition_decode[calculate_array_location(
+						drvdata, i, TGU_CONDITION_DECODE, j)] =
+					0x1000000;
+			}
+		}
+
+		if (drvdata->value_table->condition_select)
+			memset(drvdata->value_table->condition_select, 0,
+			       drvdata->max_condition_select * drvdata->max_step *
+				       sizeof(unsigned int));
+
+		if (drvdata->value_table->timer)
+			memset(drvdata->value_table->timer, 0,
+			       (drvdata->max_step) *
+				       (drvdata->max_timer_counter) *
+				       sizeof(unsigned int));
+
+		if (drvdata->value_table->counter)
+			memset(drvdata->value_table->counter, 0,
+			       (drvdata->max_step) *
+				       (drvdata->max_timer_counter) *
+				       sizeof(unsigned int));
+
+		dev_dbg(dev, "Coresight-TGU reset complete\n");
+	} else {
+		dev_dbg(dev, "Coresight-TGU invalid input\n");
+	}
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -354,6 +432,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


