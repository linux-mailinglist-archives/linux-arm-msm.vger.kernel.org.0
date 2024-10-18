Return-Path: <linux-arm-msm+bounces-34926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C929A3B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AEB3B2873B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C41201102;
	Fri, 18 Oct 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHipNUl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7E1898FC;
	Fri, 18 Oct 2024 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246978; cv=none; b=pHrELc1iev1ki5Tni/NKOrt4d8CQ3nKPCbLYUSh+hV6BMFheVs5PtdiAABqqXxaR5wAFG83/hY/7SNmJHzJk4uI3l6O7tXbUmuLiweUVMniyybVrPquLc18aaru3Y4rsM0CIkTAK8bVdGrDhy04z8Tq7FohDS4t3g6xqwUeIFKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246978; c=relaxed/simple;
	bh=Jaujs1oIoowqsKuffqsFGdTR5PkSAbzgqaQPxftX2po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj0d/USm8SlL7WcYPmSsWIrop2DOsHzaqHQ95f5+OVAC7s4dWXguJosMrGziblFHdEtQFcKNisIucqdok8NUjI544FEJ3yMHFSBoBm+ISUFydJEIwECVVqyiOGU292Rz5JoKmVU/ZJejQxNNkG52/+yCVZp/kw4qGk/iFpx2gDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHipNUl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C28C4CED2;
	Fri, 18 Oct 2024 10:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729246977;
	bh=Jaujs1oIoowqsKuffqsFGdTR5PkSAbzgqaQPxftX2po=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BHipNUl7C+3pfXcSn0He6whSY/tdKIYkUy6wyieGMQM22ZZmJEHfXRk/aCnNpb+xT
	 WWA/SImOrPKyVkDWFaKenmL4VIPnTScyfGEQSgdpB/lXeztxBom0BbRcLFCnM/W2h1
	 JGZR1nPZCm+6nchAo65XNIBC1hJ4ZsmCQ0kEBWG4seqPeg5Jz+YVr7s0HGSlozxYsB
	 ofyWGY1GwhxnXKfHRt4QzTdC8VgqsrkcQdX87wNYV/T2/z7J9c9SN9Fl6MsCjQKEBX
	 hs9ocE6xycuHRmf0ddZgy9XUi4wyutccsC06XYOocOgOSn8Oqlmyt6wSe+83ZY1Vdc
	 q5Ux/S8z/iUmQ==
Message-ID: <1c0fd59b-8f39-4247-af17-c31f149c1f3f@kernel.org>
Date: Fri, 18 Oct 2024 12:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Add device-name in the coresight
 components
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>,
 Jie Gan <quic_jiegan@quicinc.com>
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
 <20240703122340.26864-2-quic_jinlmao@quicinc.com>
 <980422ea-8c44-47a4-8996-8653bab3ef8a@kernel.org>
 <a82cd3f2-a8ba-4f19-820d-509dc45f74c1@arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <a82cd3f2-a8ba-4f19-820d-509dc45f74c1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2024 12:17, Suzuki K Poulose wrote:
> On 24/07/2024 20:13, Krzysztof Kozlowski wrote:
>> On 03/07/2024 14:23, Mao Jinlong wrote:
>>> Current name of coresight component's folder consists of prefix of
>>> the device and the id in the device list. When run 'ls' command,
>>> we can get the register address of the device. Take CTI for example,
>>> if we want to set the config for modem CTI, but we can't know which
>>> CTI is modem CTI from all current information.
>>>
>>> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
>>> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
>>>
>>> Add device-name in device tree which can provide a better description
>>> of the coresight device. It can provide the info like the system or
>>> HW it belongs to.
>>>
>>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
>>>   .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>>>   .../devicetree/bindings/arm/arm,coresight-stm.yaml          | 6 ++++++
>>>   .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
>>>   4 files changed, 24 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> index 2d5545a2b49c..6a73eaa66a42 100644
>>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>>> @@ -98,6 +98,12 @@ properties:
>>>     power-domains:
>>>       maxItems: 1
>>>   
>>> +  arm,cs-dev-name:
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    description:
>>> +      Define the name which can describe what kind of HW or system the
>>> +      coresight device belongs to.
>>
>> Don't we use already label for such cases? Power domains, input, leds,
>> panels, IIO, hwmon and more.
> 
> We do and if we can get hold of them, that would be ideal. but do we get 
> them in the binary DT blob ?  At least I couldn't see them on my Juno
> dtb.

I meant "label" property (a string). See above bindings.

Best regards,
Krzysztof


