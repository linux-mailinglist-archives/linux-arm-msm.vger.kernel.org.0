Return-Path: <linux-arm-msm+bounces-97269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH5qO+/ksmktQwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:08:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D60275357
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A4533081090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3560B3F7E8E;
	Thu, 12 Mar 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UAogwpW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApatdNC0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4613F7E7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331029; cv=none; b=SryzB0Qho+oGDI66syMRj42dGExy4edD4zKPGZLkW77WFzErdxqCMTPt5DAMn56QZL2UqZ7Ip2SNRPTvk88jULX4fSNjHfZELso/L2BXBShfWPHDH4gIM427znhOmLjhYoYJVftM8WZbdsm+O3Wnt7xQ4r41Jm+Pvqeta4Ee9S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331029; c=relaxed/simple;
	bh=NJ8bSQsvrNv+RgGH0vB23hrO6pcccX75FiYOSctThyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFrOPudDPnXNXDC0EpvfaKW6dvFWkNxp5N64qInfO3QflDuipU4nZGx0JUmXjpDfUBDUHP7Gft0tPLIR/bro5pAByk+ptxo/piLcj3rilKV4tKqZsb3v/8ZUWdsiiJDQ4weRlDkS0YOjRYSTNnQuw1BZ/aDf9XdDCk+G9NynRL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UAogwpW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApatdNC0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C7e1pG509757
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DNHnd5q8JdYb6diJR/PxRQOacgTSyQ4yOW98Kxsp1k=; b=UAogwpW1dWU/TImE
	ZbICTWi0OvIucvMecCyElJTr/J2CJm7t70H4QiRkz30tFSWkOMiINvfywFBJqvNW
	NtIwLEat9FOyQTz0TCFt3vqHkA0hTVyarMnUt2o8Ey836wCTLoZPL1MNzNC75JLa
	IJqG32ds499MKUzv1GaXickIsFJ4IywImtXG8zfN6Qo2rxZ7qPBCOVt/2Ps8V/zc
	182Wfwg2rAikLaombnJchVq1z64sWRgjHg/Dh7TbPO3n0FZHy/fuq3sG93Wte+Fu
	TpDCHQDckdkvTfU4aPLOrAZebkmbuRJihn0r2Xw9NYbjxhAtF5VlzTgoMXotOsej
	l3XtCg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w1ayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:57:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7378ffeeacso5176382a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331026; x=1773935826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DNHnd5q8JdYb6diJR/PxRQOacgTSyQ4yOW98Kxsp1k=;
        b=ApatdNC0pukw37oZPlbHPH3+ZFntHIbg+BJx8L/5cyGBYS1gZ+JRimmMFko1W3bKPg
         w5cuJF0JAFSr9p79G4niLOwKMAaW7WOSib50Ft2wczjlFhhOOhUWYXNSX8wqSU51dvmF
         kNGYQhenW5pyw17mGMYahMQJtFVAdknD2m8Mjy74eYfnKDTl5SlEPRWNbB3FM09gUbZ4
         nw9Euwh7QmD8bDq9Bz7qy91ivKCFD4nKVQ9s1vU4gBGsm3EP7Xng+RsfWwSiqbOzMBKd
         /gnmEMZAjftWo8Yzu4mRR7vNWfIZx1y9oaIr1bDAcIDfCUewAVfyw4L0b+3SMmvvUoma
         yGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331026; x=1773935826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DNHnd5q8JdYb6diJR/PxRQOacgTSyQ4yOW98Kxsp1k=;
        b=Yta4FNefgj9gotkQ6uPwBqRRmtcZTACq3ULfMl1DfqOw8UIMP0e7z59osAVQw6HKYE
         FgVnqgK58dyZeI9WV1yezjj1Wd++8PfFXLFfr0unzILJt/eO9qJGc8pALYxmGJONqFlr
         0SzxSCUBa/LHdJh0YEqfkNzWizkEuNJ2Q0fQomuQ+cnJd72Ap98gP+LNk+qxUZyt93eu
         BEBs2BzWnLEHZGs5V4F4A1JpC3myBLbIDgINVL/1ohojpRsKY7Jje7Q1XU1hiZgJ1pPl
         d3erRh0uTVpjLqscwE9SipYwIFVnMcp+cxfNuBbw+Xpn8fJapD/+Pbs9l8tHJZdo3drK
         34Hg==
