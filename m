Return-Path: <linux-arm-msm+bounces-29240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E254F95AD74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7033E1F22ADC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB05B139CF6;
	Thu, 22 Aug 2024 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyUPGA68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDFE1369B6;
	Thu, 22 Aug 2024 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724308158; cv=none; b=OCZ/JD9oxtWTXzFatDOVi19hMistEPkrG3eXOuf72YB7pH2q+ojDLmRFTviODR5wxxVC66t3xxp/91l7xgVhszPQpSeSqXCAwsTjjd/LOnQiVtsFDPXkGXQoRaKnNN1jymNU8b2PI/VQJHujBBz4cg6Y3f3sGCVC9+miwv5tQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724308158; c=relaxed/simple;
	bh=dxIr/zqhDUwIpOVfWk4NZpFnujX6cxAfQAQhph03ztA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Omov5pndAbYCChXULP/NJxolUjhgHjmOPMuomEhOgBObHzsQtuopF03RqZZt3e7bx7fwHYVqUhN47LYufBF5eY7eBFQlexXlormO+l6tMpL3Gqn7+Z6MRI1nye/YeBjqo/c33qsqtZ3YiUwf20Hh9D2Lr2BsU+6OfcOGeA1z87o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyUPGA68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11FF8C4AF09;
	Thu, 22 Aug 2024 06:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724308158;
	bh=dxIr/zqhDUwIpOVfWk4NZpFnujX6cxAfQAQhph03ztA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EyUPGA68VoOh0x8sUndjLFgOAJ7tHwG09dQtO/DtIG1z6iKJdfM89ZggczTLaE94Z
	 pIa7r9OLjMgdxhNi+DaraWTjRoHjLbWJTE3Dwh4ixzBpLpRI9xTf16vPno12TkJ8Ql
	 gMx6wwl6ZngWnT5Ml4ZLQxNBr2mGJqwftdlQHElB51cd2RPqLE2r7faLveljbqxSSj
	 vt2k1YjYz9a/HHcTRUMWG/YWrxOek5X5ZRftdY8FWZDT8od3w96MVVBEpp0IUxgyN8
	 Bf5Bh2CUbaHmHdCCH+ix41CTw4S/GsyOehqXb0uWvy0FU07pYYKCjFlcCl8tQAO9yx
	 eKRqxZ+GSVFYQ==
Message-ID: <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
Date: Thu, 22 Aug 2024 08:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
 quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com,
 quic_leiwei@quicinc.com, bartosz.golaszewski@linaro.org,
 srinivas.kandagatla@linaro.org
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
 <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>
 <krbpzjccn6xvnpfsa7eeeowmtjuuw4yp72qqqbeq2icxrqvdo4@x6pawrcctyd3>
 <51198961-2e09-4d0e-8bf3-907c81597724@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <51198961-2e09-4d0e-8bf3-907c81597724@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2024 18:08, Jie Luo wrote:
> 
> 
> On 8/21/2024 4:33 PM, Krzysztof Kozlowski wrote:
>> On Tue, Aug 20, 2024 at 10:02:42PM +0800, Luo Jie wrote:
>>> The CMN PLL controller provides clocks to networking hardware blocks
>>> on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
>>> and produces output clocks at fixed rates. These output rates are
>>> predetermined, and are unrelated to the input clock rate. The output
>>> clocks are supplied to the Ethernet hardware such as PPE (packet
>>> process engine) and the externally connected switch or PHY device.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 70 ++++++++++++++++++++++
>>>   include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
>>>   2 files changed, 85 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>>> new file mode 100644
>>> index 000000000000..7ad04b58a698
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>>> @@ -0,0 +1,70 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
>>> +
>>> +maintainers:
>>> +  - Bjorn Andersson <andersson@kernel.org>
>>> +  - Luo Jie <quic_luoj@quicinc.com>
>>> +
>>> +description:
>>> +  The CMN PLL clock controller expects a reference input clock.
>>
>> You did not explain what is CMN. Is this some sort of acronym?
> 
> CMN is short form for 'common'. Since it is referred to as 'CMN'
> PLL in the hardware programming guides, we wanted the driver name
> to include it as well. The description can be updated as below to
> clarify the name and purpose of this hardware block. Hope this is
> fine.
> 
> "The CMN PLL clock controller expects a reference input clock
> from the on-board Wi-Fi, and supplies a number of fixed rate
> output clocks to the Ethernet devices including PPE (packet
> process engine) and the connected switch or PHY device. The
> CMN (or 'common') PLL's only function is to enable clocks to
> Ethernet hardware used with the IPQ SoC and does not include
> any other function."

So the block is called "CMN" in hardware programming guide, without any
explanation of the acronym?

Best regards,
Krzysztof


