Return-Path: <linux-arm-msm+bounces-17215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884B8A0F87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D6D11C2198D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9547C146A82;
	Thu, 11 Apr 2024 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="Rs8UpAMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D32145FED
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712831080; cv=none; b=R1LEEkSMu0w5/gJuRGkSdNEmIpfR/2z5eaR00Z/HVO66W66inhc3RIDQHB8hj7OpoqTsU71DRd5qnX17jo1wc0BfWjeae/lXAXCUI6LgCZe0bt5nWWSZE7gfJ5LvEHvUek605a1jbQutCpfl7qyGfSjw+JuA7fDvWBhUnYMsGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712831080; c=relaxed/simple;
	bh=iqiwMFZey1zu7BOnPb7YXg1m7ga53hLoWg/okQovF+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/C4fgytg0lTMsWVNWOaf1L/t9vEUcj4ztJB0n68UslOzOQVSfpuyISFMLY6hDcb0Lo7+MmOqwzhhRd7uF45Dw56k32CAusbxKGVT5AvyTIlgR+SSyy4jPxFOyFcqyN6ufzapkHQLhLylSsdSwJCQOImmmbmLN3YZfrZfhiEXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=Rs8UpAMn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so5809739f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1712831076; x=1713435876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yuPoEiGswJ/4R9lwCRkvQgoPgByz+6ioVAmEgmY8KaY=;
        b=Rs8UpAMnB/mzIB3CzW4sI3Yt7Pkx+N4EF7FlmOBbfIiDNx7tmCg3K05TCbqBMOEAS3
         xeSZRvO0qkMrezOFizHt4Yq/39jpr8C/ZtzDkVAXGmxr7BTjxYbzXJO9bNE1e/pbSfvm
         K9tVufrN3YSd3W1gSfchhyJ47S+VMOBoszj4Nj8WZnpmdchrdxtX2SvjDFu5hY6MbdbB
         PKGPM7iUrwZsSokLXQtwOYf5P/cc5U4CD8l7pv9HiY/Lrp5LTuyHuqPbUi5wkGmXQkhp
         9tbCVZzPfJmo+oR2+qefcJ+hsweLoAMGhm/G2UtcXi2BQEHJ4f6HIoQ8Sxtuxvlnj/4j
         AQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712831076; x=1713435876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuPoEiGswJ/4R9lwCRkvQgoPgByz+6ioVAmEgmY8KaY=;
        b=CBHY++MFoWzWVGj4VbRQymSaST6KT7ZwMJs3eMCY0obl8EDr+IzhlK2Af63hC7nGGq
         mWzBBnxLPJaNv6k7/raOcCC7uIGlbHdTlBk689oe5bFMlzIFBqgJRGbvY9g50NOX+i/b
         Yn9g1jfIYJr0mggyhOT1Dcp5aNhdepsnVh5m6uR+ubvJoYJEoHcXgwFX7cXoRj54+PzT
         l7QCvhQ9Ki3fLj1vBNngBAo9XhEZ/vRiVuKXDbEnf4Gx8V7BjqVEWe8QqRERAy8BG1Km
         xwZ+OLWBYFp5N73mmZZY+K0e06TyHAix1k0dIqV0+TGZX1E7O5B9gqeAJi4etKxfQviG
         oaPA==
X-Forwarded-Encrypted: i=1; AJvYcCUV+6UuHGR6G9LM66bHoW+xZiYdZk0mCA6fgnDSOr0tW11aM+djQxUeastPyEJLQDt+CZpg9f2royuroiFivoEpZbhstqLTfiYaM61DGw==
X-Gm-Message-State: AOJu0Ywff6ETaJFGcUzKg7hF4pmmbMC8hlaHz8lNEIv7NvID2/NakdqY
	B0Va09YSBd89YWKKPckEkNH0nVq26nXIxAP8O/r5ZbfhUZ1OPffTpO6Ln65nCWE=
X-Google-Smtp-Source: AGHT+IGj+clKB0Y5d/2T6iCtU70DRQcW128YIXK0aBYRaPu77qzq1n+xbdvYDwVDfj6vk/fNWdFwAw==
X-Received: by 2002:a5d:64a5:0:b0:341:be17:2554 with SMTP id m5-20020a5d64a5000000b00341be172554mr5600560wrp.36.1712831076336;
        Thu, 11 Apr 2024 03:24:36 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d4241000000b00343ac425497sm1430587wrr.46.2024.04.11.03.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 03:24:35 -0700 (PDT)
Message-ID: <d6a92b15-f68e-4e01-aad1-6483d53b9ad9@nexus-software.ie>
Date: Thu, 11 Apr 2024 11:24:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
 <94779d2c-d159-4429-b0b2-6baa83461bbd@linaro.org>
 <1b4f745b-67d3-4044-9b89-de6c2c496af5@linaro.org>
 <b6d9702d-4736-44cf-9a52-b476af4bf94c@linaro.org>
 <7ef1c0e0-bd28-43f1-a46e-4fa551714e82@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <7ef1c0e0-bd28-43f1-a46e-4fa551714e82@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2024 11:18, Krzysztof Kozlowski wrote:
> On 11/04/2024 12:16, Krzysztof Kozlowski wrote:
>> On 11/04/2024 12:12, Bryan O'Donoghue wrote:
>>> On 11/04/2024 10:36, Krzysztof Kozlowski wrote:
>>>> On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
>>>>> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
>>>>>
>>>>> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
>>>>> was correct apparently, it is required to describe the sc8280xp-cci
>>>>> controller properly, as well it eliminates dtbs_check warnings.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>
>>>> I am lost. Not on your patch, because it looks reasonable, but on entire
>>>> history.
>>>>
>>>> Can anyone explain me why original commit was reverted?
>>>>
>>>> https://lore.kernel.org/all/767bc246-a0a0-4dad-badc-81ed50573832@linaro.org/
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195094
>>>
>>> We can you sm8250-cci instead, so dropped the additional compat.
>>
>> I am sorry, but that links point to cover letter and actually the same
>> thread as I linked. What does it prove?
>>
> 
> And just to remind because you bring some discussions from driver: we
> talk here *only* about bindings patch. Not driver.

https://patchwork.ozlabs.org/project/devicetree-bindings/cover/20231006120159.3413789-1-bryan.odonoghue@linaro.org/#3195327

Konrad pointed out we don't need a new compat because the sm8250 compat 
string could be reused.

So, I don't believe this revert should be reverted and I do believe Vlad 
needs his own compat string because his clock list isn't supported.

---
bod

