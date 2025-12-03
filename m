Return-Path: <linux-arm-msm+bounces-84179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A26AC9E63D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 341C34E51F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4082D6603;
	Wed,  3 Dec 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEAk5hj1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua25o1DB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C9257431
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752519; cv=none; b=HJsKmV6344qaUxpED83dw5diEAWgXX8fVTQV7rAX3WnPDEpxHbZEYHNJEoYviEeBs8CfyIwVhRSfzfyXAPB4SFZ6z5Wwad3GUm7oLEadyLCVDmeqnJBvUBwed7kZsIdxSUJhHq3y0qgjqeh49MAACtcQNEDEnR9tmPdHnWEys6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752519; c=relaxed/simple;
	bh=1BtOV/SJZWIFW6jxWiw7Sv1iyqhney4xGXyT6EzMMcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8XmkQBtKxpDi373LG7mJuzwoSbu7qYduIuA+ljda4E5ZKPpSV1WGX02/Ud6D+zkTO9WJfHUfiC0T2R9jEIUHN+A1YQZJTO4kIVIWP4oukHPy089/2lEw3O07i+5WQC8+gw7uTCaJavftAI7tknsXl5MdBF60oJFbrwnSlCqEhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEAk5hj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua25o1DB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37YGLg1909983
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 09:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vAnZPRoPnmA
	r0OgnZky4GgITZgZg+aavJ0T05/kKawc=; b=AEAk5hj10MkZ9+sicBhh8B9h4l1
	36lSLGMBnJHcvnVZhw99w/VOQ5JoNZ/cHlCLHJwSQ9+Il7tS7bKRFoAstGRRODzD
	CwVpi0hzf/m0je7iAztt5cIP10MXTX5jWwIAQYATMMIcyEgCe8WIhFNU0jNsPScT
	gzp8mRPF8TiLCnBsy1lD1q6ak+03Jno4GbMGGFt93j45kEJ3wCRzjF+uV8ZL0Vlp
	Z9yibJN7bjPAO35DTzV2VR0PX+hXEd4qjP4Fe3oqA7qi5J/EHejyNl4wK+F/VCer
	IzmhV4DfAb64PtbBeAV3kt3DNRKrKqvt2HeAPsH9/5SaPfH6pCWTAG68yeQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atgx3g80y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 09:01:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11bd7a827fdso905489c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 01:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752516; x=1765357316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAnZPRoPnmAr0OgnZky4GgITZgZg+aavJ0T05/kKawc=;
        b=Ua25o1DBo50rhm5FmYvuQitb4CxxYD/rOtIYQ5TV6guVij2fEibl0bbtrQes0Td7pI
         NkbJ7vKc+gMMWHupM+NDpOzQOik0aU/icf9HInYN9no1EKBefNSesA0M8AhbastZ5vUe
         BPeYI+MPCkHKr/lOHFmVk9OB3SjmA9Umt5aCgQwXep4Z1fkHfxFI3Z6L8IiLcknHAAcz
         4AmiJPmLDSzv8DGR9nztgbl6HTqFZGqSIaQPBTGrGzndx0zAkTTuUXy+4Zrump2hrtrC
         xcAVae4PzVFUWefIApAa/7+mHk2qVS9TXLcZZ4JhCWQ6U4yD9nAGSkLyv5sD9Imh8Cc2
         iPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752516; x=1765357316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vAnZPRoPnmAr0OgnZky4GgITZgZg+aavJ0T05/kKawc=;
        b=jQMx8PrvXUHBVJLBuLvrbZrm2upuXKx6+atem2LlXAzoNzcTRFkNikY2axSH0Q5FuX
         Zt46HBZjxvuaAWxDR340xk1kGxLPvhj123APAauJeqLjKOFf2cBNLQDGV5cqkKhrHZbL
         2GqAdrPb2372PXlyeHGmX+wTiJ9NuxyuJNpT/WRxxGnqK/XIbs9vzDQt5o0Cm/sb11/+
         pmiZPjMbu0UevqpowoXGlpMMafOfiZ+uN6MnqecQSzuf0/aQ3e2+6yL9gEKeoZ70EkEl
         VwN1Cm5yUbFw6TdRjbxqWVsGk+34Zk4IQPSG8OxANMdw3giP88iLFhBzTr//o/eYLhng
         cwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Rsh33L8B17cpc7P7DrN6KZ0SSM/MmFPw2l9zwVQmHEEidG213EAiI/qqFNLaHvrXR1W5NOUigR3Md9iq@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5o0w9A349ESdozDTBUabDTG+BXUmSf2bS+6cL9izaJYSss9i
	Y+Y5kkcg8j3oHumFDmB3j2OQYGIapVWPE4mEUKYVRDrXKj4gHHI49oXu8d7DCcb8D2u/rcsdjjr
	K8XUFW5sC14UG3MXZyZNvAKZDCYcA/aHjQYAVGLYVVOu+AkFtqc4O5wEH3/2uAUqc4BWH
