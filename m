Return-Path: <linux-arm-msm+bounces-92425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC4WNFTdimlIOgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:25:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F779117E3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDC21302DE06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 07:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A366332EB0;
	Tue, 10 Feb 2026 07:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnmZuF8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FB309EFB;
	Tue, 10 Feb 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708303; cv=none; b=lspWaR+x/eDzzviU0Py2JtJeoTz2w8o3F9+YWHUdIRkD6uIjuJ2xxvdnw0EgRTBOXbl6gpY9/QquGawGB0ra+tMvjwIU+edyehN66hFRCJIBJtWSTdUj+hoMbu7i2RTKShcaguP6FoHzMQ7wMOE3Rom/JYlCcWumh8orJC2E6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708303; c=relaxed/simple;
	bh=NKabKm5bxXQzRG3wBqpraJyx74A7XUtBm0rlOFG7iag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JCl6Z0IoLv63yXDpaaV56gU5+TNrfdrZ2RhFbJ9cTkek7nMlo1lROR2mVZlNJgtyg/nLRfFXFNYEsJiiunkxeoz/6Z2VmhdYzYudTaJeyot7AqwZmg5wk1ExW4X5s/lRa+h9X3XYuaeVnnsU9N0LOy0LnftBb2UbxvvRnm/LKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnmZuF8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1485C116C6;
	Tue, 10 Feb 2026 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770708302;
	bh=NKabKm5bxXQzRG3wBqpraJyx74A7XUtBm0rlOFG7iag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AnmZuF8FPlL7U+DEcpntM54HDphYDNE41OcocmVHVcoS04EA0ntdCrL0u3NTUoeme
	 zLUMXu3oD/kSPaYg2gb3ptBzvydHBdiicYKoyhSLOv8VteFz+5S5Hr33mW9fKTP5DE
	 fh3buE72NGRcUgFBal6Izl1AlP7+JqkBqH6KrNlvaRAGpVSos5Kj2UQGP7knfTFaLX
	 6TvM0s5yCPFpFLFuhL2cj97m71IR7KeNPW1+9hMkmjaaulk8S/kZe5TYnWPIwsaio7
	 WNz8aKUT18l2g/JYoJle/RqHmNbi3Bm4gpGwvfuWeLXJVHPFNoL+L3q7gCOm22KSa7
	 q3WOshNWN4MVg==
Message-ID: <3bed0897-f04a-4d0d-81f5-eea34a0f833b@kernel.org>
Date: Tue, 10 Feb 2026 08:24:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-2-elson.serrao@oss.qualcomm.com>
 <20260206145544.GA207233-robh@kernel.org>
 <cb0693b2-b9fd-4880-86fa-26fd1259f5b1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <cb0693b2-b9fd-4880-86fa-26fd1259f5b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92425-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.3:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 6F779117E3C
X-Rspamd-Action: no action

On 10/02/2026 05:32, Elson Serrao wrote:
> 
> 
> On 2/6/2026 6:55 AM, Rob Herring wrote:
>> On Mon, Jan 26, 2026 at 03:38:22PM -0800, Elson Serrao wrote:
>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>> independent High-Speed UTMI paths, depending on the SoC. Each path is
>>> distinct with its own HS-PHY interface, connector/controller wiring, and
> 
> [...]
> 
>>> +  supported on up to two High-Speed USB ports.
>>>  
>>>  properties:
>>>    compatible:
>>> @@ -29,26 +32,62 @@ properties:
>>>      description: EUD interrupt
>>>      maxItems: 1
>>>  
>>> -  ports:
>>> -    $ref: /schemas/graph.yaml#/properties/ports
>>
>> You are breaking existing users.
>>
> 
> Thanks Rob for your feedback.
> 
> The original motivation for the structural change was to make the binding
> encode resources/topology that were implicit before. Specifically the EUD
> intercept of the UTMI path(s) between the HS-USB PHY and the controller, and
> the need to represent platforms with two independent UTMI paths. That led me
> to introduce per-path nodes and a per-path PHY reference.

I do not see how this answers at all the comment, so no, it's still NAK.

> I outlined the constraints and rationale in this earlier thread:
> 
> https://lore.kernel.org/all/5cec9127-bdc5-49d7-80e1-2ae26f81163c@oss.qualcomm.com/

And you were supposed to keep things backwards compatible. Are they? Not.

