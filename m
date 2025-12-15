Return-Path: <linux-arm-msm+bounces-85275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB158CBF9EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 20:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 751B030173B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 19:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B2328B56;
	Mon, 15 Dec 2025 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUNFOjgq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VPpzGxgp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4CC32471B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765828714; cv=none; b=pibvceRLG+1qWzGhQQhL4bfYLbS+Sloctp/rkW+C19BI8QI5aJBl0Nj4jzXdZTVKXudHFrCbttk4Cp2xBxEFWfZ15CDXKKEC1yMfcqZIEFOgpRsEvyxb0i2xg6TATIfmzlMg1NRREw3IJjwLn3yX2kKPzG5kqvrpkCcV+zCJovc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765828714; c=relaxed/simple;
	bh=KhCNubqe3dU1MehfFIcEwPxQ2or1xMepUWoUJtG7xVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTQLVVdu1jCdLaDeiIJoj15QGru5H3ogzTs1PcyQhWNDJZxh+77UM5hYhBG3cj9pNSogYmPxEqZ4KLfoRbNTHkz8PY3DJIScn6ZlGchfmPfj/873pc9SLRdcb6nfWtDSzXIab/KpbLG5RQHjtQj50bdf441VWU/c4p6P24bOKv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUNFOjgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VPpzGxgp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFH3igw1205156
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GbZ18lxOGiUe/HsYW3W2V15E
	rrAIjtn7+Jnig2AbJV0=; b=pUNFOjgqiXY8pKRWmYw/q0uWeRil694u10zENVSs
	GidobybU22GXDkgiahUFZgKf/cGM/Ei6fqtLrn+nLIpmDI5sF2xxuyb/Dpg5DL2O
	G7n52WgvyxXETQLIC3puQ6te1Sot9xi89jJo50OcobJdXmFOA3gMYcjRxrm/bEje
	XIacPnx3VTO9gXsun8pwjXgD6Uk5HSaHpvPZcQ69ToEKXI2fPm+qwEhC8OssM6hw
	vt/YPUnaq3zgLqFtcUcUfBRW6ZLtPXDPRh+MQrimW/eiEjQBl+v0tG9py0XnJvCb
	pPRZ6gmMd/kTm9pj7/0H6ZKhwsCwA94shEdXfArAXnZSbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdagfka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 19:58:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee41b07099so46169351cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765828711; x=1766433511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GbZ18lxOGiUe/HsYW3W2V15ErrAIjtn7+Jnig2AbJV0=;
        b=VPpzGxgpwoj574aLb8ZBLtaUlbuBphyhc76ksQzLgd9h0fq/Vy3mkOj5tH2068ihmD
         105ivXZZLlwzyBGNuTDSyGcIBBpZEqqqEWnof0vqW6pLJOj3VfVdYoMl2ZXVYKW11MLG
         HhAEXdw8RIvwQXIXQNj1Wld29pH17pv7x2ZOOwKCSvzyN7DmLfhD9alFjxrfkV5h055f
         vr57VJumFoqn/4YIDz0/HddE51EapF2A8pgPJsw2liksgn/9xLDnfiQBK/kTGZ6VWkQr
         KPCzz09wnw62yLuapF8UDGy6tuUNKsI4eVzqI8fDnm2kVnVIWYDXRb21sTsYIKeF3YZT
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765828711; x=1766433511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbZ18lxOGiUe/HsYW3W2V15ErrAIjtn7+Jnig2AbJV0=;
        b=RoJxmtjUByn2Zvgt2XNJh3UgMmieQww6THHEvhV1ROkjMKaVAVonfDBdDGO3tCugUt
         O86cACg5Jff5EvaPyEYqDd9h2MAhsN4xM1DpP1ADGJg5lI8OGFJdBhoJM2CrTdU+hZvq
         ofgdlhC3Eg+cQzENC0Ntc5x5xZ1bce2WOCa1SMgxhyyIS5yLehWUqElozihyh3ZLXv/t
         F084hwucuC6qTZ4uENdHcEUTndjGpc8u+bSNooGwbVz19E3b6jAKfSNde2e29JoIihzQ
         ChRft9dpCMUffLiLVItAIejZ/a1pGmbOu37v/8aFzZR3t51QWWipmaVqw1gJp8NV+obN
         1OEA==
