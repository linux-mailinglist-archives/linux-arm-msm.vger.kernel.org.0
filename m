Return-Path: <linux-arm-msm+bounces-110259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOqYLDJ5GWr3wwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FF6601A51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0DCC3028F41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 11:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0863D7D78;
	Fri, 29 May 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/Q4T5I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9LXFdMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FD3C457C
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054302; cv=none; b=jAdXf2QGrFUyFhc3ygoCiDdoDhqaTiLx4ECtdruGU50bV5L/ts6rrRJP0tSrn2GxyZjJCRThbHo7Bo75YayhudPOTY/D19MGmMz5V6tmj4Qi/SI/A7B2BcvpWfblydXuYh1zPU0qx9nn8D6KMfvhY/yQ887uw7U8QdpyKl7FRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054302; c=relaxed/simple;
	bh=jDAFGjiCfLrCl0hVy9nsbFdGMPZCs5ChqYR26a4YPcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quGzxvCDfhL3cbO7YCHzGSEhJivXIKTSBrGzx2gM/FN3b65aqIe17NywCM9PnomLXWRshA2fMgOoAuw4uM9swbwXflXw+LYCYjo7sBSoKMGhCeDfZ04W6frWmeYSBrZPP2KrK9wxHShDEAELhPWP8kqYOlqRhCd/99zkcj4udTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/Q4T5I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9LXFdMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T7G7XK1829461
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OZfzQc/dyOQSntkzOUIiFH1
	GBBny4mWUmOpzxIrldw=; b=n/Q4T5I3mS3JauGC9yq6WWLDzem1jn/0eh3JJGS5
	ZO3xtLILkPvxkuVr5oryFC5WJxaC5bm7Jmpq4L22ba0f0SxXKpF+x1L31JyNfDOJ
	ogL8jx/uI79iG3DXHSgKlJe4BFUWOxrWXCFAlD0wwE3hltNfb5/S4GYpfXskjMFj
	fCLM2t/oiHUqomm4shzlxdRfyx4k+B+hTnCUA1EmlZ/oU82GNjZBpxHZuu5gIm0w
	Z1MjPLjLiyKyJ5cWuFfDtOmneYK0V8YeySjY31Y3N6Ai1Zkf+C9U+8Vst6JaR3+j
	0SIK/M96O3HbU5R21gxWfWseLsLo81NSdv5qlgB0ffKyPA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m31q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 11:31:39 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-57584c23424so9000690e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054299; x=1780659099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=E9LXFdMI5qYUHBXN/l1WExq79ZnAMuqvQvvTVJNA+SxhIqDK7f6CLLqLU5KCRG3P5l
         3zJqQWW/SKB//EYaJf+JCa93bGVnmkHaABRieGFDtSHnpjspduXPw3AW2nb5hlxbeo/3
         YaOMba+qjROEu5BhxhkT2xRWkqRe5/ugs9Q3J8t1ao+Ln7mGSHLdh1QbIUEtBcvg0uCL
         Ha79+cPPteOZCa+fS5gQM0ZghpycFS05RPmqpXi9BXJujMXj/RArn4eI3X8qxmWFDqWj
         iOAJbUiKGsRgUOLnu9wovEx7A9lhJYptDdtIcDnxGTQ8phxWVyvAPnW8WXGHUlYEaqsI
         zskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054299; x=1780659099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=JVNyFFUD3fJ/nkhh8MVT8+0l5xy/2oZzvUkLeg2p41xSurYftmYSrLjzkF4fCvmXvH
         9ipi5kkcMoMKUt5G21L1XV7ifh9iSdph5jB4k3fVBucFsNaQ7YklUiup1CETNl5tfwRu
         zELFWfIHdijQWlaHkQWAdZOmkJkEI8pO6rFQR9E1AVJwT3y6nWbh+IkkGSYRkYljaG0N
         ML1wPt9dJpPD3jdOJlFI4ib+9B1Jsw2x5e7+eaBOGjdLYtAfQL5zkDNchWuwQwb0gbp8
         3tqDD6xsSLegH42h1Gkfs+k0gHG+yZtANLE9AiBuY2UzF0myjulJExEbQ6GF4sUfX9Q2
         TY9g==
X-Forwarded-Encrypted: i=1; AFNElJ+6xkDvWIKX1nYqkV/IWMl1aiOLNOrksp7CbUBzaRmX0bQgHQzO/g+xko+1xNxlnGfK8kKCTJG4x8sLl5wS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3rURuCyWiIKwkaZEBl45+NyLO71U1U8JfM/L6Guc24jl9Bbc
	sYeqQzzm2SNR/28h4Fj/Akb6LYzPw29PEXbAlbnQnkITUFAL/xDb0TAFEAbDH5b776mPV4i3UMk
	GBSRRDbwbCD4iU7fjezWx2vnRmGFc9GE9ddHPVgxxWS8l0HxFLum98Uup1/WIamFWCeyD
