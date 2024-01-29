Return-Path: <linux-arm-msm+bounces-8875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0E84083D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 15:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D5011F275C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787F6664A2;
	Mon, 29 Jan 2024 14:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA8ocWqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E665BAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706538417; cv=none; b=hcgBoZcTHpptXUUF4S6vxAfqmMENhuxxqz6yWEoKQERLZJL+UKrFuPytTGizSt16/sq80ya2oEaNWacaVCS4aizO+75ZCGVIEvbCbjxOXw7xzLHfH4KahuPslrUbqQ9BjnTPDEJVfhZ0PGAtUd1Gg1qVgTJ6249Lbgv4ElSwcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706538417; c=relaxed/simple;
	bh=NCfehVqjR5Cj9j2TbgLuA6MKTFfTrvfb+PMVFfwU4eU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EACIRPPSBB35DoQ64n5NoRltlAClulbufjBT2c0kO60Xde2CO97xac4LG08fOLNBOE10Xv7Egu6b7Om5b50CoLMoSsyfsZUV3p7Gmfbhv+jIhB7ZE4dRD0Ihu2+7oUPKhHQ6OkdLOxCwwODJpAYElHLhgZW87FKmRzeYrgjuSk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YA8ocWqD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2a17f3217aso389341166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 06:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706538412; x=1707143212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/8SajdHHtiLWqLgdrEaXxFtoatwZriBX16EN6CF+8k=;
        b=YA8ocWqD+8wPjwaPOjcSKwVF7n88N0P4N3/4GlSgELNLSZ3HKFiQ0gmoI8emQUmRtS
         4kSLJHUOQyKMPf/1QLCvPP58C9t2WSvP/Kl+Pk5ANs9Kn6H8I1ZRONIu6O+xyl96Tcjb
         Tc/DhLRtOOTwLsjIuDAw8jVYC7GOGrnxY/C9gpQSOX6J6rCHVD8rMMd+ypDT3KhIeXc6
         KUPzQKwTMkFts4ZD8ME1KryZet3P9iQRzhYyiTHWwCwyEVBOkzOksugEBrOLk2M5mt5K
         FeH70j7mt5zEMelY0baMQZzPV/IFq91sBo/J/DFE9zyNN5hqhdk7y1PhGc64ZpB6pbRs
         oiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706538412; x=1707143212;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/8SajdHHtiLWqLgdrEaXxFtoatwZriBX16EN6CF+8k=;
        b=JyTjqEvYgLPcX8kGzgENMgxQhT6dW9Cu3DHAlO8bVQlHeXS6qP3sKCQLcGoemWujwJ
         ehUgdXxPeQIlJ71H6nL9YEsuAAJPYXs/0vWfExIQ2mQNZglkt28miSLNGWNwDyd6D10O
         bq7XhI9rqTQ2spYhZuFCbyj27jN4bapT3Yjyb6ZOXC6/2qVjbCuUwB5UiM0JlN8Gw210
         r3i/dhwfHS5d9kkg1xi3dNjpZe8F5QD7p2JzSW6b3ux3Oo/OeEeBQZhSFha9nUnR18xJ
         uPPvz32PT/tdnSSCQ1lKDKLGuxt9YJJptHt63+pHrk+sIP46jB2rIfuliBBcsurXZqh6
         Ru8w==
X-Gm-Message-State: AOJu0Ywp7GIwnNWujHG0uFboEBLXrXaoitiFZ2qeyuBo41ZmfRRWGYu+
	tLtN05P0S7oNQJZp3mEIk0bIYJ+/gKtyK6xrUOaxUjsyqHmn7BeVLSh7xtCXXWU=
X-Google-Smtp-Source: AGHT+IEAUZOMQLtPlVyM1GTDiHf2EOZEGrWn7XiJzSw2YnVmXyJxgDI4PHYffQWngYenQ85W7Cjefw==
X-Received: by 2002:a17:906:4ad2:b0:a35:fbc4:4c20 with SMTP id u18-20020a1709064ad200b00a35fbc44c20mr326661ejt.6.1706538412474;
        Mon, 29 Jan 2024 06:26:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id tz15-20020a170907c78f00b00a356e5ac7casm2200992ejc.86.2024.01.29.06.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 06:26:52 -0800 (PST)
Message-ID: <e9b6f790-831c-4df6-b16c-8d7a2f8ddc26@linaro.org>
Date: Mon, 29 Jan 2024 15:26:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: correct analogue
 microphone route
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240125154531.417098-1-krzysztof.kozlowski@linaro.org>
 <c34dd7ca-01b5-4424-a8ec-a525b8d722a3@linaro.org>
 <5497d428-cdc1-4057-afda-6861d2e3860a@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5497d428-cdc1-4057-afda-6861d2e3860a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/01/2024 14:22, Krzysztof Kozlowski wrote:
> On 26/01/2024 14:21, Srinivas Kandagatla wrote:
>> Thanks Krzystof,
>>
>> On 25/01/2024 15:45, Krzysztof Kozlowski wrote:
>>> Starting with Qualcomm SM8350 SoC, so Low Power Audio SubSystem (LPASS)
>>> block version v9.2, the register responsible for TX SMIC MUXn muxes is
>>> different.  The LPASS TX macro codec driver is being fixed to handle
>>> that difference, so the DTS must be updated as well for new widget name.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>> Unfortunately this is breaking mic on X13s.
> 
> This alone? Of course, there is dependency... Or you meant something else?

There was no further comments on my proposal to skip touching sc8280xp:
https://lore.kernel.org/alsa-devel/20240125153110.410295-1-krzysztof.kozlowski@linaro.org/T/#mc45e487f25a2d6388b5c478b1b7827b113640f4f

so I will go with that approach. Please ignore this DTS patch. I will
send ASoC changes which won't affect sc8280xp.

Best regards,
Krzysztof


