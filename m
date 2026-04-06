Return-Path: <linux-arm-msm+bounces-101928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNmqNMNr02lViAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:16:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F353A22B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 10:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6348030036E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 08:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B04311C1B;
	Mon,  6 Apr 2026 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2ea06Yy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1630F957
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463359; cv=none; b=Yir3esjAN/YR5XnRJ6uGzsFDpeLDseyfSe05IVtzjgjnqmHuFofu2PfCB9uO4hit9CzN4zcBMFawTSG7tjwVUFH4gSqtsTfJSQ21YHm92jWt/Z/V/wX1IsUbh726k0m2say1b4zQtdbxWbiClyMowljd7Jhws7Q7u0KT9nmbZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463359; c=relaxed/simple;
	bh=BXSCMDcWSCT1X/PPmkFaDuuMIcNq+ICC4sZrvIHudAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAKzshGIg7hhQQEjCPSJ1R6/faQhW452jJVIWOPjiL9U4YmiaxP3IaqHMpngioo47F7HYKF1eH1tmrP6DRxSubMoVXlhvXXlB23HAA7f5x2s05I8jakfm9gbNNF/fCq3DZhYNNqG42hSbn9sQ8xgoUB26RSYsbCvyrO6EQj1AC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2ea06Yy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso344391266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775463356; x=1776068156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jZf5cnrrkq8dx84bXNNVnhn1yv8NNVpaiRpnVq4qxg=;
        b=S2ea06Yy4PC/Kxv6wqGbCms7lGd+1VzdgRRiIPgg8O/MvojuCMKJ80prqtyvsen0D8
         aNhmboBi7cgMJHmKl5JPdDaDzFgw6f8i0N5CjG4970Eiw8P+azmUeCpK3wbUwNf7FD/y
         /0Zt1cAdXPSWYPF6P2CnP0K3CcDrD8M4H4QRJDyYxfqvBbXy3HnUSP6YZWmtG2oz3ikF
         AsncQvbrc90d8qg2PA4Z9zptxtkOMoxO8hJXTT9XS/o5sfxsQcqf1nMvPWFGQNzBZsLF
         TQnPEmTLmqhymCF4k9C1Y5tyaoWeLptqU6KJ796FZZc1dUldz9JXmOOi0OxUBOs8cIbw
         8oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463356; x=1776068156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jZf5cnrrkq8dx84bXNNVnhn1yv8NNVpaiRpnVq4qxg=;
        b=OAXZQnHlRPU/rr178SmJLTn0T5UJ8JHezH3b/Ytej5TwOxrV+AM8/Xxw8HEFMYHVLH
         Fm+3hho/zVsmXfmFdKGTO0edCzO0XLWAl3UlKlqATaKIq/OIFVM5EtGubg+FAWt+24Rk
         skx3eBX0IJGeAuDDFq2e0YdNzjTYgztcj/yjn25pV7cRCG4FcRX9N17HP5L+HZtImE1d
         DfRLks3Liwf14cza+sCZed79KYEa0VvBCIRKEu9AuMhEctKaobv1jeky/wpTBAzAYWkQ
         szmnumf/gPrkBBKl1FvU8pyQqbTZ1HxGspDxJQtu69iz/Vq/3sByid204Bi1qC7Gxf8r
         wrnw==
X-Forwarded-Encrypted: i=1; AJvYcCWcKDL2izQqdSA1Ydp8SOz5K1/W/r0d40WIHxsOGwLPPfJuJX1exrQdt4Z/jHClSmPzOm+rKeSNfWC3CPOw@vger.kernel.org
X-Gm-Message-State: AOJu0YwMgijpX1YoSeREUlxVCKkxhFOq6jYMrbCn26F66vOrz1NqDHqK
	S7CJkIdfA1qZdWMqTq0I7EY5Rp4TeUqF9c/G5QAfHALBSmiHppRNFhv+Ol6cpi6pQ0g=
X-Gm-Gg: AeBDievPPIyzplLpsDXCSZ/OYrTjw+PbWDB0TaB6fmo5v50AdBKXnbNEJIRXNDns2Pq
	wNTEBtXj8kzeKlWsKDcAq5E2XfoAdmhIxgZ2SsniDk5oDD9Q+vBh6zU5UkPFdpna2DcRBHfe94Y
	hr9WT2rXRIu5+6kGGltr5toDmmd0cZnKHILB87TY128NbCJ6rboJuyD23T+tK2qHc/hwGreUUuB
	a3GYp12GuAn8EQuN1qHJZxVFbmtPxhsJ4EKb4whhUjzgQGY0137sExiSLGQqRENop4Y/QpZ7ivv
	1booYwW7/wmYNCUSEFkWr76m1OclsolAfdVmAS7QWGpEd8UtVNzFPBDCwREMObxRl4Jh7qeBUkn
	XKYZdsp/fLcUz+U/FNKHrUq70NxMnBeGIJ8m2jfzaVnpaTpgKr/h/UcIHjWwrAs1CAFrgn0EVH4
	VhRrOq8WTs9HrFHDH3PYTQ3Og7dOuSjI5GCwU/x1gY8j/ly5zLK9ResqfMPNwyVQFwy90w/XiId
	M+yerYMkHXPj/XbXfg5xzP9z7K3MnXMyI1ZDA94nTMJYKNYMfhLrrq221sqtrQfOJ76kWOlXlX3
	XDZO/xcvTz2qdQ==
