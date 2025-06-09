Return-Path: <linux-arm-msm+bounces-60570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A5AD1B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE8F1889B57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 10:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B392F2517A4;
	Mon,  9 Jun 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0yE3Fx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C12505AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463893; cv=none; b=D30oL6tAj/W9poddYjWssXHqZfFt0EvgJ/bHQOjFLHDdIYJSyOR8m1rBYCC12z2lgIc9bK73bdyi8DR2c2BP4dK+8/sGoGSftSgLNzpbzzSi1TThZb0DeicdP4Lm0EEXDadlM1nZkZp/b4UGVWcn/vBzs+ZHgV7hcmpmQ2d/y1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463893; c=relaxed/simple;
	bh=An3OZnLy9ktVFQ8mmPPB+cTLsHAaqJU//ZVfHWfLkz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6sGEzPnpVONgSrLPoK3EhpNFlKacfKWCIxfe8ZyKigJKqliM1giCaQZdmQ2ICeFBQtz9TtknT4yEixGA92jbTlNRLTXkorxRxxMZmb3nAq/UbpPStZoz0o1fNmzcumb1sa/R3/JP0NYCu8o80MOJHyLLb4Q/7EBtQe8tx9bmjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0yE3Fx3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55328ae0473so596986e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749463890; x=1750068690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=km/Og/aWOepgULZXU55OcArPvPOc4ZUj6YfVjtCIRPg=;
        b=M0yE3Fx3dfESLwmV6e+MeClYGMS+L6VSHF8+OijjSmcFZ0BoI0wBmJTqfbWUU+GroX
         1H00pZHHSg37m9/p7VaCpDvA2QMh/sfoCYUwXx0LFd78BGZuJDuZkrMtqf79+UycVBJ2
         8+yNVmdSHCn7tO+85tY4/kAjwNL5boVH3wKdNwsleXUcm1uM4hUU2jIJC4yayUE3D+hK
         gt2GAy7dr8XrLxSkXxl4js/ABeiXHdWgspK+P3zveE/HVcgS6WH+D7qrUARNXJetJDxu
         XTVjuUsAPbaXPc/NS9yWQTGEReSkhsmqYikCD3WU3aYrNLfSNxaV4owlUTbii8v1anPu
         xoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463890; x=1750068690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=km/Og/aWOepgULZXU55OcArPvPOc4ZUj6YfVjtCIRPg=;
        b=uQS45q35ebCroQHmQttybkIIAAu8X3hMYn14RmBFbkQgEIqH/KIWe7hMww+A9xT0ms
         wo8F/9MFV9GK2GapVeDwopzlhcK7lIOxsLYmGqS+b4dyyuZ44PQRUEpIwgVAVjOGE2XK
         fAzlT2mQTiWqlAYxFJmXbI3q4d8qHWkXP2dJZ3aDDwv7MW6f4Mj1qNOxWOJ2t1T40Q1b
         iUHViOgGEtKrVKF+oc/toHFESI3UumvUok+QiewRlEeRWnwLFJuLO77VtZl7Jlv61f7a
         GejHweKYNzb8pRWITyDYI4yCEYM1Orc9qt+yuloWY53oIc2f47TqdupeYBE+nzkp7cRW
         XKng==
X-Forwarded-Encrypted: i=1; AJvYcCVxU/8W9OtutEZKv6IdDsPK4mkc0qd490HG/fGE56AwQARAUgYQE7Uw65p2KOKJHQUn9yZOxq++iHjWgW/T@vger.kernel.org
X-Gm-Message-State: AOJu0Yya0fo2DPTRIcH2vDm6NJfBFeP4sd0rT5EWQ9/yCaOu6ldW/cd9
	rjKa5Hvt92HA9HIMOhlllHcG3x4yBqNj7vIi0kvVtU3heGBICy2QwwL3TYK6fJE5e8Q=
