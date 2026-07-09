Return-Path: <linux-arm-msm+bounces-117882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BtQYGOxRT2qQeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C982272DEA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:46:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=JVVrRNEg;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117882-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117882-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CFC93059909
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C893C9ED9;
	Thu,  9 Jul 2026 07:40:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73739936D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:40:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582859; cv=none; b=gkVxp5DgiN+6Kk/r0x34C2FwnuaLH3cqMPJZ1DiCrC68Ee3H7ebPv6ZJ6SRGUiUQWO6ibp+KdysbDjN5y6UOoAOctWnxtbQxtfMw2gf7Vdq3JqLUSEc0PhqiunakOcc1+pegan3XoDWUr06nvfee3b0wemBvkWnAMhFPXD9GSec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582859; c=relaxed/simple;
	bh=U1ulw6iBG5h9C17DYlIs4+DpjlK+5wjsawx9Qbz0V5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmcO8U8Hl2Nib7ISbdLkKvWkle4lVxLgQTJotH4rD45XG3RA7EdKrXNhlYyVcQg+NbP204byWaj68+C0FPCulmv69wwnxdepSlc59TTrlcSvtvdrdXsYNyFJRRLLD1Nl6gDJerueQnWimuFr2en0sqozjBqpscj6iGfU3adLhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVVrRNEg; arc=none smtp.client-ip=209.85.167.49
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b014810feeso35631e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783582855; x=1784187655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8yH1YNoaMWIJTqKTNCWri0730PMLmS7x/g08jHqQ684=;
        b=JVVrRNEg7Hiqk2W1qvBTujwEx81IKIQqtUgi6QKXYuRFZzTtWhN24O3fI7U8fu+Pxm
         VZJUPu1WFGZM7ubh+3TiIakavNbzzRRIJPAOgsteRdc8xk0TXMLZHXrczUqCs6msyKw9
         TWU06oUaMCkbVczwdmUrJmhQ72beI4sOElDK5t6LhJDLGJsmS543MmTsk0NPmNnWPu3E
         joHbBq2970zRsuq4J50TA6faLUo8GWbo14t71cdNfp6iyvO1k0H8vKks46XuQd4UtpAJ
         12/MZTON8sryBRMo4EETvYSUnyeOkRoDkHuJYi/KOlkSkIKofyYVvBShZq+n6G54BWMU
         Axzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582855; x=1784187655;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yH1YNoaMWIJTqKTNCWri0730PMLmS7x/g08jHqQ684=;
        b=S86UYTo4dDPAr24iNSkLFqLitAfkAlfw0u6VTLsZoGF/LthIwkCPn6e54g4jzOqIAy
         ptlOaf6c66jowChhysy92Z9BxrRoW5K6/Vr1wa2I3wU0Pm7gl0OSPpxJ5L49hcaZ4D4Y
         GzMxrYQCa0XvFdtXjKXFGah8CVStiZpCoeJN4LTNDn5f8fttr3Nf3vbeFdMic41mdpYZ
         H4iRzyTfRICwRHxGwTQMO5sM8Ueoal/Evr5LPTxXq6M0oe3lnuyUjxzH1THyAPwgl6+M
         lZpcQLHloT8u5Y+EZU7A8eAG4FE+Id/3bsCPfIcvD4zIifuXKeD3V/IzPQ62MPDXz4+C
         +FrQ==
X-Gm-Message-State: AOJu0YzE2yrBsLZmJxop8w8Sg+obicTWG8Z5EYzntU4njorcyHmQeuyr
	uCt7ytzqNnCCld9K+Xo2nYsbnqum5F7sw2x/8sdpGPlSYBVUDu7yld0iNfTudKcTuaI=
