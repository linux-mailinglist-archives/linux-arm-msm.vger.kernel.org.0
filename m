Return-Path: <linux-arm-msm+bounces-17235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8A8A14C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1C4B245BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F59610B;
	Thu, 11 Apr 2024 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NSGsNGum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509634683
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839026; cv=none; b=X3UxHt4x3ZwbA55PcsQp8oaU1mrOQLxHQ2oObwo9QygP2vba/WbN2auwF/MLXLydr+7jSxDzM+uKX6LGUhKMOZ+7VJiWA0BZ2XGepUOTCW0sPMaSyb3BQ27bn+6kxmSeBlHNUEWwVueBI0uFBvvNV767QY15/G3NC1PD37cJnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839026; c=relaxed/simple;
	bh=+9sgMr9BIP4DFDGz+qGfq8bfnT1YvI3Vdjk55rviVG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyQrWGuXolFqU1ShzoGtlqdH37gtgsT0G77TyaMjw/VMeE3H+vT3joXwkbFsPa2GcjTpCgAMJM6Yzi/zU56UGfb+HOQmH3YgoFKgol6jEFoa5d/2Q+zSpzV4B3oRDKSPXdr8JRrp/a1ekYxVjwFBqFn7f/J+yleNAGPQia02ViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NSGsNGum; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so32062821fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712839021; x=1713443821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hp+fxLWm0FywNC3i8wBoTRZ5/VIl7OqPKUzLQiTbyEM=;
        b=NSGsNGumLxNebOnzdQ/dMruvQW88c4TOgoc7MK+zivDCmN2cUQro+MlRvw9rV0qYpg
         k7PXqcBZdxXi6XlBsfpEn0Inbdzb8tNq3h/BTuE83oThCZYcY2pw3rl4jBenoHIHfMML
         hx+sjG9ebC238jFYsccC9op2mQgscTqGezkmbtiFBAF/zwnB/TQ1WNJxj4+dpFgNSnkQ
         GFJAXULL9bZBsnvj02mnGlt/F2CsHaJc0ORQqZIMOtrkp0HZGQXoyRNqCeZokwV8x3dY
         7gOYYyyuF7QtOeDdDIcxa46PwnxYosaewlVB1RfQQh4sj3rLMrBgdLm0hpPJNYSXaviZ
         lz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712839021; x=1713443821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hp+fxLWm0FywNC3i8wBoTRZ5/VIl7OqPKUzLQiTbyEM=;
        b=GBBjtSJxNBnBEp4Fk90THhx41C+lWJyGyuEXQLdgpoGJCXx3t/PyooSZtXjLItexWR
         xErX7GIVsWhnZFzEITR2OcD1/UpNHWix6mGEimO9g7YhlFf3/B5zapi/f+2g2WpHWjJe
         lkB5vuDf7SnmkGPNUv+wThi0HwRD4y5Zbw5Su7qExUUN+kRLnV/ge37v+2VJL1VDnur4
         Y6tu3z621zDmHDkUrmjvlbao4mgldbNWAPELeEs48u2V6MyOi3Yb0e0Ur3m7zIXvFYdg
         0TYYtCmVEjk/4tGy3//Vl2Gb2O5Gfn4KkDL+0ognjjCWdm6VBIkPykkSkjBx0gg4h/6o
         +01g==
X-Forwarded-Encrypted: i=1; AJvYcCUfdJhNYh+cbfJ/afiX3A4TiNdAHhZyUdrrdz1Otzl9zdQRuVRs46jq6765GL9m1vjq3jKbY6IZCN1RmP691hYWzVjelPQxIcQ1WRMXRw==
X-Gm-Message-State: AOJu0YzJRZx/Jvd1h5HRsFWoiwGCQBdZIlQ3Qyb88+PYGLfQX9da1i5X
	WOxTZ4J+oeGbit9GAh1w3Kyo1zl9zN2UncFPEI8jNJx6vL7LO0IqnwUtZU18468=
X-Google-Smtp-Source: AGHT+IHeS9tKIMfvGWgD8xUFEA1jdCaEQNBupjWkf5jhYmRFN4yO4gZcCAHbNN/p1eKXvPQ/Edptrg==
X-Received: by 2002:a2e:b168:0:b0:2d8:6725:e9c2 with SMTP id a8-20020a2eb168000000b002d86725e9c2mr4045730ljm.28.1712839021343;
        Thu, 11 Apr 2024 05:37:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ay7-20020a05600c1e0700b00417d4f60692sm2097370wmb.44.2024.04.11.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:37:00 -0700 (PDT)
Message-ID: <1a2b71d4-8063-46d2-b790-419674e78e2b@linaro.org>
Date: Thu, 11 Apr 2024 14:36:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
 <0b810e39-b82f-4cca-87b0-6e586690b242@linaro.org>
 <7098c454-6a1d-46ae-aef9-63bb9ee82c6a@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7098c454-6a1d-46ae-aef9-63bb9ee82c6a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 14:21, Bryan O'Donoghue wrote:
> On 11/04/2024 13:03, Krzysztof Kozlowski wrote:
>> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>>
>>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
>>> was correct apparently, it is required to describe the sc8280xp-cci
>>> controller properly, as well it eliminates dtbs_check warnings.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> Subject:
>> dt-bindings: i2c: Revert ....
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Best regards,
>> Krzysztof
> 
> Reversion is not the right fix.
> 
> I'll send a proper fix asap.
> 
> cci0: cci@ac4a000 {
>          compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
> 
>           clock-names = "camnoc_axi",
>                         "slow_ahb_src",
>                         "cpas_ahb",

So this patch was not tested?

Un-reviewed.... I complain a lot that people from various companies send
untested patches, but it seems Linaro does the same. That does not make
me happy :/

Best regards,
Krzysztof


