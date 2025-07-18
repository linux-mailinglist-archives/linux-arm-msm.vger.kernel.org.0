Return-Path: <linux-arm-msm+bounces-65683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D8B0A7F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82C907A6C9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88C02E54DD;
	Fri, 18 Jul 2025 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quEXalad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D482DFA4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752854003; cv=none; b=s8zM9Xs93YqXYyFHQG5lzQw586+abJRHqbHwm+9NnLgrAuV8JgpLksCra8L7F90eIsfR2vVAGMBarlmrBecOnsoXm1Q9JowCpSATyQRSWVnOi634zXu+ND1MIS2OoEwC7UY5jpKWUBSp9qM4MQeTVYDfLW8C9lyuL3izNIgX7Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752854003; c=relaxed/simple;
	bh=j2W+9vWZsygzydsPzqO/o9VE+ojXl/rNKKXIRCB7PdM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qt9LWWa9ohmT6oQQBa2FMeWtOabXFdSuegzAcWLK0yL53cHrx4cd/AUdBtJpx1zQJjVRa+br3xDUMHpwqfU96kKkwRdRAexV/654fzsoRjf0rN1VjRdj3nSzfs28iXuCpDONoEdYh8HB+Rc/HE2P49zGF+Y46ByNqOX2Rl3uKYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quEXalad; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1793709f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752854000; x=1753458800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=83xEI2XLKwN+ObHpZw5yMzUhkwEXU5BkIjkQsIobU8g=;
        b=quEXaladmKW2q5CV7phoOgsBo3VW6XelB0O7YB9YouJED79d+6VRoS7ia+rfw8P8+L
         LXc9l76LgIYHq7U+6+SX4ZmFzITIq7ANMXJR8HSlXl1aAsrdbZoKTx5ZAb5pE7JuBGKD
         tu2IGnIAS0yyIHLJSWqijU77SbSGG8KEt+u72yoT6h4jqX9rGne8QptIROZqqnfupZwv
         WicYiE1CIy00jcvXrXJt4GjRnIYz9ncAbaOOtk273wsGvrhRXlGhfkziILgYA98+/9Gk
         DUEVaSq8/1VuIOMvkK8oNI+EWBS472zKHLvF9BTerwHQ7L5wXg/LwbRQREN3qkw/87z4
         gHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752854000; x=1753458800;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83xEI2XLKwN+ObHpZw5yMzUhkwEXU5BkIjkQsIobU8g=;
        b=swEMyG+yyiHn8A1bMLrGNO2YBIeyALJ8NzNfUrk7ykFkJThAL7q4Cbw/aS6WsQb4aF
         9kAAHUIk1DxylEMGZXoBHCkcuHhqcK0qe0Wp37kpy0gBc14eriqHI81NqvOsO2ceOAbY
         xW5n1Hu/6Xuh3e8L80saceL4l+dsxMPqRJdrFXgHBy8CHu+Q4WWsVCQl5awWYU5O/XLh
         5MreRfs0Ug7Za9y+QC+v0ukc63WcNiKfDTYRiL2nTenQFQLnH5OtAxDqOxR7TxQns5cd
         UNRVlFxfjvxXvwiwuOJ5YAwUMXiZPatqCJCTmnqcgozl/K2rwjnOsjDsEx0vGJaG/ihg
         PSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjZlt57vo3K1+EBhaJP77rvd+9CTPZcgWJpvnC+DUSWhC05JRisWaRkOf9evm0eXZne2yqh28ZZqwUZ/Og@vger.kernel.org
X-Gm-Message-State: AOJu0YxageXLZg6zjo0h6bEKolgiNI7c3hGKcCrgmTiJRpe4l+T/VcN1
	PdA0TwEXwKrvUcyZl4pnbFltj727C5JXG/YiSPS0u4tuYeiW2a76j5lVI1+rVDf+mWc=
