Return-Path: <linux-arm-msm+bounces-89619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50191D3A653
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F02FF3033BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6893590DD;
	Mon, 19 Jan 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIG1/21O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cd/k+TKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16273596ED
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820894; cv=none; b=WPXegJN7azBmIyWaqkwVmYCnKBXFzZIdKFFlC1mXrT0aIkLql8ZeT7fY+NeEYO3eoLlkW6yGW0beKHj+kZWwrb3QxONmmFL0MIV41yIO6tplO0GqEAN/I9/YzAQp2LApUcbmCOTaWffk2lRffmHMYzAmuBXblT5JQgTqdwxV5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820894; c=relaxed/simple;
	bh=WJNfcQPZcH0paaqEfgjhplDPVW7YSDQPxYQx8dqM09U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gEtBtilwUtfwGEU8m/LUi8B9KbRL9jhnrK1aex5xOS7OXw1o1ws2vVkop2SYqjClxYPYYbVw38suO0uvj/j3OuMjn8N0R3ioVUViG3+tA0g9nYfsKQSb2b3EM7B/2QhKWa0KDr03+Ve00XaOLWP7s4i6zQfC7XLMKbPRlQmTHGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIG1/21O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cd/k+TKg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91LJP748470
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=; b=aIG1/21OQDOyiHix
	78VEX7SrggziNpb98bxSAFpUWIhY+2/S1LNuq15NmNtgHOReqQa0PE55ijZHrrNQ
	w52YiSAHw5mAL3FToNBA3WamGWdbbIgfTZEyfVFmijfXbpDZTaXFKPZdcSCHftiN
	UrXUl14ZMaIVaH94hNstYliW4BSxR67weOMiyQkChyxH1S1FZq8GtVYMiSN/9fTX
	UvdAL2o2wUXmhTtPV2bMJt9fHZwK3FUo5S6tuJC+zydEvZ1bSSNSUWIVCvWBqCnB
	5YJBjtfE4gt7qXgG2GgcQkaUaqR67THCpT3Iic4qeV+ZRl2VBv2E4oznLPG78nvP
	3PWtjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74t70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:08:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014549e7d6so15912951cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768820891; x=1769425691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=;
        b=cd/k+TKgK4PGnvRj0KVp+QXR4hVc3y1Bh345z1WoI4ZEOlVHvOZHnwMqbfGyF7Tmox
         +RisJtBchXkAlHmC2EaJKcoOneu4C4azspCLKcmHTAuZceVUa7IYO9HcWtRktxNGzGlX
         Yw7jbTSxWJsU+udIJfX6qx5CBEqqhGSJv+FzhE+PuZ5SBtKYBmwYP0E9g1VMeHKBDcli
         Hf0WsyrcgKsxdgrr8PxiSz0D4e5AirjTB0XnBYJHs6TNqf2FYs5O7Rl6yMGj8IUWWWZa
         oZoHHuDL93fVWw2hOSHxDmaoo9nWGXBoFJwSJm5hHDRd5gKyWEf06BKjC+PfGMM4PYKr
         M7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768820891; x=1769425691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tky/0tzFXXgd+VBA9iRUinx9WsYhxcSfTbVi/+M0TDU=;
        b=rp4/SS7rAeu44LambHeIuHbQDzFBwRfc0Sb6ooUyRcRPqlwvWPsrogYjQXjweSAOFu
         QOUjQ760aIutB8whbiFlUY+SlEIrZnZ9Jaa8sEmt0+UYPmw2yOhXycdwnOb3JEHPoyFu
         2yau62JhfuOD8/voix2rcWhX/mfRK1CU7xQnAWY3DtnMsaYB85d8f9rCa9PWiHffAJZX
         UuzceuJibiFBlIrb7aJE13IHV+7mlhSkYFPq9eTw7Vjse0ObNvdmlAHCQQLozAGwK/iL
         yeQs00jC/AEmVQ4QRt33tubRsCpNp8VPRJRKpmMJctjbktzoX10l9sHecOeN4QDCGZHn
         5gzA==
X-Gm-Message-State: AOJu0YxPYV93zildzCay17DR1KI7M8KTeE7J8GpFdI+5VppG/0mULYCV
	hGnNeIf4ghe/V4BZuR5pfBhgPtl+nGSOA7rHYBBE1V9XqSv2KrhTzA4q2IcA3y++oOpmI6C1I+k
	hSG5rNAYhAh59GAMZJayZh1acrgMAoeZyrEHa7amLhfx4PEg3Sl7jpwtUx161qQZTPBER
