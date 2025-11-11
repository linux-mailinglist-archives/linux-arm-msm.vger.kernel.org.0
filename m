Return-Path: <linux-arm-msm+bounces-81240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F0C4D9EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 13:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53FA71880A16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7177C3587A4;
	Tue, 11 Nov 2025 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFV17qS3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWzrCFeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD70D357A57
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762863395; cv=none; b=X5zDc9rwRDI3K+na85hj+6k0iFS+i7JgusT6e0IlvnS/aFyKhbq4p8o34/2ZCdnpIs3cZbwjvRownszkTditg64KP8HKn8gn6cblQr1GqytpQl2x2IpdUw+VijHIvKDEa6EfSVP4EnGUWddju2hcy/oia9UBrzUcZSkBce3kcS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762863395; c=relaxed/simple;
	bh=CiRvglEz9obpczRFYFCnvUegm9hz7KRAd0dcBoMgiIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhzpuSg871sM/t2lqxfDLvqYFF44OzK52egvWlAyC1adXVf59UKKWkV/YH+/0L72ILtx5wQ3bs4yoQhON9O0/y9QFeEpIR17ly4tY2b+BPbBWBCgMxxj0wwKEOukhXcSBVD/no9YQXGWiAGsXM/cY78xpIh2zDzTHKvsedIgaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFV17qS3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWzrCFeo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGV3B2129956
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YPO+lkN1ZUT9aHfKkRZz4Gwg
	81V38xdtB3mnx9BFJgM=; b=AFV17qS3+1H/L5MHE1t6a4QQT5YS9LjVhVsDOtOe
	PWIgwBZjBaoQUY+YFQHYjeiRos/5mOHATtGiHwWYJv38CRgQIZb8HsZtCfOatfWG
	Bi3z0awzFspJJIS5zueCNqSi6hDJZGRvR6fC61N7JkKtnJBcqp9lcmsNbwyKpXi9
	fPXgSqkzCVm1NIhjIjYioXybuKLOhpD78MwkvhjXPINxF79kJBRk/10rzZTQe6Zd
	STC9qIP6OSFNzmWI5ZsTKlEyTCnI8gqVL6jzzQexR/zcOPDkEv35ITOxii+w8l0M
	6Q6Ts/h1CXpU4sNrpwOomKXlqTjEGrKNN4OG2CnaDBaJhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abvhthjgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 12:16:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882376d91beso107338626d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 04:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762863392; x=1763468192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPO+lkN1ZUT9aHfKkRZz4Gwg81V38xdtB3mnx9BFJgM=;
        b=AWzrCFeoPskyVMp4x+51B9XTgBIgO3qFWQGyjy14SkoHxlpBvkZMYhYeX4/fUvXmvL
         wJhhFmAcK2ieFd1SHcAd0RS7jcsKUNz7OMEi7TFWOZYAm1SNr6gfPpOAQSg+aLFt8pFP
         N1ngn8540mN1nVFxQttgQdOon3DFQIcxNaRSyQXSej3/UBJqY43SpTENOHKyQNvLK8Pe
         g7MtTuZ54XMA7zwur8bzYwQZOk+M2tZ7wWdWXlL+gw/7fQfJs25Yk06w/ZXoq3ZKl7pW
         Le2c2v2TsmqMA9yuejf1GYaT1ZRzF8IPmMALeV5V6hHiM+PVG2cRGD4oc5WjlP8TK1a2
         KI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762863392; x=1763468192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPO+lkN1ZUT9aHfKkRZz4Gwg81V38xdtB3mnx9BFJgM=;
        b=bcWn+feFfESenyCSnjf2UxOprFjRCrSczrhc21CFJrq6Q62TfoI85t6NlvRRikhQog
         5pitz0ujYmpv99AXXDf6AILQ9hZs5hOi3NXu7sLtpFgda7PDW1dkYyZz8zUyCjxkckP/
         0eDOplODOAPty8aNZtnGzVlnel1KkjB6YQJ/kO0kl3HdG91sY6SiRU7KQdNHhc+dVwtJ
         L2z32zuzVog1AR4/JHPBcNMmsQBI98tN84kAeprGxg/87GahQUWmra204pwzOHQF3Cmx
         CQWlxPgDd/4IMepKaqg7ZUEKeBc06eC3vbX9Pvc8UaExxUGh+ga+CoCwBW3/jLTjIK27
         FBHg==
