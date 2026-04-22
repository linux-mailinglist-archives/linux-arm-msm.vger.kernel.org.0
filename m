Return-Path: <linux-arm-msm+bounces-104170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB4YCwAV6WmtUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:35:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A53449C8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD61030BB665
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E42392C39;
	Wed, 22 Apr 2026 18:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQc3GcRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oxjw4jFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE305378D6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882813; cv=none; b=OK9EysLJyss2ndKLioVWzYGupsUULypuew2Q0MO2Y/8FNLfgQJVo6tynztfw5739Ru2HzlOl1S+OaEtuLMgYEMx5yaykBvDCBkMlc1Z0acluMkJxJNC/rCqkYjLniB6NrzZZ14Aa6yRVaJSgs5E3SqoyhDJQsxv75REHJabSghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882813; c=relaxed/simple;
	bh=qw5zJPCqM1SiokhXZUVY1lskCTv68QV8Hsd92bbd1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKwEupPXLjLa8GgKJkKoUtsU3UPG44r9amHwP79hkk1+gfyCLvRExdVJ8fwR95TIct8etodWo8RT9kXGbP7ZBTawK2zV3FiqgtC03yW1q+SNl0x3EEDFKQVJJlDkv2z6k3vwqQS05DEt4xZF5JD+jIpVs8Ac+F7e2GjXFAsJ4oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQc3GcRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oxjw4jFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGA8wA3174074
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=czzcA6BNC1rAv5ThVag/zxI9
	yOSTqvKDsWkDm3VhBQI=; b=TQc3GcRUB0h2WvhifGEO3INwgLX8Ix5JioNKVRJ3
	ofkiYi538qmDjBB11xLPzPdNXurTUZEhmrvYNDXtwLRcGtTqy707cdxvf4Hcgz8d
	4UDwCFGvD6EreTV6SoOYfLujTL2IiwMj9kyn/546/RPKd1e7pV+ONE+OAdfvUbGQ
	PH4OM4lzA7ngZWmpQreWGbK0zWUAC8BSQtFfcgfEU0j6KLXaiZIURUhocM4H5gdd
	qUdXzqPpZGhFn4fFOkcqVT8ZanxZZeTmvJZyDqojt5zbmeXzZTDYc3hqSvJW5Ka2
	vEhkd/+k4XWl1n2popJwfdGpWGSBztfKq9D0GGyXyIT1dA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30fw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:33:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6102a8e6eb0so3062762137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882810; x=1777487610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czzcA6BNC1rAv5ThVag/zxI9yOSTqvKDsWkDm3VhBQI=;
        b=Oxjw4jFbHEWwn5+y1vmDlvhF3Z1zbKPmuKMa9C0QfGqjoYQkS85kU+Sv0Znq14FAZP
         4iZOvngaD/TD4NLmHnpPXc4kfPfIaNx3fHgqldfcusneF1D8EyXt/v3PU0G9BovkJaia
         PArNh3IBY8UhZfyRmT1FZ8rqAgIYXiKVgwQW9kI747lb7UWwou067n2mg6Sq3VdCSF4g
         8ur8Bbp07PlSxiMG0OkPvY9dgYCkjJdZl3lHfCHsjNb9Z0+WTni2aWA2MpMBvPlcnX2c
         LwErjcORvFdAs/XSqavHJ2fBH49anhH+KsyJ37iIQ9BZuAwWwwDrmXNGjn4qEr7h2wXc
         mzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882810; x=1777487610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czzcA6BNC1rAv5ThVag/zxI9yOSTqvKDsWkDm3VhBQI=;
        b=ofH9wsaR/CTVlVXU2gzWhjLnX2ImkIRQ4Gv4FrUISmUXzomJ6D1brA5/ytSZsOKH0W
         jAQb7z6Un+32Pijp1Nmll5vNM/rPEt1aLK24ZPBoFcm/2yHuIkygevgFIp3s/0//dHtD
         H5hU+bXaxotHoqv+fXqcB0VTqNPkbc9i+Id23ALG2QbzGlCrDas+pi6mt+LS61h/7q3I
         uIWFEVl8x3e8knhTAAss0aAtS8/QfLTIxt3seu9nStNx/Wls+hH14DdLpXSTVG4b9+KY
         8DCQ4OmTaLXNHwCDs7QcYiovo7RKWMtI8JyPA4cWQKmlmJ95rKqOciTUexhV4ne1t1if
         PiPg==
X-Forwarded-Encrypted: i=1; AFNElJ8mGVKotFdpe6BuYkPB8x3NVEBt5YfEcnUQjWQ8TZRugL+ydbkhnzLLnuU+nAgTrnl71CxRWKPjuJfAR+13@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9WXLfK//ES5LEocShnDjatzVCw3EsyqvvKSqFo78mQAREcWt5
	2uaxVhFHxJ0Kgm/2YbKkNj/bVXQsBEzTMF0lFarSRoZBSM+h7hhxtVmsJd56bzU5Zm2AV1X/6At
	8WspF6FLegcpWklolocCZjgPbQLhJK7yuou7Rda6id2bymd1tSsHbYAJZ3wzRQb2wAcTp
