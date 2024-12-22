Return-Path: <linux-arm-msm+bounces-43077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AE9FA62D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 15:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2DA07A1B15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 14:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA94618D64B;
	Sun, 22 Dec 2024 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKcOyWiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6EA18C928;
	Sun, 22 Dec 2024 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878430; cv=none; b=FSw3rCdp7JVZ8xEQDcYh+K+NIrFQgGZOI/QhiwpplY8AdEtl4aYJNFFOTlfsTOWYERaYRuUkpHFDlfvUVa1X4DCSNn3L12qN3iXjnCnPjyHE2b08LqYUsJxdmNKi29jSNd/bhtbppk0S3hPA+yGhW14gB2BTd4QyjtwyMyyhq8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878430; c=relaxed/simple;
	bh=1BMmdfzTmd8K7LJkzXBs3lB5Do33bBCBhWTf3hNUwcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jr7ZemW0abK7exoy2bVAf9jc34k/XnOd0C/vDqoRjepE7ykU3BZk33MMA2i3UFR0lJVQytLKvWJz46mYNiwEMRxhwQhj2FqeRaMROPDcZMuxM9mWf6BVwHkVcTV5x9mYoCyzhCEQaIryIpMBw7JS30bPrwVGKaoDTNmBDNwpqIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKcOyWiS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31508C4CECD;
	Sun, 22 Dec 2024 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734878430;
	bh=1BMmdfzTmd8K7LJkzXBs3lB5Do33bBCBhWTf3hNUwcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uKcOyWiSXk11ddg1jqxmeE2ZaYNgC3k9L77iPlj/a8ukxoFWme5tnLUwUmryuxvaW
	 hvZQPvLr7sEGYdTL3jIp2Fa4/U4OszXKNN7B1HkUOG4JGV5ZA/w2t2diTvn3R8E04r
	 Pr0DiMuwra17Eb02yFL7MtjHGMZP8QZ2ni1bTBJTUlTVhItoSxqQgBMSyeTinXnaOe
	 wUfHlB2w13b95A/YW7zt+oP/ENe7EwItwzEIfQqDsDeveMOrd4QbLw84f5po0fOk+z
	 +uaGGbTak2XRaS8nWhOON8TNpaypeymgRm2k7wF0+UChvuQ0qLZWUNhlQoYxmtKmBL
	 +N1/wa52kcsMg==
Message-ID: <c8677ae6-a145-411c-a221-02faa1ce809d@kernel.org>
Date: Sun, 22 Dec 2024 15:40:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <Z2WxzvKRVcOz5d2V@linaro.org>
 <CAO_MupJ7JtXNgGyXcxGa+EGAvsu-yG0O6MgneGUBdCEgKNG+MA@mail.gmail.com>
 <Z2W2UhspMZNT1TRU@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z2W2UhspMZNT1TRU@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/12/2024 19:24, Stephan Gerhold wrote:
> On Fri, Dec 20, 2024 at 07:16:34PM +0100, Maya Matuszczyk wrote:
>> Excuse the formatting, I've typed this reply from my phone
>>
>> pt., 20 gru 2024, 19:05 użytkownik Stephan Gerhold <
>> stephan.gerhold@linaro.org> napisał:
>>
>>> On Thu, Dec 19, 2024 at 09:08:18PM +0100, Maya Matuszczyk wrote:
>>>> This patch adds bindings for the EC firmware running on IT8987 present
>>>> on most of X1E80100 devices
>>>>
>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> ---
>>>>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
>>>>  1 file changed, 52 insertions(+)
>>>>  create mode 100644
>>> Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>>
>>>> diff --git
>>> a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>> b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>> new file mode 100644
>>>> index 000000000000..4a4f6eb63072
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
>>>> @@ -0,0 +1,52 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm Embedded Controller on IT8987 chip.
>>>> +
>>>> +maintainers:
>>>> +  - Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> +
>>>> +description:
>>>> +  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The EC
>>> controls
>>>> +  minor functions, like fans, power LED, and on some laptops it also
>>> handles
>>>> +  keyboard hotkeys.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: qcom,x1e-it8987-ec
>>>
>>> Given that ECs tend to be somewhat device-specific and many vendors
>>> might have slightly customized the EC firmware(?), I think it would be
>>> better to disallow using this generic compatible without a more specific
>>> one. In other words, I would drop this line and just keep the case
>>> below:
>>>
>> I've looked at DSDT of other devices and they look to be compatible with
>> what's on the devkit, with differences being extra features on magicbook
>> art 14 and yoga slim 7x. Though this isn't a hill I'm willing to die on.
>>
> 
> I think it's fine to keep qcom,x1e-it8987-ec as second compatible.


No, because:
1. There is no such thing as x1e
2. If there was a soc like this, this has nothing to do with SoC. It is
not a component inside SoC and that is the only allowed case when you
use SoC compatibles.

> However, without a more specific compatible, there is a risk we have
> nothing to match on in case device-specific handling becomes necessary
> in the driver at some point.
> 
> It's certainly subjective, but it might be better to play it safe here
> and have a specific compatible that one can match, even if the behavior
> is 99% the same. There will often be subtly different behavior across
> devices, you mentioned the "keyboard backlight turning off and the power
> LED slowly blinking", who knows what else exists.
> 
> I suppose worst case we could also use of_machine_is_compatible() to
> just match the device the EC is running on, but I'm not sure if that
> would be frowned upon.


Unless you have some sort of insights or secret knowledge from Qualcomm
(Bjorn or Konrad can chime in here), I think these are pure guesses that
this is a Qualcomm product (implied by vendor prefix) or some sort of
re-usable generic firmware from Qualcomm present on multiple devices.

If the FW across devices is the same, then fallbacks for these are fine
with me.

Best regards,
Krzysztof

