Return-Path: <linux-arm-msm+bounces-78266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181EBFA42D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F268D3506C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C942C2EDD45;
	Wed, 22 Oct 2025 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HI6z4vNV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A612EC09C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115055; cv=none; b=mjTgPX3DFgvi4eUnJlOd1QBPngJybWrSGEupTmkQtKdKXbC31W4y73q+JR0QL4AEmr7pNNs4EqIjPGnaeLEva3A51M8upaKvrzYp1v4qNYhl1J7AcTmgGe5bslMjuEBrgpgJfjaX+uWBC5h/n9RgERoPAFzXaJQlMD/zEOfAmDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115055; c=relaxed/simple;
	bh=Z93iExCuX37UgKDIobpphLKj+O6LG5mSUkFFapNzyWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6DAxI71BFxf1FnO8Ci94yeUXlt9aOLT/ZgYO453jjenBFm6mxigY0146cd5vtEr3gLn+AfqUfYwtU2rw2i7dfXRuXnvA4wUItLUb06eTLV3JnL7Qlqhqbt7Nw78AykaNk6traV/Flm273hZSEnOiHkQMXGyWLMxnd+f9KX8Ggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HI6z4vNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2MG5d002519
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4z02VyJPB20nRWI46YB1ucXp1h69CUNixWswsOxZ3E=; b=HI6z4vNVOcFAQ66h
	PZENWWeLelCbHuvi4KjSDG+1j4Penfya81jnrgFEO+IyK1ae1gmFFjag1KHuuGTc
	L81eO/Og8XPcHXwmm1nDbVGoo/ykA2Qbd7r8kS5Vst44kizpEA/XIZlHrBHfk+AE
	9kS/SPLkFAoXWjbgHcQhoPnFu6OLKp3pHyq9sF91PXE6k4AiHYbe+vyyi22xTzbA
	N9Bzm0m1pkYYUhkyc1k6leaofSS6lsmGXJsOqtpmgFXGPZTuzIPrPmbz0HzDynkD
	1eB4vzPdV36U8BogocJTOoVSsaA1fEvAZJrRWw8+mldGFGqwFJFEBvt2jQxKixjW
	7tj/gA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w94hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so5901541a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115052; x=1761719852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4z02VyJPB20nRWI46YB1ucXp1h69CUNixWswsOxZ3E=;
        b=u+hlKiSYkleFb0H6jLANpPqXCrNTWfmdK+ZxlL0/c5r7ErUpFy6Q8Mu6ImYIymfule
         rNbdr2wZj1aLALoNWEAev96lhstoLbtbPX4LmIIeDQQd4VgTf0J0CSnk1HLSAQlzv1x+
         jg1am7b7TQap7J+KWaSwAg3YrvwsmRBe7W72TkMGATxJ2+pT9eOtpSgUqJsdwdnr4qA3
         drXmMv/IOZGHC4VMGYmHguCASXyl71dHWNMi3AJHv08sDqux2Gr/bhAQcyyLwyihwU7M
         DwukMtbv5po9fHN4+B+rjG2zuoKi6sCinboGpQb04CiSMTqF1+gYUkJOPddMVMv89mdd
         2SxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJs6EvExuRrcF+btGUGpuI+Qos3iiKdQJgNbM5WXDa5pMXQMqfmuv/4grkpcdDORAy6VN2FZ18XRsPkmp8@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKG27FdA+3Vhbw60JcLHlOAiFCO6inbi6JUdKkP1Zrn7JtQtU
	MRQBXdMqgSQOZUGo63jiECQIc16DLVF60Qx2FWQ6YszmQ6XwjFjkZH8A8QuFof7BPkGKOl15X3J
	ix0GxGesooM0cHbdnqtvMHDOGGyl92n3C9w0x5Atlcc8zoH8rL+09CCHr5vWtLBQY+0mi
