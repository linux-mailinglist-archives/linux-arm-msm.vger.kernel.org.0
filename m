Return-Path: <linux-arm-msm+bounces-110253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ju6GYVvGWqNwggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:50:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7BE6011C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 12:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A7CE3055EA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E6E3C1413;
	Fri, 29 May 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmt8R8UU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gBUj1S4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A63C061C
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051395; cv=none; b=Ikq1lkIPtpFyp386lp+AHX4R/6oaYsytW/vP/+2EDF0dSOqR+wcywJ2e38ZeZTO0NVZBMldG/ucSGiyj3Hp9XHm8ONJZ4qwMlosc0F0RAkycGGI2a0YLRtXAhBfHcXynxexmogecCtCDUYHsfGUywhaEzyhjCKevWxCsEaXMLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051395; c=relaxed/simple;
	bh=ixSWaJbQ66wwRee4PmEbinpxL8L7YWuFKgWmhihBeB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tlmPUep6LrimdW+oKZnk1on47+ALvtOb1d/po0W694iCgA5Wx0THMBEx09YIPGpA9CeJs7cm7NL3+ioWSY4hbAsd2mjyKNmyOggaY/DS+DWPKnqSOQSB6qwixygQTfsnd0s1hwA39JzojEmc1yj8XmTNPSw2nOom75HebSaD0wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmt8R8UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gBUj1S4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T64R193253721
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=50ma9osI1PDj+Mi7bKcJ1U
	1sqm1Qr8+xGWCuYMysqp4=; b=kmt8R8UU6LszUGXLEFCIBrDp8hQALdjEXuVIsH
	MjQ0cbvCGkZMC24GehrdKhGofUhKDoErvDKbREZOaVbQg4lg5em4gDX2ApeVGIlp
	xIRhCwqFpNjRsst9sF0LtMwNJydL3f5qfO3+wa33UIxnIig/hPZsJWzT+gdkqTfg
	+qdsMgl8SGKCWU46l/gd624213elCzv2Nq7Q2OkzswoKCH37rHUgNDRbmAUXutPQ
	sxe75mbyddqO5tZkUsC0ip2CG14vs6vgPO4UzPgsJVv0rZFUM8mIndp1B+BhWcV/
	KDWf1hoLkAmHLQOcY09jjozuDbEoMOOvch9VRIltu0xZu/UQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn43pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:43:13 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so13704640b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780051393; x=1780656193; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50ma9osI1PDj+Mi7bKcJ1U1sqm1Qr8+xGWCuYMysqp4=;
        b=gBUj1S4nNbzuOVCVpLAjrS2hUfkDqE65G0vFOmsPjUYOGpXkY0JgiWFD9624r2ZCqg
         WicKTWJUPWAzcqSAiXUYLyUG0PcC5cxn3pZWChegycCPO7jTa4kPz8GgCrKkN5RcMjs+
         AMTxydb5TNCFBmn8c+QkZUWi403oc7NSHi4fciaJoIQKBg3UOb/XiuW5gFa2FqCxvoiZ
         CrGXZWYyzVJ60sSbtRvmkG+CHU3+/Qk5uIT0S+6qkny184mmntCNY0t4mtd2ZNTPDg2M
         igeEqLxEuFQBYP/aisTWsqTdEcFuTYYu6qrPkYujYi9xbD0GZBIb8i9++MuRN0ODf/ks
         lQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051393; x=1780656193;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50ma9osI1PDj+Mi7bKcJ1U1sqm1Qr8+xGWCuYMysqp4=;
        b=eGa5WrG1xPb46JZcQw8l/LF+e6Yjf9LbMWza3/LFCwaJOD1MDHKYyPiOivcJ2eKpsA
         +NoeR4DaDUCtGg+nxiF6xHe2UvGdS+qbWbjSX4ox7UosFUNcG34M5RvBq3WHoYTfK/ul
         lwhrfwgtGxPNAeYOh8SX9V5IWwD7ZjCSB/jWHqY9/6fWkleZYjjBHJzxNcEVal/A3cnU
         aIrhBLS9WF1/5LEYyep/m+lRbty7J7kooEt5KghFgkWvzvCRbxGPBy+oEiRlxlrYBvS5
         8ZIX84PWtTrzQ+VqxoJvy0nQutOTeCJnYhFTYGBhfZBaV8HdqnpWNB+1XVBc+7gyBRpg
         rW0w==
X-Gm-Message-State: AOJu0YxMacT9SjD3GIReJbvl8ijMF1n1ML6jvj9QT5YXEplIJ9cJRg1x
	RO3hIEhIws73vBKDHKOIj7wsFE50B428RKFNTVtEWsIS90BRZT3PzL3I1qnWRkXfer6AZZFedjv
	gkb7LDPmTyvJ22DI0RxeC9qNQ2OfFiJB0tK4EK2fSZVpWHdR3iFdS2x/6m4Mel/wyUKMR+0Nb4u
	4H
X-Gm-Gg: Acq92OGN1xZi7nR6svI6Armc3kBdJczGkdutlnNxOCpRtLNMSEhB9Nubt5sFn3dLwTr
	02DO5pH0B1E9AwnDvWoANOEQTTDv40MK15jpTnyXOsj+oagEZu8CQF3kwhrtNILnL2ixJF1+QQM
	s1y+Byvy80AzJkpZCfgNciET5cnt/DRrJKOKiQHIp4hWuk0IKLJL607780m+hzW+aEpm/lGXPSb
	J+LMPieLMT5XGmg6EBC4af4SuGhqh9/dSJfL3njSzqEEjpOpZhKNCMHitzBFXJzJXjxGlC5+uGG
	80fbae5f81p+VpLGduhZThUB4pMZsPPPNpHiEVP0v2ozwQKx4Hne8U4Y2uHwAuRDp8EHCp0q2xw
	372WzBIg/n+AveXWr/bEJIyAsQHuBBzBsyV9OXxRn/NmJsofPlMdwLHEa3fZeZCFuLcMC