X-Gm-Gg: ASbGncu5/CrS98E3pliKDyTACbO6zl0u4af7oKmksI2cVq1w1mxm/m1+wYON38xNeEU
	BjpDJaPonwxGxLCoN/psgIPL7I+WxNFJvgnDAl5u+henyQwzbBclKKCjAYJ4lC+/1fal63wAgY5
	PfisPIXIPM6UsnxTnScDtLr39/CMXoaWI1lLXnE9PVkPFvVciml3V4YTfNbt+vHj/Zeb0LnqHVY
	0EgcbIMQUyIrKpUSAPT4TiGsfgzFr+iYNYKmoYLnwvSMjIkFcWn+BWluxh3L0aSHbkirckSH5L4
	ORTiYI/uAYFpHQosEJlDmXgYQoUBGN2ZfoZ+oOXHt+ghVqNcqTEISzgXzUK1/vVTBYV2u0Wc1w2
	JgTS5zaewE//t2gwbVhoX2iGHMe/klA==
X-Google-Smtp-Source: AGHT+IE3CgUhWs9JJgxNaO2ezZdpoAhFkdMBw5PvlY45Fhn52F996AFzFwsp+F4iIUJCj3wWUYvArg==
X-Received: by 2002:a05:651c:a0b:b0:32a:89bb:f8d9 with SMTP id 38308e7fff4ca-32ae32985a9mr10255741fa.6.1749463889794;
        Mon, 09 Jun 2025 03:11:29 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm10081841fa.12.2025.06.09.03.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:11:29 -0700 (PDT)
Message-ID: <5cb2c3b5-9c19-48d0-bf48-634c74d704e3@linaro.org>
Date: Mon, 9 Jun 2025 13:11:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: Vincent Knecht <vincent.knecht@mailoo.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-3-32c277d8f9bf@mailoo.org>
 <2884f55c-6b80-406a-ba21-aaa26297b1bf@linaro.org>
 <379f7434dadc22053afbf79734e8d96551b9e4e3.camel@mailoo.org>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <379f7434dadc22053afbf79734e8d96551b9e4e3.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vincent.

On 6/8/25 00:42, Vincent Knecht wrote:
> Le vendredi 06 juin 2025 à 13:46 +0300, Vladimir Zapolskiy a écrit :
>> Hello Vincent.
> 
> Hi Vladimir,
> thank you for the review.
> 
>> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
>>> From: Vincent Knecht <vincent.knecht@mailoo.org>
>>>
>>> Add bindings for qcom,msm8939-camss in order to support the camera
>>> subsystem for MSM8939.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>>> ---
>>>    .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
>>>    1 file changed, 254 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
>>> b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..59bf16888a8235495a2080e512ce179583bcd25d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
>>> @@ -0,0 +1,254 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
>>> +
>>> +maintainers:
>>> +  - Vincent Knecht <vincent.knecht@mailoo.org>
>>> +
>>> +description:
>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,msm8939-camss
>>> +
>>> +  reg:
>>> +    maxItems: 11
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csiphy0
>>> +      - const: csiphy0_clk_mux
>>> +      - const: csiphy1
>>> +      - const: csiphy1_clk_mux
>>> +      - const: csi_clk_mux
>>> +      - const: ispif
>>> +      - const: vfe0
>>> +      - const: vfe0_vbif
>>
>> Please sort the list alphanumerically, accorting to the ASCII character set
>> the underscore symbol precedes lower case letters.
> 
> I followed "latest and greatest" qcom,x1e80100-camss bindings which
> were largely reviewed and accepted, but if I must, so be it...

Well, this particular dt binding is known to be imperfect, for instance
see one of the series with a number of fix-ups:

https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

So, apparently the qcom,x1e80100-camss bindings shall be fixed in the given
aspect as well before the first .dtsi/.dts user of it appears.

> I guess this means I should also mod the DTSI from patch 4 ?
> Should I also drop R-b tags ?

I'm not sure about any granted Reviewed-by tags, this question should be
addressed to the persons who gave the tags...

The formal process says this [1]:

   Both Tested-by and Reviewed-by tags, once received on mailing list from tester
   or reviewer, should be added by author to the applicable patches when sending
   next versions.  However if the patch has changed substantially in following
   version, these tags might not be applicable anymore and thus should be removed.
   Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
   in the patch changelog (after the '---' separator).

I would say the fixes should not be considered as substantial changes.

[1] Documentation/process/submitting-patches.rst

--
Best wishes,
Vladimir

