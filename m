Return-Path: <linux-arm-msm+bounces-74889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07330B9D396
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9C5C174371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28FD2DEA97;
	Thu, 25 Sep 2025 02:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6uoAMmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254E2E541E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758768261; cv=none; b=pYe1b1FbiySGQ3ulgYNmYfFfpQj3fGx8vXzMbSI+WqKu+7cgD7K1A4H6BZAAue6R7vHlgg5NnzT7l46AS+OSGaOx79r+vxbYxbCesg2a/XV0Bl6iZOEdyIoqa+WevNTvINMZ8YMeXYh9hl2FAEjEZdr8mcuApVwlPeBNrCY+Yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758768261; c=relaxed/simple;
	bh=xxwiIJd2UGyl9n3ZOnuRttXvsXNBvZwie9sS9aGy5+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7Lx4bq60ZjXt2UimVzQUUaHNXB8dMPZi6pF4Ygkk0tcq2nmAQjJRn0S/Vs0Usdj1KGXzbDAmNx5URUjjSjxDTMlXgjF4FYZO9U6zo3AXzJ+mYVBYouVcXQEf538mkJ66IRdz+Ee5aYRT5NuypvwFqEKEfX9cvX1p6P7OPZwRKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6uoAMmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0eKlp027779
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gG4ZVwJdIZtFtrQkoIy9gcIZ
	GIZlUOefZIQJ8wWhtWQ=; b=f6uoAMmIpOqPlF7s0G0dbbqop25b5856s1u2dVZs
	1y4FGDIOyEFQMv6b31FulNZBBfUmW2KErhO8Gro8qgMnqqmSsgdo9UCkVCybZhzW
	IS4kieW4Nhs5OuLPzi2xL5gBhD6xKFwUAKeNSMntSMWrIOuHegptWeZ0rUrY78c3
	XXZq8YPHnd4T1KvaGRI55iJ0YJImR/b534VQq2E9W/dxvriuu/B04fWoUdQPL6+/
	DskaXTu3wwrj8uTpwswlNnA4wtlQg+il9/QbVyRUi1RDtOtOVDJ5ZAzjS/OsEil6
	9hz37RlrGY+sbZ3YSjflqpUkdDNRJjuZpPBwzl6BAoDeBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxu5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5d58d226cso12489641cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768258; x=1759373058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG4ZVwJdIZtFtrQkoIy9gcIZGIZlUOefZIQJ8wWhtWQ=;
        b=FjvQWqg7TrPFbB9BJOEkRMaigTu+giB6yQzo87MywRYRjT1seQk9+5yDYpjXfYU5Xo
         7ifRgXwUQZrXmZhHmTGljIDzXFM+0PK4f2iVPaThOSy/hunrMI1gZs9Rw6fDRWwOQXQq
         KLWIzPosJmNXPvjrFi+tSLzU1JHoCZkZypm41ZlHYRrayOiVt1opgyctBB7XGxyAUJEA
         c1UgUMuSIMQ5cLBmUjKkUtlGsTqDYFj1DciqExawrYqTiUSGAZjmcrtVML4zOHcJb4FE
         jxz4xIAMvMko2OOunLRVvCtS3nekyonUEXymfAGDS7W4NgiENn4JYyyHBWHjjYwXFnCo
         N23Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3EI5Ygl+p5BHb+yoHw+PI3zCLqe+IBH4GaKSWUdtyZRmNxAmCP1eJMhUOQyZxwdAUpCND7ki4kx0tRiGY@vger.kernel.org
X-Gm-Message-State: AOJu0Yza551XSXPuaYou3y6ZiVBqBxhi/ugUNRBj1ude06VtCuvh8atO
	Lq1uzwPL+OCrbavltz34xeLpHfApBhROoPPzNco4UIXPpycgbtH7j3xsJvPdZDcnCW1fN5Q4kDo
	GalaFxK3PqSNrVm65X/El0NDssExedmEHQNdQKjAKtgcLOSNVYZWkDnpPg75ydW+YmQOt
