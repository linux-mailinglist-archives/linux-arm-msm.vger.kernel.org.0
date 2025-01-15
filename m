Return-Path: <linux-arm-msm+bounces-45059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71643A11662
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97DB73A1393
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD426AC3;
	Wed, 15 Jan 2025 01:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLMJ1esn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C61EEF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 01:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736903697; cv=none; b=AAcJUWIbI5Zp8tM3W5Aj8+ysY3gSfPsgJvJlbdEQ/E5KGA7BpAkVp6VvVrap24lInqJGdHxbI7V5LJXDcRmvTSbzLP8I6L/xclgGU/7mMxIAcJ5uFGXi0k7WkyhSWjJV+iNBeBdm+nuTl9uWe4ZSL8cgC0+7rWglTaVVQP5wkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736903697; c=relaxed/simple;
	bh=pawVzXSteU0JT81cpfRQYFedo2huwQ5s2qJvw6LlzPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ritNCFeEiazb8lqr48u2x8I53rpCagJPoN1FtMjXMRB9SYGCXgBTBtDhmBo5Q18KlVJRcMstNqMOfkyPQjgMMLvOidQX3snyVGlLj3Qf0saG9iYfg1uxVl70XP/2twkkqBKWtc8eyyJ2JD6P9AqIO8cWPcebKx1oSQY2JwPWITw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLMJ1esn; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a88ba968aso5032424f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 17:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736903693; x=1737508493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGK/Z4o3tfdpxvgsytLPbKxmGC+gbq1wlB8OOZocybQ=;
        b=mLMJ1esnJUTdbOM9aSz/QFyHESph3pTO29aaaTFoT7p15wDvAMX1iCRjKOjgzmyLkW
         I9x/7Jpk0LZaP7oSD1Z+kV4vlJzvu0kuixNqHXoHLNlabpH7BkrCIgrGblMRe/fWp9ml
         BkJFu9/adr7LOmMP1uLKV8684M5V44xMTWe85yCIOVGG+UJLFZd+6UzvGJK/VSeGY5TA
         zD4IKO/lMdb3nq/42ybM9+AOlRRPHvPN0nFQvFxVGa7+Lo6J+xuoRlg6EFkiFk5fQW+C
         Nm4S9ca9yXvj4XX60wS3/qgZFRjnEbIij/q50qWyYpMugcCxs47QNw0dzv1Gd5pKVxpQ
         p93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736903693; x=1737508493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGK/Z4o3tfdpxvgsytLPbKxmGC+gbq1wlB8OOZocybQ=;
        b=RyRjr5ZTmu8g3HTAqEcXPGcuu07ztwps4wyGaMNjL+RP37z6/Hbs96xCa0w05L8xdq
         /GQ9G0O6sCUAMoPt9NIiMRCROsw/5CojF8IPw6/hKzUwZRhJJnq0BkH3GMAz9zm2CGKi
         udpdttmlK4mzL6XcQgwZEXkZ4Lzs38xrjlye0wwrRlV2rz6hy/g2v++dL5Kp8Zs74aCA
         TRTKh99ZxK7UkU6xqHDQ+xDSQECCYPiAhAxdvLLkPKPNWHp8PXe0K6vruaGCiucy5Z2f
         5mClez4XamGBtqW8OHF0oaRJOhHyZEQIE7qPN7iAFgRnZzEj7sZNz5q6k9fTFe3D3vwJ
         nc2A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+wmOY8wKm7C1IMgtetAKQ/LexVMk6pVUeYXzlZatjwl6DAV1VMf43sZk0vNh6HusDf5+6p1afXLp0IA7@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLNsGP4BoHw6jaUk63aO49PEjkvGndVms06WqjXRVPfkNjDg3
	CS8EtPCD2gojiLev7L9RwER/NSUSl5If406fQOFRgRYF42Q82oTSA0ipwsVYDow=
X-Gm-Gg: ASbGncsfTxbgpZIfMAwLQ6Tf5jK+pyMv5LlOVYVLgFdutx9tTK4TPlNFwztCcHtpwEr
	vvFntO8C18FRj5pLGOsJYBsZKVRrz9RawxYFet91Ey8mjdCtA7u7Z8ovEk1HP6rNsuStvvEq0Uv
	U+unxXTYeZ2QrbRaJtm+eNqqoHulpT89vG704chs8IifzuS3NhVgz+DsOrsW9m0Ec4chJgtNHxt
	fHrEnBg3lU94krlzWr8BvHykBNytU1LLW60ohHLMH7RUNKPKGPQ2DoaXRvj/fMiIerJWg==
X-Google-Smtp-Source: AGHT+IEXoAV81f+3HP8QyUEzM/OxmpVpuxmUdPW23b5WTL2g0q1041pK3bQ54xZClbSrFQ2h28Su2w==
X-Received: by 2002:a05:6000:470d:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-38a87087028mr26649244f8f.0.1736903693486;
        Tue, 14 Jan 2025 17:14:53 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1e0bsm16001719f8f.100.2025.01.14.17.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 17:14:52 -0800 (PST)
Message-ID: <047abbdb-cbd3-4a33-9e18-d12d906ccaee@linaro.org>
Date: Wed, 15 Jan 2025 01:14:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] media: venus: vdec: Clamp parm smaller than 1fps
 and bigger than 240.
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250111-fix-cocci-v6-0-1aa7842006cc@chromium.org>
 <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250111-fix-cocci-v6-2-1aa7842006cc@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2025 09:55, Ricardo Ribalda wrote:
> The driver uses "whole" fps in all its calculations (e.g. in
> load_per_instance()). Those calculation expect an fps bigger than 1, and
> not big enough to overflow.
> 
> Clamp the value if the user provides a parm that will result in an invalid
> fps.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Closes: https://lore.kernel.org/linux-media/f11653a7-bc49-48cd-9cdb-1659147453e4@xs4all.nl/T/#m91cd962ac942834654f94c92206e2f85ff7d97f0
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/core.h | 2 ++
>   drivers/media/platform/qcom/venus/vdec.c | 5 ++---
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 44f1c3bc4186..afae2b9fdaf7 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -28,6 +28,8 @@
>   #define VIDC_RESETS_NUM_MAX		2
>   #define VIDC_MAX_HIER_CODING_LAYER 6
>   
> +#define VENUS_MAX_FPS			240
> +
>   extern int venus_fw_debug;
>   
>   struct freq_tbl {
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 98c22b9f9372..c1d5f94e16b4 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -481,11 +481,10 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	us_per_frame = timeperframe->numerator * (u64)USEC_PER_SEC;
>   	do_div(us_per_frame, timeperframe->denominator);
>   
> -	if (!us_per_frame)
> -		return -EINVAL;
> -
> +	us_per_frame = max(USEC_PER_SEC, us_per_frame);
>   	fps = (u64)USEC_PER_SEC;
>   	do_div(fps, us_per_frame);
> +	fps = min(VENUS_MAX_FPS, fps);
>   
>   	inst->fps = fps;
>   	inst->timeperframe = *timeperframe;
> 

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5615-rb5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

