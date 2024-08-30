Return-Path: <linux-arm-msm+bounces-30202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D80D965CBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7688EB21908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9A017C234;
	Fri, 30 Aug 2024 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mcjGsjOh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000731531D0;
	Fri, 30 Aug 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725009837; cv=none; b=D0sY648lNWG1CcUp1xidBMqaidwC7usF/obFPTcEfra3sFBUA5TA4gd7dD+0RR75k90g5gtsY6E94S7WCq00b4U9rhpjxxDuzXFX2Hv4E8hSHQlYWKsOpo5qeXR08vdJJDe9+5j237kgYGviTYr+msRMQ2GpB8h1R+JFUMPxajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725009837; c=relaxed/simple;
	bh=/3m2quepIcHYK+rXAlyO2Al903bIDY8w1wV9Fq+PPfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOfMiVsq/JL61f6YxrThMjJb3i9QipBgYLPW7rsn2jo6HgdMV8XucEpnV1YXj+Qgvf49M9xGt2ahkwbkbOzB5Daad2pPHPNTTrIiBFNfmEFtWnw3n6VKeeYGHJZ/cNjtpP39eFb1Zf8GHVH7aLMuTQR0hDPT959FL9iHTfO/FMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mcjGsjOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U8HCQb013551;
	Fri, 30 Aug 2024 09:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB3WySCQ5Jk4iR0NJ3P3yIH6CknP1BiZnIbWGddtiq4=; b=mcjGsjOhlpEtFJdV
	Mgypkb7gQsGoAPZB1+uWJFcTunzlPG59O4ezit68OT1BFF2djYoqJJMDZ8FTrlGX
	U9KlAXLJY4bhDwnlAe89eRrdhFThQbZE7zMZus2+LkyOJ2cdX4IArraol4XXNtPO
	qJDOBd/oEGI7ka85YnS75qOR74GLpySaW9KYJUZmgDNedmIQSvBpv6wT1cz9ptTh
	2tFxCwFc75qBMnscoZS/i/OvlWF+9JU7ZL8ucBkFi+Njepersj+k+4X2/EbGwNHD
	+9Rq7odkincuXfGnuEpT5AQ/A8B80mx4tYM43MjojXro652aSfJ2B4VjfRqaSqVq
	AWwedA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5r1f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47U9Nj3j019425
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 09:23:45 GMT
Received: from 3b5b8f7e4007.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 30 Aug 2024 02:23:44 -0700
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
CC: songchai <quic_songchai@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 7/7] coresight-tgu: add reset node to initialize
Date: Fri, 30 Aug 2024 17:23:08 +0800
Message-ID: <20240830092311.14400-8-quic_songchai@quicinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830092311.14400-1-quic_songchai@quicinc.com>
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LoDkVErZqghbtzhIiz2PWelMPw8tG6Dm
X-Proofpoint-GUID: LoDkVErZqghbtzhIiz2PWelMPw8tG6Dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408300069

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes

Signed-off-by: songchai <quic_songchai@quicinc.com>
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
index a5f194fecdb0..56abfc9429ef 100644
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
 


