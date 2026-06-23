Return-Path: <linux-arm-msm+bounces-114167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uHc9EvxlOmoh8AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:54:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D00386B666E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:54:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DxoKJKPD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XuOpUDKn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BF5D307BF0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961A63D16F0;
	Tue, 23 Jun 2026 10:54:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3E3D093A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212063; cv=none; b=lhT0rlpBKp+xunyYG8JBpikrlYBBz+5O3tTN0VQMaAILzBjm9Y1bT45yPX8OKZGl/rUPLBcNwWl/Zi3x71gL9cxdJBfqWq2twpGSCJr+fIJPjgWVRXVh8z+MT25dfMuI/kcZ/LKDnELNQPlqBtY+edL/cC9lFO1GJvZL42ui2O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212063; c=relaxed/simple;
	bh=ji7XY0Ly5CaTH5gQoyfYoW+Dadq8HHWNk/O//BbnnXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KzuM0eRrAS5POUjFSCuMP85bnrVx/HFG4VwuK+qXYxmfp9xp1+fEWdNpTSOHy/lqnfUP7uZgw5HEhk6GqJk/UbUuwIoMalgUAuUk1o8cgopRZVEBInYuQcykpD0xJk6iUMN2We7MMbZPkxj+3N79qbmGVOZ9R1JSssT79rBvTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxoKJKPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuOpUDKn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsLuF042137
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=; b=DxoKJKPDQTVeNFVo
	mHuQgVRfdyvdMRWKx8BJH5ec6hb9shG8nMTDlWxvP0Vt7x2EvL4tP0hzRj0+pRXw
	VqEHc0lvPKFalePSXCvLciPrQIyyQoVJMVhpYU52aejLe0eJBdhMr3aQ2KzSkzxq
	tgnQPEDyerneXnSq6WEzkkPCfMb2G3VsyJ0utNufjOPPZWjOZBwKp+cTelwzV4Mq
	VU0Ki25Avo45Fl7HmrxTeOWRG/Nq+12DJ8aVp6Fn/z/oZoHRAHs4O0WKqS+rn6Dz
	RNeqK1a5heHnzEDZWYT2uMZl3Tt3CsUcV4ui3YGGROGDecLcBARycNteFtoqeg4+
	8cz1KA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr320685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c10cd7df22so97274735ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212058; x=1782816858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=;
        b=XuOpUDKnY/4Y0GyKdGiEYNhSYvetTLZfINMK7IVOQ5AUWpl3f2aVgGqpUiQ2RVb31v
         VGRS7HK/f4alz7oNtCfJeyrE21U2QZ5hcrhKTaWGdnT4bGt38RxJp3zPiCCpiNTJzww1
         LyUQNzfM9mjjpBqyv/VHxz0z1QZOmOAc/kvuLwz4G7dYHWWI4HduxCKFv1jzqIyuUu9S
         jZqG/FSH+Sp+40sTULoafFHXoUOeDt58pLw8m2pZ3ilhS7zktcUCqOqmIOZHCLfWTggt
         HrDC6BdqNQuWqBDoBqoXcWe4e9dCpalisAvyr4185mYLk+BnvMdV0jlEb8giD8NSldxt
         Ej/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212058; x=1782816858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUYYmjm3jRk/CitBXoI2MKAefc/gSB3fowDLV4Ojf4w=;
        b=nYSfDxa561h1rCAwqMgcbXNHa6gTl3CUHquEOgf4X5V8XepeKJ3Rg1WoXdmyfNOQo0
         fBBuUhw7zwdMfN3idV3CwgrOFcYwwgLnbPILbW0HBYedjuD1xAn3x4PwoUebPJAz9aIT
         k+tY2KvsPxZUgWelHDm/ZMuOfJ0hktATxJd+/xTFJNLd7ifrQYooqMIA4eJAmReGfVWG
         Y8Szbkx93YzWYm7i5HaYTeBAXAs7chOVISloUajAP/MXVX5JP9te2fd9bZA6/ck/Fpho
         jQYlebOrnrclYLN02+1tmOy6cOYWwYXuPN4da272118qsqm5tGQhd/wT7+h//kB0ju10
         ebbw==
X-Forwarded-Encrypted: i=1; AHgh+RqzbU4So7/+YjwYnWLHJvQo+FUp3FVw4u/7prLKgNIFH7czbGxY/TQW6dhu5PS+v0hiOuvwyNI3IDh2dWiB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Jh7RYfLqeZWmRkO/sRqQOfN+Nm8SVBUHoXZo9y+/dNtUUtge
	AkPg45L9WrNPM8T901mnPwoh80oy/I0UU9F4uIdbPaK/LaND8Zdc7DFYkNAAg9ii8FLY9vWK9gZ
	BdEAEkMjKnvmcfKqpMkuWr6/ir9gxqYp4XX5bhFKiRbPBmN8/6NPYr58UBbkFssxgzgjk
