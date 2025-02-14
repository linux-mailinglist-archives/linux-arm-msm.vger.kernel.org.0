Return-Path: <linux-arm-msm+bounces-48054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCAA361B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCF0416F470
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163811F92A;
	Fri, 14 Feb 2025 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZ1ffB0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1E266F0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 15:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546934; cv=none; b=o8HlTKOp8T4u2ueV/IPQTPFNmJpJJ+NwQWU+0xjYZlEHRzgn1dCKwMsGirdZK2P5KKF+X/ph24pAwaemn1hD+oTi2B/y/jipaAG+4UeWaJcxOG9k0dekBjOsuA4JZ0ptPLCN83W+Ee7vnuU+Q2ZV2kzHLNbJ2B6xImGSez4lZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546934; c=relaxed/simple;
	bh=QXTnDml+D0tEZiHck5M2HJ/XArC33mjEgCu7FEjG69k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkR0afjxMAbj1bc3K1QUDs7oQDH7H8dOK0yHlnh/3t42+Qesxbehrl4LVR0n3VjBLZdOShDttwtHx92LWY1UDAhhxXcK/BI7AhSQle+4DavsHgamGZlJv+jElUKKC2PU9+ZWsh97sdpmNohxgDXpY9BXAOROszj+W4ZGGBVqLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZ1ffB0Y; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7ee6f5535so39824266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739546930; x=1740151730; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SDaqFrihY/YY0hY/ejLI9ceCHU+V0z7gPmJlGkArmHI=;
        b=AZ1ffB0YFEq2LIEO/Dcq9LN4cvcEg+lOtpek8xojKo9VQ+fuBYfCVWjfW/sCZdsDKy
         1z4Gd8LzlKZCUMu4Jn3r0uokQt/W92J0tx4xRoZeaihFhnPx0LnVlWbw0wEV0H+NS7Y5
         uwPYU/VDfvjQ8S0WgI7giB+yrpmoH2gxlUiTkTVCwYnc6gDxZ0mlaZsVsGK3PUgxLPYd
         moQHOIB9QijdnxXIX5YZYjbgg/yAVUYxq9399OWE6vYGdPMGV8+y09rBb/1fzaKeZAjV
         rwfYYqvnahAqgzFBKoD1/64FYTE2hDywAP/hQxZAYN506HxnwVE432LoMuRA19s3GE8I
         q7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546930; x=1740151730;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDaqFrihY/YY0hY/ejLI9ceCHU+V0z7gPmJlGkArmHI=;
        b=L/RKyMSSsLO7vCQhYEjGV69ogu8fcWkCJ0fSP5wHfC+qv7kWfuJQ6waUC3qv+Wj1ju
         o2Pp8TgwGgNKZkbvqU22vdkYkeYV9+VxcyWzUtxiQHyagZI8iE37nyEdzvRv1Cvl+D/k
         ihmN10CERQ6H/81QVnH+IEOxV0UzOn+V1xjRJ39t33cCcHObLlqaSEio/TDue+5vkuMw
         5m83qy9PdKQeEhVhtTiIV4zUz6hohJL7+BBz8F97Z2+syBw/+qqNUD39amMva/9Ild07
         QTAtPHMpbzbobxeNAqRQdjE44AWDev1F44gIHlECpsR+0XxS5kFdO9eZC6wI1aL92Lfb
         okBg==
X-Forwarded-Encrypted: i=1; AJvYcCXghbxbAH5G1O77/ehXlZN5Z7uo0M2YBcOex9xPccxxQHr+rMrF+gM60HfortMxDcOt8J8Xhcn0veyAhno2@vger.kernel.org
X-Gm-Message-State: AOJu0YwbAOCbpIJGlPhXNRTXu+EGoBGzjVTNEPKHnu6v9jEyUMnXNGz7
	bL0471saEsvfAifAEIzRUo9n0n08weC1EsrSgE5vBM1sW16cuKg3Cu6uGuprDjs=
X-Gm-Gg: ASbGnctGhDiJtkKldLsTFb+gJX9Jkw2OGbOEHF5SA+07Czlb2bbXWopRaG+SS3laa3g
	PN0Np0i4ufltvAy9SkGX077/ALuofjlaARnpx25Ra/g4G4PcM7PzGivy+S7eqS/o+HDMCe4GThY
	DSRFm0qykTjEAjD9ofUl/4q3z7oP5a6QPz6EnC+KS6jAJY/6Ry/LLCt0WtFX36bafPPy0MbQu2S
	JcldYAlIsoaJICSOl3OZOf5rlEQV9hEdMBj4m/Uc9hnVKZcbzwwyPtwTfziL7oshS2LlSg8qFFM
	o1HAjDp+hZtz0l0FlGonJtckdn/mWNl4C9I=
X-Google-Smtp-Source: AGHT+IF6s2hfTK6gX3MOXr8bxckqyTK/sPsYP6XqyMCkO+ihlJ6qCIG5WJ8o/7aZBjAT7YrLV64fgg==
X-Received: by 2002:a17:907:a08a:b0:ab6:d660:c84a with SMTP id a640c23a62f3a-aba6938466bmr139881766b.4.1739546930429;
        Fri, 14 Feb 2025 07:28:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bf307sm363366066b.176.2025.02.14.07.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:28:49 -0800 (PST)
Message-ID: <a0391156-8d37-4595-a490-2b828170ab65@linaro.org>
Date: Fri, 14 Feb 2025 16:28:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
 <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
 <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <aarbydttw4zexzkorcr4yb4swscw3crn65u6eactutpfgpnt4y@fg4zyd45xwln>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2025 16:22, Dmitry Baryshkov wrote:
> On Fri, Feb 14, 2025 at 02:17:44PM +0100, Krzysztof Kozlowski wrote:
>> dsi_clk_init(), which gets the clocks, is called only through platform
>> driver probe and its failure is a failure of the probe.  Therefore
>> NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
>> value stored there won't be used/dereferenced afterwards.  What's more,
>> variant-specific clock init calls like dsi_clk_init_6g_v2() are not
>> doing this cleanup.  Dropping redundant code allows later to make this a
>> bit simpler.
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 


Thanks for reviews. Both you and Abhinav reviewed, so I assume this will
be applied by Rob?


Best regards,
Krzysztof

