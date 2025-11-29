Return-Path: <linux-arm-msm+bounces-83850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 842C3C93D0D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 12:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E87833477E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 11:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62D30B527;
	Sat, 29 Nov 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6WUNJz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9722A4EB;
	Sat, 29 Nov 2025 11:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764416426; cv=none; b=IvkFNtPa/Df7+u0rhmHq4ulM1AkHDi1FnkqVG/17eeORuUfmFLT4AwVwVN0dNj7u8exwfMX2iSj6d4Q77SjHp2aO+5bywF0ApQIgwheQZmVpfIzZC2XorHgxOkhlXIJoeIJevpnhqbUn6iyQtIv6G0rH69x0oMqTz5HMLrsoqNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764416426; c=relaxed/simple;
	bh=rkc0SFY1jXLwTWHpMx0nncdAQVf5LkNyXZAWC8E23lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPrK25yVdnJ/pYEqeA20zL7MsXqwiC0m8MDFfvcVERppBVLOSzlLwyTu4cKRvmjgxBmWR+xYUdcQbCqrynmZkFRyOnUaGvTXqMyfvytvO5fcCBRkE7pRpBk0sZKPeZYqzBwDmRyHCfLZ4BlCE5ck6hEAzHg4gCyqdIsk6S4Yn6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6WUNJz5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53903C4CEF7;
	Sat, 29 Nov 2025 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764416426;
	bh=rkc0SFY1jXLwTWHpMx0nncdAQVf5LkNyXZAWC8E23lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h6WUNJz5xPskj0GkNAUsp99ssWs7bSg48Y65uDLHbxUd6InRpV98KIqJljrpDfLx8
	 sd15LRHAthip+3P4K2eK9l8OvNTZBf6W+VGLGdEiLuegJzeVzi0Plv+OKUUwiXmiBk
	 S+tTwqz4HJ+ssudxvhPmFgahVJ4KMNbK9O5uI1geiP3cs/b8yZwZ8bQHvTJiTULgJJ
	 b9u1X+tpOEDicfWLNtMjyMOoSfoLfgG9blXzbkWfFD0RkaqBvmr+xAHLMm5jd09iwn
	 MyL7lPc986yFSc4ADlKk1AYsdViNGJMsqWMFPLScUasmDvYdIzLSaIT7YKYTlkkLHJ
	 aQQLs1t5qv+kg==
Message-ID: <5dc32a3f-42d8-43d7-854b-3cf11c05544c@kernel.org>
Date: Sat, 29 Nov 2025 12:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Antoine Tenart <atenart@kernel.org>,
 mwojtas@chromium.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Herve Codina
 <herve.codina@bootlin.com>, Eric Dumazet <edumazet@google.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, davem@davemloft.net,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit
 <hkallweit1@gmail.com>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Tariq Toukan <tariqt@nvidia.com>, =?UTF-8?Q?K=C3=B6ry_Maincent?=
 <kory.maincent@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-2-maxime.chevallier@bootlin.com>
 <176440811455.3523222.6418355134728802633.robh@kernel.org>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <176440811455.3523222.6418355134728802633.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/11/2025 à 10:21, Rob Herring (Arm) a écrit :
> 
> On Sat, 29 Nov 2025 09:22:13 +0100, Maxime Chevallier wrote:
>> The ability to describe the physical ports of Ethernet devices is useful
>> to describe multi-port devices, as well as to remove any ambiguity with
>> regard to the nature of the port.
>>
>> Moreover, describing ports allows for a better description of features
>> that are tied to connectors, such as PoE through the PSE-PD devices.
>>
>> Introduce a binding to allow describing the ports, for now with 2
>> attributes :
>>
>>   - The number of pairs, which is a quite generic property that allows
>>     differentating between multiple similar technologies such as BaseT1
>>     and "regular" BaseT (which usually means BaseT4).
>>
>>   - The media that can be used on that port, such as BaseT for Twisted
>>     Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>>     ethernet, etc. This allows defining the nature of the port, and
>>     therefore avoids the need for vendor-specific properties such as
>>     "micrel,fiber-mode" or "ti,fiber-mode".
>>
>> The port description lives in its own file, as it is intended in the
>> future to allow describing the ports for phy-less devices.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>   .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>>   .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>>   MAINTAINERS                                   |  1 +
>>   3 files changed, 76 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

Those errors are unrelated to the blamed patch, the patch is about 
Ethernet the error is about thermal-sensors.

Christophe


