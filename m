Return-Path: <linux-arm-msm+bounces-111481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GqMAH7MEJGrv1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:29:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39064D32A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:29:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PRS9YJzT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PiXyrysp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111481-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111481-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65A3A30107E4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1635278C9C;
	Sat,  6 Jun 2026 11:29:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52038387585
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:29:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745393; cv=none; b=oU0fRrFrPrc8+WxOuYu+KQM1z+ojR5P90Rpr2x4Yx1NU4ePqoOOORU6aqqeSq0V7C+oFpi4JSGUU5sCg6ZRoNFdAyKbjn0bUSe+Dab04LbRvGrZe5uWJ+gVeqOkCkYUDuYk8i6SRzdKSp7eEy2hMshLxuYmESi9dNERdELePlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745393; c=relaxed/simple;
	bh=HlTv9Mp2GCh03u4ekoKQKmflNDAcHFY5vhT16StrnwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZrzSEIb9JdRxIXmnjuVjZc755nBtAQMlS2J2o6W5ieinOkvq+Ul4Mz9eMOWQHy9O8MDBhGB4uS4pWYUyrij4NbjyBlhnw6ouH5xlwRz5Wo9F2vW3wBbXKvxxJdicpkBp3uaatibT1jdR/qgx1M/HUSp1A0Y4s0GpxIZYgTb9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRS9YJzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PiXyrysp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BEFUP1258193
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/TEk8+zNTzJwyjR74INi1qfM
	zffd/TY2bH3icd/Z7QM=; b=PRS9YJzTshvmdExIp2Cl0ljAdllk7iNRyj9UZg/m
	E7zEQUn87tB0q5f9DmrgwUnPndCKwvoaRjujCsVI+3DF2m5j+2Erdtf6ESNUAxug
	032WD8E+8FrW6yDLtbuEqIwm/ou4X2TWfeihGCIO1ewo4Ys+I2NUBI9dcBEfI3Qh
	7nsWxyoS6S4ibz6KCYsh/1INv7E0dEOuCodDwTo4tizT+Hgm42K/H9mUKEsM/P/B
	wM8HVh05aFEMu34Rd36mWV7Qfy57YRE/Z1FQaRrSohbBg8R4w5lWj38sU6yssp8F
	2RsidM7RHcb9HhzhWYV8u6+s00kywfxHuTU6Z8NHR5ln9w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrrxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:29:50 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6ee0bfb5681so3390829137.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745389; x=1781350189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TEk8+zNTzJwyjR74INi1qfMzffd/TY2bH3icd/Z7QM=;
        b=PiXyrysp5RS8RMcwBheFwEFHQBRIXonfUbxmeRfgTIDV7HCB8OfkTVd+eBhyOI7/1Y
         jdE3GZYNx5znVJm6/zTUG7MFCr+inOJftg+IpkQOKHgbI9Cp4fh97q1PMKjU5a9EEUJq
         XTHyKTGNYISkn1OAusmLiCXjkSE503Vy48Z1del7PoICAtZjYglnlGp0h2u3CQCygdQ0
         DRUYbW65fbS4/YdJRa3S8P2iqwihlzlqebs985AlKDmP0w2U74YKLjecm90KSUAenEch
         3xKKHbVYMpf1JDYAQAgdDgpIFvOqFtQL38tc9aerOpDxDPeW2tK4dTJEDylbEo+0FgIk
         d3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745389; x=1781350189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TEk8+zNTzJwyjR74INi1qfMzffd/TY2bH3icd/Z7QM=;
        b=NPQWSysU3QJcE5//e6q+vPelf8+lw7R52jxRNz8N0JUG5coD96VCl4dwMepjaQoSgn
         CaafMlQ2ufUAd0U5PiMzcwj2zWqGlU3Jl4SbZSrnYXt87aTltnlD31U2A+qSSSR1U7IL
         UldCdqituM9BxjGSJ+HVXP9lAciaBWCdKvc8Po4CydhxQl/DHBMZ1XHbreiS9sfs3EkE
         H1sVKt16aUxkCdaHKss6WoWDfl5NVzQ1/DHpbpkcrwKMyBT6/e3+QMmnNmU7eJn5FZ6V
         oJxO+Tn8CD6VV9BGKMHOTwRXuBggoMaSU9EqTODpy4iQMsklfEC37qNXaxaflvfnz9PS
         Ptvw==
X-Forwarded-Encrypted: i=1; AFNElJ+zNp8FRTlyJQVz8onIHI6RY9Yi54fTPzCgPkKyVRiBCNnrLRrg3wK/q9R0VJQqETBqeZ3pqeDSt8Dt2rFV@vger.kernel.org
X-Gm-Message-State: AOJu0YwC289cQyNuXny4WXPoy85lpMCm4hqUc1N9NNv4eLEXuBc1R1te
	VsxtbUn1GUh+xrwoge146+eglclX+Pda5CbaGkYPDTthxNggkedvR3ONvM2b1EXKrcigEUBml+k
	8mEsVTLx5OwratcFF55z9h/cgsS7T/m+aV0m5mLOGoBqRF4WGL2OPKH85LRjTzFN5rNqP
