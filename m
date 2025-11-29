Return-Path: <linux-arm-msm+bounces-83851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512CC93D16
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 12:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9489B346DDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 11:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F4B30DD1F;
	Sat, 29 Nov 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7JzutlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673BE26656F;
	Sat, 29 Nov 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764416540; cv=none; b=ZEY6EbgUJIEP4cuCxtrOPeZ+B0RfOaixBxBXh+rxqTTv6gqIwAmTZfkOjt5b6YhlHg2oV98awgFwXe63SncTupJbVrozb+QMzrfUwmKCR4GUqihYttWmwHnDyWSVS/n4Qb3b2XMjmr7fgIMqUdVQiZHdZr54loQCCwX4NC4ZTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764416540; c=relaxed/simple;
	bh=OiJJoLGTt8ux1ryDxA1jS99SlMC/axq49Ib56TBKzoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALOFEXPJaGQHlFNcvHPmUDS716bJ3l4pIqJ52t0L8NjvzxoqMSyR9cS0l5H4zYu/WfzJTOVgHs1MpdZ4uld8RMST3Y6RhNbq6cPaDNFTnhsbhDAg8pTfSeEh/Gt2J40SEWCpiXvUFYcqAYRTaLOt0/vVfLdrR1g5oeRustcA1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7JzutlJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF4EC4CEF7;
	Sat, 29 Nov 2025 11:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764416539;
	bh=OiJJoLGTt8ux1ryDxA1jS99SlMC/axq49Ib56TBKzoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s7JzutlJmipipiOvOvZ9s6lS10qPsQMhiyI67iD32MQPADdmIEzOmvSMDa/B5DMRO
	 RY2omE5tkRjajZrWRIkJZf5tc8cXhQOTSlCJOOLXax/kE34E2T5dwTedawHBt27mlX
	 vkiuzWyUihH2Aqvg0mm+IA5JCd52ymeD9SRj+K0O55mtwnYvUHrB2jEGlpju2kj9G7
	 qiZgxTfq4nPK6HRxTSdsik+v59g+wbgzbrh1GdHt756tsPqkpc2yjnIr0zl822R7UI
	 TKbZnr6HOg9ebFVEmg5svPwriJ/v9x9ncE58VIGFp7KP6ycpDHt5CgJQ9OObUMUWq4
	 iC3AMqORk5diQ==
Message-ID: <f87d6e32-7b40-4e52-9460-6711486b4844@kernel.org>
Date: Sat, 29 Nov 2025 12:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 05/14] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Herve Codina <herve.codina@bootlin.com>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 netdev@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, davem@davemloft.net,
 Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-6-maxime.chevallier@bootlin.com>
 <176440811592.3523266.4372040709133421609.robh@kernel.org>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <176440811592.3523266.4372040709133421609.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/11/2025 à 10:21, Rob Herring (Arm) a écrit :
> 
> On Sat, 29 Nov 2025 09:22:17 +0100, Maxime Chevallier wrote:
>> The newly added ethernet-connector binding allows describing an Ethernet
>> connector with greater precision, and in a more generic manner, than
>> ti,fiber-mode. Deprecate this property.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>   Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):

No errors listed apparently, the bot has a problem.

Christophe


> 
> See https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Fpatch%2F20251129082228.454678-6-maxime.chevallier%40bootlin.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca89d85159e8a4a4e6a9d08de2f28c066%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639000049232512534%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=JOIl5FJPybTScu9tl2If5oN%2Fs46eLE4znVe7QXHALX8%3D&reserved=0
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


