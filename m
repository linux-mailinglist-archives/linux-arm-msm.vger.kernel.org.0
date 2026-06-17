Return-Path: <linux-arm-msm+bounces-113614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mip+N26AMmrv0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:09:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B7698D70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:09:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e56v5nQ+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O7XIOckc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0966730039A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316263AD501;
	Wed, 17 Jun 2026 11:08:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB867384242
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694489; cv=none; b=qNdsehUsoc7NzOC56wDoezmD0Jph4Qkx+U4aFLNppJTYGZoBYRpTB7eWxtgzkhAJMMJSBw/0a/DyFxQ6FK/Lpn5UkuHd6OII0YP0+ydemoh8l84oAPiwe8PbCsHX6yrFaCP+6U/QQJHRfwVVyiDjKO4eEFFMo0y7FpxteVwOXVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694489; c=relaxed/simple;
	bh=6nHArGMO3Cwv/SXwhHS/jgwboqG7plRanKvO8l2O7Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDM/Z6hvySGOpxw7o9Bq8vtsqGmGYZ58QxtNklq4aYAzOt7zDq1NnZjGq7pSfmQzfGifccpUX7u8sOejhd+SfVaT9NuJnhroLgTqSfE7zfHsteQxtubHCB+npjoH7zLNvBllYe0PR6WXInx+w8gsT23u08+piZ/C+BQD91G6ulw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e56v5nQ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7XIOckc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UTmt3273522
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=; b=e56v5nQ+8StLrK9Q
	MHioQGwZIOrleQ0/cswDbsuUn582nrziEmd4ZZTQSbxYdE1TLoQvYJXLc3d6x8L3
	874oFKfCPcLQuGMlLP9zFq+O87Awp97NmvYFBecB4lfpPo/miSqoUQb0QksgLRAm
	y+u/tXh8Optga4cd8ZWsYA+OKv6Gj9kPjJCSj6aWKbUJEBV6OvDzarn8XxuHvoqJ
	RsROc4K49g7Oq7NYDiWGjuYfPALXPVCpLXuWpzHIkkhHzpkOJcQyawd83px1AIn7
	73ZJcPf+ZQlKTqgCZOsOnp0q9jugGICoQBUIJivAc10V2vba9WIQtRXJg7Md9mAy
	r4+EUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euefbtsyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845319bb97bso170541b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694486; x=1782299286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=;
        b=O7XIOckcqwExrPwkB8SzOncn1koSQk9q+hZybH/R8bRmtOi1IAZ82p+029lYGCT/CR
         rjEAQJMfOEv6NU/cTE2ZcOkUQVpDe4UmYR2v3zLkSH2tbOTUIhIwb/c1D5W1wRkitt2l
         Fu5RZ19oV04jHSOP5oxPjsEZ9JqUIa7w7JM7HG9x64zGSRCaWGShoQzVyuhkm60+bknB
         PassIe/fV7gIArarv/eX43J+OjZdtbYKUAB+0UcRuO6qh9a/Zhun52y8QPywZ8oi8Xa+
         SUL7oK7zBWOYwiQklOIAiX+ISA10y/wmcPH5Y9HJar2AG0mkqEd9pbpRgAcn6clfeuXT
         WMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694486; x=1782299286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/e3KYoCSscSnW4+7EnpoiV6X0K4TPliZfldkojZIAt0=;
        b=kQSVSDeHl1kWdQHRNn/XhmkXjN9lUm7jieS8Jb9exx0wN5g2XMTEQFZ2IITY3nwy2y
         /EBD3RZPutqPFZlSgPu9P0GlErUhL4pZm4XQ4iN5/KVsmQJQft9spY96gYXAHJSzwgVS
         1qSL8N0UeQ8Qx5yLhGgjLgV/gBHklMDcfGg9wcy7Oxl8weAPA3/ft3yNNkX+GDJx9bH5
         AaWTb6UZvM2c+Mh7guRAE7thfj0T+PFAcPIe6zTFAVptEzyLS7KXuc1jJGWyahCHlMlL
         UWIFRUzVVcW21oyspFXY1GfrcZ4Rn38OKCEaZAsUWuWEN2JXQ51udKDP6WX0OEAbwiiu
         9WDw==
X-Forwarded-Encrypted: i=1; AFNElJ8YE7j0XssYhI9PDLCmmaV0QmIf4/HJVc/rwhuzEnnTDwrNtKdzFB5LFuzepcAb9Trxdtg8DcskASZZJ5yj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qeK+3soQ4b6v1OP6LqYE+ajFMlNAqpc7V0DPG15lcPxrDG3P
	R3s0KBtFKpm/JendZtNEjYHv2o3Ud/Kb6foMAVJuK4XNp1EKxGeJ02sC6OzgXQ4gzu92jbFjgqa
	NUUscFA7yd3meQIWDqvpsU8I0j+3elAv/W03+6QO8UTBntWZcfSXZhajRlTjySmUGuRxMtbEnmK
	IL