Anyway, the reasoning cannot be somewhere else. Must be here in the commit.

> 
> 
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +patternProperties:
>>> +  "^eud-path@[0-1]$":
>>> +    type: object
>>>      description:
>>> -      These ports is to be attached to the endpoint of the DWC3 controller node
>>> -      and type C connector node. The controller has the "usb-role-switch"
>>> -      property.
>>> +      Represents one High-Speed UTMI path that EUD intercepts. This node models
>>> +      the physical data path intercepted by EUD and provides graph endpoints to
>>> +      link the USB controller and the external connector associated with this path.
>>>  
>>>      properties:
>>> -      port@0:
>>> -        $ref: /schemas/graph.yaml#/properties/port
>>> -        description: This port is to be attached to the DWC3 controller.
>>> +      reg:
>>> +        maxItems: 1
>>> +        description: Path number
>>> +
>>> +      phys:
>>> +        maxItems: 1
>>> +        description: High-Speed USB PHY associated with this data path.
>>
>> Doesn't the DWC3 node have a phys property? You don't need it twice 
>> since you can walk the graph.
>>
> 
> Yes, the DWC3 node does have a `phys` property. I added a PHY reference under
> EUD to make the dependency explicit, since the EUD debug module is independent
> and relies on the HS‑USB PHY for its operation.
> 
> If the preferred pattern is to rely on the controller’s `phys` and discover it
> by walking the graph, I’m happy to drop the duplicate reference. My only
> concern was whether that makes the dependency effectively implicit—i.e., EUD’s
> correctness would depend on a resource not directly referenced in its own
> binding. If my understanding of how this should be expressed in the binding is
> not correct, please let me know and I’ll adjust v3 accordingly.

Binding is not for drivers, so term "implicit" used before and now is
not correct. Does the EUD has dedicated different phy? Yes or not?

> 
> 
> 
>>> +
>>> +      usb-role-switch:
>>> +        type: boolean
>>> +        description:
>>> +          Set this property if the USB port on this path is role switch capable.
>>> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
>>> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
>>> +          between the PHY and the USB controller.
>>> +
>>> +      ports:
>>> +        $ref: /schemas/graph.yaml#/properties/ports
>>> +        description:
>>> +          These ports are to be attached to the endpoint of the USB controller node
>>> +          and USB connector node.
>>> +
>>> +        properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: This port is to be attached to the USB controller.
>>>  
>>> -      port@1:
>>> -        $ref: /schemas/graph.yaml#/properties/port
>>> -        description: This port is to be attached to the type C connector.
>>> +          port@1:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: This port is to be attached to the USB connector.
>>
>> Both port 0 and 1 are attached to the USB controller?
>>
> 
> No—only port@0 is attached to the USB controller; port@1 is attached to the USB
> connector.
> 
>> Why can't you just add more port nodes to the existing binding?
>>
> 
> Do you mean extending the existing top-level ports like this?
> 
>   - port@0: USB controller0
>   - port@1: USB connector0
>   - port@2: USB controller1
>   - port@3: USB connector1
> 
> My hesitation with a flat ports list is that it doesn’t encode which
> controller/connector pair belongs to which physical path through EUD.

What do you mean? The index defines exactly which path it is.

> A graph walk starting at Conn0 could also reach USB Ctrl1, even though
> these are independent paths and not interchangeable.
> 
> Below is the high‑level topology of EUD connections. In the disabled state,
> EUD is transparent and UTMI traffic flows directly from USB2PHY0/1 to USB
> Ctrl0/1. When EUD is enabled, the debug hub is inserted on the selected path
> by the internal UTMI switch, so UTMI traffic on that path traverses the hub.
> The non‑selected path continues as a direct PHY↔Controller link (EUD can be
> enabled on only one path at a time).
> 
> 
> 
> 					EUD Block
> 			   +------------------------------+  
> 			   |                              |
> [Conn0]-->[USB2PHY0 ]----->|  -------- Path 0 ------------|--> [ USB Ctrl0 ]
> 			   |                              |  
> [Conn1]-->[USB2PHY1 ]----->|  -------- Path 1 ------------|--> [ USB Ctrl1 ]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> 
> 
> So to make the connector–controller relationships explicit, I kept the `ports`
> property under the `eud-path@N` child nodes. Please let me know if there is a
> preferable way to model this.
> 
> Thanks
> Elson
> 
> 


Best regards,
Krzysztof

