Return-Path: <linux-arm-msm+bounces-79880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9DC24ECB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68F3F189A5CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB35347FEF;
	Fri, 31 Oct 2025 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gN1t8NyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ja1MbekQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03B34403D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912458; cv=none; b=uPMc1ER/CpmUQdrv0knOkEOlV892eMrgecQEclB4L0ddWeJYHHVvetlRsuH1XKF9u527BpTiMpSD1UWeOCKV3ioXH2HKFX4yzHWJblT7hoydAUZzMGdo3pwHA07Qg2CICbDUZuZXwU7x85j1mhpf3NniSioQc3iy0ZCzbhF5/qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912458; c=relaxed/simple;
	bh=tBK1qwBUvRQMVKV0Br5+JUjYr+yEhU8c8RDgQyKsT2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+P96zu1PexLl6IajW2nBIUxk/xTP4owWot6yQh8eFUy92/GBVOTcbqsiwby23+dr7B7LMYWdVmB70m6sjxTHZcxg8kt+/CZ5WoTRAa26K78jWRoYZvXanzigRPOyL93wE8h1ds5jfAp6t6haZyABL10bRxbEGq5ODD4ZqGE4pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gN1t8NyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja1MbekQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V3IZBb102826
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZWwpst+Hrx7
	G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=; b=gN1t8NyAcBVi60Vvai+eb/AFnpz
	mJJrg9q+PLn6babOQyCZWdbP99SjWSpjQPsNxXaK19GL5a71MZPwB2zID1xwtgaB
	xzoRUsQSggjuuST1LjGO7ut4Qkcyj4fMb63cNkSJ0mSmCcj3FTbNFaXXJtBatJge
	Wdf7dU49CLdVkEhiPXAM2fIe+LC8gf1OtwEOALxgeU4wlEhBolBdlt8uiy0bj1dH
	oJbcykGiZphWIB670vq0K0KxRKEjn3rDEM6OSHyuAabtdu9yXPz8/pXP9jgTBYfZ
	WF33jk+EZ+0OGWF6aJo2O7hJSzSPApNcRAUWm1kzFVurV5D5GYN8RagFOgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdk2x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 12:07:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eb7853480dso55265361cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761912455; x=1762517255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWwpst+Hrx7G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=;
        b=Ja1MbekQg1Zs3yQShBeYdzUqi0r7QixB1al9xwafsSl1EOR5XARcm8JRxScESc+zyb
         oldJ2ku3MzwKAm9ApejYX5ACx21UArsLB/tV/i4z7CmVYNhaGCSawqL2yrFCY3JSXCmh
         28ShcBP/39PPYk7xlDnyjvNR58RUQeBhJXhUl1LeqB6Jy1ZI5NWiBL3RfeLfGZEneyJ8
         NTGj2sNYEgQFiIl8HnkAcMoJch0kTGfWW6S2CgR5cMJpoIUBAnvsW53VcWzuMKgHbjC7
         8Fe67EtbTxi6e5uHWgaiKAzsKwMTHI/1XyIB81JQFoNw3LdJTbYXDMtxtON+BNWb4K7i
         Th4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912455; x=1762517255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWwpst+Hrx7G02/RkAKzDN+ldfPPWqoovAXsun6iEuQ=;
        b=ZH0/Agf9qVQs57lU3/A7jK7RZzA6dYzNr+MjRsmVjP5l4hD/MLOaqRikVYEOMsyG4+
         kaGYMSwUf0Gl/aCKmpXAhOXT9oc1Qg5JTNq4YiNwudU9MaCmtudZBmRB2+gZjxsyG3o6
         RNU9fQ0oKrBt3AiCWM6tUNiWTKwcNPa+Ly5DexOKzxDpF+liYpPoCfymwQdrS5Vf4+pk
         tH0ulhkDxvQ36yVI4qmKBY+v0ShOqKM0qh5vPeC8h/5MjsbAX6OaBrHtCfV+ezzJ17nC
         bc51D+PYOZbuXK91Yis+X0mk7+cKdE7kr34VwtiE2VTVwPTbiZ4hz17NNc+GdRqwRFtK
         etjA==
