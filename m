Return-Path: <linux-arm-msm+bounces-41472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E29ECB1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 12:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D15286A3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 11:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86787238E21;
	Wed, 11 Dec 2024 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tlanoJJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5841A238E1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916275; cv=none; b=rM8zU0+5oRGCz1DXJwooufxOQ3bhM+i8378zR1s8x2qp9vz/KI7J3mWvVEhhGV3MTbl+WKyd6LH++GqVqjish+YMRHws6CX5uYeEVhVd1Saqq5nLmr4RvwVkgSN5V1oE4WV5ZeyJQ2zIGYx6zusLvHYEWg0mtW326q+LDG+2QZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916275; c=relaxed/simple;
	bh=doQ+jxVCijrIMLh7OMLzT8/sHqoOku3Qjpw3S+/LdG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONH9LTqZH8GJcRJ5PnuBPDaoFf7V4ls3rFoehFRNLNYb/RBtowma3WCt9c04V6oU2+imYmjLnZv22IyJBUHMsN8N+Bmt1L2MKGGuUpG7tCPszwzrxTA/p8DLrzlvo+PBU5N62zbBUsFQe29hSsfqRh5rD0hojGYdC7AijUoXN98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tlanoJJH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361815b96cso9853505e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733916272; x=1734521072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdVOYxjqZw+NY/Spw9lnEumCFUaVRFED0TdxGULYnmY=;
        b=tlanoJJHrC9aBRFgGGz3kJ5Ht/QNihOU4/AUfoGmb13I6KLYlvl9jjX0eBShlVOX5s
         RH+7tXrrmq99n4kBVzJGjBdW6w95l3u8IvzWDhM55boPsOiB9GUoSboyF5SnGdVQbLqQ
         3F9x/VBiuSCnipGhP0uknYWWhBvSTrIN52Pgvi7ZwyiCqwVtIkytO3IShTRQfBp+LHZC
         gDUvs775OIej8PLMXEnGnYbYnLzJDdujPahpsHt4IUf15V8QwdZ4bNrhVBoss19GBiBz
         77fGDEAwK/m4VRDotTt4idrquDyd1i3op7s4SO3KW3t8df3LtnFxPudvXf18IHGEMB4q
         deHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916272; x=1734521072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdVOYxjqZw+NY/Spw9lnEumCFUaVRFED0TdxGULYnmY=;
        b=U1mmqtizGyLUwRerY5bQ0waSf8wBEgrR9tytXlmzTCeI4ksad0SBr/AV5GtdI97r8S
         D17AYA2gXLEiuO2IrdaRGDjQOT5mHEYl2ZbHXa3jUwTVpgIFG0fPN6V23vqsip3SQvoC
         drABBO6gGh0dlZvNhpSKxZZ5hT9Zwj8QJxvfO1qRqEM2Xq5fi4Ur7chWdcjgkD97nsIP
         FtWuaQnWUuMkm3kDfhUpLz7sSknYgOHTMCUSpmiBhzQa3OmQqRO9cFclyLQr8Ydwkmv0
         3v0VqWyO/02hxr/Iio5Q4K1Dm6KKMi5V2NeKlWJFjCt+Sd5D3GBJGuZBPqL4uz50dd3x
         ahbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxs+n9GEDhwZY3ydCaDOgxlWN6jh44XMKClzN95ZHgALthYV2YzRnLEruketrmjDoyk3I/q+Wt0p4gvNMa@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxOKMuLBORIxaY3WAADwMhYj6vZXjoJQTiKU5TgDUAzlgex3v
	92tm+8dBt1IRtbzr7fD/0afM1yAjn1RDRDrpgPVevgSfI+6QJ/ZybcTidyAbS/M=
X-Gm-Gg: ASbGncv5CHEis5eAizWHF3wR6zkNqrMngxYTvjSFJNWDFdvFsVZA/RqMbwVA9zVu+Jj
	wYj4cHNV2p1t57nPFlKyRB9awKfb3ojG5/wzxRxwguF3JPtDCw9jex4N860Vp5ALfiqYmIuI9mZ
	1gr/PPNSMj6KfSQVlqEGgbbjDEMgKiRzvdS+SRHbjWrKwKHnD8NfpO8TZeecs9v3gbVWh1SZyc6
	z5vv1AeMRtOWsvoIjwilWyZ/b7f5yPrRItsAD0u4vMSX+9IILwyTh65EGnZl8XvJ0s=
X-Google-Smtp-Source: AGHT+IHfpFkIaDWgwQjHg8s+n3l3A0yqYbHH2mwIG4royHXDzI/IOfZn/Y6bGxTfFIWmUzLK2LmN0Q==
X-Received: by 2002:a05:600c:1d1d:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-4361c419464mr21115285e9.31.1733916271781;
        Wed, 11 Dec 2024 03:24:31 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f981880csm102337305e9.44.2024.12.11.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 03:24:31 -0800 (PST)
Message-ID: <a499bc08-1505-4f7c-833c-68240fdec275@linaro.org>
Date: Wed, 11 Dec 2024 11:24:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
 <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org> <Z1jdNaeoictuCK7N@radian>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z1jdNaeoictuCK7N@radian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 00:30, Richard Acayan wrote:
>> I think you sorted the regs, interrupts but forgot the clocks ?
> Do you mean the first three clocks placed first? The order was suggested
> by Vladimir in [1], but I can undo it.
> 
> [1]https://lore.kernel.org/r/40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org

We've had a long, long discussion on ordering subsequent.

Have a look at the sc7280 and align your ordering with that.

---
bod