X-Gm-Gg: AeBDieue+qjtwmAQBWig/F9vhLzmy6ILeJEez1TYAtX484k24RlNCIf3GaUuCN8BTsP
	1wt1AlTzsf1HOGwuuml/O5RZNlM6ViE0EqERJoUWlBarvixCrtZLN8hAgM9znyvgRQHL+KOWZvU
	L2nWTyl60+ITBtSW8EoPbmVDTcJytSkLHhV/kQXDNdS2Op9SP3B1rzYJxu0ClOVJYMbvG0E+N9c
	FMPh0uCcDpkp4Kt2XrS3Ka6h6jGPZpz6dpdcwIsN8wPsfWj8A3zdjRv7Mxq7xhBafLe8eHpjPFJ
	UQ1EewnuCC+4g8NjCZR2r+4h2rM8fEAF4pWVnW9fyeB7olMtI1AupQrc39yzSyoo8ZKnV1Y2zKB
	8xnAcR/g/KfYD+V5xixd0rUkr3QXYaxdraER8yEQqYAVKFz03GfdtsGgGeCCvGKjbSH6Sg1bho8
	AKZeAb3vGH3JV2IDzKiP269c7Uug0uZqJ0t6LD/A3hW29daw==
X-Received: by 2002:a05:6102:3584:b0:607:a151:819 with SMTP id ada2fe7eead31-616f53a91fdmr11475151137.5.1776882809791;
        Wed, 22 Apr 2026 11:33:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3584:b0:607:a151:819 with SMTP id ada2fe7eead31-616f53a91fdmr11475134137.5.1776882809325;
        Wed, 22 Apr 2026 11:33:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f5035sm38387471fa.4.2026.04.22.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:33:28 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:33:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