X-Forwarded-Encrypted: i=1; AJvYcCW3kxPNKu3lPZUwlMxuMW3oot6UBlibOJT+idwPMDhHZnXdtQcbHDuod7MXBH+bnnyQvNYJl3RVjZ8Exq7U@vger.kernel.org
X-Gm-Message-State: AOJu0YypPNk5MMqF4LpGs+hreNidfgf9J9g91RuB1Ez7WL4OkD2tTpvz
	6tqdNtD1ZRw5rxAfjwWEhLZ94ZJjS3h0IDg7cBy4Tw6XDRX6bUjR38ZcH5AuNfuZ2YuSWNgwjOj
	wFvzI/4F0n9TVWa4cM5Ssew76HcxEi2wEBPaJY/nCeEIJ/PaO5hpFe0Bb6ZSSUnyIs5za
X-Gm-Gg: ASbGncs27rW1QWjUKqGs9I1NnhblnfT9uyTVztmOMA/BkAehDA21jpOtzHSZm/kxwkS
	syFxtrnS4l5mM2w9sbPZPdrGeoQQDAQ4eQmlgVZQBVc9yiAkqPDJYOOQj5X5gxqdTsPITJDQJX2
	zZCWktaEYHNv5MO3GJKPeuR2BY5f6/ymlXGu7xhPv8vDDQYs1DvbelBOfYp6BBFQShbgT4jKZS1
	Bw0MNJLq4HG3NBDmm1y+USoyICK8JksG42HU8uP/EmD2l+xQRmpL1cnrbYey6CqxvefHT3c2hCs
	K+mAp/U5SKvifcLEIRYlEWEwElMPZP6d1mTWm0RL9Ebwi8JYzCZpFf1Lw+DIF1ewptPqfn5TOi9
	7ejfiiDBOhysC
X-Received: by 2002:a05:622a:1f1a:b0:4eb:a3eb:2ad1 with SMTP id d75a77b69052e-4ed30f9c8bcmr39360911cf.53.1761912455252;
        Fri, 31 Oct 2025 05:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFubrQw4XO/dt+yCzz4q2Xa+aUfqymGqW7ebuZTqajutjz+f81U2jcLSjc0jlESDX5Kqxd0BA==
X-Received: by 2002:a05:622a:1f1a:b0:4eb:a3eb:2ad1 with SMTP id d75a77b69052e-4ed30f9c8bcmr39359921cf.53.1761912454522;
        Fri, 31 Oct 2025 05:07:34 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fd280fbsm21273995e9.5.2025.10.31.05.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:07:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v3 1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Fri, 31 Oct 2025 12:06:58 +0000
Message-ID: <20251031120703.590201-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwOCBTYWx0ZWRfX+afEFPh9aTC7
 e5SQz4LsXGk6cKN8sbhb1S/hn08oJOdb4+uZ9BT3FcuyDglIu1MyFmZhXgDqQm8N50J16ZSBk0D
 PtWPSm9hM+/xULExClDR14tdHCttFqxy5+sIYvjQOp8z/WRy8B3vyOpq/jZSyKP9Q5p92U+h0u8
 gVGdSaN59OENKtb49ll0Wc2nuHDaJ96x740+Tra2pLNnoYGp+bKD7gZG7CpMEEg06sByjSyOeBH
 4UF4ld5zixnz/tnBxhIKOURwp88lZeRBhpjxfHRbjNYARIRFm7oRVVSkO+1vbIlJ1E8PfRX5q0X
 f26XBsmjBIu2tDFfd7/23hjKXSA3c2Pfiqhi4ZxT1l4wIrAau4kwnCKz/zkZPXE4penUAyN1Ns3
 peptNzChvPiBPmnAh6IsSUJf26WU3w==
X-Proofpoint-GUID: lZSC0u_sG_-j_4F1d4acxlTARByoMHUt
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=6904a688 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9D4bFhRDwPOLDOHaW_wA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lZSC0u_sG_-j_4F1d4acxlTARByoMHUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310108

SM6115 does have soundwire controller in tx. For some reason
we ended up with this incorrect patch.

Fix this by adding the flag to reflect this in SoC data.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..dbd8d0e4bc75 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2473,7 +2473,8 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 };
 
 static const struct tx_macro_data lpass_ver_10_sm6115 = {
-	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				  LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_10_0_0,
 	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
 	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-- 
2.51.0