X-Gm-Gg: Acq92OFSDiJonklJkYbcQ5WwTqMoJUTnrMpTM/fRWAf9A2/8pcTcZ6t8db7tUxgyb32
	BssX7vrYU+fVycReWF4vu2/JCsUKZ0JafILdxqmW00iZC/mr6vxAX0ewgIidp4NL8wZfco4qcfM
	iUhn6ACWiaLuPfOQmpWZjgWTsgKnAIgQTDDnincXkRkWrXB5W8zpKtxyRChCqdgU7vww+d2XYpd
	QgNGwuvbGcnAqt8vUj7M3mQdlsPWdd2IkMRRFhmmPo397V8Abwdwg8b9kgyMIwgTxPDSLXufS/Y
	64WCSi5i2c79CTUvEjYcU2UseXGWkoUsn2pZThYmBGwzI/e9zKonePGIjU8DzAAWaelt7f09Y3W
	Y1vg9k0No1/VjYcW39iJXXSwNFPw7R87HuJFMRPHa/pv51Cv/urPnDe/C5hNSI5gWQhs7szkgOR
	yZ2/dAFwgFz5meXaqHKSWDnntAb3h/FhXw/DQiWTY5XYaa0A==
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr4438778137.12.1780745389473;
        Sat, 06 Jun 2026 04:29:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:6c6:432c:84d3 with SMTP id ada2fe7eead31-6fef05ec0famr4438764137.12.1780745389057;
        Sat, 06 Jun 2026 04:29:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9916b8sm2438068e87.71.2026.06.06.04.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:29:48 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:29:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/13] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Message-ID: <4zhwpr2n6ihjevwamqzutoyoj4owg3mkutbn3ddstooh566fqy@j2k2or3narkd>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a2404ae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-AUlqdHlT6LtwJEXi70A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Nxzisg-xSyLqUezDTS5HGtLiBQyAac8g
X-Proofpoint-ORIG-GUID: Nxzisg-xSyLqUezDTS5HGtLiBQyAac8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNCBTYWx0ZWRfXzE19c/Hv/N7Y
 9mGvTFZEU38GVSX3etsWIlbem/LpkTu4aPTxJFjnEL5zjJPs20tho82UNkzDwHaEDkZ/wbFXg12
 1GRiOQBwTfcaxQbKd9Lj3x8n9z7+L/Cc8Hd9EITYD0xi06ou3kXWJOqkqqvIu6ILiypjq6M49bl
 LPimQuVXMRlNU7RK0LALKRWvihxIc3D3STQvNDGqw9loFruMzRa7IUJ4296MZQahuaxDUVhwjUx
 xvWVcoQuh5e5OjuznSQWKaX2st63QjbQiy64NSKqUc8BbIf467m/5h/uMqb3FyPo+nc2/4cLjqa
 lkQTHRxlpzNugxoMzuPWnBlGm/ilVYinI1fvengI1PBQPO2hrvYeHR6MgQzxDzXPDwttk+jer2P
 TWXrwZX7iDQWxICakC7FQnfgAH0biydczucqhnS6ROaVTCuvj9igBYtp+KxVfc/1muX+AAcUR2L
 u8ErITYVHR0busfU6Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111481-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC39064D32A

On Thu, Jun 04, 2026 at 10:56:14AM +0530, Imran Shaik wrote:
> Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
> the critical clocks handling and PLL configurations from probe to the
> driver_data to align with the latest convention. While at it, drop the
> modelling of gpu_cc_ahb_clk and gpu_cc_cxo_aon_clk clocks and keep them

Why? Also it looks like a separate commit to me.

> enabled from probe as per the hardware requirements, and drop pm_clk
> handling as the required GCC clocks are kept always-on from GCC probe.

Separate commit.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 92 +++++++++-------------------------------
>  1 file changed, 21 insertions(+), 71 deletions(-)
> 
> @@ -224,19 +210,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
>  	},
>  };
>  
> -static struct clk_branch gpu_cc_cxo_aon_clk = {
> -	.halt_reg = 0x1004,
> -	.halt_check = BRANCH_HALT_DELAY,
> -	.clkr = {
> -		.enable_reg = 0x1004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(struct clk_init_data){
> -			.name = "gpu_cc_cxo_aon_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};

This wasn't always-on beforehand. Why is being changed?

> -
>  static struct clk_branch gpu_cc_cxo_clk = {
>  	.halt_reg = 0x109c,
>  	.halt_check = BRANCH_HALT,
> @@ -318,12 +291,10 @@ static struct gdsc gpu_gx_gdsc = {
>  };
>  
>  static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
> -	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>  	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
>  	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
>  	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
>  	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
> -	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
>  	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
>  	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
>  	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
> @@ -342,6 +313,16 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
>  	[GPU_GX_GDSC] = &gpu_gx_gdsc,
>  };
>  
> +static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
> +	&gpu_cc_pll0,
> +};
> +
> +static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
> +	0x1078, /* GPU_CC_AHB_CLK */
> +	0x1004, /* GPU_CC_CXO_AON_CLK */
> +	0x1060, /* GPU_CC_GX_CXO_CLK */
> +};
> +
>  static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
> @@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
> +	.alpha_plls = gpu_cc_qcm2290_plls,
> +	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
> +	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
> +};
>  
>  static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>  	.config = &gpu_cc_qcm2290_regmap_config,
> @@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
>  	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
>  	.gdscs = gpu_cc_qcm2290_gdscs,
>  	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
> +	.driver_data = &gpu_cc_qcm2290_driver_data,
>  };
>  
>  static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
> @@ -369,45 +357,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
>  
>  static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
>  {
> -	struct regmap *regmap;
> -	int ret;
> -
> -	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
> -	if (IS_ERR(regmap))
> -		return PTR_ERR(regmap);
> -
> -	ret = devm_pm_runtime_enable(&pdev->dev);

So, it was pm_runtime-enabled beforehand. Now you've silently dropped
it.

> -	if (ret)
> -		return ret;
> -

-- 
With best wishes
Dmitry

