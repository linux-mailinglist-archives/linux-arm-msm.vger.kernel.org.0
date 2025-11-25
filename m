Return-Path: <linux-arm-msm+bounces-83278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D7C858FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 48B954EB853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DD432695D;
	Tue, 25 Nov 2025 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSN1UBh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S22K4HqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A33246F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082038; cv=none; b=uaGckXTobczMqGbdAL2a6SZvWoYZYFf37A+4BEDOqxOAomK4c006NgKgIlfRVieUcBovwEfasQBOdHEKP2K/CaGB6jESKppv0d5AL00wpMacZWAtlODHrqiWEIheIKGGJ8mHJuzuyEZdwtGGNBCko1dcPuccuuJ6lNs2FJ9bBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082038; c=relaxed/simple;
	bh=vrXzx5bVCEQ/DIJoAm6G8tgINhpEI3fCQRh/EucAaMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs0vl3VmpbCNYmjuKNWAbdSxZoapTsrfnC9xnwZQEaTr5LPy2QqGAWlV2OYXXTkAA4Xna5ZUT7cA5NqlKELL8GUvozpvrtN+HJSo88/rhBfFIYlZied8+HKuWvhYfU4rMqvQf96btCJn0G4/4/dqHMniefQZlVRkNSorYHB6+I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSN1UBh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S22K4HqI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xPcX2650982
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0OtSc4Iv//RzAZHCwgmMh85n
	iL32lnUpnwK33iA2iag=; b=WSN1UBh3oO4OzK6Tk0pSjA/1hOqvHqA+hgShwSyY
	4lexRVBlWAb9QBTO49fkLvldQx1SGHMy6wxOVQS5UgCvW/CHvqey4Yvgzwm+78wK
	HNSx9R5lHaGDmDkicvwhBAHfMooi/jvzINeKlgjoV0ci42xssMQzO1FuDq+ACL+j
	0ODcZ1LtuhOdkSSYneaUm1KWvKUrkrqik/t9TJ5O55NFhJRzMr3SVGhHT7EQHuQK
	tZzxmcTAn+vS+gr8mLJ3WIUPuT5ohHVekm5ONva7jeI14Q3uKKPm8CZO/rGxq7c0
	+y9Rsfh6H+f0liX3mynCkWBF8X8wCNq6KNMXtU3zqn8Aug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anaabrs29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:47:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so2062740685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764082034; x=1764686834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
        b=S22K4HqIYLYQcIsR1/Lmjj7Anq3/RtutzaevM/nJwxoWdC5MlBzKiAD9cbYWpxq8id
         9687Pw7Squ7aCvsJuW+6u+adN4O6kOX+1jDFTlFVmsLzA0BnZs7sVxHA9lvo8nuvpXq5
         2ltdNryDtbxLcLsWL9UJpU6iSiLBXkjMBABOkC5taL8TnpixctJtTSdULaaTuXQVLyLJ
         /fR2cIrgYOC7Cqf+K4ViZ1uVno2hWY4xWg48LXTtJsifwIrga3tzmtfCRGJRkWnanYHO
         AX44HbBfl3B/1cmcB/FpsXSuK9yNPxec/ICHsYqpcnUIaiuxBeN0tqdvARsSncQl6wfV
         qPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082034; x=1764686834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
        b=nwfYyXS7JzsjoBCvuzyc3KjtObhT6P74x9eDBQAxZD5JnRfoR0/+BuPJ5d5FAxpFox
         JhlzHaItFTAPBzbP+Y+cAuZx2OkTMs/0/vmVkD0sFbGCRWAiGNMCjk6Ypi2yFkP4DYe/
         g6BJ4akWmeX1zCQoiB9nQadfrgUCJLjFmSNqngFnHJechtsNXO7s2CrgsrlPUyIrzxN3
         /JBuxicrQLzsnvDsyogSeSwOub+tWyEdDswaqdKGkeinVPfBA0sSnQHSFTABZIqxPbxB
         guQ/hccGgkmhBrHs1nR7CXbVl9kjZm3sOoC8nbT9OZ2ykyQ2xrdHqJkLtleQzA1L4SNs
         npvg==