X-Gm-Gg: AY/fxX7mSxLUJQoKbgxHOEv05GoNA6GvnuzQrbywUJi1otTp+0JRIgABQeB9Ay6sLLN
	uMt2KztDc14krHAxqbkzdAh2l5raMcUhGY7TDrEIrX7YZggXZg8mLAoKOv5wqfLiC8pb2m1oHex
	V1uXMz9QpojMIFcIIZnp6vrB3QmuuMxnc16MSt3+0pBc0LbIDKcZLPzOn4eJ546wiAd1Ny5ax/f
	9PEIPHe40FBnLh/95set2i8SWgtPAEK/KXXVWVPaZoU3dQBTU4fiq6U6whYcgPw3kaczrAOMKPN
	3335RgE7JZAVPkTdNSDCl5Wz205kGpaIW2J7ri4Yac3j8q8vw9JTj+LLhGsiSkFUkCw7KhMhef2
	JY4W5jpK5Pj1qC/w1XMbvkq2HXm943iL9mgrPzTmJMTOxooIaeXzN6chwIDbSgVM8NPY=
X-Received: by 2002:ac8:7fc3:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-502a1735f4fmr129192611cf.11.1768820891016;
        Mon, 19 Jan 2026 03:08:11 -0800 (PST)
X-Received: by 2002:ac8:7fc3:0:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-502a1735f4fmr129192301cf.11.1768820890519;
        Mon, 19 Jan 2026 03:08:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452bce876sm10108927a12.5.2026.01.19.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:08:10 -0800 (PST)
Message-ID: <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 12:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming
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
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e109b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XeJQKAmXQAzf4d-CZB0A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: aqAmEMimPb0AzCtr8SUYkxO1OZ7-SLLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5MiBTYWx0ZWRfXxAjV7mbCvUaq
 4Sm/i1sNNnPBEe2YaNBlA8MU78nvl5MELN0bT9ONw9pmTqoaDP/XKxzC1MRqj94PzCxft+7OOv+
 pzYy3iEXl3oFl6rSbQo/MIBiAtsVDYYquPRhfJjuuEgNaZ+kFVRz8pXlO7NhjvGOPh5y4hog13j
 OmDJmUDEDdIlNJfiULd8xpC/8C9wDCo+5+HOyFbatF+PTzp+f+kiF40eOybuQotCdhrhy8b6uFy
 kDUdHkVEuW0v17sppvulRdq2eMt2LmFpNzawok2WyMJMtJAhcYGjFYTadDCUqgNfYlSM9whU/wx
 J8f8ighAY79EKF1SDwyOjJ9+ddL5hM/6wsFV/Lc1AZylUiT97O+ihMQ0vjCj4amWK+FHxtwN+kL
 CNZGAchUxj5PqDeQPfsVtVpzVuEN8m5FEJdGWnpNW8WVkJ8gNu2sXD916G7iihmEV2IWVapbxI2
 KSKLNHG1t4m0AO5rB6w==
X-Proofpoint-GUID: aqAmEMimPb0AzCtr8SUYkxO1OZ7-SLLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190092

On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> than 4.0. Replace switch-case with if-else checks, making sure that the
> register is initialized on UBWC 5.x (and later) hosts.
> 
> Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index a99e33230514..80a9fb76b139 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  
>  	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
>  		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
> +		u32 ctrl_val;
>  
>  		if (MSM_FORMAT_IS_UBWC(fmt))
>  			opmode |= MDSS_MDP_OP_BWC_EN;
> @@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
>  		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>  			DPU_FETCH_CONFIG_RESET_VALUE |
>  			hbb << 18);
> -		switch (ctx->ubwc->ubwc_enc_version) {
> -		case UBWC_1_0:
> +
> +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> -					BIT(8) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_2_0:
> +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> +				BIT(8) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
>  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_3_0:
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> -					(hbb << 4));
> -			break;
> -		case UBWC_4_0:
> -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> -			break;
> +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
> +			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
> +		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
> +			if (MSM_FORMAT_IS_YUV(fmt))
> +				ctrl_val = 0;
> +			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
> +				ctrl_val = BIT(30);
> +			else
> +				ctrl_val = BIT(30) | BIT(31);

Can we name these magic bits?

There's 2 more bitfields that I see downstream sets here (but it
doesn't claim to support UBWC6).. 

Konrad