X-Forwarded-Encrypted: i=1; AJvYcCXXAr7d59xnNer6f2GWQlxz8AkSyqO/vTEKd6S4ERV8PMltCu1H9tRi6MpNR9Nd7UltV05NFF7oUOLCbp2U@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuEsxrC4fxGh35fvtVGYIUwGrwSW+acE66NrrnVWzXn3H90g8
	4L8rPt6Btdlit27zUdtO7jkY96/lYujQyWhOT2ANLe6qP35WZTr2J0yyHHzTdCCqBcWKKjo//xH
	kRSOhG93YNWtJvn1niMgl/h03ZWgfJAQU+/gHRsp2ib6B3wMEtSWRBFdYTTbgzq5Ocnqd
X-Gm-Gg: ASbGncsBZOSMn1cupGXWwRsUrazAxm8EPvgwYhtIYj3lI0Jt50liWpZ+wyCclsEo6bO
	aj2Uakq696rfVWzCmzsGHbHvg9efAl0FI6M3PtfjJJWXJI+WmttjzEa1mN7RsxjRsLy6lvR9f2V
	ciZxXhwyIeqAhr238f5V6ZTUdqSY9SJCtqIsk79Munyk/vJOyGLrdifjdeNjz9TWzfNGJG15WUy
	WAjRstIhDLSD1hIlpV9Bm5T8nqsNyZwU4XG3xOZdlTjGOONym5Qsue3Lgv3MAdDLEyugPIa/9E0
	F2gMSxeYJNXx87s5t6XoCFAc/KIgOuCwD+6KYXr8KZ4JheoZcNfNOV1yycUIGUYVH7IGXyn8zEL
	jPwP9CoFGJTbxuqiDrgzbXWNvgI5PGeP2t40LgBD1UEGXyN1C46Bb/UZowAtv+g21zsFkC+RNHu
	JffMtqseLuYDro
X-Received: by 2002:a05:6214:f03:b0:880:8600:efbf with SMTP id 6a1803df08f44-882386d5b99mr166814406d6.56.1762863391798;
        Tue, 11 Nov 2025 04:16:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIqLMQI26kS8Yvv7q+uFtZNNaKWnnzqEHGEoO7KaLW48CDb63G5eW64vATn4eGy4RIMOQajA==
X-Received: by 2002:a05:6214:f03:b0:880:8600:efbf with SMTP id 6a1803df08f44-882386d5b99mr166813666d6.56.1762863391140;
        Tue, 11 Nov 2025 04:16:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0edc2asm41895861fa.40.2025.11.11.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 04:16:30 -0800 (PST)
Date: Tue, 11 Nov 2025 14:16:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <42xj5qgoh3m26y4hmdck5hfyqaxncfaeugymrmrxb7tusxjvm2@wsjztnhbp5jf>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <507b121b-98c0-4632-8a61-e9d7a6a13a3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <507b121b-98c0-4632-8a61-e9d7a6a13a3e@oss.qualcomm.com>
X-Proofpoint-GUID: rEmi75sUaKrJoutqP2UMg92XjySYUlH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA5NyBTYWx0ZWRfX6wCryGzl/NSM
 Ka1Z9ufDrp9mJst4Tv0LTLMrvxXaKh3bw8nvfmv7PF8rH5qQxLLMYTcQhOXKmtJMorKTTsIE7+Y
 PcJG1TlBfMTYh0y5NcVzxYSzBFmRSIv534NttGWSmxPVpIeIfcp6gDQlyRNdsiuxsmZ+8uvcjow
 cmLQK6UFpHDuMdQTXvzuEd/0KS5drz86N4v7d8+ueZtSqb/A8EPwhZrknGYyA947PgxnXcx4oDQ
 I21W72NYtP2ZiEAmRuQ5mv2RG/plBUk6fNwZc7XmkaXz2bVAip6NK8pHdpmIHAh7qVLoobdoI9x
 kk0OYAu4Tz9E9AZkh/xjWAmSGBnBuA1oqk5Q/WCYVD/xtagsc78ivXne3FO0va+DtGc4G6vTHkr
 fh70sFRNzapEmiC7HbjWAFXEdlj3qg==
