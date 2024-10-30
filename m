Return-Path: <linux-arm-msm+bounces-36460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B009B6539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 15:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A9A281E4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926F81F1308;
	Wed, 30 Oct 2024 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OfyWoy4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D101EF93E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297170; cv=none; b=fz81NwqL2K6wfXIrUYvyrtLYBiPRLXpcHnIVHCTYql0KGS+JeaU7zBp9MCHfp1cTHDw1aTwLnSjzdPOZ4OIEmV2kWV+OXFkdhQxfdElVnXokTKGKUwGnlTitbQvfVpPw6Mj7tFbwRq8BeG8wIgFfxzc4cUq9a2Wm/x97uGldkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297170; c=relaxed/simple;
	bh=D9BHiaEy0WTAhDY4bi9J/zAvzlr/WyuDVuG5oQMLFHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lywz/0gObdW1SOmD5TCs0zvmIqA735kJMCxL0D/P44VBMo5yIrdEGxoLekjDhiRvSUGfiqP2lOEe5vfaOXa13hgxfrubz71WKGBncgO5S1aV4zaLbYtyEQribKiTm14071Z/mzHzVapeZjQ583h36Huth5iNX6wuhtdcgH6S/JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OfyWoy4/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4fb6312so912637e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730297166; x=1730901966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hv2VJHVDcg8Wii/RZCdBGPcNoey4yFsCjeuvvSqHe/Q=;
        b=OfyWoy4/KNHbvrqi65wNr0+d4dBsnnoUphfXrX46B9rchw7EJYaw7Ds4/naEkjFwKJ
         Ksj46mEoPRU7EuO6NTPoR6U/ZpOUL1NmO9wI8ZULSfu4pb6HQV2eX1NSOTpT+IsJhugQ
         ixbAUH8qwyBxGKUmS6y3fDgn0TsBKlmxmITA4X1c9VjOrFHYit/lxH2xY7OWsKcmsTUt
         ozOAnZjPnw713AYZnM42SgfbPaf9/RowoCSoB7+xAZB5Gs/vjz6nmzO2a/47iHeYMioR
         1kHZEMylNMZ/GjTPLj61teaKLwNOduFtc1i/n/ehxg5ijfq+34mtlSEB1EFJuhiNcI1t
         6wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297166; x=1730901966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv2VJHVDcg8Wii/RZCdBGPcNoey4yFsCjeuvvSqHe/Q=;
        b=Rsqfp0/3k2z3UCaZ1SXbnLrw6aOxAfEYVtiXRaQO/znl9K7fuKGhj0ZBu0LEs2Pnue
         bUkC18McYmFS0Kv4xKwDzDT9ciK74rtF1ezDGjr96/pb1Hl8utI4gv4gSs2W1bNurynM
         yBkfLZGTXTi0/4ibPRukl+95Jz2i+hsXbuJO5ECpX4beozAfqaIRyiAltslIjLg4vgXH
         LICgg6ykNPD1C7l4l+l8GYEkSgYdI+5s1RHL1SfwwqkSDsNxwoDnW6cOsuZD5HpjpSiU
         NjVOBxHWLPsKC3/u2jggbTgtDMckHLFv0/+u2ZaIJWwjMT1VA8cd5uOcHXQGy0o1d/OZ
         9wgA==
X-Forwarded-Encrypted: i=1; AJvYcCVDmpVS7AqeN0JhtgFoDTiyqI2u3vkr9Z7OGyWvdYlH1Fy8zcNWG1l+MBWJzG6FM2+shPTf28Sjpp9k+KaU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Fps6GtOpqtpczXZQs40/Fy52LQ6oxj9frsf58ccABqs+HHSb
	XEftFBvNpYx7iXRMms0IztYbLEjEyx8sRKwSszOrTYxaSDbBlrOQvBc9rlIibLU=
X-Google-Smtp-Source: AGHT+IH2L/6XjRIgM+sXzITyJOXZN1AbLFaNxRiS8FkqHf3XTsWp1SQFnVOtruNggvE0aSGGFBRg5Q==
X-Received: by 2002:a05:6512:1386:b0:539:f67b:b859 with SMTP id 2adb3069b0e04-53b348cb00fmr2643979e87.4.1730297166266;
        Wed, 30 Oct 2024 07:06:06 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb819058csm259393e87.14.2024.10.30.07.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 07:06:05 -0700 (PDT)
Message-ID: <955ea816-5394-4dbf-ba46-441634a97685@linaro.org>
Date: Wed, 30 Oct 2024 16:06:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <jcqgsgp4ivbokn545sy2rvfllm3vnygfpbufxagotuicacfmgd@v2hlnohlwzdf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 10/11/24 17:29, Krzysztof Kozlowski wrote:
> On Fri, Oct 11, 2024 at 10:14:49AM +0300, Vladimir Zapolskiy wrote:
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        camss@ac65000 {
>>> +            compatible = "qcom,sdm670-camss";
>>> +
>>> +            reg = <0 0x0acb3000 0 0x1000>,
>>
>> This is immediately wrong, unit address shall be the same as the address of the
>> first value of reg property.
>>
>> I still object to the sorting order of reg values dictated by reg-names property.
>>
>> There are a few recently added CAMSS device tree binding descriptions, where
>> reg values are sorted by address values without a connection to another property
>> values, and I believe this is the correct way to go.
>>
>> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
>> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe from now on
>> it should be assumed that all subsequently added CAMSS IP descriptions to follow
>> the same established policy.
> 
> Heh, sc8280xp introduced entirely different sorting also in interrupt-names.
> 
> Just look at interrupts of sm8250 and sc8280xp. Luckily clocks are still
> keeping style.
> 
> Can you start keeping consistency? All bindings from the same family of
> devices, especially if they share something, should have similar order
> in lists.
> 
> How do you imagine writing drivers and request items by order (not by
> name) if the order is different in each flavor?

I don't see a problem here, and I don't remember any reports about this
kind of problem while adding CAMSS support in the driver to new platforms.

While the problem of improper CAMSS unit address appears again and again,
the focus shall be on removing a chance to make a commin mistake here.

As I've already said above, device tree bindings of CAMSS in two most
recently added platforms sm8250 and sc8280xp follow the numerical order
of addresses from reg value. This becomes the policy.

Sorting lists of interrupts or clocks by numerical values makes no sense,
thus the argument of *-names sorting becomes valid here. For clarity, reg
property is very special, also a snippet of its value goes as a unit
address.

--
Best wishes,
Vladimir

