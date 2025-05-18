Return-Path: <linux-arm-msm+bounces-58316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B02ABAF35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D461747AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42913D891;
	Sun, 18 May 2025 09:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWcQIgYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4812C470
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747562391; cv=none; b=jWDFZbluvMleumjps/oUsAkh/olu4bbL3Ih2FJH50r6U8ylFdKetU+lwphTEoHCfVEi+FQxdMRkR2gAMoxJzWSOaCdRBskZ8cJOSi174lwyLbzemAvVx7O1k7GDHqlA8AiDA7Ms6kBtLsB9eXiZFXIA3ItYvO47qQTT5bgRh4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747562391; c=relaxed/simple;
	bh=ueWk3TgqMfa5c9wV+6RoVaZpGnywa4/zBpLz6UmdNOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGBiNdaBzdHp3CI0is61EbkSAxt4uwMNCLT7jqsl5JIxZpG6SmjclHTtysg4AP2YLgZio9bZ5wUwVK0REm8k6YLusEd3GdRqOo3sUkdRpfjISE14GVMyxMkXVfiL80+9BmMEK6yMkNMQHKV3D8u1nThO5DCAaxVQxZmOUeHZTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWcQIgYq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8nslg001806
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K50CCOhb1oRvXdqTRxazbRT6
	Bc6ZaplqyOTawwp2iHI=; b=OWcQIgYqPHCqvOadeF2z3+wWe5ESOqrErI+jWY/x
	q5UcGZRPDiqUJTyK91vxfVqdoH9Duct/rlliGEGDrjkpiiVSahIHMCs8gCJU9Q3o
	ED87fm3cPVfb2sZLy52qX1D5b0aDz8yuor8Lk+dxJo/AB0ZF9AytO7aWktzd9P3V
	AqjfoFChpBHm3u4xdVWdsI8rKNBDnKjWPPACSNOGsrKR0/Tsre1LpxDAkwuE5gue
	Mcom6RTlP24CEwOyODkwxRYorhOfgm3RRGy53+6LyAdzyWq1cIkluphu4Nu0Hgro
	ra/7awc1wUEKsYGGVTrkFxdQChynVik1h/N94EhLI8ulLg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhtus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:59:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d0bdd023so22643356d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747562388; x=1748167188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K50CCOhb1oRvXdqTRxazbRT6Bc6ZaplqyOTawwp2iHI=;
        b=W+K9GFjYuMW5PBnxHHhigCTJMbnr2KwFsHRtnzICDiAGWWz4/bNgD9ayh/j6vvqqnb
         8IGL2JAsC8rKaGtNqGA8gBkQXIgy+aIyIoK5WVu7HcmXTI8JVGTYTpfnJ0B/eI8s8Xp9
         BJ++CkTKubZyguMgMrLKDyZhijOCAQr0Ckj+GgcffrIffje/K0juVtwweNidDhxPQU+D
         vjK9dPKUPLJFx5gi/zQeWUWLKf1aowDBO3+G6rz3hgVwCimnqK/S+xoEQOlWxC7Xa/wQ
         8NLqekpwk6IT5zlLbvD4WTXuNsfjfzdoEHrYr3yo13Xc0SK3PULU2DDY8o8ontp2xpSh
         M/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8hGDVvfjVyAhj1Kgr7YMSoNE+ETOHbUrUCvuvEBufYmrlz1JXkOb/M9+K1urn7KVsrpbDcN6p4U9nN5N@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3CLzPCprG3ki0zZazlI8WDqyW2LxA4b56CIVfX1zz9d+B3ZTk
	N4j82MIEAkD1LEZC66aEBKloFmxuT9e96UOfavWKAmKzZyuNihnN5OxQWSjReZknKpSPJQnx2yh
	w8tO2hNuC8jg8GuqWixAN9Zt9o8lz9a1ZRbDPOwtlFYtkxR2KU2E+nWNZNsi1dVOVPgsF