X-Proofpoint-ORIG-GUID: rEmi75sUaKrJoutqP2UMg92XjySYUlH2
X-Authority-Analysis: v=2.4 cv=d4b4CBjE c=1 sm=1 tr=0 ts=69132921 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=40rvkjjxWIT4wm9QV3sA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110097

On Tue, Nov 11, 2025 at 07:44:36PM +0800, Aiqun(Maria) Yu wrote:
> On 11/11/2025 6:46 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
> >> Add the RPMH clocks present in Kaanapali SoC.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 42 insertions(+)
> >>
> >> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> >> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
> >> --- a/drivers/clk/qcom/clk-rpmh.c
> >> +++ b/drivers/clk/qcom/clk-rpmh.c
> >> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
> >>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
> >>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
> >>  
> >> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
> >> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
> >> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
> 
> 
> Shall this suffix necessary to have e0?

Can there be C6A_E1 at some point?

> 
> >> +
> >> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a_e0, "C1A_E0", 1);
> >> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a_e0, "C2A_E0", 1);
> > 
> > What is the difference between these clocks and clk[3458] defined few
> > lines above? Why are they named differently? If the other name is
> > incorrect, please fix it.
> 
> Good shot. Only now I can understand the previous comments.

In future please ask questions instead of ignoring the comments that the
engineer can understand.

> IMO for kaanapali Taniya was addressed to have the right rf_clkN naming
> here.
> 
> I think the point is glymur is not using "rf_clkN" for rf_clk, sm8750 is
> not using "ln_bb_clkN" instead it is using clkN:

I don't think it's that important. These clocks either should be handled
similarly, or there should be a good reason not to do it.

> 
> static struct clk_hw *sm8750_rpmh_clocks[] = {
> 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> 	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> 	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> 	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> 	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> 	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> 	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> 	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2.hw,
> 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_ao.hw,
> 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> };
> static struct clk_hw *glymur_rpmh_clocks[] = {
> 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> 	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
> 	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
> 	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
> 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
> 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
> 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
> };
> 
> > 
> >> +
> >> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a2_e0, "C3A_E0", 2);
> >> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a2_e0, "C4A_E0", 2);
> >> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a2_e0, "C5A_E0", 2);
> >> +
> >> +DEFINE_CLK_RPMH_VRM(div_clk1, _a4_e0, "C11A_E0", 4);
> >> +
> >>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
> >>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
> >>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> >> @@ -901,6 +914,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
> >>  	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
> >>  };
> >>  
> >> +static struct clk_hw *kaanapali_rpmh_clocks[] = {
> >> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> >> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> >> +	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1_a4_e0.hw,
> >> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2_e0.hw,
> >> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_e0_ao.hw,
> >> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2_e0.hw,
> >> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_e0_ao.hw,
> >> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2_e0.hw,
> >> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_e0_ao.hw,
> >> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a_e0.hw,
> >> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_e0_ao.hw,
> >> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a_e0.hw,
> >> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_e0_ao.hw,
> >> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2_e0.hw,
> >> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_e0_ao.hw,
> >> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2_e0.hw,
> >> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2_e0_ao.hw,
> >> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_e0.hw,
> >> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_e0_ao.hw,
> >> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> >> +};
> >> +
> >> +static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
> >> +	.clks = kaanapali_rpmh_clocks,
> >> +	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
> >> +};
> >> +
> >>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> >>  					 void *data)
> >>  {
> >> @@ -991,6 +1032,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
> >>  
> >>  static const struct of_device_id clk_rpmh_match_table[] = {
> >>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
> >> +	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
> >>  	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
> >>  	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
> >>  	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
> >>
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> -- 
> Thx and BRs,
> Aiqun(Maria) Yu

-- 
With best wishes
Dmitry

