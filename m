Return-Path: <linux-arm-msm+bounces-43076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5B9FA627
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 15:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F29516530B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBEB18C018;
	Sun, 22 Dec 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vnty3+C9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13AF259484;
	Sun, 22 Dec 2024 14:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878071; cv=none; b=dxqIMN06jGcwoI6IWiYL1yX5nVX6HaskiuuX93zDOrLFGxv3lhf1vuH1Hw0kP8+7JIvhzRWllEs8Wu80+PPcXp4xUgcKUMBzRgUxmzxhHbqEYV/89XoCKZ/7ELamRVKd3qlQUfVxJUirwszqlZNxvRSDZLS6pLsz14j3tLxE4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878071; c=relaxed/simple;
	bh=1bFFIMffdESlk/DfXVFVcVEr+JL75OSenaMM0ggWsR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg5CY7LWQDxm5wy8Jb7c8hYpWIGVsG5pIMWX6ifTBO+o6XLhtYBlEgBRRaT9zHxxh+0teMrkEnpA6kdYctb1b7xRq2oMLd0kQ7yXWLii7E/ykARlAi4PLT59SbFiRJwyrDVfF96ZqlTis3apzOiR0UWWPmpJeetjXm3UUju1XG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vnty3+C9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EA5C4CECD;
	Sun, 22 Dec 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734878071;
	bh=1bFFIMffdESlk/DfXVFVcVEr+JL75OSenaMM0ggWsR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vnty3+C9zJCMGusaGXRDl+cH7ccv0ZPs90OBf9esczi15vB85X91Wtjepksc8c3hb
	 g2kvSIQryIc+VW7x7hDa3nf6N4olv8u6aaS/V4oY1R/kbt14CDi9opU0fL78Z7uJv+
	 Y++2lMvagFPhIhpb7IAaLpUKOT5RqNmQYz8LY3R1a/bKstfArshSSmHGm3Pbq/YJEo
	 NnzrLP4PrE8rDsSPfTgIjTxBRfmuEnvt0VdYPBO3pvufF/v3L/is1YWK9oMkVjBrOy
	 NERzGvMkkWcF6xfvtM1G6cvPmvRYxkYLrdZRogxSWPYfng3dBzfbiXQwjokUnPtYHF
	 Qg7Blh8BL+9HQ==
Message-ID: <def949f2-301d-4edc-b303-0fbe02a18c3c@kernel.org>
Date: Sun, 22 Dec 2024 15:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <tma7q7lfskdr7myfoeene7o27g7nhc5ca66kpmnqvgksv5oxqv@ziefqqp5khic>
 <57515c0f-caa0-4651-96cf-dde75a13937f@kernel.org>
 <CAO_MupJNuK2UyXEPdr-xufWotbP-EmHyUk81YiTwaQR=WccSEA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAO_MupJNuK2UyXEPdr-xufWotbP-EmHyUk81YiTwaQR=WccSEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/12/2024 08:55, Maya Matuszczyk wrote:
> niedz., 22 gru 2024 o 07:40 Krzysztof Kozlowski <krzk@kernel.org> napisał(a):
>>
>> On 22/12/2024 07:33, Krzysztof Kozlowski wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - const: qcom,x1e-it8987-ec
>>>
>>> That's not a SoC, so I don't understand:
>>> 1. referring to the SoC,
>>> 2. Having this alone and as fallback.
>>>
>>> It does not look like you tested the bindings, at least after quick
>>> look. Please run 'make dt_binding_check' (see
>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>> Maybe you need to update your dtschema and yamllint. Don't rely on
>>> distro packages for dtschema and be sure you are using the latest
>>> released dtschema.
>>
>> BTW, for sure Qualcomm did not develop/create it8987, so it cannot be
>> used here. Come with specific compatible for this given, one product:
>> embedded controller on one Lenovo laptop and use it also as filename.
> 
> Under these assumptions:
> 
> - Qualcomm developed the firmware running on the IT8987 in most x1e machines

No one here knows whether most x1e machines have this chip...

> - IT8987 is also used in other machines with a non-compatible firmware
> - The driver name should reflect the assumptions

I don't care about driver here, so you can use it for the driver but
these are not correct assumptions for the bindings.



> 
> I think the name qcom,x1e-it8987-ec is not the worst name for it, as
> "ite,it8987-ec" would imply compatibility with other devices running
> non-compatible firmware,
> and names specifying only the device wouldn't reflect the "firmware is
> based on what qcom did and it's driven the same way" part
> 
> Which other names do you think would fit this better?

I suggested the one in second reply:
lenovo,yoga-slim-whatever-model-it-is-ec

If you have any indication that Qualcomm firmware from a reference board
was used as a reference, it could be used as fallback, but I do not
believe you can have such indication considering downstream source code
does not exist and all other docs are confidential. Therefore lenovo EC
is the first implementation we see and we know anything about.


Best regards,
Krzysztof

