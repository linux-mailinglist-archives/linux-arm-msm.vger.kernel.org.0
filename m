Return-Path: <linux-arm-msm+bounces-78265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F00BFA41B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F30519A08FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C472EDD6F;
	Wed, 22 Oct 2025 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CB0sWIT4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92D72ECEAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115033; cv=none; b=qWsEaQGOSmFKwah4X8VSksXrsi62wDVuTxe8c/0uqQvSGmoROheUe4xi7aPfeBbPr1Jwmi6bUU7yDnTu2pTXtWi+0AIaF0UWq+JlU1N80MsTCFrPf1eBLc7YfL+uNF0twuHLjVsb0APK1KX2Fn3+3bPAn1ToGM15OUMZC+nCgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115033; c=relaxed/simple;
	bh=iJ1uktF/2GWrsG1i/Ztq1ODfIsEIJ8TPn2k68folgJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVwnOX1GfPfMEB8utCs/UYZ+V4aY0/LVvqbdX0AjfqyRgLfwP3/wpWbeczsN/AqkFjCecqZeN7tp0GcUHknKKSDH+UVz9bjxzqKcUAlu6DN9PZwvhwe9ZnTX9uaAxwAHStWGzdhusu03VYWsK8xEdu7cypw6n8WbZE2gKNlhA6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CB0sWIT4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2ncSu032755
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phYYPHpmFAc5t3rQjDklKkr3KZqV3jpdRFmpgMO7EiE=; b=CB0sWIT4dGesmZr3
	VblF5Nyh4oTrrS85MkDKXBLlVOZT8m8BGZex3n2lQH3w+gJXz458mxwFRbzOY/53
	WzwqV+5w+dzTdQLKDzJiq1mOJ74gzKfmFfbkK3Ttk4AswoUFcQ4cOkNifAuyL0Sr
	eXkp7IFg40NRMMryJDYBWKxd839bW4UPkBdRVez2X6iMDF52X6RU8ccO1K/d1sgb
	Y+yFIRi8+dia5KJdpBG7yyT0bkriEabFzVWLuggTRIJQhe+cLsUGYVQmplePgpNs
	eghiIiARZ1kr++uLXOPUd4fzZgKS//IntqCYJtWhDkTiZ+BnzF2TW8woDddJIhDF
	oLbPQA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w94gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:37:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-783c3400b5dso4267400b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115030; x=1761719830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phYYPHpmFAc5t3rQjDklKkr3KZqV3jpdRFmpgMO7EiE=;
        b=KvCn2OfPcBhDSh+ZnLmth1VOspFfQvYPvZ5MYnSPg1SUu8iR5OyOjMEPOZdBosVjPb
         kaBnTikIuTCIl8buIpUVgI42E/D0N5KdgCCxg/LoWeTX23ZDnK5LnEhJVYSsp7JjnpH8
         JvwldrsKbzQlewDJdmNmpBwNjE0OQsARdkZm/6POdkQcV46o92MtPq0rNPgA2E1RxoeF
         pJO0CO1AjRY+yx68aWsVsOUtaRM28z4Olaa4TnlKsb3hVFeQUIYE5EC7QWNFfkaGOX4q
         i0lY8v3SQw+ejx9j1Xo/birO3ScFtQnY60pk1Pg/0pNOiSNfkcrStd36Hn9YrwEM1eos
         yXhw==
X-Forwarded-Encrypted: i=1; AJvYcCVWIKHYCx/L6tsC+uuHqLEkyhhtgZYfFxYphZPvhEbo7iY11JnLiP6Q6Y38W2x90fr55zPZtKTiorjRMZR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tgeZZnjOUyt3u8bvALXDjdpBh3egMiEEsLnEQLnEzRHDS5RB
	i0z7f/XnUYjvBe6DyzJzdIEPVEmOxHhGmpX41pk6YL6oSJuUOh/s3EmaXBzQsgxjHeU7uOJICTt
	OUr9Pxq/BIG1X5E/Z5i3mynb09rpFvODZhYAqdyB4YX+SYsxywgoWGXHypMN1rjjFsajF
