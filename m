Return-Path: <linux-arm-msm+bounces-60532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF38AD0FAC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAE1C7A3AF2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB742217679;
	Sat,  7 Jun 2025 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWBtNL/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D76202990
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327271; cv=none; b=lRSQsJMFBS/eym5EvL4r9KWHm0OYgluIXGcpasWex/UeYxY0zqFlsfKnQ0MAXj6j4b5Ec2JQeoo1+QlpKyl/mACY41EzCef3hY7i2ldHQlDZzjSxLD+H4reaSk975xTZkPlyQ1wdt1NXom6ATRIypA5b+LQgd1eLJs2BcFKLOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327271; c=relaxed/simple;
	bh=/yTvjJSbmeBkjetv+t8paMqwCZ7G5iKcabOsmKpoGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdYeeIqJa4v1pSdh1KJ6CknQ57iGBADzOdaplH3XLLxfLxwT+1j4PqIY9KWFhqAPjaWS49M9mn4w943OeTTMHqyLY/3ILUbXPUkO9fdYawU8fjyk+3DS4RqpEZtCbzOtK+6rSZosewGJ8e78TVodm26B+LJsdRrIf8Jdh/gfO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWBtNL/w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557HsYu4020513
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=neSEr4Vb10TXp2iyqI1V1pKk
	tA2cv81JEUUM8szWa8Q=; b=aWBtNL/wBLh7CzJ6ADsTcd6RZes+GaWM9LycJcLq
	C7Jz4+8RJe8RokAt8cHhZbC99Sc4sCvW25ZKoTUthmsXUo486GQvgMCGpPNJs7OD
	eOdlhGb4RgKYbOexm82vfpwVDVH8b2VVGEHf97jUZBd2fbtVw2g42uLrUiSdUxxA
	X1N1yxLutj18RPuwltXnToYvs9w8ZI5B5g/fh4+DlEooQepkt3AxS/0FvPHux1XW
	CRWYhppRcI6mFcB930+ZjmYG5eRtMJkCYiitb1pxlJahvDvTV3FROEWZMnz3SotO
	aaXj1Z64Xt4i7x6ECtaPNKIzwQEh2HjpoRnI0PP4e4d89w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn610v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:14:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so954477785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327267; x=1749932067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neSEr4Vb10TXp2iyqI1V1pKktA2cv81JEUUM8szWa8Q=;
        b=kaeExPRSwarlxZ0Xr4P/f2PcGBEfF+ZEJnA7gMCnDABV4lRzN48k8013kdJyXy69q+
         mV9ZSlaybnkjt3KXQjczgyEUnpl7ex1EdHDlfjcoaoGpd0ajNXnTRLzDM1athwRxe7pi
         CMd2dgpfs8K9LD1J4wmuRoxpdpQq8B3BoZEY2Y2UhE6s+jA65XlA4HomMXujOrd7UPfz
         Xo1J+WbT20o3WELA08aV+QIL/pWg1Z9DmECyRVGinllHJHwrDgH+dzczF9OyYuq6SEwL
         Lp3XMPjaK0PdgjpthAeJJd/E2AGBU69APnFYyAcSuKu8GEyvU6PwWy6PoQ46Dk83F0A7
         8Q+A==
X-Forwarded-Encrypted: i=1; AJvYcCV1Dkii/He3LVsdVLz0jVCVdxZu5h0cp1bssefY8i4XlheZvzjsrHGTzxXu45+Bd/73FIl51+0UHfGs8BGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBHkWAjAo93L4rQKmvf+wGHTsXjUrDtnwCCMNbr6vJU1OMGJr
	I52EV3qutwtbZf3FkOEzuu0KhrCusjY46QJcoDvCjJFxd1+oZavK5uUM4cw7bsk4LR6G/SlA8PU
	8o13E6f3OS/07QstHgZ5M0JUKTbMLMSIUeNf78GYPa0QA1Rug9NmB5ProziGghhv+Rs+7
X-Gm-Gg: ASbGncuVXABfYrbeINYvT5LasCYb814ZzKnaEtxjRY7q3oKvyM94eGLzyp/ls6rKrC2
	96P1wa8tU+D7u4G008YGuC1AtqfmKn42Ni0RGyzgUBMy+4PSSc5IJ6PyaVwUVhU4xfmU4LjtQd+
	2xAlGbeDkpb2lpj40c38GQYaanUWxTdwb7x52Ky7boigHi5EcUjv4OUSsotyKy5G7in807WRil6
	4a7QK/Wt7sKumI+01eE+OxvHsjcL5KsoDSdmejZPmjzrjpku+IuFkWmaFDsJRpFMfbGXVCJjkz5
	AM8dgVpPuIq5T6SElwARYKe22oWLH9NMsBE49uUOdQJ/IRye/djD00U802vma8y1p+ApGr9GgXe
	Y1bbvpdQoQw==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050770285a.28.1749327267622;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCuag0taTHrzm6R/+ZyR5VGeUYcsVJcuUbo2+TlgX3IAKr2Foit53gWXRD7B4X3LAeA0xVTA==
X-Received: by 2002:a05:620a:244f:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d229895ca3mr1050767785a.28.1749327267232;
        Sat, 07 Jun 2025 13:14:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm5606531fa.12.2025.06.07.13.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:14:25 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:14:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add Adreno X1-45 support
Message-ID: <5xb35clc3wnnwpdnmqfminl4z6ok6nhoxg65hwgyxegxguby5d@fuks7fc2n3pf>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-2-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX700YmfCqzehc
 ptcPbPxHXJGTbK+6KoCbC9VF0GQGQXi/UQpy5Wq+dDbk7/Mvi3av+gxlwUXlK2KLYJXW6RUewqx
 gyNppiwm0lsuZd3IyuYJ5sGmUoiEKk62EzryPsCHVaOaRuGpaycqpq0b+El/gXOwaMHg/UbBUkh
 UhW0WO4oXcmd0rrx9SvOEw/TJZlHSDxxXkops4j5MsiVrvyIgYekccTe/CsIN4tBa39llyKKUfC
 Zdf408+CNGx+D8PZsxsuoLS8V9xA0L4NlwaN+VbLS1k9kalaAqwCAe/ebtihtGcm56fLLp4X6/G
 6pFCcydRs1JvV9YuF35Fy79vEG2flKdeOfgjGRT4DIa+bHXCq/pdeeu0QVcRO03qrsbwtYjYVne
 OZw4gJa1Jx4tUEhqK0x6II4G9BCYE5OjB701sgbZ8PC/onNfXS6J8odn57lBWaEkWu1IzzKJ
X-Proofpoint-GUID: 7sBgoWQr4L07kSgGHDLNUYAs3ENumOXh
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68449da5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=K9QtY5NQ_aNozdUEqbgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7sBgoWQr4L07kSgGHDLNUYAs3ENumOXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070147

On Sat, Jun 07, 2025 at 07:45:00PM +0530, Akhil P Oommen wrote:
> Add support for Adreno X1-45 GPU present Snapdragon X1P42100
> series of compute chipsets. This GPU is a smaller version of
> X1-85 GPU with lower core count and smaller internal memories.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 38 +++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..2db748ce7df57a9151ed1e7f1b025a537bb5f653 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1474,6 +1474,44 @@ static const struct adreno_info a7xx_gpus[] = {
>  			},
>  		},
>  		.preempt_record_size = 3572 * SZ_1K,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
> +		.family = ADRENO_7XX_GEN2,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
> +			[ADRENO_FW_GMU] = "gen71500_gmu.bin",

Any chance of getting these and ZAP into linux-firmware?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