X-Received: by 2002:a17:906:2092:b0:b9b:1b9f:8397 with SMTP id a640c23a62f3a-b9c67b4d146mr344896366b.31.1775463355810;
        Mon, 06 Apr 2026 01:15:55 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d36f16sm3491001a12.3.2026.04.06.01.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:15:54 -0700 (PDT)
Message-ID: <4bef096a-9f0d-4609-a74c-088caf8fba1e@linaro.org>
Date: Mon, 6 Apr 2026 09:15:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
 <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
 <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101928-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,3b:email,vinarskis.com:email,bewilderbeest.net:email]
X-Rspamd-Queue-Id: 93F353A22B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 05/04/2026 21:50, Aleksandrs Vinarskis wrote:
> On Sunday, April 5th, 2026 at 02:05, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> 
>> On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
>>> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
>>> codename 'tributo'). It may be partially or fully compatible with EC
>>> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>>    .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
>>>    MAINTAINERS                                        |  5 ++
>>>    2 files changed, 96 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890fbef08c6c717c0aa6
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>
>> I believe the part name of this embedded controller is the "mec5200" so
>> instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"
> 
> Correct, its Microchip MEC5200. I remember reading some series discussion
> about not naming driver after IC its based on, but rather platform its
> used for since driver depends on firmware which is platform specific...
> cannot find that discussion now.
> 
>>
>>> @@ -0,0 +1,91 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Dell XPS 13 9345 Embedded Controller
>>> +
>>> +maintainers:
>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>> +
>>> +description:
>>> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
>>> +  and power management. It is communicating with SoC over multiple i2c busses.
>>> +  Among other things, it handles fan speed control, thermal shutdown, peripheral
>>> +  power supply including trackpad, touch-row, display. For these functions, it
>>> +  requires frequently updated thermal readings from onboard thermistors.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: dell,xps13-9345-ec
>>
>> Ditto the compat - name it after the IC not the laptop its a "mec5200"
>> or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit in
>> "mec" probably captures.
> 
> I'm not sure I agree regarding the compatible, its supposed to be as exact as
> possible. "dell,mec5200" will not allow us to differentiate between EC drivers
> of "tributo" and "thena" for example.
> 
> Suggestion:
> - Schema filename to be generalized "dell,mec5200-ec.yaml"
> - Driver filename to be generalized "dell-mec5200-ec.c"
> - Config to be generalized "EC_DELL_MEC5200"
> - Compatible to stay specific "dell,xps13-9345-ec", with fallback to
>    "dell,mec5200-ec".
> 
> I would also keep "-ec" to stay consistent with naming convention of
> existing drivers and bindings.
> 
> Let me know if this would work for you.
> 
> Alex

To me including the laptop model in the IC name, when our best 
information is that this same chip is used on both Thena variants isn't 
very logical.

The thing is the IC not the platform it resides on.

But if you think the firmware is specific to each platform - something 
like dell-mec5200-ec, dell,mec5200-xps13-9345-ec makes sense to me.

> 
>>
>>> +
>>> +  reg:
>>> +    const: 0x3b
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  io-channels:
>>> +    description:
>>> +      ADC channels connected to the 7 onboard thermistors on PMK8550.
>>> +      EC requires frequent thermal readings of these channels to perform
>>> +      automated fan speed control.
>>> +    items:
>>> +      - description: ADC channel for sys_therm0
>>> +      - description: ADC channel for sys_therm1
>>> +      - description: ADC channel for sys_therm2
>>> +      - description: ADC channel for sys_therm3
>>> +      - description: ADC channel for sys_therm4
>>> +      - description: ADC channel for sys_therm5
>>> +      - description: ADC channel for sys_therm6
>>> +
>>> +  io-channel-names:
>>> +    items:
>>> +      - const: sys_therm0
>>> +      - const: sys_therm1
>>> +      - const: sys_therm2
>>> +      - const: sys_therm3
>>> +      - const: sys_therm4
>>> +      - const: sys_therm5
>>> +      - const: sys_therm6
>>
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - io-channels
>>> +  - io-channel-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        embedded-controller@3b {
>>> +            compatible = "dell,xps13-9345-ec";
>>> +            reg = <0x3b>;
>>> +            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>> +            io-channel-names = "sys_therm0",
>>> +                               "sys_therm1",
>>> +                               "sys_therm2",
>>> +                               "sys_therm3",
>>> +                               "sys_therm4",
>>> +                               "sys_therm5",
>>> +                               "sys_therm6";
>>> +        };
>>> +    };
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b319a1b08d3425f4d712 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7236,6 +7236,11 @@ S:	Maintained
>>>    F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>>>    F:	drivers/platform/x86/dell/dell-wmi-sysman/
>>>
>>> +DELL XPS EMBEDDED CONTROLLER DRIVER
>>> +M:	Aleksandrs Vinarskis <alex@vinarskis.com>
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>> +
>>>    DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>>>    M:	Zev Weiss <zev@bewilderbeest.net>
>>>    L:	linux-hwmon@vger.kernel.org
>>>
>>
>>


