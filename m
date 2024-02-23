Return-Path: <linux-arm-msm+bounces-12409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78C9861E24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC3728480E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 20:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8BD146E96;
	Fri, 23 Feb 2024 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mYzE7YdM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFB26291
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 20:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721318; cv=none; b=UcLl9v6CJieExJeY6ncNb/RASG39S0cQfmgyFPta/tIwGvuxyMcEzxPTDRlS6xIkHySqOZPpBjUnDYb6HM4E+LyQMjSVRvr2UpnxXNMAV5Ib9iw0WMnPVctirM/Q1PDNgFYHTn02urdZWmO1MdZ9MT/gjVkqbPRjgJwazZj56Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721318; c=relaxed/simple;
	bh=vc3YRuc0l2ZwcabvQrBANHDD1IEPDEuwsXagbWuektg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rAdA2k4t+Ngo1DRhgb2+ybim5KkXm8Bp5QDddwYTLNp70hl8BweAqxz+DPAC/A/sVZepxUTucjcZBowi1/oV6FifB6s84atgMSIabNvHLixKtC8anZ6lAfpzZGdNocz/38Dwum1NvqEeprfYl4ioaiBOJx7vrpnMjx+T1mLmsjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mYzE7YdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41NKY1A7008914;
	Fri, 23 Feb 2024 20:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=LKWrf34v8r33/LmQhsxTJharZCGDQP5OGXVFHqA25I4=; b=mY
	zE7YdMLtvGjHI+ZRrE4bqJcyFBHGG7SXFaj7MZsf0bAIosGIGfUW8jL2N2S2D8l0
	WzRxGubTCRF6zGxZpIQrqv5Vb9z0LQj0KK5NBVpHKWgrJcmVzlN1pkthygEwAf6h
	pcewG55dJGgB7r1ITYaDlkXID5n7tRgdVY2w2zotqnINkoFtAdvvNZIvPzsno9RQ
	lEKp+2Rn/GmEGEnfevdiLYMbbhbHd50Q4SEkoS/6w3CdwSnBlKiKQJ/kdQsb6CJq
	tLkpKtl/JvFsusvi72HZzi0FRb6HJ+XOtM4EO9kNfh6zTFH0no1mb7lKR2uOXXTd
	TaeTDBo5D7GbQyzKVuPg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3weq6x9nm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 20:48:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41NKmRrc020334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 20:48:27 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 12:48:26 -0800
Message-ID: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
Date: Fri, 23 Feb 2024 12:48:25 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S2pdWKJC23btV_09glpIOFEQDiI7l5oH
X-Proofpoint-ORIG-GUID: S2pdWKJC23btV_09glpIOFEQDiI7l5oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-23_06,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230152



On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> Extend it to also support 4:2:2 and 4:4:4 plat formats.
> 

I checked myself and also internally on this. On sm8250, the DPU planes 
do not support YUV444 and YUV422 (and the corresponding YVU formats).

May I know what was the reference to add these formats to DPU 
considering that even downstream sources didn't add them?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> correct way to handle it, so I'm sending this as an RFC. If we agree
> that bumping the .clk_inefficiency_factor is a correct way, I'll send
> v2, including catalog changes.
> 
> I had no such issues for the YV16/YU16 formats.

We don't support this too on sm8250. But interesting it worked.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 24 ++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index e366ab134249..1b763cd95e5a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -475,6 +475,30 @@ static const struct dpu_format dpu_format_map[] = {
>   		C1_B_Cb, C2_R_Cr, C0_G_Y,
>   		false, DPU_CHROMA_420, 1, DPU_FORMAT_FLAG_YUV,
>   		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YUV422,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C2_R_Cr, C1_B_Cb, C0_G_Y,
> +		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YVU422,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C1_B_Cb, C2_R_Cr, C0_G_Y,
> +		false, DPU_CHROMA_H2V1, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YUV444,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C2_R_Cr, C1_B_Cb, C0_G_Y,
> +		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
> +
> +	PLANAR_YUV_FMT(YVU444,
> +		0, COLOR_8BIT, COLOR_8BIT, COLOR_8BIT,
> +		C1_B_Cb, C2_R_Cr, C0_G_Y,
> +		false, DPU_CHROMA_RGB, 1, DPU_FORMAT_FLAG_YUV,
> +		DPU_FETCH_LINEAR, 3),
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ccbee0f40ad7..949c86a44ec7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -195,6 +195,10 @@ static const uint32_t plane_formats_yuv[] = {
>   	DRM_FORMAT_YVYU,
>   	DRM_FORMAT_YUV420,
>   	DRM_FORMAT_YVU420,
> +	DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YVU422,
> +	DRM_FORMAT_YUV444,
> +	DRM_FORMAT_YVU444,
>   };
>   
>   static const u32 rotation_v2_formats[] = {
> 
> ---
> base-commit: ffa0c87f172bf7a0132aa960db412f8d63b2f533
> change-id: 20240222-fd-dpu-yv16-yv24-6bf152dfa7f3
> 
> Best regards,

