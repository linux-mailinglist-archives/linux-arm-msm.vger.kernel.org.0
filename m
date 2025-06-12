Return-Path: <linux-arm-msm+bounces-61118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B181AD6EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 13:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BDC6189731D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FE423C4E9;
	Thu, 12 Jun 2025 11:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WdCn39G2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2923A99F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727671; cv=none; b=qBqTr/gbYMh62ohl2sW5M2OYuLRj9qoBwsLJFtm+3EeAl+stMwQKxVCoWpjju1zlNYEPxYO2jCBAKAjlBErDGsZOJ/nDRqFQkLia/ASgwte9BBdAQb9GFI+WuNSQUfHjCQdeyyq5qR3QwlWc1A6RRAD0RN97D3cRSovdnVaBQL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727671; c=relaxed/simple;
	bh=baOh6JNrNs+y+44obXR/Ufj9U6PUWPAjBVng4c8Z9hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2ROOB/eCI6RnnjndpStse2f0FICUv5YSowWfSkqBhgyIG/nGzNISM7HPN6ICjLftFapTiJCrn0BfbsxYLariP9f+c1eX/UKRH/FqFiBVnLSfaBQRaQ9aByLvCel+Vm3AxQ9aeRpooyKfqIiQibV+fXIy09VHHLim6hss8fW1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WdCn39G2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a8abb1613so1240961fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 04:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749727668; x=1750332468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMJIO+9hxF2T1hW8fxlUtSq3+LhB5vVChGg7nGiwpMk=;
        b=WdCn39G2E6CPs7UXaqW5eAx6v5HgjxmSyrVlYtyLsQdM2ITwC1kp2CUndzUoHt+FOA
         EWeix5toMcAZ3uDE8TwSyL5+b6F2aNyZVQpwT4hmBLOvNqvFPHd8AElsa5Ttp3YkyTHV
         llYqxZRCy582KbrH0NaWtru6HJqx5MM2sBtT/0mHwGA76lFcyA4jxn7IDZEF4GplP+/2
         JXdl/yFRm3Y/AfmZxuLs43t4go5nBwtPY7I+OujwlCkJQ/8zUtvoPo+WAOM8wNuibtml
         dKQg4AOOFiMCayfZMMUQIf3/j/Yeb6MabczG1MnO869I1mRZXEELzTU/UfAlXwx8v7Ku
         5YoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727668; x=1750332468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMJIO+9hxF2T1hW8fxlUtSq3+LhB5vVChGg7nGiwpMk=;
        b=DAFtc5ZK84hPkL8QOrCT2OnIWpyxpx/qSIY7m31u8K8xVob1VxE/BC+D/fX7cOiXcV
         bKAOMbOrjtm5N/4+6XiBxHhR53P5a2IkH/jlnGvWFNr0FUfQQuGKO8XjNgOUSbYDyADM
         PVka1y5GKFxOo0W3XafuC1ZXf2DCfj36yKqDZ5hurebbbr5PWFYa2TffzQ59gYEcAUoU
         r9Vs2Txu1MJxFJy1w+EqJfaWZ5+9eCVc4ufyz3uHuBBvoNG8W0PB9R7yZTM5Th8p5mzd
         xffv2tyh2MwYXc2iY7OQ2KN4tRDZHyuZm21CGz88iNXDUt6v9YftR4OZWKmI7IzzNGmJ
         TyNA==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ8pFko7Hte2juCzweZoOyjnNvVAzb4/g2pvKZNuGRN/fKuhZSJgx37wyiIAl1sulnbK35UBP9KPqs8gO@vger.kernel.org
X-Gm-Message-State: AOJu0YwnADzEca5DyVyyKKKDIeVVwchq1xxE5D6fIUPhueQzQVaTRk3f
	UY8Xl7x2gnoSEBk09jPWNftzOJ9JxRszwb2ejLoGTCpm4X6J8389BzG39Tk9wh0rlV4=
X-Gm-Gg: ASbGncuZFaE5UfjipvoOcq0GSTwQx9vC5Oe+5ucI05vG2MTJ6whNGzxP7OCC7vvyfiF
	RtkrMElWggFt7bYUdBwWUWM8qd3EtguI/EPI9S5wajrykFmXxXYXEqWKVMHh/zmP1oXn1wfg6Tx
	DyN9shXzsHU/zQQG2+/pfqwdsyv4iONkGw1qNWb/IhziACWrLc2W0FK/SOVuSNprfgaY7lbzxtv
	k/Mz3BHeuNGvF3rpSK6YTYPWWcMnGfFFSa9URtUFRgJJJYT//zLu4EMSfnFhIvgGSso/y//szR+
	dvjBdIHAAFEQkXFnqR4RM5qmTvfHdFYKx121XS2gJ28hSulGcJt3lsObnFqwP7hupbInBN1JLwo
	6d10gh22zPLPW1BOF0WOSzTzTL7wGuZSrl+ehCi8BMnSOsvtPcCU=
X-Google-Smtp-Source: AGHT+IHim72L19yadAXZGJXEuLrBbBbuXPX7tGYPhPYpnsQljqwHSSz7SjlCn5GLRjBPKu2TFNsZbw==
X-Received: by 2002:a05:651c:1a0a:b0:32a:6236:7094 with SMTP id 38308e7fff4ca-32b21d8c15fmr7846241fa.9.1749727667784;
        Thu, 12 Jun 2025 04:27:47 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3321f973sm1821551fa.112.2025.06.12.04.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:27:47 -0700 (PDT)
Message-ID: <51a91c84-c83f-4b22-9861-88929b222432@linaro.org>
Date: Thu, 12 Jun 2025 14:27:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
 <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
 <d424481b-cb06-4bee-8d36-5e31ca2838a2@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d424481b-cb06-4bee-8d36-5e31ca2838a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 14:02, Krzysztof Kozlowski wrote:
> On 12/06/2025 09:57, Vladimir Zapolskiy wrote:
>> On 6/12/25 10:39, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>> ---
>>>>> RFC verion of the change:
>>>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>>>
>>>>> Changes from RFC to v1:
>>>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>>>> * added 'clock-names' property,
>>>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
>>>
>>>
>>> Now I noticed this... weird change and clearly a no-go.
>>>
>>> Device binding cannot be generic, so it is not good enough for now.
>>> Please write specific bindings for specific hardware.
>>>
>>
>> Can I add platform specific changes on top of the displayed generic one
>> like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> etc?
>>
>> The generic compatible is sufficienlty good for adding the enhanced
>> CSIPHY support to any currently present in the upstream platform CAMSS.
>>
>> Obviously I can rename it to something SoC-specific, but then a question
>> arises, if a selected platform has to be a totally new one in the upstream,
>> or it could be among any of platforms with a ready CAMSS, and a backward
>> compatibility is preserved by these series and the new CSIPHY dt bindings.
> 
> Just use a specific compatible for the actual hardware this is being
> added for. I don't understand why this is different than all other work
> upstream.

There are very close examples in upstream, for instance that's a generic
value from Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml:

properties:
   compatible:
     enum:
       - qcom,dsi-phy-10nm
       - qcom,dsi-phy-10nm-8998

To save time reviewing the next version of the same change, will you
accept a list of acceptable compatible properties like this one?

properties:
   compatible:
     enum:
       - qcom,csiphy
       - qcom,sm8250-csiphy

--
Best wishes,
Vladimir

