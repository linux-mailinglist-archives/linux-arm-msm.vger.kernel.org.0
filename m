Return-Path: <linux-arm-msm+bounces-55248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F430A9A03B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E65BC3A17A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 04:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C0C19CC22;
	Thu, 24 Apr 2025 04:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii0SDCVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538774A23
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 04:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745470060; cv=none; b=DwcFk5xl+UQ2ZqyJsm3c12qAGu/4OVuECh5t3w9Hmn9N/IJVI8mPaw0yGOmMckwbzaBzF2i0bZXD7jCHaa6NmUVHrkMvj6WBGcZo0VbLb9eHX8K5pDD5237EjOeHMx8Wv5wAcR/UDkr6SRbPszR3+qLMH2rNUswpQ4+kxZoD+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745470060; c=relaxed/simple;
	bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qwVP4nCImOLYmnkzlzI4P6GzrjYHLarK0ckltDCSmNMWSD2PUjIA1XcGHuHuwLIA0KOhf+kcC4bEtQz3ymqGvktoAp6Q8VfYcwZkzRfym2xiPxIu8XmCJYzonIsYyjrti39PUMRY9nmqrl+Lo3l99VKtfEk/TJIwH/lmdlo12dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ii0SDCVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6aK013227
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EOpmjHuWdoyxtbl0lXVyHn
	PEnYkVQY0jb3AUJtDtsSI=; b=ii0SDCVwQ09Myqek9hu7mOMmEeUahRsfY1YJCM
	TMxDembBNPFtL6PIg/Y7J13KDvAbgirWPswJwt9NHS6sQPIQP1thbRkq6ZPbbMf2
	b+E4RhbvsDSWmZj6m1w+/zeAmbEOPWateyDXbWKNVDej3jI1E3PGbGrPKzr0xlAu
	MLt1xpS3tITrkLH0dA1cTXGSriNOYPW1whFXookNE6+lIekvyLYJt72aP4vsGy3u
	CeS5tJf8JnGp7LzlapqXgm56+YqO9JE45nvc6av6eCaeFGAPPFP8s0BWDvV//4HT
	LXEfZP9tJGd8dlGmqtcWzNNtHfLJq3JqyDxeWlDDTTyt798Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2c86h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 04:47:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2242ce15cc3so5353265ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470057; x=1746074857;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOpmjHuWdoyxtbl0lXVyHnPEnYkVQY0jb3AUJtDtsSI=;
        b=Is0cD6k8xDtvq/oHKFp2bHHRHllZv57gEqkEZTzVX9jGPuDd/NpnGqLe/VbVcQrGMo
         n3OYys7XaPbIf4jb9djHvmvSBR3JwXNYQRReBLnwTXI9Mko3TmhcuLc0g4Jeefpmnfjq
         laJFshMypcVwPH70TUBWUa81MV8w53t13YHAr4hOMVUcgKyzmR0WorTpysVHWwYeHFKy
         gwab5k7ojwCNqCbjp/qBzVo0Z6Ea1YzeYCft9i/5QBmALmHCgFK2FiLuHsO4yd0a45PD
         Oec95MCbuUGLa8M+nRbb1rUUBQymu5qyo0aHplEq3BO4EFm0BXn1jbJugTpdhgZR+NSr
         rXZg==
X-Gm-Message-State: AOJu0YzR/sk9zE7trhSFLbWaiWLsnmzN75Gv+BKiWAEagmzM/deU+Evu
	JHC+pdRqczNiLZrmSprkmZD2G3OtXdXLuJmbpDqrwZsprshW1iG6uZqKdWV/kuv1RkGrdgSHUnS
	r+C6FD78vbtw0YkQjzlNLdzYeIH37wM5tVhpOpI9Ximm16DQ9K1OFc4sXvsnrmfIU