Message-ID: <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ii4pYNuQNeapcQW9S-FNnVqr5sVn3wKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OSBTYWx0ZWRfXy17Q2imYeTxt
 RuENc4IesODw/Qs2unV1YVsPvIISg/gUF5VwNltQvRMg3i98LfnwgWsc7Mat1usxW8j2QFXluJH
 GezZbNbvq4cM10BGgLyPgLFYbCLqeHNybZFRaWF8hp8oISjo+7KGc82pWGgvyQVditQMGlctv4J
 bJAFXk4qjTzEkAhTmr1DfJQTKQ5PuuhGg84pJMjZGVriPmeWo/Zp5lzK07fmmFA7K3RHmhiRJf3
 rloIqV9oJ/lJMnvzSrTc9GgsLuA/hpYUWL2rwzUtPR1pNLGNpGTkXw0rFHNdRKMpClAz//Co9sM
 gb3Qsz2ovDNe3+A1z/l+OWyCAtAx2z6cf804pk90MQzEicbZ5e5e2xQsqhPcZh28K8nd19RE8ZB
 paDNIrV9bkTmGO/njAHCzEWwVyNRZHLM5+KUIzcZCHr9rx75tP/auXtnKjsxZjOPemTfcQ2iLzy
 zlYeW4dQgwOT4HasVgw==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e9147b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kN99BD5UUlLbkdYherwA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Ii4pYNuQNeapcQW9S-FNnVqr5sVn3wKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220179
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
	TAGGED_FROM(0.00)[bounces-104170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76A53449C8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
> Add support to control the DISPCC MDSS MDP RCG and the associated display
> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> enabled, the clock ops of these clocks will be updated by the common code
> before registration to use CRM specific clock ops, allowing these clocks
> to be controlled using display CRM (CESTA Resource Manager) hardware.
> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
>  1 file changed, 56 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
> --- a/drivers/clk/qcom/dispcc-sm8750.c
> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> @@ -71,6 +71,16 @@ enum {
>  	P_SLEEP_CLK,
>  };
>  
> +static struct clk_crm disp_crm = {
> +	.max_perf_ol = 10,
> +	.regs = {
> +		.reg_cfg_rcgr_lut_base = 0xd8,
> +		.reg_l_val_lut_base = 0xdc,
> +		.vcd_offset = 0x268,
> +		.lut_level_offset = 0x28,

Seeing this configuration makes me even more sure. There is no separate
CRM or disp-crm. The CRM resources should be consumed by dispcc.

> +	},
> +};
> +
>  static const struct pll_vco pongo_elu_vco[] = {
>  	{ 38400000, 38400000, 0 },
>  };
> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
>  	.user_ctl_hi_val = 0x00000002,
>  };
>  
> +static struct clk_init_data disp_cc_pll0_init = {
> +	.name = "disp_cc_pll0",
> +	.parent_data = &(const struct clk_parent_data) {
> +		.index = DT_BI_TCXO,
> +	},
> +	.num_parents = 1,
> +	.flags = CLK_GET_RATE_NOCACHE,

Why? It wasn't there beforehand.

> +	.ops = &clk_alpha_pll_taycan_elu_ops,
> +};
> +
>  static struct clk_alpha_pll disp_cc_pll0 = {
>  	.offset = 0x0,
>  	.vco_table = taycan_elu_vco,
>  	.num_vco = ARRAY_SIZE(taycan_elu_vco),
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU],
> -	.clkr = {
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "disp_cc_pll0",
> -			.parent_data = &(const struct clk_parent_data) {
> -				.index = DT_BI_TCXO,
> -			},
> -			.num_parents = 1,
> -			.ops = &clk_alpha_pll_taycan_elu_ops,
> -		},
> -	},
> +	.clkr.hw.init = &disp_cc_pll0_init,
>  };
>  
>  static struct alpha_pll_config disp_cc_pll1_config = {
> @@ -681,25 +692,25 @@ static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
>  	{ }
>  };
>  
> -static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
> -	.cmd_rcgr = 0x8150,
> -	.mnd_width = 0,
> -	.hid_width = 5,
> -	.parent_map = disp_cc_parent_map_9,
> -	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> -	.clkr.hw.init = &(const struct clk_init_data) {
> -		.name = "disp_cc_mdss_mdp_clk_src",
> -		.parent_data = disp_cc_parent_data_9,
> -		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
> -		.flags = CLK_SET_RATE_PARENT,
> -		/*
> -		 * TODO: Downstream does not manage the clock directly, but
> -		 * places votes via new hardware block called "cesta".
> -		 * It is not clear whether such approach should be taken instead
> -		 * of manual control.
> -		 */
> -		.ops = &clk_rcg2_shared_ops,
> +static struct clk_init_data disp_cc_mdss_mdp_clk_src_init = {
> +	.name = "disp_cc_mdss_mdp_clk_src",
> +	.parent_data = disp_cc_parent_data_9,
> +	.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
> +	.flags = CLK_SET_RATE_PARENT,
> +	.ops = &clk_rcg2_shared_ops,
> +};
> +
> +static struct clk_rcg2_crm disp_cc_mdss_mdp_clk_src = {
> +	.rcg = {
> +		.cmd_rcgr = 0x8150,
> +		.mnd_width = 0,
> +		.hid_width = 5,
> +		.parent_map = disp_cc_parent_map_9,
> +		.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> +		.clkr.hw.init = &disp_cc_mdss_mdp_clk_src_init,
>  	},
> +	.crm_vcd = 1,
> +	.crm = &disp_crm,
>  };
>  
>  static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
> @@ -1562,7 +1573,7 @@ static struct clk_branch disp_cc_mdss_mdp1_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp1_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1580,7 +1591,7 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1598,7 +1609,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut1_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_lut1_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1616,7 +1627,7 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
>  		.hw.init = &(const struct clk_init_data) {
>  			.name = "disp_cc_mdss_mdp_lut_clk",
>  			.parent_hws = (const struct clk_hw*[]) {
> -				&disp_cc_mdss_mdp_clk_src.clkr.hw,
> +				&disp_cc_mdss_mdp_clk_src.rcg.clkr.hw,
>  			},
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -1844,7 +1855,7 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
>  	[DISP_CC_MDSS_ESC1_CLK_SRC] = &disp_cc_mdss_esc1_clk_src.clkr,
>  	[DISP_CC_MDSS_MDP1_CLK] = &disp_cc_mdss_mdp1_clk.clkr,
>  	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
> -	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
> +	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.rcg.clkr,
>  	[DISP_CC_MDSS_MDP_LUT1_CLK] = &disp_cc_mdss_mdp_lut1_clk.clkr,
>  	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
>  	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
> @@ -1866,6 +1877,11 @@ static struct clk_regmap *disp_cc_sm8750_clocks[] = {
>  	[DISP_CC_XO_CLK_SRC] = &disp_cc_xo_clk_src.clkr,
>  };
>  
> +static const struct crm_clk_data disp_cc_sm8750_crm_clks[] = {
> +	CRM_CLK_PLL(disp_cc_pll0),
> +	CRM_CLK_RCG_CRMB(disp_cc_mdss_mdp_clk_src),
> +};
> +
>  static const struct qcom_reset_map disp_cc_sm8750_resets[] = {
>  	[DISP_CC_MDSS_CORE_BCR] = { 0x8000 },
>  	[DISP_CC_MDSS_CORE_INT2_BCR] = { 0xa000 },
> @@ -1885,6 +1901,12 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +static struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
> +	.crm = &disp_crm,
> +	.crm_clks = disp_cc_sm8750_crm_clks,
> +	.num_crm_clks = ARRAY_SIZE(disp_cc_sm8750_crm_clks),
> +};
> +
>  static const struct qcom_cc_desc disp_cc_sm8750_desc = {
>  	.config = &disp_cc_sm8750_regmap_config,
>  	.clks = disp_cc_sm8750_clocks,
> @@ -1893,6 +1915,7 @@ static const struct qcom_cc_desc disp_cc_sm8750_desc = {
>  	.num_resets = ARRAY_SIZE(disp_cc_sm8750_resets),
>  	.gdscs = disp_cc_sm8750_gdscs,
>  	.num_gdscs = ARRAY_SIZE(disp_cc_sm8750_gdscs),
> +	.driver_data = &disp_cc_sm8750_driver_data,
>  };
>  
>  static const struct of_device_id disp_cc_sm8750_match_table[] = {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