X-Gm-Gg: ASbGnctPsm0nHpZC3x3dHcBx4WL++r1qaeMjUhvicJFz6AR5FkPYDo9sDbXU+EooIPv
	8vbcBE5auT/kXt+cMmQMwCdiCLm4tFVTS59s1UYE7WacqTsULy99tPIqGsIIB5m0kRRz3rEshfb
	WKmOOZm7bDwPaSkySVhKnIfhJzPxXPRQ1Ml8ydPhWJMKq5uScxJmyNM24ZktQUmFzafyHA8/sLM
	vXjds4BNYhyJWY2JjFeM8GzZuXx/xG8w4rN08au7FY0WebTfqbuPRoBKJpRGkucEnDj7pCujMvh
	0ftKzgp+ZnP0R71hE/xJSsiBpYSM9ZvEtDhV5GVhoJEGfBYlZZDfKvlIQg4Fzd7T4VLgtDflWXh
	2fMh77TjdGPOpsAtshWfybRvh8EM=
X-Received: by 2002:a17:90b:52d0:b0:33b:bed8:891e with SMTP id 98e67ed59e1d1-33bcf8fa427mr25385865a91.19.1761115052469;
        Tue, 21 Oct 2025 23:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7joNkznR+XIabkzzijhQowA5ro5PMScYqcqH+x0jynIzXiNCgZ6De5048CiOYXQThklmRMQ==
X-Received: by 2002:a17:90b:52d0:b0:33b:bed8:891e with SMTP id 98e67ed59e1d1-33bcf8fa427mr25385841a91.19.1761115052001;
        Tue, 21 Oct 2025 23:37:32 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34adasm13339717b3a.19.2025.10.21.23.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:37:31 -0700 (PDT)
Message-ID: <50cee7dc-330b-4a4d-a49e-27f872e6556d@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 12:07:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kUjWaBMRRm-doVtwxJtdAblbLXnj6fMO
X-Proofpoint-GUID: kUjWaBMRRm-doVtwxJtdAblbLXnj6fMO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX5cq1ED3G1Xr7
 2HL5OhOnsYBJvmIsvUkj0XclnOuCHmYlwP+SjRU2+VgGJ0Z56YUDfwb1io0JSwz7lPARHlG27vV
 8kZiW+cibccxqWvHPShPLQ0GCj3mKS+HMrenwripjSTWizRvSENjQ7SkObq3yHFPNpj/4dVVFwK
 5ejQe7je+C9Wax9PumTX5H7OOurA9HrPBUwSfEJapv//cPPf3k+oEMETubPn0SuGeovIfbkPEZD
 7IHCQbDeJvtNvKaB8vo7uMM43wyXjmpiKtp93JuNPRGo/EZbVrCRjzuP7Sate1BMm9Ys8HEI1Lu
 NN9YOLRFfzfel+fnNf8WrFHKXFY8vr4Buire5X+iWcmseN132134MkV77RdliFgK+h4SnsUXoG1
 sh2zqkAFhB1CY2W0um0sZTQNIayIQg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f87bad cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=rHO35cIvbrFS-cT-sPwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090



On 10/21/2025 11:38 PM, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly, and fixes
> CAMCC_MCLK* being stuck off.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm6350.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
> index 8aac97d29ce3..87806392a59d 100644
> --- a/drivers/clk/qcom/camcc-sm6350.c
> +++ b/drivers/clk/qcom/camcc-sm6350.c
> @@ -145,15 +145,11 @@ static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
>  static const struct alpha_pll_config camcc_pll2_config = {
>  	.l = 0x64,
>  	.alpha = 0x0,
> -	.post_div_val = 0x3 << 8,
> -	.post_div_mask = 0x3 << 8,
> -	.aux_output_mask = BIT(1),
> -	.main_output_mask = BIT(0),
> -	.early_output_mask = BIT(3),
>  	.config_ctl_val = 0x20000800,
>  	.config_ctl_hi_val = 0x400003d2,
>  	.test_ctl_val = 0x04000400,
>  	.test_ctl_hi_val = 0x00004000,
> +	.user_ctl_val = 0x0000030b,
>  };
>  
>  static struct clk_alpha_pll camcc_pll2 = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


