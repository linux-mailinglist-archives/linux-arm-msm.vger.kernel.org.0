Return-Path: <linux-arm-msm+bounces-56500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9BAA7292
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985BC1899D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBB624677A;
	Fri,  2 May 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHKi5deO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8223C516
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190255; cv=none; b=fSEuA3HNUgq352f5d8SGni5FRtKll2qw/NvmSEgTVKDDDxLf2BtDsOPmgxmk4Zn5SoZFQ1xZyRaYLdbN9wF+RIon4eOZCtNnqnVUtHWukrfXtn1oJZSTsgt7XtHEJq3tYUeLEOul1RAESv3DnNhznPLuukJTy7mz9sYIR8MgBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190255; c=relaxed/simple;
	bh=I6QAVRToiFrvXi4WBLFZ0QTX2zbLl6IKDM8t8exjEX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFOlk4kDWkeRnHmlKcY3ReUhoxx+M/SEBMOqZfVGJxUYFH5Au9WacLUWZoufXYfkLcaVIar8/GVLPN7tmFx9mhwm2dKWfEhVNn2Cm5CIJKo72q7KBD4ul6akkyaZ30QSIu1cA58daWth/wv1S/MzvuXFkKJGNyh7A+veimTol+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHKi5deO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1395165f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746190252; x=1746795052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=cHKi5deOJ293bf3CRIphFNNfccXuVpGeTQkweNbYsuGDGPRmyAAqXcSf5TKyhYbBxM
         B6uqGFVseCZrUIpOcXA6AV5eqC/TPGFipFGqvTsnIhQLbiOdj7CBFbETeiQQ2mSLXotS
         M+46dYNWyhaOiiV9Htsi/iJNJWUVK4XLrHuEr9mUrslroilTvHcIe5Rmd/SARHlCKZQg
         T7AvoB5qPsb3scm1XUwFntqLFeBFknb2WhhfhT9liYd9nrknsSIPF6NcxWgOOFwrrifk
         eI2M5D4cP40H9elbFCMdMXJ3J1cp3WMdeEljoW5SX20hKkz6EOafP8sbBiDw8m/04POJ
         Ukxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190252; x=1746795052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OVMDO5iVYdVsAgbbPuYJnfbdpZGyS2sQg1xq2ZTg1LA=;
        b=SP0QcpIMbN/oSq0j46et1wBu1GVfbVycNiRP8MRlbeigLGvb5djB2BRJFg71A4K0qe
         woE8nKsZvDzQYRgj4Jqp6XWCWY7jyFrJXK7GpzYOrA7Dt/S4FK7T5gXSSMz2rb1ef+C+
         1TpWqr8J0Rmyr0OiNS9/W325E4gwBx/Ku8/G+hrXJCmRH1HIw1tPaZMiW4WZSGCVtTfb
         7I0ujmrgRhb5SJaQU2kvv2SI+zegHq03n5XlNJmKRabG+psrLx0Q9eWVV0O/fzejqCRF
         EjYhEPvM7QzZ5lClm1w1LoFf7HkBfqjetcx0qjTESEgEIfmwNQKaAY9QiMExTDF0VVO/
         48XA==
X-Forwarded-Encrypted: i=1; AJvYcCX2TaM8ntPFXVgFlzISZ1/hnTO32IuUJDC56t87SaUEfRvNPjCgzTz92ij9c8c3X0N04Ay/Erv2iQ9TQe/E@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8ZvzJxHDtDY4AceGQLyHOh/xH4vQ3pPSrumGvpLGhV+ONfB0
	rspnElr0bJXZv3p4AltSByLO7h/77ZO6j/sX9mdedsoluuN7/0eyTXGeEGkvv10=
X-Gm-Gg: ASbGncuCeLfTgoZ7I9tsbBFpVH3ZrgnhcuaKePRl7/+xuguQafvZ7er+cdAH5Fla+ST
	TaEGyY3UhJ2+1T8SGffQYzwezlVN+zUhytYiHtET5h2cftr2ToT9EGzUtD2LeJbJtM9Uvh1gDdq
	rhdO701K+MA7dMHXz44hhruhfAllqxG/HZuwduUD1rYmkGs1pNffQc/aeBxuKkhVAEH0rh2XRJk
	G0spMy1ysDoRiGsOnjIVyrokhZXhcgFSAYK6iNqFANkGAxQbBc/QOpJszwdqup782MVb3vwPtZ0
	f1caUlBdpGont0HG1sWrfgNPoSg/pVrkWs1UGfsaLgxLvTJeLfaAprWkdEfcc2SrItpAwFZjUws
	JcGJf3lHeSwK528le
X-Google-Smtp-Source: AGHT+IEpWxj8o8pcRmbEsdS/lBTeH4fuOpeC4FeLOdr9sgL5/27OXW/XpA743y7zHGnyxTK8bCoWtA==
X-Received: by 2002:a05:6000:186b:b0:3a0:90bf:b9b with SMTP id ffacd0b85a97d-3a099ad40dcmr1861666f8f.8.1746190252191;
        Fri, 02 May 2025 05:50:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb54sm88637035e9.10.2025.05.02.05.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:50:51 -0700 (PDT)
Message-ID: <6bd73ae8-28eb-42da-b916-fadc114e2fd4@linaro.org>
Date: Fri, 2 May 2025 13:50:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/23] media: iris: Add handling for no show frames
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-14-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware sends the picture type as NO_SHOW for frames which are not
> supposed to be displayed, add handling for the same in driver to drop
> them.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h  | 1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 806f8bb7f505..666061a612c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -113,6 +113,7 @@ enum hfi_picture_type {
>   	HFI_PICTURE_I				= 0x00000008,
>   	HFI_PICTURE_CRA				= 0x00000010,
>   	HFI_PICTURE_BLA				= 0x00000020,
> +	HFI_PICTURE_NOSHOW			= 0x00000040,
>   };
>   
>   enum hfi_buffer_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 3bb326843a7b..2267e220c9ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -91,7 +91,9 @@ static int iris_hfi_gen2_get_driver_buffer_flags(struct iris_inst *inst, u32 hfi
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 driver_flags = 0;
>   
> -	if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
> +	if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_NOSHOW)
> +		driver_flags |= V4L2_BUF_FLAG_ERROR;
> +	else if (inst_hfi_gen2->hfi_frame_info.picture_type & keyframe)
>   		driver_flags |= V4L2_BUF_FLAG_KEYFRAME;
>   	else if (inst_hfi_gen2->hfi_frame_info.picture_type & HFI_PICTURE_P)
>   		driver_flags |= V4L2_BUF_FLAG_PFRAME;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

