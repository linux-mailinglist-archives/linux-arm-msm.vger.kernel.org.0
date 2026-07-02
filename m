Return-Path: <linux-arm-msm+bounces-116108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5AQyEoCvRmpZbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8696FC1F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ghJecZv6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RRNNAGKY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 403E4304C96C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AF136AB4B;
	Thu,  2 Jul 2026 18:34:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2236A03F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:34:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017257; cv=none; b=BlvmklXroeHZrKXbv2zxLA2y+5pwpxDdaZEpflO6PiiEDQGue8DBqEoPvGhdc6PMWRADWAzIKke4bTEXry9naFH0/i8v7UN5ikcVMB4rKDFUl8ugG/hMfW5dgL2pkibtVYbzxB7BdUr24nVEuy+gNMaSSb5rwo9IDtinUfjcy78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017257; c=relaxed/simple;
	bh=xvEppMuh7bHMtzlkUdcvZDLvzPcPeT1rc/Fc957Trsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShkAQPmYTJtpwL4q2RdeILU+OptGceX5qbx5bUfgZ+8uGLoeKFIt2q8VyYtn9kLJHJGaerpPPHS71ytB43CBwNG+GBjB09o2BCav//9bmFd/9qm2BSu6I8S9OzF48QMvnLVHDE4wG0RJXnsBCdWVZ4Bgg/jCN2cbdkm51aDPzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghJecZv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRNNAGKY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3JsM514857
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=; b=ghJecZv6optUF0ae
	tLRiXwjwNW/eVCDs5+tpApw/TsHkw+ZJ36GKbn/wyeuDjyAaZkSLFu4QzbGiPjaZ
	ovrrqHLofMwTfshs5+9QQPZo2LBfKqvs+5umG8TqRpSzUqmDeOlP4S2B7W4KPNbB
	7uYOSNKK2hVngKJj4tZ5kUwtO/5pyX9exl9LH7vZM/J35+2RJAWzmRDBf2q9Nidh
	nSFqt2b6HGKSsQo1ReQ+82HLPdASyVJk84JmPzJ66MFkA5+v14ziieLkEMKOZYHB
	q6CoxoCmV0BI7vlCWUZ2iiBH3KGTqjbf66etBju09PNpsMeJGINjy/xBO46NqSME
	NYqYLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5npra8k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:34:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca53c486f2so28947605ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017255; x=1783622055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=RRNNAGKYMx4RQITwD0k51bnwv7HQfCmcofVDBx5cSJoXoo1xMOWPCQEOCTsxcdHXF0
         vkEc6YbEpDcii/l8pKSg3pTlC5h8+YtEXtYApFnjeLWOz8s/OG+ZXfy26Gq+r8IOiReL
         8MUGyblxVmSH2C32oK446vtdy8755R4kGDPCPWONG3NPKuppgQSLaqXZy2S4/I79uBBM
         GKXmaND9YPOJh98juokvTZQeZ4jKHhF6HvyiW6S8rFpdH4ffYnXWyN+V12mjEwUMCjFm
         XMNhnZjUT2Xb2AQKmCMaFjrpkOIF6DeGfAAPP6Z/0txeiD96kFW9kX+ME5bIbo/MoTjz
         ZbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017255; x=1783622055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2JZrvWT9A4DjhRmvjWfIQbLkYceVgF/0MWq/Abfkrc=;
        b=Kj4nvlWeBL03yxzepr5MqFXeLhGzWno8ZNYkXeHbQTB+D0Rp5PURMRPPjpnjF6X0M3
         AXQaKFmpN37dlM1qU1/HE8CK4sbNVW2T18kahksTmXVBAz4wwPUtO8tHsFtj9RLim1LD
         cjoGaG1EyxBgNPk7jrYH8isQkf58IkN4XxQaZq++ZH1Fdvxp3iTX0ltZnk+JC4sAV6lx
         Ovo02jcBIl+XyCyZIuTsotl7zj9Nld+LQzCUcfOMZYFovyjrLWg9lXV+cFU8TKyTefvQ
         bOgexAf8VuiaVakUKUcx2jluhNR+oJXARa6fpaQBcBXn6ZRJOaZoIRVBBeDhE4lfQdXo
         Vhuw==
