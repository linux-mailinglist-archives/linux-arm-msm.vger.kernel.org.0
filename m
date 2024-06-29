Return-Path: <linux-arm-msm+bounces-24722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BE91CCF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DEC0281F43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1998577107;
	Sat, 29 Jun 2024 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DwJbLFX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24429CFB
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666388; cv=none; b=eZJ86iFOIfTEIi0I3xzsStSmR+JBXVMggKhqM6a2GD3yTqJR42WEgVTbbrxuynvE7flmbVIjKD6VSSLj3xV3lLvC0NAfwCX5ekBqBWDcINwoddxyAX6s7rPDjNmBA36MrFZnA9kdmcg60z/dKJKfzF7iQEKp6NrIlP9l/s6uFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666388; c=relaxed/simple;
	bh=3sQu6VgKwaUYSzy8TAMralAAs3hKUrdK/sql8c/CXDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtHvbcMb2kBmDFrG2eWbu7F4Cf2/iGNzBJo1TMhL2SSgQ9UGdjstOisisq+B3PorM0mv1LyVAEiBmUkVUaf8gKXc7OInwPjUgQnfq78lyJv7O34B7kvgExTrsakLe8Ez8sk4eIPu9ArnqgX9t0KObVsO+oxY7B12d+E41+IPX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DwJbLFX5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6fe7a0cb58so76869066b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666385; x=1720271185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=juC1pM14yL20MLPpp7yOCptiRFFzbh2VvWT0XwnjgzQ=;
        b=DwJbLFX5Izk6qmezPi24uJ52ivYsHc59WA9XD3CiDt2H6dlXiDOiGrf7JFaEbjpeM0
         uG52+m+Pc/vR+fdfh7Zwv5pAHdobiY4WUkI19rc6I0E2XaW4uIhTv+2DCieGqIALNq25
         HfEors1yn5rgBYZ0ALol89G63oNpWz2SeZyYAaEIk4aJU0Ty1dW9BrPOCCFcJYQ74wrt
         abuEflUNjTssOosO+MY/cN4nqSQL0yXfI1sQfmfhkbS1B6jfBTf8uEIWRnJywAmzpULI
         3Pq8RLU3REuxTb/cdwMjHmQNCa+oRWc8jpO9LTsiiO7xKyfp02X/Ud9ztZezZVnwB+NC
         bPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666385; x=1720271185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juC1pM14yL20MLPpp7yOCptiRFFzbh2VvWT0XwnjgzQ=;
        b=eag++8oYGCePuSzFuUhoi0LAgTyOadgxk19bLANlGas8LFT2J8PVmYyWrXyGeqxtHc
         cakaIhL5KsQK3Ud/0/7LghIov7ttRGtGLCbN29+viGcNW/zUVjwv3IqFOaVtQL1aaHK/
         u/D0TWo8Q+pn0KwI6Mwh4uy2KG+KQspVEeHCB9r5d4Er2z6PRE9TtSd1r7oUBfDltVV5
         xbRMucLW7s02XuFGOOJ1bsYth6FwqHNUeEW7QJUVE04jGdSVr8XOwn1Gtj8XbjvBau3Y
         5vhjk9pXVOrIS1425vcFkOGOcC1iQ+wk4258+7d4IXYKb8u8Ig8ScZpBCWNeEI0MOAe4
         G5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVfaVgqfh3H3yQMWL0tsyeBYGdKCI0fWegHsxTRSoS3XluE7oesLlhZKRLqtpHe6YM6Giib7sWrk3XRMsXxm0P1eKk3dgbSZHv2bm4k4w==
X-Gm-Message-State: AOJu0YyYo0JOo/fh3FE9HvZtWhEzQvRlr9SgX2BKtlp1EoOjHRzbjOSi
	mWLUogpNAo9kTJqKDncIHQ8hQCzvhJy8PmlUjKLomM6EBjJQs+RiCB6YrA1GN1y9t1XyhLkpFyh
	k
X-Google-Smtp-Source: AGHT+IEDzqRR+FH5vNtJR2qnyBY924I53APu79r66rf52OA5SrMOBR4anPJDv02DF2PO5wvUOKnBOA==
X-Received: by 2002:aa7:c986:0:b0:57d:3b8:85e6 with SMTP id 4fb4d7f45d1cf-587a0decd81mr791789a12.39.1719666384502;
        Sat, 29 Jun 2024 06:06:24 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d74dsm2209586a12.90.2024.06.29.06.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:06:24 -0700 (PDT)
Message-ID: <243c0432-a681-4932-957b-e80f2f4ef295@linaro.org>
Date: Sat, 29 Jun 2024 15:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/msm/adreno: Introduce gmu_chipid for a740 &
 a750
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
 <20240629015111.264564-4-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240629015111.264564-4-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.06.2024 3:49 AM, Akhil P Oommen wrote:
> To simplify, introduce the new gmu_chipid for a740 & a750 GPUs.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

This gets rid of getting patchid from dts, but I suppose that's fine,
as we can just add a new entry to the id table

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -771,7 +771,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
>  	u32 fence_range_lower, fence_range_upper;
> -	u32 chipid, chipid_min = 0;
> +	u32 chipid = 0;

The initialization doesn't seem necessary

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

