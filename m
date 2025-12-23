Return-Path: <linux-arm-msm+bounces-86428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54BCDA8C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 21:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AAEE3025DC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9DBB35F8C7;
	Tue, 23 Dec 2025 20:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0dVQOkb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MC3+DijB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957FA35F8B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521570; cv=none; b=Ka/jGTueKQtTxXL7kNOY5+9LzMg0DR6RGK+9QZ6b6z8T6Foo3Cc1v+eAR4bgKEnf1Sk2aMGuJSgfm6wgJ5TivX/nDpFEYPML3CYGIdsYk7+gTfL7krkAZwHw0OlfOtF4JwYMkG7P4/sc70CAPe58DelM1b0aR0Uy1hk7ol2jPww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521570; c=relaxed/simple;
	bh=CFvP5a2KfjxiURdfN0mnxnTosl7gqO+37M9yCf0UAlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V32s3y90oXYe05lsukyMjan3ppSldZpjzQLzTDMCq4iqXKQKZwwY3As8M7Zusz9gHQ7nbhXK5nlj3/FBVZJ3R8OwjJKzOPC3zccKd7t+/COk5foyZ8iPjzRDqafFj6Q8k6r26iJ+/iMxkMyq6rEeSa4GzeN+BYtRLj2UiJj8RCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0dVQOkb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MC3+DijB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr41r4134150
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aj42g1lbj0Ht7S6i5Ug6TnJq
	UFURBH1OBIEfCmbSvUg=; b=C0dVQOkbuUJes00BoM++kLlWZZnfRYlKkjLtIMVN
	qpe7y+5frfzjwPETP7vUesuHUH7uH1gJItJs5CAmwy1D2u3mbv4enWn4ykW/bcxN
	MxRB/wbhEGNmxHDcRienRtlBuQsXqGbrJG8V8C/uhEc6HppvbwcSsdG2dsdgpSwe
	qg5L+SgIPXHjG/0tSBB9lE59BNuGUz10lO3VsTIFeSvbccn9os+ykrCHhGVYohY4
	H4y6chTCulZNxT+uhVWgprUtw7gheAMcSUOk/PTUSDFRVqP0Z3tCPxlR2VWtQUEy
	CeYvoTQ/Gc6ZDYcoqK4ldxYpg8s2fY79uCIje5johpshJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46rv4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:26:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8887c0d3074so140988976d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766521566; x=1767126366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aj42g1lbj0Ht7S6i5Ug6TnJqUFURBH1OBIEfCmbSvUg=;
        b=MC3+DijBwVG6zAtJFhfB75Lhnfr2KXwv4GnqjfXRBAjTD3iM/NINJFd3+tJezJoh9F
         CeKDZzATY/Ix7H4iCEe0eFCXApyebG8CGlzawxfKrucyc2SqFlA+uzCoiJz4V9C57i4L
         mT9fapkPFW23SHlhCDiFPJHEbB34nBR6p3QlPdmWKmQ8ojHAohn/RR+hgsDaoqZrOhlt
         ITXJf1AWM02SL9br8hkxZrL9pFtB9zbx8pWG/lQxm9+0/K6QT+NBD75/gqdm9JcmQ69w
         1rd25URsf68yzytGh/4PoLfYyhPgaayhtCxhiRXuwL7TB942+yzyr9hlkoVOYdGRPxZQ
         /Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521566; x=1767126366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj42g1lbj0Ht7S6i5Ug6TnJqUFURBH1OBIEfCmbSvUg=;
        b=YJey9xPxt+daXnkktDmbpYfp9q/uJT1oB/nuJb5WJXpWni4HXvnTLyIrOlMCNuJzl1
         9PFItVc69ScuP4YFYmGoBX1XVkXB0EFTCkdlBribn6KqJuoC4zDAN2V4YYk71EJr55nK
         QgbqJ2jhIAbuGkqp31CZ6w5hXIs6JHgW5F3tHmdZvhLM05GriXh5A6tLyG0FwfpC7POY
         qCrCkVQfukV6foJAeiMRei661owNEimffyhv1tbrEvXgG36HtkvzbazKGzr3bhVlA2kx
         ssfQdKJo+5p6/mnl40YNpJBy7xxokSOJTDlgQ958PKfXkEDnHQANAcRHejNgV5K2/NWd
         dNxg==
X-Forwarded-Encrypted: i=1; AJvYcCUlJDe2fem0b6uldA3S83WhSrNt/S7qd0yzGFZXPa0G0/dg9PynN0Tesh82SSRMdfWTs4POwQKApq6fWcEv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5HLhiMsAIYMpzfwCqewU5s9ulzttftvxTqlr8Qz5apY25elV
	iYJ0I/5N3UeModVdLLClXb1lS37V49AbT3q+UPPXcYKtGVDzABIrTUjcSPzG1vNfapfVYIfHgkr
	6Ubv/4g0dry4KWiWChyCCwbhihXRcC5vla4mOX9I1j3eR173mkqySspngvLuGtDKOdg9M
