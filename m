Return-Path: <linux-arm-msm+bounces-81947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC86C605C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 14:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9670C3B8D7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29EB2C15A6;
	Sat, 15 Nov 2025 13:21:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DEE2C11FA;
	Sat, 15 Nov 2025 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763212861; cv=none; b=pscPb8SEcng1A5PksV6d7lkHqMWf0AeQyC7a5ltwzpYGu444wumKO3zVVQ2t7FQjrY9heFsJNlOL3WXEmXGiJz9YVqFY0gidgq2dtATyI08RJduq5Bro7fdgAhiFW5re3On65lDWfqUZnCuZ+epDvPwDqh+qaRUGpQ+2z6OB0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763212861; c=relaxed/simple;
	bh=4s7nVQlxdDCMUraekTHf79alBAvvx1I64y5IhZZARAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIPVRAtZ0iuYfPKHG9rdqq4uHvPvgpGTy4DWPEz6pOfHj7HHBVISyqnYNYY25ttdi53mPzjLhT14on0/ML2Ej7PThZX+zKjMinuIv+G9E6a6i4sC8c67iTv4nqFXeHq6d8FEIhTUiYf7qAurxYnz9fsx3sCJMTN7aOqqTGznE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7v6G0cFvz9sSy;
	Sat, 15 Nov 2025 13:52:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PGr5geNtPDyH; Sat, 15 Nov 2025 13:52:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7v6F6R1mz9sSv;
	Sat, 15 Nov 2025 13:52:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BE1708B770;
	Sat, 15 Nov 2025 13:52:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OkSLQJsfn8js; Sat, 15 Nov 2025 13:52:05 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FFDE8B76E;
	Sat, 15 Nov 2025 13:52:03 +0100 (CET)
Message-ID: <95bb5163-a9f0-4d70-b647-a069483b1168@csgroup.eu>
Date: Sat, 15 Nov 2025 13:52:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-2-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251113081418.180557-2-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/11/2025 à 09:14, Maxime Chevallier a écrit :
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>   - The number of pairs, which is a quite generic property that allows
>     differentating between multiple similar technologies such as BaseT1
>     and "regular" BaseT (which usually means BaseT4).
> 
>   - The media that can be used on that port, such as BaseT for Twisted
>     Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>     ethernet, etc. This allows defining the nature of the port, and
>     therefore avoids the need for vendor-specific properties such as
>     "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>   .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>   MAINTAINERS                                   |  1 +
>   3 files changed, 76 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> new file mode 100644
> index 000000000000..2ccac24bd8d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Ethernet Connector
> +
> +maintainers:
> +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> +
> +description:
> +  An Ethernet Connector represents the output of a network component such as
> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> +
> +properties:
> +
> +  pairs:
> +    description:
> +      Defines the number of BaseT pairs that are used on the connector.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4]
> +
> +  media:
> +    description:
> +      The mediums, as defined in 802.3, that can be used on the port.
> +    enum:
> +      - BaseT
> +      - BaseK
> +      - BaseS
> +      - BaseC
> +      - BaseL
> +      - BaseD
> +      - BaseE
> +      - BaseF
> +      - BaseV
> +      - BaseMLD
> +
> +required:
> +  - media
> +
> +allOf:
> +  - if:
> +      properties:
> +        media:
> +          contains:
> +            const: BaseT
> +    then:
> +      required:
> +        - pairs
> +    else:
> +      properties:
> +        pairs: false
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index bb4c49fc5fd8..58634fee9fc4 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -281,6 +281,17 @@ properties:
>   
>       additionalProperties: false
>   
> +  mdi:
> +    type: object
> +
> +    patternProperties:
> +      '^connector-[0-9]+$':
> +        $ref: /schemas/net/ethernet-connector.yaml#
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
>   required:
>     - reg
>   
> @@ -317,5 +328,12 @@ examples:
>                       default-state = "keep";
>                   };
>               };
> +            /* Fast Ethernet port, with only 2 pairs wired */
> +            mdi {
> +                connector-0 {
> +                    pairs = <2>;
> +                    media = "BaseT";
> +                };
> +            };
>           };
>       };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0dc4aa37d903..92d6309a968d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9277,6 +9277,7 @@ R:	Russell King <linux@armlinux.org.uk>
>   L:	netdev@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/ABI/testing/sysfs-class-net-phydev
> +F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>   F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>   F:	Documentation/devicetree/bindings/net/mdio*
>   F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml


