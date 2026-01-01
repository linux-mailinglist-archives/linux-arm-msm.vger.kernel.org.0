Return-Path: <linux-arm-msm+bounces-87153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF1CED2E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 17:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE8D930039DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 16:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0E26ED2A;
	Thu,  1 Jan 2026 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0Euvl9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYc1XU/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262521FF23
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286340; cv=none; b=lhLam+6JG8/P7+mk+x7yuiPz+0Vk+iF/k9r0+CQJXBrXjL8230A2BNyXOgDuJBL1592Ny2qtIm9gfTT5Yw7Kt9dq7PRFdP9bNoybtT1EOtc3iN+58tA+jegVt7TMse14CkR2iEzkKYVVYOoP2U04XHNvdhN1vDs/QEaMasQBTDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286340; c=relaxed/simple;
	bh=CN9+piqYU2nRNNc814BMIlhkmO7iuBRqZMMzlGDUZQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jc/gEOq4Ijmodq3WK3qZrfVREaEKXzwwnHnvRdBZkTdWjI9PgIn9GSk1IL5dfstM/PyNkLFV2N0BKGqnehceuxAKI8j9ezCZoHxGJCOu8Ee6u/OPFs4RYLaJkKWzlAnmKud1FoR4sWBz+M5QfIthRaazP8Uu6hmdLm43eIijsgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0Euvl9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYc1XU/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601Cf6l72540746
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 16:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/85oUn6Cidu
	DRwj+B41HKFKfTsIhRmw6/va6Abau3QA=; b=l0Euvl9Yso5DbB5Tah+Hh9zbgpI
	LX3we6DjDdj3Efkx+2bJTUbENyqDolZZrHHs2Gxbq/M8/LkXBq/lVvtRYZL7nEfj
	dgWjKXl0gWQk+yCKMmlvlAvfIWYyMidE4W+K01G+4HGMsezAuFA1FJ34V6an6nnq
	PLzNVoYnUGeI+hn2z2/LFFyEf2d6acx7fRbqANLJXmEfljD0DN0Mdmlk+MrbtXg7
	0n/MeR5Sp/Ul6xTU3TPEXsTolLsK+YKaw1vOf2/JD1Ambn+lrFFQS9FtkkfpM14X
	lbXQXwSfOE71rkTKT+38jvkGGjKxKPS1AO1Vr93H9tIx+GQKSK2ijHfGG2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8531nj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 16:52:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso102745005ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 08:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767286333; x=1767891133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/85oUn6CiduDRwj+B41HKFKfTsIhRmw6/va6Abau3QA=;
        b=cYc1XU/cGgLoEUxgOJPG8sjDeqgUFJFMmJA/wlCu5tqfCrZvEUoj+2gL69tftQu3pw
         jmrGM6QctvljY87MWj/os9b84h9bIvfwwRsyHKr5l7Q7S7tGD02so3HYYG+amRmryeOw
         Uua5CsiiG4m7Gfpj5RcWhy5QurY17ZvruUv++FWS9yXyVlWJJvbA/DKZuVrS7r8SFEy0
         g7jofieVBiQ00QpT7FxLIxxTIjn5axTtpxMVVGy6V4TZvlyEWcDzZIwtBDNyAfV96w7c
         mjbO9s3v+vZqAlFE26fR+RK0R4EdrYvbsxG7SwSKyCLTjoxAD17bV2ZWNsW2wPaTjAl6
         HLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767286333; x=1767891133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/85oUn6CiduDRwj+B41HKFKfTsIhRmw6/va6Abau3QA=;
        b=B9Y/ahANltO5AZ3IScIF9fO8ztNAOd3POsi6nB7sy965pVeaj76RN/Zk1BEMaDIv+N
         Db8u5MlrVPva9YMpNjvEL+yVASvkssYslVJrgOomYoxFI6yAKYdVQoQ2+TlaZyy/yWnd
         653nvk8SpcUyBdjM8fQjdp031yieSvRt2MgdvXvgfDnWuwtDABGBcIuKfAHXNCc6SJjn
         RIs4CfDDb0ghVqEXCtPCtDJBjPtQ4OZW3BdyOARNDEQZYKttiAWu7M5TA2BksEKBd78B
         egLaqmNn7E6Rx8N639XQicNHWz6cMHUxDaqRO1dBNNDVvv0HIkCfzpTTmiknrDLxlIDx
         U4yQ==
X-Gm-Message-State: AOJu0YzsWH+ZoNMQi7dvBEAMMTLlRP0QcfVm2Aq72INvsecXqwoxH6/h
	+WOhbIpvThTw1ijeGfVnAn5o8RpJTqwtftVeJtmYUCmumIAU8BL2Ljc/qAQXenNn7Je+NEsmlz+
	oewc0wlmdmUClpERTL3TSpyR1xK5ZfxaKrls493buZW7JB5rb08uuhlH9qONvicX+swQF