X-Forwarded-Encrypted: i=1; AJvYcCW12takBrS4/y6orfBfwHgQRhE5z38fNbp15WilzNcxYNg2M8bD8rQEjnxNyxmrMy+1Qx5SZSs/2+IfzM2h@vger.kernel.org
X-Gm-Message-State: AOJu0YykPW+c5Wpkb4KiqRGT7wALrxysErz8+XSIyJCLNLCODhuxPASx
	KFn7eyxeKe/Av4AkNXym21pc7+y6gSCyzIVGqlg2h7m+1Vmt8sCC4Q1MQ2IHP2rJ5TNbsZiGtJM
	+A7yAuBp9/LF9KKeSQwPSHi8li9+zpbvwkNC+VP8eajtVVLldZ4tUEqLkl84OpHuLyVCV
X-Gm-Gg: ASbGnctK+S6sa9quja+bs0oJj7mSeKe2PMh3sFBSaobtHJOBAV/fK8qIRsO77bgHdl9
	rPwp0Qqp5blElb66IQbkvwf5CY+zlqf1qR/X8qfFOEJElFFw81V6cABunkGp38LPIi13nUfhIm7
	vQ1JCzBJC47on2ZCWM7un6CqQieyPfrDAWxBKObkY60RMi4rVWdyHIaSRghsbol8skamEKfnuhd
	+0p4l6R9fxaeB1tAXUokUzPOurCQ9ihSkKNJQema1Frx/F4AjZ7mz2jNZWHxIdFzKtxhNaomao5
	LsZx8hS7pmVK9fTWJmfuY+iFv4EFNqhTJMQUb0isvDaaiiL290dv7U6PmpOS+Arl4RiG8huIyIp
	R+Ev7AwKAYg1I3IyPeJGB9rZCzCiiWYV/SR8a27cFJIzQw0/oVgi9NsdrErLO5kibjCpJTgP8ZC
	sfATPC+1MTH1lMub0moLdEtzI=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id af79cd13be357-8b33d4a72c3mr1768049585a.46.1764082034085;
        Tue, 25 Nov 2025 06:47:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG7UOLRXXghJiqS+TfOorFOsx005dRphXTelmvvYi2z9s+6NL/AWnFV8TeVC1x1Pw/DIRsiw==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id af79cd13be357-8b33d4a72c3mr1768044685a.46.1764082033476;
        Tue, 25 Nov 2025 06:47:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db88f71sm5301984e87.34.2025.11.25.06.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:47:11 -0800 (PST)
Date: Tue, 25 Nov 2025 16:47:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Message-ID: <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Vd36/Vp9 c=1 sm=1 tr=0 ts=6925c173 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-U1_elcvvKRzM9PYnLcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0oiplgNy3EEyd7A90NsTY8Rf0badHknT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX3mU8frmJHkdn
 /g8xJld3wBOGB8H90nZTy+LqTLwbnDocu3PV5gbap3GIpd/jHnPD4CYNFdco6Q7HFSua/1z//4V
 /dgO5OiqmCjMtYQbwJ+Dx03ZxKIicvnOZrviqpfa9WJkpfuKZOicUvB6+pI+F/2suz0dIUFoQCE
 ypG/qHcaDAVwBh4d8u8nVtaCQyF5ZMVpIlR/7pI56oc8plw389oajzHVuzJjNE0QHz3lRfJ0XHu
 /f+IBLfgYO80Ay5utbqTmSnKOpjZpCWBoQYHF6rBY4EeBS2OgBsCJzqwGQJhwkGnI2RjbsKC0Wk
 BIYeyQSARuDfKMPnZGbpDF2HXyM+olZQwG5X9C6+7qdPyHUvi1oCorVE6UqpvwrOYQbjWCIiQR5
 VSrlQLKgzgVAo1wo/ZQX98ypCEg1Ag==
X-Proofpoint-GUID: 0oiplgNy3EEyd7A90NsTY8Rf0badHknT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250123

On Tue, Nov 25, 2025 at 02:47:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index bf9a33e925ac..797ef134e081 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> +{
> +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> +}

Can we please merge this with 4.0 and 5.0 functions?

> +
>  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  {
>  	int ret, i;
> @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },

After glymur, please.

>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