X-Gm-Gg: ASbGncstgdonTaSE5c9z7MP2jvx0ash97zRki2ru0/j+zCmSMk5QR4Sb+bucYWZiEsX
	pOyce9PLiw4RJDj113QRrh0G0Q54DPsxToXZR8v7rj30DjWkBn1qox28ewWfQBjbHR4NRB35TqX
	/P1qXLQ4qLtdkslm9h+KF2fL/J8Q3w+BPck+rUi3o1k1pIvMELc4Qzza4vfB6/SDsmpBLpgqMrj
	WlodhpguBc0I2HGwCd8yhPcWTuog4y2fXEqsWZ7+ydgthXFLLNzcO5ZX7Omt5s+nXqnYDwgRqv1
	0sab7uLsI2p8VEonJe13JoYvANl9EF3iRpM2ULSsoUTobT21dFqPf+gleiVEwN5zr6rsPuJLtMI
	=
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f8b2d15058mr139256246d6.28.1747562387940;
        Sun, 18 May 2025 02:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvht8meUEeI5mfZ3Bwjo3DPt0lB/3QmCreZafC8XgUYj5EDksJoZDDg/reTUlqAbsb+namaQ==
X-Received: by 2002:a05:6214:248a:b0:6f2:c81f:9ef0 with SMTP id 6a1803df08f44-6f8b2d15058mr139256106d6.28.1747562387580;
        Sun, 18 May 2025 02:59:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f5d17sm13804061fa.113.2025.05.18.02.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:59:46 -0700 (PDT)
Date: Sun, 18 May 2025 12:59:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 13/14] soc: qcom: ubwc: Fill in UBWC swizzle cfg
 for platforms that lack one
Message-ID: <k57pmwohvnubbsxjxc7y74nkuayiktcrolbqlm5vorayrifemw@uuou33ffwdlb>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-13-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-GUID: gTqJiXpRstrPXy20JHsNG-ohV4-Gx1-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfX+6mcrvKrzmDG
 rFoMHNr6C3c9g7O+n+1jgmGoN7yaB3gvoKsBlgfOhws/A0zvX3V1PgNywaLvaNpW2zyLflwwc8I
 ytPun0T5hZgmSKarIuS3+HgPwR0RTYC4A0ro4L/APijiLZ5+Nm0kFNs/h3RrNK7tMzNNCHcoj2Y
 iHiTobblV0mBSQ984/h9ioXt7VwkgHEU++XXC3HUxNDZGY3pXFcEUPwfVqlqBNnJUQ2UY8IkQrK
 kcqQam++rqhg/C0WnLBs+Sq2iH7F1x3Q8SfeO0mCFfO5ZTddlXQLHL1MAQhsnSIl6pPCNSXF8DD
 iHHjzghYB5/lTnGt565a7xpunLJDBB2Us2Lr+M4ZzM81cIVVjPI+DBzRhlGKJijQaaBxZYYoJSr
 AQZ0OuQddS9cR3AO63mx0/QWJ0kGHPSh+PaFhG3sDIiefG5onEw1yNUuPlklfgYa2V0EYeqU
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829af95 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=IaUOA4i9ptLxJl9v6jsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: gTqJiXpRstrPXy20JHsNG-ohV4-Gx1-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180094

On Sat, May 17, 2025 at 07:32:47PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The UBWC 1.0 case is easy - it must be all 3 enabled.
> UBWC2.0 and 3.x require that level1 is removed, follow suit.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Ideally we should test this on relevant platforms, the commit LGTM

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index fe874ccd8df6acb4fac65f7d261afb05861117c2..a4b730dac6c4aaa609d41b2782c9dc522387d8dd 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -15,12 +15,18 @@
>  static const struct qcom_ubwc_cfg_data msm8937_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data msm8998_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
> +			UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -70,6 +76,8 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
>  static const struct qcom_ubwc_cfg_data sc8180x_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 16,
>  	.macrotile_mode = true,
>  };
> @@ -87,12 +95,16 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
>  static const struct qcom_ubwc_cfg_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sdm845_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> @@ -118,6 +130,8 @@ static const struct qcom_ubwc_cfg_data sm6125_data = {
>  static const struct qcom_ubwc_cfg_data sm6150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
> @@ -133,12 +147,16 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
>  static const struct qcom_ubwc_cfg_data sm7150_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 14,
>  };
>  
>  static const struct qcom_ubwc_cfg_data sm8150_data = {
>  	.ubwc_enc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
>  	.highest_bank_bit = 15,
>  };
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

