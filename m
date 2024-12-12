Return-Path: <linux-arm-msm+bounces-41661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 209389EE030
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EADB71882CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59FD20ADE7;
	Thu, 12 Dec 2024 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8qXUcZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F7945027;
	Thu, 12 Dec 2024 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988209; cv=none; b=aobJFw0owFZt6vMUhfrBnclsVISWVCvnvuRk5gHPCIu5X/6VU9HqV56+/JVcmUfGZ2dcIIK5LZ3b7OksZExIkTg09RzXIJ55yKP1EftCFl02svOS/GDK80OxT4FAQum9G+Aqfe57ZQ2Pl4v+xgH0eu0Vi7z/lh3TZac/soCjskk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988209; c=relaxed/simple;
	bh=JZk+vkzVVHoIxLeiYJCOuR339GJF+lQkjwNZYJNxM88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLCUEtEnIvl8jsQzgVW7ryP6gs1ptotJnWWsuE+v3xRL0WWoY1McnS3ksiWf0CRnjRFXzQI/CDKbYh8vof/C/20ryh6VylGoDVohZToXsXdyyWojpEj/aGOW0XfvmLPI15LMAByRvGFPaDQayP+2OjHVU8+b4bgfE319neLwP20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8qXUcZ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B573C4CECE;
	Thu, 12 Dec 2024 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733988209;
	bh=JZk+vkzVVHoIxLeiYJCOuR339GJF+lQkjwNZYJNxM88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K8qXUcZ3Z5yASYBvKbj7xTYYiXDIFjtIJKpALdYOYbHXSpNbnyoZizBtINLHgilDw
	 Fd2NNAlV5V/Y62/PFS0x8N21tafJT1e9ZToploNZ2zyJG6BVkWKQwtrG5uPQPMIWTS
	 z0Y0fBd+CClMHxNaLh6wIAxAsa+wu9QZpnm7WS9yR0JRb4TgBFwtjI9CCgf/eBecA/
	 G44o010ZzG4jilRvLuNEXSZKVW6oF/pQ30qlXfY9TKS1+Qghse/AdXOo0Vr9RBAfxQ
	 zdWu6tVmNS7ExsDXELMtIoIq4VrGTJ8brHMJzXXVD6VPlWH9LRZNxvsvey5ppi5edz
	 tIkLVsZvsr7Mg==
Message-ID: <44c97ee6-ba32-452c-8b83-ad39139fd310@kernel.org>
Date: Thu, 12 Dec 2024 08:23:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ASoC: dt-bindings: add wsa881x-i2c binding for
 analog mode
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org,
 konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dmitry.baryshkov@linaro.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-7-alexey.klimov@linaro.org>
 <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>
 <D695QHHBLGUF.7HOOI1E8RMTS@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <D695QHHBLGUF.7HOOI1E8RMTS@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2024 21:35, Alexey Klimov wrote:
> On Fri Nov 1, 2024 at 7:57 AM GMT, Krzysztof Kozlowski wrote:
>> On Fri, Nov 01, 2024 at 05:31:50AM +0000, Alexey Klimov wrote:
>>> Add binding document for WSA881X family of smart speaker amplifiers
>>> that set to work in analog mode only and configurable via i2c only.
>>> Such devices are found in Qualcomm QRB4210 RB2 boards with
>>> SM4250/SM6115 SoCs.
>>>
>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  .../bindings/sound/qcom,wsa881x-i2c.yaml      | 103 ++++++++++++++++++
>>>  1 file changed, 103 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..51b040b134d2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
>>
>> Filename must match compatible.
>>
>>> @@ -0,0 +1,103 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier in Analog mode
>>> +
>>> +maintainers:
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> +  - Alexey Klimov <alexey.klimov@linaro.org>
>>> +
>>> +description: |
>>> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
>>> +  is a high-output power class-D smart speaker amplifier.
>>> +  Their primary operating mode uses a SoundWire digital audio
>>> +  interface however the amplifier also supports analog mode and it
>>> +  can be controlled via I2C. This binding is for I2C interface.
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,qrb4210-wsa881x-i2c-codec
>>
>> qrb4210 is a name of a board, not codec. i2c is redundant, codec as
>> well. 'x' is not allowed.
> 
> qcom,qrb4210-wsa881x-i2c-codec came from qcom-soc.yaml with the advice
> that it should be qcom,SoC-IP.

I am sorry, but qcom,soc.yaml is about SoC. Is this a SoC? It is the
first time I see WSA integrated into the SoC.

> 
> Anyway I am working on updating the qcom,wsa881x.yaml as you pointed out
> in another email.
> 
>> This is qcom,wsa8810 and qcom,wsa8815 compatible with it.
>>
> 
> [..]
> 
>>> +
>>> +      wsa881x@e {
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> The best I can come up with is "amplifier", or it should be at least "codec'.

amplifier, speakers, you can check how this is called in 10 existing DTS
files or their bindings for WSA speakers.


Best regards,
Krzysztof

