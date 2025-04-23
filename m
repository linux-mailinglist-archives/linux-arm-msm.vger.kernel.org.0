Return-Path: <linux-arm-msm+bounces-55062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2DA97F63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261C5189A89A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A628519E97C;
	Wed, 23 Apr 2025 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQxR61Y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE9267392
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390351; cv=none; b=IjCOSiP6DU81R2w6p2beqElX2dDrp0eOuclvV2wtN9DeQjlDjkeAbPyIbVw6RXGaAHfmDJoLkcmbOC4T02svMK4SakO50Qxo8+kjWOOK49BApzy76zWXTK5ty6PHTvx0k/t5TgpRU5SvdWrMMrXxjnH2qRGaAxkJLFXxuxUhPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390351; c=relaxed/simple;
	bh=zno3MqswWzFkpvb05DVN/lUjOgYNlIgm4Tjhl/CIjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kJjLW/WekADnleVmk24WmXD7LsDX+MoaWlHxcSFA6+T3HM4Eh6k3/zXR9+8jWziP0lSZBxAVnmgb5nBlrwI2fja3omDIDcYqvr79NCmx7nfQBACNuIxYqzYSCMBJAt5N0UKds3bVvms3QJyDsMhJ8sizasOrTG0EZ4z21hRhp2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQxR61Y0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i8Ik016813
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjF8OO/5P+FQVIEf1bpLFIghnvpBMnKNuJV69UP/rCo=; b=dQxR61Y0q2kVRXB2
	+VcjQ9IzZWtUGjNnAe6V6UTbjc8cFaBb2XOiGmuPrKqrwAi9mpzWVaBL3ck1zw0J
	kDw7czDE28nGAB9G8W9Nmba2WEgY4BKBWEUuKCj6bLHmqB5FmfblVgrZkGag1YMS
	+9D+ECn2cLNoIM5Lg2otTu+y5YELzmEJ6uIF+HLz48QS9qAzUKG7Ii0vmi62iMPY
	jLEZ0NDkLWbzURrrmmYQGnVFpT4UoNNyiI12fCAmxbsGyoPpddIZQjpb3CCMa8EE
	0j4cctgfkL+ZsUzf21IxqHruDLCQwHZQ98k6kNSveUTraQX/XHFCbJyuGAqdpohd
	cp5HVA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh014kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:39:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6d75O019865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:39:08 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:39:06 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:38:57 +0800
Subject: [PATCH v4 7/7] coresight-tgu: add reset node to initialize
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v4-7-b2240b8ba7d5@quicinc.com>
References: <20250423-tgu_patch-v4-0-b2240b8ba7d5@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v4-0-b2240b8ba7d5@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745390339; l=4150;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=zno3MqswWzFkpvb05DVN/lUjOgYNlIgm4Tjhl/CIjs4=;
 b=zn7B/D9AbWWg27xMXn1rydp46eUNIL01/8YR7SMQaUD4j4zHrsehfYSuArPTjEN9GgtKzYW5t
 b/fwnqcoxZwCmQIw+LyYVXSZSb/w0Sz2OsFpmJU3S+ZzAIDPsdmjLPL
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MyBTYWx0ZWRfX4No8vo89JhB9 EywL+K/NZ11d2ROPO4g58I3wtfqUS1+Bl2OD96XMQ+S5UOIzi3AbuGcJ0NSvZ2v751PtMJf654q hFc8TvcW6a+PGmGTwQp9qOTDRoySXG3q+J9ebBNl8ocG7BS8BgO2i+cvOGjPaUZqy/iNDjPAv+4
 TTUtFw3dExb0Tzk4RGRq7NhL6S7FUVzCf5nqsCJJa18/tX+21JBYxrsZuidkoZz45vpvbeoCbIn HSdua/8zJIl/6Pl6FOCb2Lf+Vm350J7IFHAOevjY9l3JWKsBsd+kA6EZ391IwqVubjqCD4AHsBO 7qAppZ1EMZ6D96crFJAoEKyd7VdkKQzrB1XLU8vHAnCOByQCjzjO2l3hC4YfCTBkLsmaKeAJkGE
 ppTYErEv5Wb8FoQoABQcS+SfogxpvU/ncwrFItuj2uKAia2AXkdT7DVF6Xe/sJyqAtjmGgLq
X-Proofpoint-GUID: YftsvhltvpF4sNEO7ZLUdwxNdICix3Lx
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=68088b0c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=z5a9ZJBnnRrTyqXdmuEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YftsvhltvpF4sNEO7ZLUdwxNdICix3Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230043

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes

Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tgu    |  7 ++
 drivers/hwtracing/coresight/coresight-tgu.c        | 75 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 2843cecead55f520026739731f702bf5cb66a48d..117e648d28535ef813a5d4381927acf0a4440203 100644
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
+                (Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/coresight/coresight-tgu.c b/drivers/hwtracing/coresight/coresight-tgu.c
index 4a58f2cb8d8caf98dc29a3c5e1ce0222f15c5a6e..b44c876e7cc7e9bb6ac30cfef702e7621a29596f 100644
--- a/drivers/hwtracing/coresight/coresight-tgu.c
+++ b/drivers/hwtracing/coresight/coresight-tgu.c
@@ -477,6 +477,80 @@ static ssize_t enable_tgu_store(struct device *dev,
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
+	if (kstrtoul(buf, 0, &value) || value == 0)
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
+	tgu_writel(drvdata, 0, TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
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
@@ -488,6 +562,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 

-- 
2.34.1