X-Gm-Gg: ASbGncv4WyqNU9pKR+UdUhJHFkkAMBOouUpCXkoGR0FyZy52+8IerTe31MeKtyJkqKk
	VP4ylD0NhRGdHaaRF0LHUOnsRqZMbnnQ/FtXnQntwgNqhM6q46HxPChTQT/dWIQzLeExmrAEfNJ
	RvSKk0kH9Bd+CwVG78Soddp7CqBCmBBZqgmoAph4OpSLzD9IJNsk/6gOszLJaDJLSkFxADZ3zW1
	UVIVoqpdfEIQHE6TDhvfzCDgjEgNnk6uVO+IgqQ3AGlt32A6wqHlee1Hli0PQUjpvv9sDtz6/49
	syH6y+CZ1apHr5nIc2pjiC0g1zbQdoEmOSNQl8y0kUu5J2vgyXYvwJwdXcwBCBhv8g5TtTvkiOR
	89MaIsHgozR+pFqACY85cX9wJIeoblCIrzmaQCBxdjW6p5W+Uu7Nah8gD3KJ2CPQ=
X-Google-Smtp-Source: AGHT+IF0QxuN6b53Ajqhh8pPWoHEegj14l8lxBEfG99eop0NenvhhCX6GWM4sUaNBmu1FVWFfiXd9Q==
X-Received: by 2002:a05:6000:310d:b0:3b6:c6b:e4e6 with SMTP id ffacd0b85a97d-3b60e4be9b2mr9606302f8f.11.1752853998584;
        Fri, 18 Jul 2025 08:53:18 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca25678sm2264632f8f.12.2025.07.18.08.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 08:53:18 -0700 (PDT)
Message-ID: <fd107ad0-27b4-48f0-a441-03294e7b029e@linaro.org>
Date: Fri, 18 Jul 2025 16:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Dell Inspiron 7441 / Latitude 7455
 (X1E-80-100)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Val Packett <val@packett.cool>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250716003139.18543-1-val@packett.cool>
 <a2681844-a96a-465a-a48d-49e1ede526c6@linaro.org>
 <316007b6-6e24-4095-be24-fbd4ae7d425c@linaro.org>
 <2c5b3ddb-d171-4b30-9b64-def913ca5af2@linaro.org>
Content-Language: en-US
In-Reply-To: <2c5b3ddb-d171-4b30-9b64-def913ca5af2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/07/2025 16:34, Bryan O'Donoghue wrote:
> On 18/07/2025 16:33, Bryan O'Donoghue wrote:
>> On 16/07/2025 11:53, Bryan O'Donoghue wrote:
>>> On 16/07/2025 01:26, Val Packett wrote:
>>>> Since v3[1]:
>>>>
>>>> - Applied R-b tags
>>>> - Skipping the eDP panel ID patch now since it's been applied
>>>> - Fixed the last remaining '-names before -0' order issue
>>>> - Changed usb_mp: keep the unused PHYs enabled in the DT
>>>>    (to let them go to sleep), like how it is done for the XPS
>>>>
>>>> [1]: https://lore.kernel.org/all/20250706205723.9790-2- 
>>>> val@packett.cool/
>>>>
>>>> Bryan O'Donoghue (2):
>>>>    dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>>>>    arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455
>>>>
>>>> Val Packett (2):
>>>>    dt-bindings: arm: qcom: Add Dell Latitude 7455
>>>>    firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude
>>>>      7455
>>>>
>>>>   .../devicetree/bindings/arm/qcom.yaml         |    2 +
>>>>   arch/arm64/boot/dts/qcom/Makefile             |    4 +
>>>>   arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   | 1666 +++++++++++++ 
>>>> ++++
>>>>   .../x1e80100-dell-inspiron-14-plus-7441.dts   |   52 +
>>>>   .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   53 +
>>>>   drivers/firmware/qcom/qcom_scm.c              |    2 +
>>>>   6 files changed, 1779 insertions(+)
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell- 
>>>> inspiron-14-plus-7441.dts
>>>>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell- 
>>>> latitude-7455.dts
>>>>
>>>
>>> Just tested on the 14p this updated version seems to work just about 
>>> fine - or no worse than previous.
>>>
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Ah I was booting my old dts with the spelling mistake "inspir I on" 
>> booting the insprion.dtb here is a no-boot for me.
>>
>> Please hold off on applying this, until its root-caused.
>>
>> ---
>> bod
> 
> [sic] inspiron.dtb

Ah no it is OK to boot.

For some reason my encrypted disk prompt is a blank screen with this dts 
but other than that it appears to work the same.

No reason to hold it up.

---
bod