X-Forwarded-Encrypted: i=1; AHgh+RpV471ItECYk0rv0yE8KifZU5ZGGYFkVxsZzxN8WVOQQePfghfajLesfq9KaXePvLp4kA0QuLohBrskSxwP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8t/AJMDqdT7NLYU9pc9J638mj/BcVeOLsCu/1dwCORutyCIQ
	dPishXsP6zZSifDP7u55D0n8IBK9if66NTdXYTBaHLXQiJ80OZ6x8eh64JFpEn4JBPAIonwfrCg
	XEgYlfA5VJcqqLEYbyuCrUKeshFpc8eKj9Cwf2XOEeIhuqbyzVU5pUzbd8KTLwOW9G6E5
X-Gm-Gg: AfdE7cmtj/0LMB5KtiSpaj9X0ElMwLAMfK4u8F21/WdmFYY1DTnB4gSe5GoohdUX+TK
	YCGpF4XcQPRmfqYDHBRI+qsuyaD3YF9WqpjyN7VoectOsfiMmAeaTJ0khG5C/bOcujavF/aOJ3q
	fIc9I3ukOqr8YcwkkUuKr9tBOPJFX7c+D90kdKMMaZtYx7lgvNyNTHKcAJ4YV6w0LWIymKVZXaK
	4cwBWlqkG98Vjtiq77u1vzv/ISr5ae+y9AM0AeyKUYRybEH4YnQEEjM9vpWVxE5LiC4orFY7aur
	vUJhnIzKpAWvKel2VMt4h1GS8c14M6dnFk0nG21BkG2pYibJe8hSoIGwRdoJm4qutWDzQ2GARK4
	GHbFI8xokxpRLRN1x02t1chHNj3S5KXKG5RJCgq7evw==
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68383195ad.29.1783017254928;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
X-Received: by 2002:a17:902:e806:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ca911d8b80mr68382765ad.29.1783017254353;
        Thu, 02 Jul 2026 11:34:14 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:13 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:36 +0530
Subject: [PATCH v5 14/19] clk: qcom: gpucc-qcm2290: Keep the critical
 clocks always-on from probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-14-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: DgtuRD1Y2vObItpHg_GdGhVdTMKE9r21
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX2u9XPzDB01wr
 B/cbvUk2CybqkKmaOOrLNkGNXmsWsnU8qPU59xTrq5tAxnPFrSMc+6ruQNXN2QUf7si4zMIPHpj
 9pa8M+Wgq+l5t0+3aL1iD82uOQ+D6Kw=
X-Authority-Analysis: v=2.4 cv=NsvhtcdJ c=1 sm=1 tr=0 ts=6a46af27 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=U57akka57KfjTRmel4gA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: DgtuRD1Y2vObItpHg_GdGhVdTMKE9r21
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX9YGKLB0kH3YK
 x8CO9ARYXgax+9LY2qMckw0X0O/tWROq+L24oSVfRchu7bXR5epyD7zLziVPwB6MJPWcODjmnn5
 GsFQbbNdOzof4h39/xXakIXu8XOz+7KpDmw2Lrds1VkPLTeknLBuiIGsrhvrZH5M43j0hUN3ANr
 s6DcD1q15L4LK7mHFxdYE/TUDo0frbHUlQnrtwojHlgzK9/6V+FtVWyk1YyoBMALanusyhf1kl2
 7XIpTnOOGY9D+9mb9+ML54X0ztM3m5Gl2W45o5xRo26oWKiBXarQQxoLqFiujcH5M6RgBE+a0MD
 s/STQ4IbNt1uRXQTv3NLI/9wRyUYBMfl33UipHV8BHonoc69h9IYDzAvjYmqXbCz5IozuO5S36s
 p2zuDxOvWgmDxXP6GQp8S7jCrw3Q2ryPmdYz5y7LFsuFSBkF4XZekfZGlThnbSZZqjyg7AEls6e
 WByDwSWgB5+KtMgnuyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE8696FC1F9

Drop modelling of gpu_cc_ahb_clk and keep it always enabled from probe
similar to other critical clocks, since marking it as CLK_IS_CRITICAL
causes the clock framework to invoke clk_pm_runtime_get() during prepare,
which prevents the associated power domains from collapsing.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index b19e8910931d85ceda079c2745eba37e18112955..78797b77d7c7ba053201064ace3963cf2bd5281f 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -324,7 +310,6 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
@@ -353,6 +338,7 @@ static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
 };
 
 static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
 	0x1060, /* GPU_CC_GX_CXO_CLK */
 };
 

-- 
2.34.1


