Return-Path: <linux-arm-msm+bounces-89649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A279D3A8B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F0EE302F819
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FC730FF1D;
	Mon, 19 Jan 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G568nbUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrZeDa+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D7314D26
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825508; cv=none; b=iWEhre33Ayn677+WGp6YUnGHxPhgbob3hPwtZx91VPIkeSPI77Mc71KyNEzKjWaBcA+z4AABrPBqss9YBpSMP5ftMoviVNWl+ixifa9RqqWl3vyVyVTStkZ0TH4mDXHylvj9CGVFoBPLVmkfRtKkpp7zWOe41InXr206xbqAJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825508; c=relaxed/simple;
	bh=1mpdSpB42HOH+CED4/BNQ3DTpRvK+xQjYmsHPbum8OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TM6F/BCLHFSkJDy5WNlF2NKcCR7tfhm0PrE/QVnWMk/j9G02N+iV+I5MtBLgpeFQprl394S1gbUBPFCd/eNV025aNLISoSLYrq5UnRHG/ewbD75fClCsYyo/k33VjFdCu451LETKv7TMmHEp/9um4rM6HFgrgodt83RTqRpnL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G568nbUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrZeDa+c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9n8Fk2965504
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=; b=G568nbUz3mTLaxzL
	fvKXILX8yDmVLj8GAkG5rA7IscY1QEbXGXjd1uwfjOmcL15avGUcK4nUVAaDo0ye
	WAQNUwdXnjylWQtjLotCVPuFYtuVFmMv8faSuH1YnILIhSGUmdzU1DI4PK+bxtm0
	Cz/Ioqya8TnrEMgbmHu1pK4L1S1C0mxC8YmjZVNl6uTyzkjO6k/Lc2OEAT72bwIo
	fDJBbkJv1pRIqJfxVDTQYM9Qxi0VD4SwaU/pdvxbEvMBIBNw0ys0BmMKSxFbdwVU
	7Nwek3Cc74F3hxYMBF71nlq4pIRHxMYHefPnnnd3gth3yZk94miW0FUAZCbJIJTV
	HjFJrg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8es6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:25:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88887682068so15346506d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768825502; x=1769430302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
        b=MrZeDa+cf0soY7ZJ4Eb+Ue8SF7yAaacWqocRIGvZ9CgciLdnXUMKzuof+EPlucUiPd
         ibA4cfM6Y8aYZFRMJQ6x3gqmFys/U4edkPjLcV/+DrHlbU+NKfMfVnC1LikoG1ysQ3Vk
         wNWzf7vhlUL3CSSUg7fDEv5to8jZDvtJIzzjDxMtyqDKFdOBAU2dB7/E9gBsOaH8n+ww
         N8RtoC1UQNs8ZCgyADTD8NmvpMonio1NkzKMylt5iO/OehzdHGAtGWv1STb0VloCWYYV
         dNRJSERSOxWBa+DHIEYPbWnb8aszp4xj/MRAhR89sNIuXlLzAO3wZk9A/CbC6wHBGdn6
         DtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825502; x=1769430302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS4+y5Ixt5ikr4pYFKf10f+qp8yuyDl61gKWxxUFT6k=;
        b=UrUVYIpbpRbSih4w1kPtbvo+GDq2I9D40reS+Q3CxNtL9e9haRgE91vmFHpbS9YK3j
         DVQU57hBtzcnkk1vEIMKLiUBuIBtp53zKpnpejGf06Py5OINXPzQNM78CZnYgtim1LDB
         nc3/c2yXhjurAsWDgcLxHHE849GeHbSJzyvaAKsh8YUFZSz5bauMGuHc0d5XWmJ/0npK
         yTBJdzqtHswL5zkotxxhekBS9ByChHCHWPJ26Bvq7Hro0AYVNsuoe99tuVRzx7TUXxtz
         W/kgnAqQTp+ZwBonfkTB5+1NUP1cINo3Fjz9/JkN2bxmlejzihzR9J8kBqfQ0ThZY2rr
         tDEA==