X-Gm-Gg: AY/fxX4CoG1sbD0fmdmUhzXqWFS+4JVe6AlcINusG1zpXYAklrHrN+TEEJ+W5/B0cQ3
	lJJitZrpVMENiwcQqNa3W6RDzNzybr72QiQX/m3H2CY9djz1RYBNkDOJ9VqxnsSQ0FSLqHm8NbR
	NosanPM7cLfdagSi77bVf+rX0nUUwF3uqXyQ8V6kDWv2ci4HNJSEcPF+fwA15LU7RCRLUOVdtoA
	8hbahwHPud15J2WRNlpnDYjTgEbCA51oGWbJ7XXCl2giXpiZhqVhQgPJkaUrY8jj9pF8rU2kbQ5
	QN7t+fx8utdBhWYUhOLN08LaQ5X0eGnF+MS8mstwmvQzyY3ThrmQNThuR7tEjVa1gBrtm/Xbeud
	cFxMAzba9QaHpXxq4Mkp8NkaHzA==
X-Received: by 2002:a17:902:f641:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a2f0d5e6b6mr451197425ad.29.1767286332625;
        Thu, 01 Jan 2026 08:52:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0LuO2brOjcuc/oced29DvcpXqw7het94MNPTu1lzNBZWBQefRp6AgtYNRInRgnHSXcGSX6A==
X-Received: by 2002:a17:902:f641:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a2f0d5e6b6mr451197225ad.29.1767286332119;
        Thu, 01 Jan 2026 08:52:12 -0800 (PST)
Received: from work.. ([120.60.56.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm353854135ad.44.2026.01.01.08.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 08:52:11 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [RFC PATCH 1/1] soc: qcom: rpmh-rsc: Register s2idle_ops to indicate s2ram behavior in s2idle
Date: Thu,  1 Jan 2026 22:21:58 +0530
Message-ID: <20260101165158.7251-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BECsUQH8QT4Cb9fB98oP6Rg2_G0HOH5N
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6956a63d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8IDmrAvK+qXhUoYjRFLHtA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EWIu1AOeq_QherZyXQMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: BECsUQH8QT4Cb9fB98oP6Rg2_G0HOH5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE1MiBTYWx0ZWRfX5/me36yut1bq
 dJZPFnr+LyUzMtXSncFKmk1FEXgzbFibAItjQV277gq6ujbJA2GQ6S3gjdNEAjIEpNFcBAi+u3x
 PfxWD1vd+VeM/R/sLI/LbDC/gDykT0lFxKUBtzVhH3IXD4IF2OvZD1iC96HNMv2ZFAQ/rv0HThK
 5HTuPepo9ONQldOf9USKbk12n2E+768Hg8NXy+/1fW3Wvcpz32ixuslO0kroRpq8MQwUSSnxgXs
 4JMqtWs5zgRI/EPzcrKA5DM/ou2mXsNpI66FYg5Y2PoszzVXziSxeNhpEq082OfKqEot9QtKUKw
 kPk5CR7Bn6Y5YP8yh1IPldHhRORdc7Csn91yrprx47UHP5WvSDUYzlW6Gc7MTTr0LUaTszgXw64
 1AEKOcIEAV3gZ5bIwQzbZ6UR2NhwJBeFv7n94eAbju8yF3EkbHl4Y+Q3cMr7NCj+XdULFzZyZUi
 wx1QA+nQK90mLkxCjyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010152

RPMh in some Qcom SoCs like Makena (SC8280XP) implement deeper low power
state similar to that of Suspend to RAM (S2RAM) despite PSCI firmware only
supporting s2idle. So the OS never knows the platform will be transitioning
to deeper low power state and the device drivers do not prepare for the
possible power loss during system suspend.

So register the s2idle_ops for this platform and invoke
pm_set_{suspend/resume}_via_firmware() APIs in the callbacks to let the
drivers know that the firmware is going to get involved in the suspend
process and they need to be prepared for that by taking actions such as
shutting down or resetting the devices.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493..a7a03b50c289 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -25,6 +25,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/suspend.h>
 #include <linux/wait.h>
 
 #include <clocksource/arm_arch_timer.h>
@@ -1028,6 +1029,25 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev, struct rsc_drv *d
 	return 0;
 }
 
+static int rpmh_rsc_s2idle_begin(void)
+{
+	pm_set_suspend_via_firmware();
+
+	return 0;
+}
+
+static int rpmh_rsc_s2idle_prepare_late(void)
+{
+	pm_set_resume_via_firmware();
+
+	return 0;
+}
+
+static const struct platform_s2idle_ops rpmh_rsc_s2idle_ops = {
+	.begin = rpmh_rsc_s2idle_begin,
+	.prepare_late = rpmh_rsc_s2idle_prepare_late,
+};
+
 static int rpmh_rsc_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
@@ -1122,6 +1142,9 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, drv);
 	drv->dev = &pdev->dev;
 
+	if (of_machine_is_compatible("qcom,sc8280xp"))
+		s2idle_set_ops(&rpmh_rsc_s2idle_ops);
+
 	ret = devm_of_platform_populate(&pdev->dev);
 	if (ret && pdev->dev.pm_domain) {
 		dev_pm_genpd_remove_notifier(&pdev->dev);
-- 
2.48.1