X-Gm-Gg: ASbGncvWDOX8rLj3qnmTg0FCVS2n5NnYj08DssU0539LCMa3QtQ+0rD27tVkeozpMOp
	g1Clz57G48HUskGT1pXkSULwHkfawHFzG5qKfyIKnUGvzlN/tKWbHSYhCVHj6PhJz3s1UnxkYGL
	AVg7WypGkMe/Q93bwRxiaaKMazIiYuTRify4Ms5cz1mZBRKIVDFsmz/iTt1nRXn9ZsoUzPW5kz1
	hXvp7qE9aSN3IBu4tHuWg6SaJGveN9TI/8vjPz2fHaVHDtGN8yjiAU8Ur9owrW2CI6TAmKgvbiH
	YMDa+ZC+UR6JpC5zAot4bZgivQ==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15774475ad.16.1745470057587;
        Wed, 23 Apr 2025 21:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRXAusDnHxqVZy7R8LW483DslzGVuC/HbDJZqxIbATob8CnEvN8+j4rJ9x1uEc3kEzS5ppSA==
X-Received: by 2002:a17:902:cccf:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22db3bf1a0bmr15773985ad.16.1745470056924;
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76ee8sm3589345ad.50.2025.04.23.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 21:47:36 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:17:10 +0530
Subject: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE3CCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3YLMvOSSopz44lwLc1MDXfPEpBQDCxMDMzNzUyWgpoKi1LTMCrC
 B0bG1tQBIeyI8YAAAAA==
X-Change-ID: 20250423-pinctrl_sm8750-7abd08406675
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745470054; l=1529;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ptuipwHUDCgZKqYL6e0NkqtYwtJGVubt2616v9gIpm0=;
 b=hbcY0ql0VRWNSWGKLs0BemjFuqtyHC3PLvTPFrDr5Kcg6ZUkOi9fHtbjOREi+3Iubk06FQDhM
 raADQQ9NeeoAYkwrk+6vhlRguAIqUXqJ14ovV9CA3rcbAzp0DQcvbeg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 4G1MoEivk92kBMh7A2-si_uLkv9Q8yGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyNyBTYWx0ZWRfX2gkYmZ9CQKAh aNeQLshOC36vqE9sTHunAtmliUZhf07ZNos2LNcNEW+7/D+HRdsr/I4WuTUzHdshXHTWR6igLSw g0Ey4a+7EoFT9NOBPiSKFx5o5Zb0PtQVYMyi9ju78ZmBGRhP4GWKzz/T6WVS7QXk6jHun4TOeGd
 gE7Ma7Ki6r/eOyvM/wr34ey068ObZ4PnIgO6A3NRa5RXYinGjsvl6XPFQyXi1scDv5tfYSjE85Y d2lsgwoMCOxvBgeC8288Uc5wqj+xSLWI5mK4WrVnsdA7AePRzDS/tfZ4+Ffal7NE8/7FrCYlEXb eXwf7aO0b3mv9S+fUWkiqfindi03ENXBPHG/36fTBsLS3OkSkvw+2So6j8tp7MOmj75eIAZiQN1
 z7WMdxY+rl68BSgSrUA2S3mCoN4rw2d7u6RXYRwulhO2icTeJi/lt357/O7MKHX8VQmHgi3G
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=6809c26a cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=61JurpKn_mCFDXP9eHYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4G1MoEivk92kBMh7A2-si_uLkv9Q8yGL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=611 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240027

On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.

Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
enables forwarding of GPIO interrupts to parent PDC interrupt controller.

Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 1af11cd95fb0e69fcc876fe069cc2cd6fd6679fd..b94fb4ee0ec38013d8cde7e45a7d6088a20e3b28 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -46,7 +46,9 @@
 		.out_bit = 1,                                         \
 		.intr_enable_bit = 0,                                 \
 		.intr_status_bit = 0,                                 \
-		.intr_target_bit = 5,                                 \
+		.intr_wakeup_present_bit = 6,                         \
+		.intr_wakeup_enable_bit = 7,                          \
+		.intr_target_bit = 8,                                 \
 		.intr_target_kpss_val = 3,                            \
 		.intr_raw_status_bit = 4,                             \
 		.intr_polarity_bit = 1,                               \

---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-pinctrl_sm8750-7abd08406675

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


