Return-Path: <linux-arm-msm+bounces-28101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955794AADE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 16:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17F0282114
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FB612BF32;
	Wed,  7 Aug 2024 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7VfTSgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43212BEBE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Aug 2024 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042696; cv=none; b=HNtS8EGd1qvBD/Z+8xkEd+/famsgG4mUkrffF3ByrUPUsA8C/Nz/b0LPpmJ1eGzkvbufNizTHnPRj1hzYkK4/ESJDK0kPUyYnXEFDBFYH3Pwy/OBWTC+VY3ZNO5rZ0vwZR2dn9pB8dqmNh8OLl70GCDoHbEI1C/FDrg+nXe+3hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042696; c=relaxed/simple;
	bh=2A9olRXkkurPhWoduGEq4sLP8Qa2x8nAbpkI9q6xYLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE6NJejQRlWZOGDo/c8yY1b+HJUKXkQWRy/1DajQFGx2RGkyDveTjMc72k4Y3FL3oMgbdgZ1kmxERNQBny3u8tQX91Hx7tQczcrCRmcrc7lpTKEbD4Um+JUWFYr7ZIWvQYU/ebcE3AEe55GB2cjMKfu3Zp39bxZyTSXSdBAEQiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7VfTSgQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so2916700e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Aug 2024 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042693; x=1723647493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ty6wu6NnvFiktV4jQYFBzkKafWYbgDqtBdyrFjL9W0I=;
        b=y7VfTSgQxyNECRCUtqnqeN9TSSvdBMStgcaktBRfzCSWk3ef9p8Y7bubarYRoZenab
         R/gOHHGoUn+sFuOh3iHFCLNRoe6sSDlUUXAyKZw14GPCgwA2Xw4Ay+0s4MTHdYW4+Z4m
         4nDrx0dp20Bq5qSJjym7yrypx0IrH2Nf+tkswOirN3S5bewKzV6nyg6DjSx9Lv0Igw7Z
         200+RF83A2UTwbhkWcN8di1e09LmXbFdLf9cPy7mceK88BabRNnB47j5M8ZCpSpkVAQP
         qiC5BMFPZ6c7lLO9XkJEEEtV57UlIBDFJa0yQLMkMbUiYqM7NT2eg/EVS1GozLJmjWK1
         ULsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042693; x=1723647493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ty6wu6NnvFiktV4jQYFBzkKafWYbgDqtBdyrFjL9W0I=;
        b=vh9R7Vx9VshyGA2RINk47nNR41DsNuG2GoBqE7C1lAJoxzEaLhpOxleUFiJ/t8SFGG
         yPi2ROPGWFRwBeDvnlIkgZlQCIYMGvhePeunzsbSGdQ19KZfY60uZdVQAJCmyKxzbYDZ
         3rjux1CIEp2zxoNwQ1ZOWd8lWcyf4HCsF9/yUOZ5sacu6WtIY2uDm7C8C2KX+CnIsYeB
         51YsyCVSdHDbU4JGaXYw9N5qWgEUDkdwhaFuTRoB6gWOYitgDsLE2e26JT+tS/9Q1s9O
         pdqg3Btdssig7inWXSll1YP2iwLa5qEbDHP4iijNf5OIcZNbNLOnIo0VLgFJxDhYAciW
         gDNg==
X-Gm-Message-State: AOJu0YwjydtimpwkaLHWzS2v6SPqksyxaPWFYbT2RckKejMF/ZCjFM6o
	aKVpZrL9Nyf2MId+gzgxaG3Xa8BqTppfqpfzSdK24dSAKVE5sS1sY32puVfxHns=