X-Gm-Message-State: AOJu0YxWBuQQs+ng8yvUoFSc6VDF0iCrgZfr2/m3jhPVRg44rgLktohB
	Idcb0q5AZ7lq9sYkf5D2MRZ+R0Z48DYhQt1H/Y4xkMuRoCMFQTJOkkr6JpYtLmGNXM4QXUpGJtq
	hN3vjFhNIocEncBa3jZ1UfneIbzHQusMjXy/BnafIFa8rnttRKoDr3Sz8FTSvgiXiM3P9S3RHHY
	5J
X-Gm-Gg: AY/fxX6o3jLPtTdQqEokJ9ShgDWJE/WGTjdITq1EQnK2FzjeCrN5t2WoipiQai2R0yI
	WtMnZGRVtn2RKaClnjY9bHpxod24x71rJBt5AenZP8YYlJjjsTEZFF8gwxGNtzNG5vcBvqp/lEG
	rS6Wc57w6hbtMMdn5keLw+SGud3yikBzIvz40qROBjOYRX9uhkwQ11rYyUotgpOkGwm9N+0xVAM
	PTG6OHsCtczcP49gVqxCwKiU3rVr6uhx8qlJevynt25gUM7du0Zy2+mlGW7UyJDsa20LIViBJM2
	vBuJzKeyCruOv0oNozyE3glCLF4azRC7/SFIJQ7zrJ6kA3KAWDEQFqBfU+FUp5uphGe5zVXfcvs
	oNIElZYOsegW9+7R71mWqlY2AlUpX8icfzRTr8uFa6S0Ls/iDghyMigTJOiaCWlzt8AM=
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c6a67cb0bbmr1154159085a.10.1768825501856;
        Mon, 19 Jan 2026 04:25:01 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8b2:ec2f:cb3d with SMTP id af79cd13be357-8c6a67cb0bbmr1154156385a.10.1768825501296;
        Mon, 19 Jan 2026 04:25:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm1114310366b.38.2026.01.19.04.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 04:25:00 -0800 (PST)
Message-ID: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 13:24:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
 on UBWC 5.x+
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwMiBTYWx0ZWRfX3E4Y7TmiiRZL
 QLKTcYcGQz12iO6sEcIn/zJSSMTjzcfQH/CUpywjagDHZex3GrVMYCqkOff7CX+NqivGX3Ba7Mr
 sZ0nzp1wWQwEK5Au/FJY9UrAkuyslD1t1pu22rNRvgVcCNFLBJtVXw4mliZTX//G/ZLd8/Jspl4
 E0FoiZTcOpeRL1G0Nxsi8FKfCEnPvqWWmR8/P6D7C3BBkJZeG9PJjxwRCz/eE2RF/syrToRdfZs
 HGkymN7WWMsQaFHXJLhR1+b7+XIqvsDcOndkn3E6djxEUu/Virj2pck3ig3VeQtnNx3SMq9wNpK
 xl0nHvXWAfQK7lmA/g7UtPpMwlVVa7dqJbpvnIIePUJjKbxlVOPM/lbQMm4nZ7a8JTmc4wHuC0d
 LSZSy61wvfitvWz5PHZ/zhF1GcU2V9y5CHmKNnDPb6Cuy+SwW04PM4HTHosxPxFA/yCVmrUeBZ2
 1JnGLbHHr5xANyIprCg==
X-Proofpoint-ORIG-GUID: Zx7M3SZCSUYy7oJGfvDGp9XK1P94b9lB
X-Proofpoint-GUID: Zx7M3SZCSUYy7oJGfvDGp9XK1P94b9lB
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e229f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s51bjNJNeX3feSWTtREA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190102

On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
> 
> Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_2_0:
> +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				BIT(8) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_3_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_4_0:
> -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> -			break;
> +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);

This is pre-existing, but BIT(30) is not unconditional in SDE for v3

For this patch

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


