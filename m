Return-Path: <linux-arm-msm+bounces-49665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00084A47920
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 10:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11093172058
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C059F2288CB;
	Thu, 27 Feb 2025 09:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VwWV+QVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8522A4E0;
	Thu, 27 Feb 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648461; cv=none; b=ofeY3tHjSy02sF9fu1ZvnHCLH7EvTtg4hB9XD+y1u3/Jivc55b4phLDn3/Av4fsPdNJsox28kA53es5ZATRryP6FLHoGd2+ZZA7SvS60LFF8RFY9i3KL7+NBrdJMxZ+3SALHZ0UFuBV8CSgr7iFxq4BbP9Gc4b++T5WWuapyUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648461; c=relaxed/simple;
	bh=J7NjV+a4A75Q6FVQVvBR5hHZa0YLNsYqusRD7coT8Dg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpqAyesRod1azBJUWrWqhPS/E+WkY5BAaYZ+/nEURBbJ8ekmtugjGH3WlU2q1ezRwpSl81jxMgUrffqQAVCZAjrpgRIf1Bb2azDSAXuqum3Zqm4tH/kg8b7yu9Oc0278Mg3UUhAKDO3c2yQQvMTt+ClY+eNlZenDSQOCRr15Kz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VwWV+QVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8n5mw002157;
	Thu, 27 Feb 2025 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1l7edTeasmoMFPJa7aEBSwFL/pdGW62t+1SXgjMizNw=; b=VwWV+QVIYrpjXcOG
	CM3KKCLtKafZtyZ7UGNICLSRtHB/JeKEatGw6IR2JItnFWqUUGxRV3EzyuhmIK/k
	+CFL5CeIaMpenqSwy27FHo0+y8lqU7Qk8tvUzTLXJhOJILx9T++TV68FoMw3SXMT
	vZ2Pt6+lKALaGtksQL2yezUeLK1T+Mf1PauyJ4tiu9tq+3RJIr1vqd9vPuB4t4Nn
	npB7dMsiFscXCC36FfAg7HLQ05+bDIpYdfBqyCgljI4WTT/B/M/K/TrjXT6/3YVp
	mRnd/pL+xlgZYePIBF2z/tKvwe7fuP/7bOC1gVJOF+9V+zvYy2kHRHDL6IHfIpr5
	FMOHLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451pu9d4dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R9RUqG012443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:27:30 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 01:27:25 -0800
From: songchai <quic_songchai@quicinc.com>
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
Subject: [PATCH v3 7/7] coresight-tgu: add reset node to initialize
Date: Thu, 27 Feb 2025 17:26:40 +0800
Message-ID: <20250227092640.2666894-8-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227092640.2666894-1-quic_songchai@quicinc.com>
References: <20250227092640.2666894-1-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ez9pBtqEFL_RKGTRrdyRjH8hiiDxTHnL
X-Proofpoint-ORIG-GUID: ez9pBtqEFL_RKGTRrdyRjH8hiiDxTHnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270071

From: Songwei Chai <quic_songchai@quicinc.com>

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
Signed-off-by: songchai <quic_songchai@quicinc.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/coresight/coresight-tgu.c   | 79 +++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index d88d05fbff43..8fb5afd7c655 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion   6.15
 Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
 Description:
                 (RW) Set/Get the counter value with specific step for TGU.
+
+What:           /sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:           February 2025
+KernelVersion   6.15
+Contact:        Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>, Sam Chai (QUIC) <quic_songchai@quicinc.com>
+Description:
+                (Write) Reset the dataset for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 693d632fb079..b36ced761c0d 100644
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
 


