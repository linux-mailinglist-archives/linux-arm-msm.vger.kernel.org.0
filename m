Return-Path: <linux-arm-msm+bounces-55039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32CA97F25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 08:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F96318976B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 06:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EEA266B55;
	Wed, 23 Apr 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hFBpNl4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C390267385
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745389628; cv=none; b=Ih9NRW2qbfJBo6ESV5bibeO+JL2yhYI0LqOI/VPFSD9th9HjQ41/jSW8fVGPGqI+BWPDL2t/imoh5WQWudb4Y2X2vo3hwzWS/m5qiTiTXLQU3HJNm5uFvu9+tJR0KdRWl6GwDoT8P7vz48IXvI5te2KdGr5Kz9pRIf6RoWUG+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745389628; c=relaxed/simple;
	bh=zno3MqswWzFkpvb05DVN/lUjOgYNlIgm4Tjhl/CIjs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NuKRZEZHU4rqrVNJzxwLj2pxQFjuncstK5fYMe+mkjBYl8F1YDzXQ+S2BlHKCQ1LPkZcL74XSLrs125ufGRLX95LZHGT+RsaaY2PQz0s5PX2+idMJMJ8c0EfzlO4jcVBlKBk+tPTDG+iGXDEtGigT2CIC4bcEb/GtqOiuBqUXZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hFBpNl4v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i8Iu020411
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjF8OO/5P+FQVIEf1bpLFIghnvpBMnKNuJV69UP/rCo=; b=hFBpNl4vHElkKp2e
	sSghuRU+c+jaq2BVExHmcj+CfwqmPN5CJCIktBohJgzmjeU93hUm8VlQaH7axOX5
	UNsIGMEyIMyR+EwKCRMbgNqYr84vKjL2/+D5WdaUCOO3oLLpLQ463ePH9KjzN/tc
	vlB8P3uxB5DSfC+gKECHkkwiCojpkOAwefJrSfZsFKUNhnfx4FRUk65Dr+xBYUXh
	emqpyYXFLxiOHaQ96aA30wLZeIcnM+kwDHJplQJRuY1+ZYBbT3HDbePZkc4mDA85
	4RMJ6X7zcxvVTsnLtiuDoQ5+RaJTQhPSIvgai50NXb00PgERVrkajkHOG2mAY5gx
	3S6Pmw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2133t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6R635022999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:27:06 GMT
Received: from ap-cloud-sh02-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:27:05 -0700
From: Songwei Chai <quic_songchai@quicinc.com>
Date: Wed, 23 Apr 2025 14:26:51 +0800
Subject: [PATCH v4 7/7] coresight-tgu: add reset node to initialize
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250423-tgu_patch-v4-7-92bbca66c766@quicinc.com>
References: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
In-Reply-To: <20250423-tgu_patch-v4-0-92bbca66c766@quicinc.com>
To: <quic_songchai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745389616; l=4150;
 i=quic_songchai@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=zno3MqswWzFkpvb05DVN/lUjOgYNlIgm4Tjhl/CIjs4=;
 b=6Eek4bUxgM8CLHuUo5JEtVQ/+AIycZzZP5keQsxJ7by7NPA5sOMYsNGLEeEn9Ox/piBfDPNBZ
 lZDwYcd2UhADesC5uwDKGW6aCZzqTRfyX4XfiQ4lzr/Py+1ME97f719
X-Developer-Key: i=quic_songchai@quicinc.com; a=ed25519;
 pk=uPEL8tAga6UMzd+eo6u4Mmg7ctrdZe8b/sjFJqJYEHA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808883a cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=z5a9ZJBnnRrTyqXdmuEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0l3JH7zcMYtm5HG9wy5XpvmBtO-SdbOB
X-Proofpoint-ORIG-GUID: 0l3JH7zcMYtm5HG9wy5XpvmBtO-SdbOB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX+B0NWy81quZ9 U2GwmBmMIyheYH3UNXmY5Dey7lBXXtH5j8jTbXs/Wv961/Mn0rBHcGvE6H9Gco1NA7Wb/pnvTXP lnhEO+iLnfz5+hb4EMVmwAsJ7cOKOIaOlHbhxlaUkU31X3hIwzpySxUKv52wBWHmrrDz5nmNuLz
 Vq3YJ0A/kw+mxaz3QGJuYrPpKTnuXibHv6mFJAsW3DSk23nqgreiiLeVqN0N1Mqw09wxCugHJqn +0xCbg2DchDvmDEb2pU0XtbsLqzWlES5sNz91wjPE/7Tb1HNbvGi5h5DUm02IMTTQX4stVNpYqu 1eevJlRKtIpQiPM/vYOt6P+yXoYGJfMq+o7HzI6YPNgAzwBN8gUckE1vQR5Yt208JvQS5RWnEef
 gBrMTxQFqo6jEla79TTA4ajck1jeD7Cz6R37oTcgAP55RbhTdJJN7ROlLPwovzKM7iIAC01K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042

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