X-Gm-Message-State: AOJu0YwHh/DUzpVES+Vo8PnN2Bz5+UZkzWup1LozqgGjQmQxcY3gtSiP
	WUbleI2LcDX7YkuvUk+8qoAtywrd8Eo/KFD3z8mZigLivMFxV804JhWjTqrjzatB2TtPZjp+Ngs
	qZK5FYNFlV+EXJp7Jm3MFYkxADD8MlLX96paVlDD/zip7E2drd5D5WZAq9DdkHl52K61x
X-Gm-Gg: ATEYQzyMGztjHyLz+bcQ+EN/vCtw9O+LwkOAS4fk99dCN8cjKgeUn9ppTo/39KOWJDy
	WckjHtm1SEVjZnAVGN1q6u5or0YYHiNpY/8DASlp88on1/UWUztM3AWyh4o5G1q2pKFZFn8KwRC
	MMYeExPk1x02yI2XPjXNXALuTVsij/cC3M/VqWSwLA26JoU4hE2gdFDQtH4mSVTwAhmKFb0xvd3
	Od5Y5oBkKVmxS4ebK12c08e6INoR10OMa/zhaQwMrUMlgtSUGdGCLvtUJkBVHNAtMVxnXc4ltb8
	xAjJur0xfWuH7pkO0d6d73VwEWs900eFOVVkBfY+K6mW/L5uRRMIbU2S3fdFnGoatKvsQH9xvH1
	8OBryuVe2RsqyHkIKjzUy7vwSX3fuZ0cYt822YMWStnBP5VYzdA==
X-Received: by 2002:a05:6a21:4c16:b0:398:98ab:71a8 with SMTP id adf61e73a8af0-398c60e59b5mr6961774637.47.1773331026043;
        Thu, 12 Mar 2026 08:57:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c16:b0:398:98ab:71a8 with SMTP id adf61e73a8af0-398c60e59b5mr6961755637.47.1773331025620;
        Thu, 12 Mar 2026 08:57:05 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:57:05 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:39 +0530
Subject: [PATCH 5/5] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-5-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=1197;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=NJ8bSQsvrNv+RgGH0vB23hrO6pcccX75FiYOSctThyc=;
 b=rD0Ei0HSh9bbNMlw0dI2qpz+6AyCNXkRaaS1CmS1Irc/Wb18gwuLl/voTRP92EMMN3BehT5Ll
 O36yLyjrWH4CLeTbMsPqsmoB/2Dt9Qn264LPwq0a0MeKmX3QBKjnuST
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 88ycXxda8RADCI6Qo-QKQRrT2zzGIKSM
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b2e253 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xCvdDQxbVn5SMwWwlOUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfXxdNag/eX/I5b
 rKUy7qDG76F5xVKtK/ito6/MucoCCy1+CAQMehfc5afsilL4rF7s9ef5ltlvc3ooA50Ol3d760C
 k+XvrQiagk7JCiJ3mW7XIimRASVQ+VfCv7fnohnuvZFCiOXBMLdXHz9GT0MuZM351VmqxJ5oTkv
 Q9H8JncWNtbT43xqlirY9cZvYmvRXUKZYG3RXoCYRVZvDQQnz1Ps39KUYk1g2dXQpYjwSPH4Yld
 5g0Cy88Xk1HuA9THQUY8idSO12W3de5luDgl4RFhxmUivOf8a7m1zTTN/9/19I1fUTo06tfD9yR
 U5Q0khsA6aAfr3qaTr15i+Y3H2C3c1vlJpmb5l4Z0W4YThfIsvf5Nt7w4C3fWxvR+l3FBYHP2iv
 NV2m7IQnqGfsb53kJEg0LeztXCGYg3ahO29c29xYkQGh0trWVXYhfv6OCJSTcgrsp83e7NcdQgR
 Kfu9suVRLLYVNHQ8kuQ==
X-Proofpoint-ORIG-GUID: 88ycXxda8RADCI6Qo-QKQRrT2zzGIKSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97269-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04D60275357
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs. PDC is now set to pass through mode
which allows GPIO interrupts to setup as wakeup capable at PDC and pass
them to GIC as SPIs. Update nwakeirq_map to reflect the GPIO to PDC irq
map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index bb36f40b19fa53eedf68d46d02986410d07a733c..04e08680f996bb06f1e3123c45863c184a3fb205 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1839,9 +1839,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.34.1