X-Gm-Gg: ASbGncuniHu2wab56Eutp67rEETVaOJqxCKF7hP7BtHLN44bL7BfyJ4gZ+tnMZmdnAr
	LVvwvzPVMCCHbwq4of0Hr+nmHa07/TtayDub33GEC388nL7Zb1XhQHSKtKw4ZAS2YNTwLTSVPR5
	zgjesprfcHpMjVceCXAiUbL7wtKrPj+X6SSZBOX50aBsGNS9XLmGFvhKkCn9mieLDM5LTDTh3On
	KzEA+uA3AN8snzvd5pXNz6V1Db4tF7onpOEEnlFdjffW6sxBbgnV0L8nIGqaOQGnE/jha3abwBT
	ba7KX/pF0utIlWrDT44me+15CfSUc+dDHA8ISztvUoWL6Sw9kbI/anan1j1535f0OOP429N7afb
	2EfNg0LOglFjLHhdCAFgsLCY9PE9qwZ5+MWlq5OIahZP/vDvVglLy
X-Received: by 2002:a05:622a:507:b0:4b3:78ac:150d with SMTP id d75a77b69052e-4da4b42ca52mr24480961cf.40.1758768257901;
        Wed, 24 Sep 2025 19:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs5aCsuoLqd0Av/XLCJxuIqTcBX9OxymgFOUfJmZ0G7j884g4RS2x98PoxZY2l5l+RhObr8A==
X-Received: by 2002:a05:622a:507:b0:4b3:78ac:150d with SMTP id d75a77b69052e-4da4b42ca52mr24480741cf.40.1758768257402;
        Wed, 24 Sep 2025 19:44:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583173d0fbfsm255849e87.144.2025.09.24.19.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:44:16 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:44:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
Message-ID: <23b56m4xjblk27rgpuu5pn5zecv25laoo2yijk7r7ns4kkvfh5@4s2ijgt4qq22>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d4ac82 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_kvchVDP8_-l7kQr3B0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IS7Txqlop39o_0xV6fvVKKSpS5dsHuR2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX+Jf9aWvvm07a
 RK7YB5dWMCj8kTEGVQqGm9otTwPv+wzf33cUGkHiFQmUW7EVmIRX8Kl3QIQ89MWVmar4vwkN2Jq
 FmgjkuXC+9TUjd4+yRLdKdBfcRtEYjWtIE2PygXveLIcA3hTuJTxaWrl9vsFWoQbg077dw0t6NU
 uIJwxAMMDh1548r9eu5R8RmnYXuwoAutxK28kF/RT6A6jlXGRnX2z4psGl+TPrMMUCENwDFqPzk
 kBFz9zNEuFeqc8H0w8XhVH+WJvwBK+/ODJlFrrNVPyIyvivT50F8KI6+Sgd3ZezRQzu2FegbUv1
 7FiSd26mE5t5yITXUQu3x4eurOrRp6fRW3NeFa6u01ZlLBV3vFuIRxmzQGYbAzAm7yoc06FEScm
 roUCmC/q
X-Proofpoint-GUID: IS7Txqlop39o_0xV6fvVKKSpS5dsHuR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Thu, Sep 25, 2025 at 04:44:46AM +0530, Vikash Garodia wrote:
> Add support for the kaanapali platform by re-using the SM8550
> definitions and using the vpu4 ops.
> Move the configurations that differs in a per-SoC platform
> header, that will contain SoC specific data.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 ++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 154 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8650_data;
>  extern struct iris_platform_data sm8750_data;
> +extern struct iris_platform_data kaanapali_data;

Please keep it sorted

>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..142b7d84ee00a9b65420158ac1f168515b56f4a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_kaanapali.h"

And this

>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1095,3 +1096,88 @@ struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +struct iris_platform_data kaanapali_data = {

Hopefully can also be sorted.

> +	.get_instance = iris_hfi_gen2_get_instance,
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ad82a62f8b923d818ffe77c131d7eb6da8c34002..9a0db65dbdb2eedf3974bcb8a2327e664b556ccd 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -370,6 +370,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8750-iris",
>  		.data = &sm8750_data,
>  	},
> +	{
> +		.compatible = "qcom,kaanapali-iris",
> +		.data = &kaanapali_data,
> +	},

And this one.

>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

