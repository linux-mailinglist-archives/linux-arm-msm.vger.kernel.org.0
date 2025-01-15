Return-Path: <linux-arm-msm+bounces-45060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E0A1166B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7B5188A9C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C51BDC3;
	Wed, 15 Jan 2025 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xgVo55om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6199E2B9BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 01:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736903844; cv=none; b=Ddh5Ryx37JUHUTl97e6gK+6nLu+UExBgbms7aZKu2M8gH9sM0eev1BLwfHgyzJ56lpY9on+Er0gPqHOHfp9QX1intHb+MshE3g7W24INQpZOtnJLmTiRdbKvajViAUYKWFYrGDpyQ45BdoKpSj0q+fZapjlFDVFGnxYeUAWWiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736903844; c=relaxed/simple;
	bh=GTHQQFJXQu1CG26JlW0wcUFa40ANd922rkuoW6iWkYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/EOa9Pwur9kx5CliXEqw5UU8sgb4YoM7sE4qrr1eRZZ9velWZAkITY8IExVe4xGKDUy+EwdlUYa5eDpuG5TiWXHK4myiW8mqrFf2vl0Gguabb5SFEAPL2loN4NPi5HB+QoyxKmDixcxCElSyAn/Xmv5cU2hIijM/SQXp8QTsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xgVo55om; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso44025485e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 17:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736903841; x=1737508641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYhWQj4ojjdJzbMmg6mMySnIdWhmXaZB7FNcuEIdeH0=;
        b=xgVo55omz19VHR+6NsB7hefw4ctBeIb54yyM/5on+gwJJOmRJO2ZPV3zg3z6jAEUdc
         VUqaEy54MlBxqNMeh7Xdez4xi213ggSEcxGhsv38FauL38N/bvUMAjx10L67vog3jyOo
         ipWdtw4Il/HSKTPfiT26r+M+mI1Ah/+IOCdVupSumC4hTy0c6eQ2yD/t15u5B3lMDifC
         Oriz1pV1CZOV4zXpyVlXw0Pjj/r9q9QTM9739zmLGtMgrHPcsl52JzlSxgbwivyB2qXJ
         ycV3uFPmJLmmFxndGqrWUTDWrw6zD0ISL9r6vrALGqtEOG7YjA5J+R/086MYBVQ64JwU
         NCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736903841; x=1737508641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYhWQj4ojjdJzbMmg6mMySnIdWhmXaZB7FNcuEIdeH0=;
        b=pxRsLJnWPY5dnu6XHwiPiiTI7bh54YrFAF3FqSCoFYfTtVUi9BSu1aC22X29Y31Qm8
         xwBHDQSo3L0yOemkHP+CCyV3V6AsyZ8Rf/o9veaf8qC6Dx8udHfpFGFCGueqsGuMco8L
         q3tKy4mSrOMiH5ZeS+dDFBN1hju89+lnnk+ACxm4UFvuRaXxsYn0OxiPFixTvoUDE49Q
         PAX8bLWLAqtBe4RfpV4Zy6mKJs+ZWDvuudapYhmYknhuoR/E7v5uvfcZqCz1T/Y7tjza
         jknRjnY/TFh0oXVb3IoCc8c/b6Uy0P+cHbiTu+9waiq6wtRL7e+v4vNksulgGWz1eRvm
         QW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3I6C4KIQ/hB4KfytpTQEkyUcVOlp7N2tPyKcVMbTdOJBH9rYpcD4Jx241vxyn4LH2wx9d5elz2okvEmu3@vger.kernel.org
X-Gm-Message-State: AOJu0YwikA8Kbhl915PCdeDgRbK10ClrwP89w6cpntJHH0h/asHK5G4t
	G7pJ/bE3wqgdbBM9oSM/t0WzQuQTTYc25EdAAh2IiX+trqGaK7UQq1lvynt2lzM=
X-Gm-Gg: ASbGncvI53OLtlo16ecnxzDdL0VthIqxV8Qgbb+9LNHEZn4tqgHYbHecZc74VU6wcXM
	6UnSsGurr3lrG1vZZREcEqjYlg41WWcWt7KdKI+izxW+GSdCLtb6uu0fK//fkXEHMzk60crMVE2
	Lu3HOEPl0D5moAwS3Ok3iXKOuYs3qCAu7zJKWc0u497Ix+CLs4+sm0MNv5q97PujqA201ggQJj0
	6rkjiyddbyZTFLTKlD6p6FIlrnwoKqWAzHoUYiEGCODiLVlgadiW7jMtOmV/emmKwxJLg==
X-Google-Smtp-Source: AGHT+IGnaNr/+mB36vB8scdAb6zytw+YYCxL2h9EazlDijzabttMubxcv8HGRYtwJ0DaPUQkf+HZVg==
X-Received: by 2002:a05:600c:a41:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-436e269a9e5mr278706015e9.10.1736903840774;
        Tue, 14 Jan 2025 17:17:20 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm16005256f8f.80.2025.01.14.17.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 17:17:19 -0800 (PST)
Message-ID: <d8e8f119-4c9c-472f-a4af-59861fe4f2d2@linaro.org>
Date: Wed, 15 Jan 2025 01:17:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-6-1aa7842006cc@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250111-fix-cocci-v6-6-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2025 09:55, Ricardo Ribalda wrote:
> Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
> There is no need to do a 64 bit division here.
> Also, the driver only works with whole fps.
> 
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index e160a5508154..aa9ba38186b8 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -484,8 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	do_div(us_per_frame, timeperframe->denominator);
>   
>   	us_per_frame = max(USEC_PER_SEC, us_per_frame);
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	fps = USEC_PER_SEC / (u32)us_per_frame;
>   	fps = min(VENUS_MAX_FPS, fps);
>   
>   	inst->fps = fps;
> 

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

