Return-Path: <linux-arm-msm+bounces-24406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB591A09E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 09:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B19C81F21C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 07:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3875589A;
	Thu, 27 Jun 2024 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opCS1+a2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1898153364;
	Thu, 27 Jun 2024 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474158; cv=none; b=WzhCDeHhjqCRVK4NysnYM3ElOkLXBXhWXJ8odeZDKEBII/BNCcLif5AZ1do/hG6TmS6lfenFLq/pCuldQMSH4dqOcexdRCwlQB19JqeISrJFMgL5sPyldSYldbkSdF++IOSaU8bRz1ZX/UBgBrdHcS4DHVk14AwihxbrSiFDIfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474158; c=relaxed/simple;
	bh=+6/2eiODOce3fiw5XiGEEaZr7L+CuCqnH8p7dDX7VA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OM997M2ZAQNaIeHdIPn/16zvWzuvCEsl9rZaKy4wgmdQxJ0wKbhxjUfljIOZimotZVkK36QtwknBJ7Xbj2cZAGxtDGnkJD6OmvOf/IDx+Rrurt0u0uXXaZLMb/Fh0lZJa12wRkqPCUVhLRg1xNND56iyNmx1gmkLFk52k9qxbuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opCS1+a2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F42C4AF09;
	Thu, 27 Jun 2024 07:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719474158;
	bh=+6/2eiODOce3fiw5XiGEEaZr7L+CuCqnH8p7dDX7VA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=opCS1+a2JVdpqvYfM7Z+r2tDEyViU982n3s9/OA+XP05WjM8GGP+ySvzgOwbG2/qS
	 tKufkazc/J3RGw8hloKGATgasDNtTYkQ+d1BArS/J4GqKGTS1kjjxhpWbXv1CsYK6D
	 H4D3gOhkTZrDSBQoYDdypyZ+nfgymi6BRBU/oAP/3xY9SqJ3r3eqxYHFPmQFC3CI0r
	 wUMJCJM6TtOImjAxdjJSXGRreebOC1CImMeVAP35qu9afzesHPJsP3hWxSaQsngaN6
	 UbUtJsSRO4GIX97ABaQzzuqE3Pxh4P4j07VU2S/Cy+HLN7a8p44xIx+oJ+gPJXT16k
	 J0ReQOdEDb7FA==
Message-ID: <bf87c34e-a4ff-4e03-9d6a-dc365fec06a5@kernel.org>
Date: Thu, 27 Jun 2024 09:42:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
To: Devi Priya <quic_devipriy@quicinc.com>, Andrew Lunn <andrew@lunn.ch>
Cc: catalin.marinas@arm.com, u-kumar1@ti.com,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 geert+renesas@glider.be, neil.armstrong@linaro.org, nfraprado@collabora.com,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, netdev@vger.kernel.org,
 konrad.dybcio@linaro.org, m.szyprowski@samsung.com, arnd@arndb.de,
 richardcochran@gmail.com, will@kernel.org, sboyd@kernel.org,
 andersson@kernel.org, p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-5-quic_devipriy@quicinc.com>
 <171941612020.3280624.794530163562164163.robh@kernel.org>
 <eeea33c7-02bd-4ea4-a53f-fd6af839ca90@lunn.ch>
 <4bf9dff9-3cb4-4276-8d21-697850e01170@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <4bf9dff9-3cb4-4276-8d21-697850e01170@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2024 07:25, Devi Priya wrote:
> 
> 
> On 6/26/2024 10:56 PM, Andrew Lunn wrote:
>> On Wed, Jun 26, 2024 at 09:35:20AM -0600, Rob Herring (Arm) wrote:
>>>
>>> On Wed, 26 Jun 2024 20:02:59 +0530, Devi Priya wrote:
>>>> Add NSSCC clock and reset definitions for ipq9574.
>>>>
>>>> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   Changes in V5:
>>>> 	- Dropped interconnects and added interconnect-cells to NSS
>>>> 	  clock provider so that it can be  used as icc provider.
>>>>
>>>>   .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  74 +++++++++
>>>>   .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>>>>   .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>>>>   3 files changed, 360 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>>>>   create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>>>>   create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>>
>>> yamllint warnings/errors:
>>>
>>> dtschema/dtc warnings/errors:
>>> Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>
>> Hi Devi
>>
>> Version 4 of these patches had the same exact problem. There was not
>> an email explaining it is a false positive etc, so i have to assume it
>> is a real error. So why has it not been fixed?
>>
>> Qualcomm patches are under a microscope at the moment because of how
>> bad things went a couple of months ago with patches. You cannot ignore
>> things like this, because the damage to Qualcomm reputation is going
>> to make it impossible to get patches merged soon.
>>
> Hi Andrew,
> Very sorry for the inconvenience.
> I had run dt_binding_check locally on V4 patches and did not face any
> errors. I somehow missed to notice the binding check error that was
> reported on V4. Thus I went ahead and posted the same in V5.
> Will ensure such things are not repeated henceforth.

If the warning is expected, e.g. due to missing patches, it's beneficial
to mention this in the changelog (---). Otherwise all maintainers my
ignore your patch because you have issues reported by automation.

Anyway, up to you.

Best regards,
Krzysztof