X-Forwarded-Encrypted: i=1; AJvYcCU4aa2DFDmqKF9u5JpwoG0pzbBgjsFzeZtvAgyy9OOJWCaRFZmPlHrWLN85n00kOd3j0S8a5WVN/VCGRLio@vger.kernel.org
X-Gm-Message-State: AOJu0YxyTF3v0UWM6Vo4CqQaZdg4rUHgm9ziBdlEy6x81JsrII4gK9aP
	27ZxhdEgT5Qv+JcjuRNBKRV0jnFzuY6fiiguzZL5aaBBRspVy/sMvjSK4EE/9NpMxFpw+dLzcEn
	cP6gLK2q+m4C6jVq3TjYz/6i1P5lQhBxAq515TCKisf5aYvPvSHTqwbYFcpVL6SRaNsdA
X-Gm-Gg: AY/fxX7P5PP+pmCG3lzUG3agjREFuJkXdrsof0vtiZgobSYtKM7x7VKPfqpg1RMsTOo
	afvNOLD0Prqun2feGGsG/fObs8Wo27W38ZwxRVyCYahjEVkCgYxKKamgtldb0qc21rhoXMjgQiY
	3PSAkjSTTrYXqUHnNuh7NF2yL4u0SXW4AtWoiIXr2fnSS0EbVvXFEPwOGAen9B9F1KNkeOebo3d
	dDXts0PBVCB1qi+tluJfr12VCdFU9dq/Mm79wcU4h7AOUjb6KJDq6VQ6ktvGY0z3B7JNCHS6AM+
	wcUAEfvs1Hf/krOTYHb+kSNXaUy0GrLkJNZTeltKbqRNXqVoWWsqHxLW6msZVVrAH+Swz1vAeyM
	LcV26FG8x6aFIOxjgPeoxXyWv1V7inxKMiKBEgjcLaEYajO5K3gOXI+4xIEOW6mfOvyWvmbqkZ1
	iM9MKcnXS8T4mmRNusiJ7JB24=
X-Received: by 2002:ac8:7fc2:0:b0:4ee:2200:409e with SMTP id d75a77b69052e-4f1d04adcf9mr184522641cf.4.1765828710843;
        Mon, 15 Dec 2025 11:58:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD8gPMKgZe1NIXF16IRzWVaynEkaU6K0gMBwesa267GBxyPXnZwQyLh159lx5eTh04Ay8IQw==
X-Received: by 2002:ac8:7fc2:0:b0:4ee:2200:409e with SMTP id d75a77b69052e-4f1d04adcf9mr184522161cf.4.1765828710310;
        Mon, 15 Dec 2025 11:58:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdec393ccsm29465041fa.21.2025.12.15.11.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:58:29 -0800 (PST)
Date: Mon, 15 Dec 2025 21:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: -7xUnOG1LD-pYycKp2lw-6F5kQ0l3Nx3
X-Proofpoint-ORIG-GUID: -7xUnOG1LD-pYycKp2lw-6F5kQ0l3Nx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfXxpbTopXa46rc
 huN4qSdSLwI3dqqOaVU50I74p8XPVeZM3rrGilclWygZ8JmO6sCdMXbxGE9S72EB/UwC498fS8E
 jBKabdwWzIiCElrJ0CIjIrcjv9GR7613iN5sbD/FDvJwzAt3BNn/ziZp5TgLt8OYFA3UMtJzikl
 8AV7XafBzM1w8Q7DeZYo+wNy4Tbdux1TrFTvkygY6rJmRCY7lvi8fdROhByP/4UmxS1UaSL2HoY
 PfCCnets7YUyA7jmrXuvhqFeb9gwOCqPVmqdvVHceIF4WA3aB+Z1xt8ZIQ1aBA+Lj883aZzMplx
 3VR+iIPc8m10nIVvaqhJQdo08icGbP2LQUgL9WX7Ck6T8UCAF1d+jLhHGVCfYqlw9BXFaAnl+EU
 aLL6hjiY5AdSt4K1HqfRbc3YR8l8Hg==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=69406868 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HmsCTVYA9p91sAGNaR4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171

On Mon, Dec 15, 2025 at 04:38:48PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index bf9a33e925ac..cd330870a6fb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  
>  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
>  
> -	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	if (data->ubwc_dec_version == UBWC_5_0)

This is the _dec_50 function, you can't make UBWC_5_0 into a special
case.

> +		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	else
> +		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> @@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

