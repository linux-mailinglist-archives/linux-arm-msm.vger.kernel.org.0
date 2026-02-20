Return-Path: <linux-arm-msm+bounces-93499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ErrEoNUmGmSGQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:33:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A096F1677F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 13:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC24930210D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646A433C52A;
	Fri, 20 Feb 2026 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEqg237b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE719C546;
	Fri, 20 Feb 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771590784; cv=none; b=eboBrRJa86Obfyrf33fSQZg1BQbFp3P8EjdhfS4Z6rApippN5PM1cLDJzVBbGHwQcP2qjFZz0f9ngIDAQmNZyO4uUeYg24ixre8ZEeFc4PeJRARS84vkjewMfmKTwZP7aeCEkSIEYJCpMilHP8Xufr/86lSXlwOfOh2D3yWQjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771590784; c=relaxed/simple;
	bh=Rry95Gc2fxlT8GKfq8DTVucLDStkB3OQ9fJQxU3L/9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKUtyorJyiec7HkPFppkPiPatcsmB1Ba5GzRUp9mrRhtgYS02IfLeCGOsEdnAsoxAC51c9zVXNcXAYmk8HzQkVhqySWhLCuQc0GYhkCYzH2G69BSw5CGgcsqLfGPrURlRoDrUPqWg+wuLSSlKJpBDPKo4u+RNrl4IhkrTtAdWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEqg237b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37DEC116C6;
	Fri, 20 Feb 2026 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771590783;
	bh=Rry95Gc2fxlT8GKfq8DTVucLDStkB3OQ9fJQxU3L/9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MEqg237blb0EzAeyK7sgE8RTY7jPQs2RJ3yJZGj8EsxZ9z3VZKDXXCUcOfv2SGPSF
	 Dqq8bG6gl0V+M7EdmjNHQS0jbFpPGk9313u53+4uExBia7yyKgsEqFko2Hat531cnb
	 ME/jtmzVqUYa3KqbS2G/n+8Mah/B0iY+ZTR+dthQQ5VRCyLSh7XQPWONbNJLH/J5wY
	 2Nc/W3IozHsCOc7S4Jx7Gy5JICilEOFaMaIby4OoZ3EvMOC63b6GTrpnGyUlltiWWI
	 nODBNUHrsSzv1BS6e6rKcMWPLCoYyPfmnZujA12vok7ANOFlsG7qESsh7vnzNk7Evw
	 wIL1Ax5eKW2pg==
Message-ID: <f8f6a51e-cc25-496e-ac42-4b8af276451f@kernel.org>
Date: Fri, 20 Feb 2026 13:32:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: add
 bindings for QCC2072
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
 janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260218114955.3970974-1-vivek.sahu@oss.qualcomm.com>
 <20260218114955.3970974-2-vivek.sahu@oss.qualcomm.com>
 <af950713-4a0d-43ec-8000-3400f546acbd@kernel.org>
 <55b6051f-dee6-4f05-96ac-e24752030d4c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <55b6051f-dee6-4f05-96ac-e24752030d4c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93499-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,quicinc.com:email,devicetree.org:url,bootlin.com:url]
X-Rspamd-Queue-Id: A096F1677F9
X-Rspamd-Action: no action

On 20/02/2026 13:05, Vivek Sahu wrote:
> 
> 
> On 2/18/2026 5:23 PM, Krzysztof Kozlowski wrote:
>> On 18/02/2026 12:49, Vivek Sahu wrote:
>>> QCC2072 is a WiFi/BT connectivity radios which exposes
>>> UART as an interface for Bluetooth part.
>>> It requires different configuartions and firmware, so
>>
>> different than what?
>>
>> Also typo configurations.
>>
>>> document it as a new compatible string.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>>
> 
> Different configurations like interrupts GPIOs, firmware binaries, 
> compat string. Commit msg, I'll correct it in next patch of this commit.

I asked not what is different but against which this is different.
Different than <here goes explanation>?

> 
>>>
>>> Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
>>> ---
>>>   .../net/bluetooth/qcom,qcc2072-bt.yaml        | 47 +++++++++++++++++++
>>>   1 file changed, 47 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>> new file mode 100644
>>> index 000000000000..7b27c2c651fa
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm QCC2072 Bluetooth
>>> +
>>> +maintainers:
>>> +  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
>>> +  - Rocky Liao <quic_rjliao@quicinc.com>
>>> +
>>> +description:
>>> +  Qualcomm QCC2072 is a UART-based Bluetooth controller.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,qcc2072-bt
>>> +
>>
>> Where are clocks?
>>
>> Where are supplies?
>>
> QCC2072 exposes M.2 UART as an interface for Bluetooth part. It doesn't 
> require clocks and voltage regulators to power it up.

Clocks, maybe, but power - I don't believe. AFAIK, sending radio
communication like Bluetooth requires energy. It is BLE, not BNE
(Bluetooth Non Energy)

> 
>>> +  enable-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO specifier for the chip interrupt.
>>
>> Interrupt? No, it cannot be interrupt. This can be only enable pin and
>> then description is redundant. Look at other bindings.
>>
>> Looks like matching QCA2066, except missing clocks, or like other QCA
>> devices with proper supplies.
>>
>> I don't believe that Bluetooth device works without power.
>>
> It is an interrupt to the HOST. I'll make it more comprehensive in the 

Still not.

> next patch of this commit. QCC2072 exposes M.2 UART as an interface for 
> Bluetooth part. It doesn't require clocks and voltage regulators to 
> power it up.
> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - enable-gpios
>>> +
>>> +allOf:
>>> +  - $ref: bluetooth-controller.yaml#
>>> +  - $ref: qcom,bluetooth-common.yaml
>>> +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    serial {
>>> +        bluetooth {
>>> +            compatible = "qcom,qcc2072-bt";
>>> +            enable-gpios = <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
>>> +            max-speed = <3200000>;
>>
>> No firmware?
>>
> 
> Firmware is required, it is just I've not added all the fields in the 
> example.


Add complete example.


Best regards,
Krzysztof