X-Google-Smtp-Source: AGHT+IGXCHlz9/+c8YzxTWD7YCnzLHWWooLICTpK3cTNMLvpZfCquxkonb/+WZc2obkni9AL+ddSPg==
X-Received: by 2002:a05:6512:ad1:b0:52d:8356:f6b9 with SMTP id 2adb3069b0e04-530bb39d25bmr14044602e87.38.1723042693166;
        Wed, 07 Aug 2024 07:58:13 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429058026b0sm33690255e9.35.2024.08.07.07.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 07:58:12 -0700 (PDT)
Message-ID: <c3ed2b0a-3f59-4cd1-98e1-96494d15d172@linaro.org>
Date: Wed, 7 Aug 2024 15:58:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: camss: Add CAMSS block
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Depeng Shao <quic_depengs@quicinc.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20240807123333.2056518-1-quic_depengs@quicinc.com>
 <1c0ff0fa-73d3-400f-a58d-15fb9b0574d1@kernel.org>
 <c2a3e578-b098-450f-96f6-a3ae321f2b4c@kernel.org>
 <85cc52aa-4593-49f5-9438-1ee3f09d2d71@quicinc.com>
 <336e5679-f04e-47aa-9655-df88fde9de21@linaro.org>
 <0fb55319-0bae-4bb0-bce6-ebdbdd68f765@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0fb55319-0bae-4bb0-bce6-ebdbdd68f765@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2024 15:51, Krzysztof Kozlowski wrote:
> On 07/08/2024 16:17, Bryan O'Donoghue wrote:
>> On 07/08/2024 13:53, Depeng Shao wrote:
>>> Hi Krzysztof,
>>>
>>> On 8/7/2024 8:43 PM, Krzysztof Kozlowski wrote:
>>>> On 07/08/2024 14:39, Krzysztof Kozlowski wrote:
>>>>> On 07/08/2024 14:33, Depeng Shao wrote:
>>>>>> Add CAMSS block definition for sm8550.
>>>>>>
>>>>>> This drop contains definitions for the following components on sm8550:
>>>>>
>>>>> 1. Subject: there is no prefix camss. There is no such file, directory
>>>>> or module.
>>>>>
>>>
>>> Thanks for the comment, will remove this.
>>>
>>>>> 2. You already sent this, so this should be v2 or v3 or vX. Provide
>>>>> changelog under ---.
>>>>>
>>>>> If there is going to be resend, please fix above.
>>>>>
>>>
>>> Sure, I thought it might be a new series, so I didn't add v*, will add
>>> v1, and v2 change log in new version series.
>>>
>>>>> 3. If this was tested on aim300, I am surprised this being not enabled
>>>>> on aim300.
>>>>
>>>
>>> It was tested long times ago, but the patches wasn't sent out for
>>> reviewing early due to the team's internal schedule.
>>>
>>>> One more thing, bindings were not accepted, thus this patch should not
>>>> go in. There were no new bindings, so I assume patchset is using
>>>> rejected ones.
>>>>
>>>> It's fine to send it to get some comments, although would be nice to
>>>> mention to maintainer that this cannot be picked up as is. :(
>>>>
>>>
>>> Sure, I will resend the dtsi patch until the bindings are accepted, send
>>> this patches because you posted the comments in other series.
>>>
>>> https://lore.kernel.org/all/0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com/
>>>
>>> Thanks,
>>> Depeng
>>>
>>>
>>
>> Recommend
>>
>> 1. Send out your yaml and dts in one series
>>
>> 2. Driver series can be posted in parallel
> 
> The binding should go with the driver. Also usually discussion about
> driver brings comments, thus changes, to the bindings.
> 
> Sorry, DTSI and DTS should wait till bindings got accepted to media
> subsystem.

Yes you're right

1. Yaml - bindings
2. dts + driver
3. dtsi

In this case @Depeng remember to

1. Link back to the older series in your cover letters
2. Suggested by recommended - publish a complete tree somewhere and
    link to that tree in your cover letters

Its fine IMO to restart the version number of your series when breaking 
up into smaller series, so long as you remember to link to the previous 
series and explain in the cover letter whats going on.

---
bod