X-Gm-Gg: AfdE7cn2P0w3GEcERqu8HMONzLK6jVUNFaewxN26hcUSyUT+2QwlrfUWlJBAsOXnm4E
	lhs7AfAbo+QrEpn0E8b/wdgOYme55SEH7WP1mZv2pJVfSJmETYHK9STZoYRfW7mN1Kx2B1Q6IpV
	la1fPLQpn4WM68BODvaWKalQ35QIxsBWQ4X/xxHsEkuEKRvu9yQlZAg7pFq1V/Pv3b7LTB5fvel
	nzuBK2Pg8yQ66o2RN/g3lchvR+rzTw0lRRXNQBibsBUO5E4rdVoQzwMIb4uItunDW/HoX/1eUSJ
	vRtKt1awN3IGFnyWdw3YXpKkbjQ9VEZZaYLpxwKLDD89UN0/K7/fVFl0fOWArHHwNG3N/LEEbQc
	NHwhhWjCcsu/hdVHm6ksm4+l0wQfMni36KhSCsmAj/iSfjcO5LQWejPqfvLbhf1frWOPY6vg4FP
	u3Gfxrz0ykis2g/n74KK00jlVg7NvBbagpukgzR0WLyh5MSPqfRNDEC3umUlrwFJZHyNQ=
X-Received: by 2002:a05:6512:3ca1:b0:5b0:312:21ca with SMTP id 2adb3069b0e04-5b011474220mr806567e87.2.1783582855271;
        Thu, 09 Jul 2026 00:40:55 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c4acdsm5083912e87.76.2026.07.09.00.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:40:54 -0700 (PDT)
Message-ID: <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org>
Date: Thu, 9 Jul 2026 10:40:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org>
 <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org>
 <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117882-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C982272DEA8

On 7/9/26 00:55, Bryan O'Donoghue wrote:
> On 08/07/2026 08:44, Vladimir Zapolskiy wrote:
>> On 7/8/26 02:39, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>
>>> The schema here defines two ports with three endpoints:
>>>
>>> port@0: Sensor input.
>>>              endpoint@0: primary sensor
>>>              endpoint@1: optional second sensor, implies DPHY split-mode
>>>
>>> port@1: Controller output.
>>>
>>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>>> individual voltage rails.
>>>
>>> The need to model voltage rails on a per-PHY basis leads us to define
>>> CSIPHY devices as individual nodes.
>>>
>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>
>>> 1. The ability to define on a per-PHY basis voltage rails.
>>> 2. The ability to require those voltage.
>>>
>>> We have had a complete bodge upstream for this where a single set of
>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>
>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 202 +++++++++++++++++++++
>>>     1 file changed, 202 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> new file mode 100644
>>> index 0000000000000..a7fbf6804cd9e
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,202 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm SoC CSI2 PHY
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>> +
>>> +description:
>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>>> +  modes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,x1e80100-csi2-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>>
>> Unfortunately my review comment given before was ignored before publishing
>> this version, thus I will repeat.
>>
>> There is a clash between the proposed phy cells value and 'bus-type' property
>> of the media endpoint, the proposed value of phy cells brings no information,
>> and therefore the whole proposed '#phy-cells' prorperty shall be removed.
>>
>> There shall be no third link introduced between CAMSS and CAMSS CSIPHYs.
> 
> As explained in the cover letter: I'm following guidance from Rob on that.

Pehaps you've misread a given review comment, because Rob's guidance is
to remove 'phy-type' property, and so far there were no arguments given
against removing unnecessary '#phy-cells' propert, which is needed to
exclude the clash on peer's side between its value and 'bus-type' value.

> 
> 20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org
> 
> Old guidance granted, so let me see if I can get his attention to this
> matter. Perhaps your suggestion is fine by him if so then fine, if not I
> will stick to his original nudge, either way its up to him as the
> original reviewer and senior schema maintainer to call this one.

Hopefully Rob will discuss my review comment, at the moment there is no
any technical arguments against it from anyone, so it's still open.

>>> +
>>> +  clocks:
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: timer
>>> +      - const: ahb
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2: true
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
>>> +      - description: MMCX voltage rail
>>> +      - description: MXC or MXA voltage rail
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: top
>>> +      - const: mmcx
>>> +      - const: mx
>>
>> None of the power domains finds its place in this device tree node, the
>> child device belongs to CAMSS, which already enables these power domains.
> 
> Right, I think the whole subnode debate has run its course. Its a
> problem for JPEG and a bit of a fake debate, there is no real "bus" here
> so what is the point of mutating DT to look like a bus ? We are forever
> lecturing people about "making fake DT stuff for convenience".