X-Gm-Gg: AY/fxX5OWE66eEXKYbV1kY/Y6I9i5EIYPVlsf5xwpSuKsBjMa50+ooe1+uHKfs/YNDH
	ydxwnqBG2ZiCUP6HFUzRyW/QEYvj0DhTsYrPad9KD2+bZqlbi5NmH4rN97RB8ik2ZzgASgUzpyq
	cRqxWXNoyIqTG6Lv47XTWRs733ZL8jLV6tKvNCwl2V+8wfN2p9TdGrDqLM7SUoEmVIX4B3FU4tV
	2ZBUvj82HwBDXZtK+XtBj4l9JvwKlZNwScGNvYW4RtijwLR/Mo8TFTgKDMQw38FQLu+cijBRsZB
	0LKP4ToiBkxGDxBQrErR4CB0sykxOHykHBDempuSW7PVScvx8lYfbHfu1ovFCe6ACHoCa8q4oH1
	1ONI5hGSG59GEDTRTlQqQfw4UAY3tySNWIX5WV6AaN1/Q/lz1uDA85oivkrO82sqGl9Q3Ml52vn
	Jn2S2NwcC+rXnm36KE3uXgceU=
X-Received: by 2002:a05:6214:1ccf:b0:880:5867:45b4 with SMTP id 6a1803df08f44-88d8166a0bbmr248859616d6.13.1766521566576;
        Tue, 23 Dec 2025 12:26:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcP4W+FMfLAts8VrhxqLmeMDy1CfbZG1GmYVwnMftp49xkskmopobDd7HasAPIjVFzVis7Ew==
X-Received: by 2002:a05:6214:1ccf:b0:880:5867:45b4 with SMTP id 6a1803df08f44-88d8166a0bbmr248859266d6.13.1766521566133;
        Tue, 23 Dec 2025 12:26:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d4asm4430980e87.55.2025.12.23.12.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:26:05 -0800 (PST)
Date: Tue, 23 Dec 2025 22:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 09/11] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <bqmk32aahvxzhpzvtzpvxcbstbrozjocmx6enkry5z7owdavax@7xtgdizvjomt>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-10-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BhcMc2zZawM1kaNX0wVHjheYvon_dlIZ
X-Proofpoint-GUID: BhcMc2zZawM1kaNX0wVHjheYvon_dlIZ
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694afadf cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kh7DVJtwBPZ15u4CcvgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE3MSBTYWx0ZWRfX+3Eyqwt1nZdU
 enazoOEyW96JhwcxSByeTvB81wWHikj/jBW6gIuFl/6lGZ+AU30Z/A3jAKAJ6q3nBSRty0aKS8V
 xcarYKOeHGd8NO6NatiFe7jPrV6AnDcBjLDlJlFgeLmTBgwxO1k7rzHqI3J6EAVYCw8HEBH0dn4
 3xEScWMH9jBsp6uvth5A+nhtJt5rowYtNq0wWvfe9RtIRnFjRM0qoANR/Zkox66HI8H78S+PoUt
 Bbq+xVhILOF9Ys88Pp6yDbKvUS8GKF0i+i3m6E5ZKDrNQc5G+4uEO7htgKFClMKyuAHPbLpQlLo
 iZenwr1CjbkzzACvmBP1iQOG8xb94NKhf3TzOAkI9FhykbvJwlHMqrVx2qJ18wHQzK78agaQzFb
 aao0qAWBIAeS2Fnnu7lTh7I2U7N3+8uEnlZcZdSsWPeb57xetgDScO9SBLWBs5fkbnxZFdaoMVv
 LoR8ykdNYlLXLrngDdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230171

On Mon, Dec 22, 2025 at 06:23:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 110 ++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 +++++++++
>  3 files changed, 130 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 336757103b5a..b03fea1b9cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -208,6 +208,18 @@ struct dpu_dsc_blk {
>  	u32 len;
>  };
>  
> +/**
> + * struct dpu_sspp_v13_rec_blk - SSPP REC sub-blk information
> + * @name: string name for debug purposes
> + * @base: offset of this sub-block relative to the block offset
> + * @len: register block length of this sub-block
> + */
> +struct dpu_sspp_v13_rec_blk {
> +	char name[DPU_HW_BLK_NAME_LEN];
> +	u32 base;
> +	u32 len;
> +};
> +
>  /**
>   * enum dpu_qos_lut_usage - define QoS LUT use cases
>   */
> @@ -294,6 +306,8 @@ struct dpu_sspp_sub_blks {
>  	u32 qseed_ver;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
> +	struct dpu_sspp_v13_rec_blk sspp_rec0_blk;
> +	struct dpu_sspp_v13_rec_blk sspp_rec1_blk;

This is a refactoring patch. Don't add fields (and structs) which are
not used inside the patch.

>  
>  	const u32 *format_list;
>  	u32 num_formats;

Other than that, LGTM.

-- 
With best wishes
Dmitry