X-Received: by 2002:a05:6a00:2306:b0:842:994:939e with SMTP id d2e1a72fcca58-84210d4cbf4mr2159836b3a.35.1780051392889;
        Fri, 29 May 2026 03:43:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2306:b0:842:994:939e with SMTP id d2e1a72fcca58-84210d4cbf4mr2159812b3a.35.1780051392427;
        Fri, 29 May 2026 03:43:12 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cc094dsm1793802b3a.44.2026.05.29.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:43:11 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:13:01 +0530
Subject: [PATCH] pinctrl: qcom: Remove unused macro definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-macros_pinctrl-v1-1-3d5671efd18f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALRtGWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMz3dzE5KL84viCzLzkkqIcXWMzA0sLE+NEI1NDSyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgD88cpTcgAAAA==
X-Change-ID: 20260526-macros_pinctrl-3609843a2519
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780051389; l=2728;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=ixSWaJbQ66wwRee4PmEbinpxL8L7YWuFKgWmhihBeB0=;
 b=hcv0K5M8nBZL9UZKJebTzkv4PdJqJi/IctBSxq0YCFBUiEAhpasGqpv/lNARWm+Hp6ccbpU9q
 hbe+aH8D2L1CfVPGK0FYrUmB39UWDfBTt3HQGGwUHvkuK8XUnhce55b
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-GUID: cxPKgoIpZoKu31yAZiuBRGBFZQnX67o-
X-Proofpoint-ORIG-GUID: cxPKgoIpZoKu31yAZiuBRGBFZQnX67o-
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a196dc1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kh8tv3nup7AWy7AdkQ8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEwNiBTYWx0ZWRfX7EFHEcjJemMc
 zVV6Cyb9p95mch/DNaPZrjOOId4ZsG2RFYKjx/Bs3I9xjanWzYUk9Jmlw8dRkQl9IWWhNcMMxb8
 yhr/giFjZTupcLi0PpfVbQZpKNxvvIZ02/iepaS/5SXmYtoLG9qCNXrGBvkE3aZgrMcrOt1LjMJ
 gVtodgVGo2wbLvLQzl3Otgh+GSdTpbRq3TJLDty2yOtPKIrE0evUy0hfG4z3+ny7t47lWhGXXzK
 Jds+oYwaWZoK/RMM5pFLWM8+cY58DrWtgom+CtgJ0vGFnSVq9Jf1B9VfmSfs2NnxrrIeUAJtAKv
 pC3nmtcKpCVP4cwaWSpXQ9obvFCVhDBOhkzBJLtY2VQtmf9lRtQtcqMvQGwkQ2qPn3HBprgErRp
 NoLNmEPBFxZQPDNnhgdq1PdM/9Cinr30e1YSVe2rbtMaPqZeVpLcNDJFpcllJfd3PEp20IDgWVC
 0u/hDmViML+OMEHm66A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110253-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF7BE6011C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The macros QUP_I3C and UFS_RESET are defined in some platforms
and yet not used. Remove these macros as they are unnecessary.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs8300.c |  6 ------
 drivers/pinctrl/qcom/pinctrl-qdu1000.c | 24 ------------------------
 drivers/pinctrl/qcom/pinctrl-sa8775p.c |  6 ------
 3 files changed, 36 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs8300.c b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
index 852cd36df6d5..9a904d809e11 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs8300.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs8300.c
@@ -100,12 +100,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 #define QUP_I3C_6_MODE_OFFSET	0xaf000
 #define QUP_I3C_7_MODE_OFFSET	0xb0000
 #define QUP_I3C_13_MODE_OFFSET	0xb1000
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 77da87aa72aa..1ef77f82820c 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -75,30 +75,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define UFS_RESET(pg_name, offset)				\
-	{					        \
-		.grp = PINCTRL_PINGROUP(#pg_name, 	\
-			pg_name##_pins, 		\
-			ARRAY_SIZE(pg_name##_pins)),	\
-		.ctl_reg = offset,			\
-		.io_reg = offset + 0x4,			\
-		.intr_cfg_reg = 0,			\
-		.intr_status_reg = 0,			\
-		.mux_bit = -1,				\
-		.pull_bit = 3,				\
-		.drv_bit = 0,				\
-		.oe_bit = -1,				\
-		.in_bit = -1,				\
-		.out_bit = 0,				\
-		.intr_enable_bit = -1,			\
-		.intr_status_bit = -1,			\
-		.intr_target_bit = -1,			\
-		.intr_raw_status_bit = -1,		\
-		.intr_polarity_bit = -1,		\
-		.intr_detection_bit = -1,		\
-		.intr_detection_width = -1,		\
-	}
-
 static const struct pinctrl_pin_desc qdu1000_pins[] = {
 	PINCTRL_PIN(0, "GPIO_0"),
 	PINCTRL_PIN(1, "GPIO_1"),
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index e9a510d3583f..5dbaa50cbff0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -101,12 +101,6 @@
 		.intr_detection_width = -1,		\
 	}
 
-#define QUP_I3C(qup_mode, qup_offset)			\
-	{						\
-		.mode = qup_mode,			\
-		.offset = qup_offset,			\
-	}
-
 #define QUP_I3C_6_MODE_OFFSET	0xAF000
 #define QUP_I3C_7_MODE_OFFSET	0xB0000
 #define QUP_I3C_13_MODE_OFFSET	0xB1000

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260526-macros_pinctrl-3609843a2519

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


