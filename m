Return-Path: <linux-arm-msm+bounces-29761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4B9625AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DECD0B237E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FD0145323;
	Wed, 28 Aug 2024 11:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B667KoO9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1316CD07
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843632; cv=none; b=UBo9xukY17n7/xMCXppLuXRuACgMn/9qQWTotFJwu/Zo7VGllccJqyYzanbe4SVFi1yN59eNVSHqKgbLJAjyWZt/lGrGR2btA/kGBMwplwnDBmgMFMvkiQKnz5F4qnaGSY5ACLd7j2jibljmww1ZpItTWl6ZEbAOLXAFsYlU+Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843632; c=relaxed/simple;
	bh=jUnILKAo5ATrsd6lz5mB3iOFWIQc7AkfPEQ9LPD0iHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6yKBXWWyhAZ/0Gy4riiMlNezx3u7li+FSM1eM0s//CyJr7UEtFZ3c6rVeVo++78Ucayn6p8ZpxwMy2v77w4F7SmcaDZHQkbyo1cQRRN5hMOrZGy9ydoY3ze7ZwJZs9vpaelKuWaCXbRpbRjM7awzzuUgTo0D4O4yax38lkT65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B667KoO9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bf10810d8aso849089a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 04:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724843629; x=1725448429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zcghzgIG2bNBAb6yUzFmlFHQDpsaEhKndi+DVgkFQkk=;
        b=B667KoO9Aku+3lrUmsgHInNoavkANZmKUGGDXzmdW5eCl5pFY8fu7xw1MEvDQLuJQa
         PXdIxkU992SAtAZwOcyWG1tQ9ML6KcmYTelu2p1tIbhs3gGzhGGiLo6Da7jl4wN78Sze
         LjkljLJUF1lnjSytwmxSJMg4pc3TLP9UE2f3IYiRQjTU789FUq8cA4KJkFE58HxaT4DK
         Cc02FV+Mn+L2d/zrI2YY/nYYYdRGzD+Xw/L+8tP2JP9IFPq1Z94U9dkhLZXe7nPFcjfQ
         kKdJAswV6xshC9NyW00mzY+dJCCtJ3M7+bJJrMZAgwIWewCf/JxRMb8MT7Y12lWw0Puy
         l6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724843629; x=1725448429;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcghzgIG2bNBAb6yUzFmlFHQDpsaEhKndi+DVgkFQkk=;
        b=MYZ9cl3Hi/Rz47fRLluKf4TT1rKAN+SQOgOM1wUvhHyCQ5kFUtnjWdD4qHjR/u9uwF
         4NXEBI/Az4kb712chF7seyG8WzbCOrFvmcsPG3gGyGMXgzU0esVnC7shXMZYuHEny4dI
         YcytGJ47pgbJXvPITzYWZS74Q3YPmVol+W74PpjK7tGSKFC5bDxJfnhhB61f0D1udMzT
         GXrS4gOMhD9ci//EjQNk+MqWSO/zqJaGtJJ07kAHPj8wcyy1spPnDAoUpgacIHxRwlZI
         JPebkACmuOb0HBimHBpoHaYL9QQLhkFMf22JAa9TbEs0HQbnMxlDX7oI6GHOV1Hg/uZw
         oUtw==
X-Gm-Message-State: AOJu0Yz31unyXNlPqS3DRxuBt6nXZHksWmvTMYooRQYLSVNuFmHEQKmd
	B/Q6+s0TkOllXTJExarf6wmNVATc4d+b55phOQu9pWD0+Csymn4HqEORkP96kuk=
X-Google-Smtp-Source: AGHT+IH1JpO9SbHismOTO20+L7uRSRuh4mNvVVKRlxfyREMOZrSaYHDZouLRC/uPD7wWEwJu+Nv8PA==
X-Received: by 2002:a05:6402:3489:b0:5bf:e43:895b with SMTP id 4fb4d7f45d1cf-5c08915adc2mr6787041a12.1.1724843629187;
        Wed, 28 Aug 2024 04:13:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4722b0sm2107487a12.69.2024.08.28.04.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 04:13:48 -0700 (PDT)
Message-ID: <47c4f8c8-6ca2-45a0-9e8b-813e5c5884d5@linaro.org>
Date: Wed, 28 Aug 2024 13:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] arm64: dts: qcom: change labels to lower-case
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
 <5f7735ac-e03c-4399-bdca-3e9550b23e14@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5f7735ac-e03c-4399-bdca-3e9550b23e14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 12:55, Konrad Dybcio wrote:
> On 28.08.2024 9:17 AM, Krzysztof Kozlowski wrote:
>> DTS coding style expects labels to be lowercase.  No functional impact.
>> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>>
>> I am splitting the patchset per few patches doing the same, because
>> otherwise diffs would be too big and would bounce from Patchwork/mailing
>> list.
>>
>> Best regards,
>> Krzysztof
>>
>> ---
> 
> I can confirm the changes are a NOP, however:
> 
> g diff $(git last).. | grep "^+.*&[A-Z]" | wc -l
> 232
> 
> e.g.
> 
> +		domain-idle-states = <&BIG_cpu_sleep_0>;

Same as in patch 3. I'll re-check and send a v2 tomorrow.

Best regards,
Krzysztof