Please remind me, what is the point of grouping CAMSS devices under one
device tree node? Is there an X1E CAMSS device?

> 
> Peer nodes with TITAN_TOP_GDSC will perfectly adequately describe this
> hardware and the JPEG too.

It's not an argument against my proposal to get a simpler hardware
description in the form of device tree bindings. Please address
the review comments actually received.

>>
>>> +
>>> +  vdda-0p8-supply:
>>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>>
>> The property name shall be vdda-0p9-supply, the description shall be
>> changed accordingly
> 
> Hmm what ? I'll have to look back through my notes, I thought the opposite.
> 
> Let me follow up in v10 after grepping for this again.>>
>>> +
>>> +  vdda-1p2-supply:
>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description:
>>> +          Sensor input. Always present. A single sensor is described by a
>>> +          single endpoint with one to four data lanes. DPHY split mode,
>>> +          where two independent sensors share the same PHY, is described
>>> +          by two endpoints; endpoint@0 with exactly two-data lanes and
>>> +          endpoint@1 with exactly one data-lane.
>>> +        unevaluatedProperties: false
>>> +
>>> +        patternProperties:
>>> +          "^endpoint(@[0-9a-f]+)?$":
>>
>> This is too wide regexp mask for one or two endpoints only.
> 
> Yeah you're right, this is just fluff.
> 
>>
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              data-lanes:
>>> +                minItems: 1
>>> +                maxItems: 4
>>> +              remote-endpoint: true
>>> +            required:
>>> +              - data-lanes
>>> +              - remote-endpoint
>>> +
>>> +        allOf:
>>> +          - if:
>>> +              required:
>>> +                - endpoint@1
>>> +            then:
>>> +              properties:
>>> +                endpoint@0:
>>> +                  properties:
>>> +                    data-lanes:
>>> +                      minItems: 2
>>> +                      maxItems: 2
>>> +                endpoint@1:
>>> +                  properties:
>>> +                    data-lanes:
>>> +                      maxItems: 1
>>> +              required:
>>> +                - endpoint@0
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>> +        description: Output to the CAMSS CSID controller.
>>> +        unevaluatedProperties: false
>>> +
>>> +        patternProperties:
>>> +          "^endpoint(@[0-9a-f]+)?$":
>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>> +            unevaluatedProperties: false
>>> +            properties:
>>> +              remote-endpoint: true
>>> +            required:
>>> +              - remote-endpoint
>>> +
>>> +    required:
>>> +      - port@0
>>> +      - port@1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#phy-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - operating-points-v2
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - vdda-0p8-supply
>>> +  - vdda-1p2-supply
>>> +  - ports
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    phy@ace4000 {
>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>> +        reg = <0x0ace4000 0x2000>;
>>> +        #phy-cells = <1>;
>>> +
>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>>> +                 <&camcc CAM_CC_CORE_AHB_CLK>;
>>> +        clock-names = "core",
>>> +                      "timer",
>>> +                      "ahb";
>>> +
>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>> +
>>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
>>> +                        <&rpmhpd RPMHPD_MMCX>,
>>> +                        <&rpmhpd RPMHPD_MX>;
>>> +        power-domain-names = "top",
>>> +                             "mmcx",
>>> +                             "mx";
>>> +
>>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +
>>> +        ports {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <0>;
>>> +
>>> +            port@0 {
>>> +                reg = <0>;
>>> +                csiphy0_in: endpoint {
>>> +                    data-lanes = <0 1 2 3>;
>>
>> The previously given review comment about numeration of lanes was
>> not implemented.
> 
> I understand your comment but as Nihal pointed out - CAMSS has an
> established pattern for this - and I think his argument is convincing -
> we should stick to that pattern.

I disagree with it, since it's a new dt binding description, and the
issue is known in advance, it should fixed and not ignored.

>>
>>> +                    remote-endpoint = <&sensor_out>;
>>> +                };
>>> +            };
>>> +
>>> +            port@1 {
>>> +                reg = <1>;
>>> +                csiphy0_out: endpoint {
>>> +                    remote-endpoint = <&csid_in>;
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    csiphy_opp_table: opp-table {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> +        };
>>> +    };
>>>

-- 
Best wishes,
Vladimir