X-Gm-Gg: AfdE7clznTBWjWkSomYIBfrrTOmUq05Or7begknUIWQS/MK3A6UxAU3GZMe65cjeJ53
	YsovlS/nyUYUcg6Hr4THW17k7qmj3/QP5Ax86CCVLgVw+y1YsX5z4ZQXd9PiYaf/FXbtoz3ZEx6
	nT1hDkMpAiTDFvagYiNrh0jfej6BItudRT1ZVuT6Xh6Dird/uvB8pbbokCL7e+Za+3m2a8eKUJv
	wdH9S42fSKok6rHg1z1YXB+V2q9v/76c0nrq7LIJdSU5sTvdMrEoMUxJEKHu1M0dV+t6n1p+10c
	2eq32/uqja9MY4UFNTfl3HL3X+2mEOcR3XtmVQSdjup9JoL6mR17+dHL4jpxVSZjIAQNVqgZJen
	BXPeMSPpcBBFmbwF/fKw+bRXhoQzgZZ3U7Yk=
X-Received: by 2002:a05:6a00:1748:b0:842:4612:55f4 with SMTP id d2e1a72fcca58-84524565b69mr3457695b3a.31.1781694486204;
        Wed, 17 Jun 2026 04:08:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1748:b0:842:4612:55f4 with SMTP id d2e1a72fcca58-84524565b69mr3457655b3a.31.1781694485756;
        Wed, 17 Jun 2026 04:08:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:52 +0530
Subject: [PATCH v2 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-1-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: hSP8m1Lk_jmUchbKlPgKd-p6KoWtK3zY
X-Authority-Analysis: v=2.4 cv=IeC3n2qa c=1 sm=1 tr=0 ts=6a328017 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6SqLyIFWvb7f5ISMJ2QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX7rNzxblM4h4k
 n13Hs9PTBAm3I0Ayq7NARzGSWi+M8G9i9IoJz0lsdGaZeySFcAMmmbytKdL8CI90/UACv659tR6
 Et1ApQmV8tUAUq2Li8VRbH4+Vuo5gNA=
X-Proofpoint-ORIG-GUID: hSP8m1Lk_jmUchbKlPgKd-p6KoWtK3zY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX6tEYCOTuWCUb
 U/3kdCBxS8+u3SuGj6icTcJmm6AyYpm5/IfkX+Bwa3ApKTsVezTX+fkkQo9/lEZ2Hah68/mx5mE
 vn4NG1c5lnRXuGH/rVq/AGn1LEmc4EF8JxbrHwTq6ahSwUWqn0psqKo8I7h8eaaVhHVvEh2R2Lc
 qP2HtcRgqxiFeoDFro19eohi+WLbDs0GWNxcjvbE0lYgQUds/vegWqOE+oev79/HWadc+nOiu0C
 7bunfhY/JGVe2/PqQEz7JaBCZxPU87DWPhOrFDHNf6k/fCa3m1M3EEFwMShg6V8v2G/Isaj4VlX
 SxdLQbEuapG+4txZMfmYuCraouPEnu3GBbIFUVDkjP63FzB9KEDkPB0CSilxR6DRymMiAwu+pDN
 Gu6bnIUtyByInRcr9iq88KRvPilVUz0WpYNDl/JJuLdMd+p4EYB012Bg/+92DHqhf6+Uo8AoOH3
 xrjSIYwtzrzWAzrM8gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105
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
	TAGGED_FROM(0.00)[bounces-113614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D5B7698D70

The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
registered as standalone GCC branch clocks. Drop these clocks from
the GCC clock list and instead add their CBCR registers to the GCC
critical clocks list to ensure they remain enabled during early boot.

If these clocks are registered as normal branch clocks, they may be
gated, which breaks access to the EVA clock controller during clock
controller probe, thus leave them as critical clocks similar to other
subsystem AHB and XO clocks.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2736465efdea9b3cf9ec945107d4b002e123b59f..32d23bdc819b7a62472f2a1ad23c9c8a66cfd0d1 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3669,21 +3669,6 @@ static struct clk_branch gcc_disp_hf_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_ahb_clk = {
-	.halt_reg = 0x9b004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_eva_axi0_clk = {
 	.halt_reg = 0x9b008,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3714,19 +3699,6 @@ static struct clk_branch gcc_eva_axi0c_clk = {
 	},
 };
 
-static struct clk_branch gcc_eva_xo_clk = {
-	.halt_reg = 0x9b024,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b024,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_eva_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_gp1_clk = {
 	.halt_reg = 0x64000,
 	.halt_check = BRANCH_HALT,
@@ -7993,10 +7965,8 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_CFG_NOC_USB_ANOC_AHB_CLK] = &gcc_cfg_noc_usb_anoc_ahb_clk.clkr,
 	[GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK] = &gcc_cfg_noc_usb_anoc_south_ahb_clk.clkr,
 	[GCC_DISP_HF_AXI_CLK] = &gcc_disp_hf_axi_clk.clkr,
-	[GCC_EVA_AHB_CLK] = &gcc_eva_ahb_clk.clkr,
 	[GCC_EVA_AXI0_CLK] = &gcc_eva_axi0_clk.clkr,
 	[GCC_EVA_AXI0C_CLK] = &gcc_eva_axi0c_clk.clkr,
-	[GCC_EVA_XO_CLK] = &gcc_eva_xo_clk.clkr,
 	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
 	[GCC_GP1_CLK_SRC] = &gcc_gp1_clk_src.clkr,
 	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
@@ -8545,6 +8515,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32058, /* GCC_VIDEO_XO_CLK */
+	0x9b004, /* GCC_EVA_AHB_CLK */
+	0x9b024, /* GCC_EVA_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.34.1