X-Gm-Gg: ASbGncsVecSMX3Ppg+WhwiN4o1Byv6Ua7EY6jdO7JLIfqbcgrtF69CyHLrspa9tQz06
	Ub8g/FDst68VtV3B0LY6+mv1qy10HPl67mavYoZBIXgQykmX+T7LF7s751cCPMy5JYdrOzX0Fuf
	tQJFFwa/7/+ngEIbPu4kFzB3+xtl631j82agWVUqVv+CON2sSnqB8ad4iUpiPKHfdHez1kubN1Q
	cBs+VIs3fFfjCAI2bm8u3E+FjH0Vt6me1BikXdiNqMpxoW88JhCndm2NuUIhCES9zBtnjvh3mGQ
	mUFZ4jQHSHFAeFtq0+h547Cjcd3jI39ywdXOiY4FoMrQvNclbIcc3CMiPBM3lL3TQHuzF5ibxb6
	pSIJOR65cT3wJhLa8E2OuadS+mx8=
X-Received: by 2002:a05:6a00:1493:b0:77f:3149:3723 with SMTP id d2e1a72fcca58-7a220d3464dmr24153359b3a.29.1761115029930;
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7vtPwGZMKsrymbcxu9zzkrZlyJC25po4kInazwlIOlZKWVgmxbQJbd5FeFHB1tY35PDWVlA==
X-Received: by 2002:a05:6a00:1493:b0:77f:3149:3723 with SMTP id d2e1a72fcca58-7a220d3464dmr24153330b3a.29.1761115029486;
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a26c3026aesm74721b3a.24.2025.10.21.23.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
Message-ID: <d453ddaf-aa44-4125-b86a-4a51f2c23ac5@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 12:07:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
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
 <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JNVLGenW2si45AMVGDOysERuZZ-sVNkK
X-Proofpoint-GUID: JNVLGenW2si45AMVGDOysERuZZ-sVNkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX6E+3aO5oUP+s
 cDSS4yxpNd6ojlMs3JmB6tijUnJmAyedquAxmVVmw1+mK+2qxzo2wAa5nOGfxB8Yuw7LyvmN6l5
 Yq+wrUxONDRSBADajW/h5rXXGXQnE3s0oFeNblIbvmfaUd4OvZA9L7h5teYLt0POSqXZuv/KGgM
 uZnbpLekjjs8d6FNuJQxwLWl1MjzsHmZvWO2zNmiQe36yN/cux09b9ryk93+INeNGoDlDlZ9Q5K
 zZO3KmOdEm8bl2dtamNw+ozhp6KIb/WAKVweDAd38f59j8oUtA776ySjIJuzFOU2MfN3yZc/wS0
 pu90oolX9r6FFRudJ6Pc2g6nNY3A3V81RgtX9X1SkeHwPKaFeiSsWBF3tnCWh7bPRA7+xWP8HPN
 gOVCl9mf2dq+QiuIjGtO+RfcMXVbkw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f87b96 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=rHO35cIvbrFS-cT-sPwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=Soq9LBFxuPC4vsCAQt-j:22
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
> Fix the config so that the PLL is configured correctly.
> 
> Fixes: 9f0532da4226 ("clk: qcom: Add Camera Clock Controller driver for SM7150")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm7150.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
> index 4a3baf5d8e85..590548cac45b 100644
> --- a/drivers/clk/qcom/camcc-sm7150.c
> +++ b/drivers/clk/qcom/camcc-sm7150.c
> @@ -139,13 +139,9 @@ static struct clk_fixed_factor camcc_pll1_out_even = {
>  /* 1920MHz configuration */
>  static const struct alpha_pll_config camcc_pll2_config = {
>  	.l = 0x64,
> -	.post_div_val = 0x3 << 8,
> -	.post_div_mask = 0x3 << 8,
> -	.early_output_mask = BIT(3),
> -	.aux_output_mask = BIT(1),
> -	.main_output_mask = BIT(0),
>  	.config_ctl_hi_val = 0x400003d6,
>  	.config_ctl_val = 0x20000954,
> +	.user_ctl_val = 0x0000030b,
>  };
>  
>  static struct clk_alpha_pll camcc_pll2 = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