X-Gm-Gg: ASbGncvLlsQcXXMBubRcpBIUQayGERG9W2iuaKSfgwHVk809J0FA054rYufsGIHrVTs
	ZC1UdeSkKiP1jEbhXAhg7/TaJOUk+tD6+zwNWMMmS4pNVGJR9KZd9Vzbs886GQv27PzvXsetxPl
	1B2uHikgEmZCSeBkEKBg2++euifPhtwGVn0+IjK2S8l53u23KdiYY42HDE+ieyCjyPogNEjtxnX
	ZpqwWWDHIfRq0VRdPV9i0tYmL67i779XKWIbbSSruJU1wPiMTbBSM3i6xo+isT+pekeEFSfk/hR
	9Z2kOsgHqz950MrF83TyD0I16m6ISOP7mQGabCKsU0Eo++KX0oL+Koo1keIKBJ0AG0AnRDb5EH+
	7lrU2/1nN6NzWyjaj1kSVVcEkKl6HGHG1ApIiJ6JJQK5dj+6YOkcGOHO18lzK0BsO
X-Received: by 2002:a05:7022:618f:b0:11b:82b8:40cd with SMTP id a92af1059eb24-11df0c463e5mr1170457c88.14.1764752515489;
        Wed, 03 Dec 2025 01:01:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSNRtAZGBTSJue+Ey8VONMYuwnZj4Kvoe/oRjlVagfklSEUJXSEiWRgsKNGcC6ntzC8e0u3g==
X-Received: by 2002:a05:7022:618f:b0:11b:82b8:40cd with SMTP id a92af1059eb24-11df0c463e5mr1170428c88.14.1764752514936;
        Wed, 03 Dec 2025 01:01:54 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:54 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 7/7] qcom-tgu: Add reset node to initialize
Date: Wed,  3 Dec 2025 01:00:55 -0800
Message-Id: <20251203090055.2432719-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX0u0zg49Foefw
 AP0HIDSa2QjbuhXd+mth7XAYRWc7ct63zV1Vkwmp/v4nr9SkUicx0+HJXOqryh3PVOssOavRUDc
 ptTAPnWIMVmZfEXYr6g+FBdqn5fTfUYPiaQrAX7YnQtNoLP3nHQqx9WpefN/xcCCv9nI5XPagtD
 563fpCDSg0fVP8kVsU9v903afPHw6tnFf49iNsrTFZVqrXXX3HNZe3m6Q1g6/gFktZJadIeeSUj
 sgyUHglA3kYQxY7e5aUGK2+zM+w9vbA/mivWJie4M0cMGgqg1mXX2fm1P4l2KcxyE1fXY4A5RL4
 Pwj/EFoH+zXfETvG/oX0MxMc/C9uKBAeDui2H5l+Otnco5RrpXYtdJ4J6zPW0gYjJg75PWWvcvd
 VPPRY+DJjyrLe80ma/HNTkKbtZcqBQ==
X-Proofpoint-GUID: rTBxXITxfps180XyUrXxMAusyDPXmvBZ
X-Proofpoint-ORIG-GUID: rTBxXITxfps180XyUrXxMAusyDPXmvBZ
X-Authority-Analysis: v=2.4 cv=R/QO2NRX c=1 sm=1 tr=0 ts=692ffc84 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 28d1743bd2fc..3029f342fc49 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5db876c31a63..a164867c6b66 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -434,6 +434,80 @@ static ssize_t enable_tgu_store(struct device *dev,
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
+	spin_lock(&drvdata->lock);
+	CS_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
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
+	spin_unlock(&drvdata->lock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -445,6 +519,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


