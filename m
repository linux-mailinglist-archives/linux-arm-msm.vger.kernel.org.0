Return-Path: <linux-arm-msm+bounces-83697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E2C913BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8540B4E9FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2A62E7F39;
	Fri, 28 Nov 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jL2lRw+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4D92E7186
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764318868; cv=none; b=p+ymnaHQFH2qHgOUB/bhB1wZlu9qLbKiQd+Dlq/sDLNLolLnlJO3gbNheXXJKcAP+6rFUY4308Cc+bxFr5xwMm8ge3ekrCf86V8STrFylSDRlnHXr/i0QFvyNkqBXs9xDKVHo9fdyCJhzU/aYS6CVwF5CwFgl0O8oS3Ep4/aWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764318868; c=relaxed/simple;
	bh=Us60MkmM1JBxfHUQhViQbEpdjWLDx5b8qa9Za3ab5F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1TWiuD7Zfo5TWucBWjf5eTTMKAgs3x1iBfxS0UAJ6in0eUas5vY8djnpDtpUTewnYjc11cngiEkSPlydmRjvafE77MyjKcgD9Q6DDyO51Y9qDsu1+7ZA/Mm+j5w0B2zCwocn/GuyIq40iFrC6MinA+x0spC8QFPrkbUzlVFaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jL2lRw+t; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6B42B4E41946;
	Fri, 28 Nov 2025 08:34:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3542F60706;
	Fri, 28 Nov 2025 08:34:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98471103C8EF1;
	Fri, 28 Nov 2025 09:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764318862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tgzdODyZLz4GqNmYM3p+s4koXLC462zunCov83SK9t0=;
	b=jL2lRw+ta61DisBvuQJKHw75eiScP4u/1eTq3Dj/KyRjxC3HVIySdyvLe8gSIopegLCoT/
	+Uia2DSqjS8XMe8u1I2OTmhBnCvSELWEu+5Ehg+vwRe6VOy+dmWcv/qVFteEOwoB2G+t2r
	joPlaQWkBOl8qiD1HuDQFn7nSwQgb/S/Ei2ayADTXDtoxlOav4V4ZnWfrtBn7k7BOkgWDC
	KID8FwOyJXvlt1wtcFRKgExuatU20+T1XHrO5LSpGMdbMe682d6vpu+kX5RDlTr+F3PhvL
	BsTDqkzZGLpxkRR0H8HwX3fiM4cVIesD2WLVhzB4FFz6ZAlzdjfggDZ6b5O64A==
Message-ID: <b8d12481-2637-470d-a3f1-784c0d7b4b3e@bootlin.com>
Date: Fri, 28 Nov 2025 09:34:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, davem@davemloft.net,
 Daniel Golle <daniel@makrotopia.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Herve Codina <herve.codina@bootlin.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, mwojtas@chromium.org, Antoine Tenart
 <atenart@kernel.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>,
 Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-2-maxime.chevallier@bootlin.com>
 <176426738405.367554.14295793625592890396.robh@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <176426738405.367554.14295793625592890396.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 27/11/2025 19:16, Rob Herring (Arm) wrote:
> 
> On Thu, 27 Nov 2025 18:17:44 +0100, Maxime Chevallier wrote:
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
>>  - The number of pairs, which is a quite generic property that allows
>>    differentating between multiple similar technologies such as BaseT1
>>    and "regular" BaseT (which usually means BaseT4).
>>
>>  - The media that can be used on that port, such as BaseT for Twisted
>>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>>    ethernet, etc. This allows defining the nature of the port, and
>>    therefore avoids the need for vendor-specific properties such as
>>    "micrel,fiber-mode" or "ti,fiber-mode".
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
>>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

Hmm I don't see the connection between this error and my patch...

Make dt_binding_check doesn't show any issue related to the binding
introduced by this patch :(

Maxime