X-Gm-Gg: AfdE7ckEtHic+muI3DTXPDROKdN4T4TV2gJouTNBwJZgdXC9OYHeUY1uKr3wTXchv97
	bJNmJoMdUKt3U7S9jVzDW3lPEHcKlyqlT2IemCpESrh6Ty6ur9jVGsUhsvuSgYgoro479uZJNLf
	PVc+tBRYLqtszY6vHVbsdZ7AMYih46ocEZByWMrhyP7c6KRdNaFs9FPPJlKQC/Aylet8fl8gv8U
	o0pMMCrLwSIi7bjwllX5t42puZAejN1d2MtukcmbdbLFVcF4w7pdYaOF3u1giikKO4THtkfURsl
	dsTPWLePmFAvfV7JVfGjwrPGEwz5aDoDcZinX9u24K2cUN6xgzdLsyJp9YNJTiLkjtTYRZCBh9y
	V65g66i2ZW6JxeW9mj9uwgQT9/mdz8KvsvBA=
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr189638205ad.14.1782212058101;
        Tue, 23 Jun 2026 03:54:18 -0700 (PDT)
X-Received: by 2002:a17:902:f683:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c718ed584emr189637855ad.14.1782212057594;
        Tue, 23 Jun 2026 03:54:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:04 +0530
Subject: [PATCH 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as critical
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-1-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a65dc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CVX4TxgtaZIOJJKr5bQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX0ZE2JHCzXsGH
 73WKeGoiVCAmU3e3nZPfRsMpTxvqb1lfD7n0C3FxpW/IZkD/7ZmmahJJuXfJ9qHoPYohrJ5UMot
 xq+fOPa3Boyu36Zm5feU8cgSmLdSrUub3Ggf+5JHHIir0u2OIonmY3fNwfJ8jKolHrky6iYhXoP
 xwwjRllk70uAdd4fOOl+VV0VqlCjVOCejOw8FdiqeBUxAjHcksLpBQk783/hkneu1V2Z2WTjaqf
 EZoASOJ2lg1apgawfxgttv0wOGpp+Egmw9qDGDLg3CDHtN/Vv4pEPb9m4MVLMhxns14OVfHm+4x
 EH3iJE3Cf9ixJQW2tDcdPyjOHoNwmLLvQ08oFLUGCBwPsAHY+b+OzY/lnr6Vd1kPn1OlsHiEsng
 fLiFIHdppv3mkuWTGdbzlMSJUCOSvw==
X-Proofpoint-GUID: TpxZxw7HNlaTpVMmFecv6x0RH5XykDLK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXyXi/AXkqlkN9
 nFkZalAtO3jd9Dvz15t20nnLQLriJUipzYnV7+Mlk8zqfun+m7kqfZh0gaO/OSL5KZPPP+0RJr5
 nGkawJWgqtAtyXKrb4uDtKh58QRk4cs=
X-Proofpoint-ORIG-GUID: TpxZxw7HNlaTpVMmFecv6x0RH5XykDLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: D00386B666E

The PCIe link AHB and XO clocks must remain enabled for proper
operation. Representing them as clk_branch instances allows them
to be gated, which is undesirable.

Remove their clk_branch definitions and register their CBCRs as
critical clocks instead so they remain enabled.

This matches the handling of similar always-on clocks in other
Qualcomm clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 8a6e429f264022d55fc5e59b9ec46ae1124f9ad8..299c616be325156ccd457b7b6ef45afef364ad4e 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1185,34 +1185,6 @@ static struct clk_branch gcc_pcie_d_slv_q2a_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_pcie_link_ahb_clk = {
-	.halt_reg = 0x52464,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x52464,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_pcie_link_xo_clk = {
-	.halt_reg = 0x52468,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x52468,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52468,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_pcie_noc_async_bridge_clk = {
 	.halt_reg = 0x52048,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -1758,8 +1730,6 @@ static struct clk_regmap *gcc_nord_clocks[] = {
 	[GCC_PCIE_D_PIPE_CLK_SRC] = &gcc_pcie_d_pipe_clk_src.clkr,
 	[GCC_PCIE_D_SLV_AXI_CLK] = &gcc_pcie_d_slv_axi_clk.clkr,
 	[GCC_PCIE_D_SLV_Q2A_AXI_CLK] = &gcc_pcie_d_slv_q2a_axi_clk.clkr,
-	[GCC_PCIE_LINK_AHB_CLK] = &gcc_pcie_link_ahb_clk.clkr,
-	[GCC_PCIE_LINK_XO_CLK] = &gcc_pcie_link_xo_clk.clkr,
 	[GCC_PCIE_NOC_ASYNC_BRIDGE_CLK] = &gcc_pcie_noc_async_bridge_clk.clkr,
 	[GCC_PCIE_NOC_CNOC_SF_QX_CLK] = &gcc_pcie_noc_cnoc_sf_qx_clk.clkr,
 	[GCC_PCIE_NOC_M_CFG_CLK] = &gcc_pcie_noc_m_cfg_clk.clkr,
@@ -1850,9 +1820,16 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_nord_critical_cbcrs[] = {
+	0x52464, /* GCC_PCIE_LINK_AHB_CLK */
+	0x52468, /* GCC_PCIE_LINK_XO_CLK */
+};
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_cbcrs = gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {

-- 
2.34.1