X-Gm-Gg: Acq92OHblKqQgCYFKH8vjllUosI7/d+oBOrb9mFD7QpP4cO2ABRswqylEeUPUf7lGRI
	yyRRq+NdZ/nKIDhIzbABKDph6zYAXQoe3Q0PAJ5UvBVvYL1v+Zl3g1B69p7f9GTjaHw+4n24u7A
	ftVCbJjXNFEtFe2pIfqIY6yjTDlUTHg/8MV53Fo643OyUaVcEUI6P5W8EM2OEs5EktEJHkhq5qe
	BsMwiPQurUW4pY0uXb2P/L+Jvpe5G64WgH3/9/mSWYAplqiC9GoskqTex1zyHRLpDhu/JY/nYN0
	ak6v/8RLWcy7tTwhbeKnZAbLPyBnvAawdrDuiK6AkBC30EUEsVmBWjJEozOs2pqDrj3/hChYjnB
	Dr1MFkZnku2fyZsW6yGafbkT2s5Ig5gG8fWvup/mA2BJEKKLQP50AQjV0rquXKzYHj5T/dvkvFr
	fkDfbHfg/JBiXH4VUeMGIauvDqX0Lkl7k+BLevfQ+dY9pM/w==
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776923e0c.14.1780054298739;
        Fri, 29 May 2026 04:31:38 -0700 (PDT)
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776857e0c.14.1780054298205;
        Fri, 29 May 2026 04:31:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596814sm221915e87.43.2026.05.29.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:31:36 -0700 (PDT)
Date: Fri, 29 May 2026 14:31:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Message-ID: <s5wjr7a7zkueqyzlmrij7f53brrh6rv5z3t5cser5cj74qca2e@6xhljjefc66a>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
 <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNSBTYWx0ZWRfX7a0MfmN1Zq/T
 6uMfVNPtgNCHc/CMQdX5UU+bR6a6bfNKEff5IIZtPe024eahQqx28JxaWTNe0t2Bijm8tVHqP/F
 vSDs0sDObEOKjV0rmo5yAXNi5HKtS70+HK+AYoQAiaJ8x03+0OQRQbOi/v0qVKMYkHUGYAd8yLa
 wMCvl3LoX6gTzF9/uUW+5II2z+7RgTQ7KT5nqCsesF4OlV7rpBAiGMd5pSXE2m+AD0XaY7Zsv8/
 NLHXvwcM9WTlQIYxCIncPTzggpXXsMWKDzR+okWmIg1mshqAZM+x3wfwHSBpCN0l8lF8CciM58K
 goah/q21yvUeIsP1lTIg9IVy2DLJRP/oityN4rvaAlw42VL3ocljkgaKyEwt6oQngOSexhSPuau
 07H528Us8FmjvBYScXsQMKgqlFIairoMZktcJxZnOVqsd60j8u+JQQQq+IFwFvyJHLcku+D3MG6
 xgke1WX2USvDW/wmrHA==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19791b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6Wl8FitGjV6qeXz9Ne0A:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: doniQsz928GrUirfosJ26tVF-I0pEElm
X-Proofpoint-ORIG-GUID: doniQsz928GrUirfosJ26tVF-I0pEElm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290115
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110259-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31FF6601A51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 02:52:39PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
> > > Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> > > enabled from probe as per the latest convention. This helps to drop the
> > > pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
> > > Shikra SoC.
> > > 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
> > >   1 file changed, 11 insertions(+), 142 deletions(-)
> > > 
> > > @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_gpu_iref_clk = {
> > > -	.halt_reg = 0x36100,
> > > -	.halt_check = BRANCH_HALT_DELAY,
> > > -	.clkr = {
> > > -		.enable_reg = 0x36100,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_gpu_iref_clk",
> > > -			.ops = &clk_branch2_ops,
> > > -		},
> > > -	},
> > > -};
> > 
> > This clock is not critical. Why is it being dropped?
> > 
> > > -
> > >   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
> > >   	.halt_reg = 0x3600c,
> > >   	.halt_check = BRANCH_VOTED,
> > > @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_ahb_clk = {
> > > -	.halt_reg = 0x17004,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.hwcg_reg = 0x17004,
> > > -	.hwcg_bit = 1,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17004,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_ahb_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> > > -		},
> > > -	},
> > > -};
> > > -
> > >   static struct clk_branch gcc_video_axi0_clk = {
> > >   	.halt_reg = 0x1701c,
> > >   	.halt_check = BRANCH_HALT,
> > > @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_xo_clk = {
> > > -	.halt_reg = 0x17024,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17024,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_xo_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> 
> The above clocks also should have been marked as CRITICAL. Not sure why
> those are not marked in the QCM2290. Since we are updating the critical
> clock set, moving all the required clocks to the critical list in line with
> the latest conventions.

Sure, but it doesn't match the commit message. Explain that you are
making them always-on, because...


-- 
With best wishes
Dmitry

