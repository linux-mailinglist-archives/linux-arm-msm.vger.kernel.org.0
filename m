Return-Path: <linux-arm-msm+bounces-64476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E0B00F2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 01:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E9C1C44C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 23:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB2928C5B0;
	Thu, 10 Jul 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id35bl8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F832235BE2;
	Thu, 10 Jul 2025 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752188485; cv=none; b=Ld6WaLVBmk3iL3w5YayrD5HJdWUrFFCSIJ8xeQ2GgVrpxVdqg4TMHopRt88WD6AK/Zmza1+LlRk9GaWcqRcqDHqsVu3aoQknQUGOWgznN8fbGgRjknlSg8eftadAkgJNCQQkqloe6lF+s5QqLpHMXfccMmwgkP74zUdrePaORKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752188485; c=relaxed/simple;
	bh=7ZHvFCmV3/wqSVJYpykZn9eCOEAwB+1FKd0S0WN3FJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdTBLP69H++1EEYXKK7aw6pQpiHCBsZkiwwhBrnuVoRkLZGpodL6zcfvACEMVzuyGPSmiJGM09Aj4MHjdYwssCM8s8VVKUQLM7JQ6ImEL0h7JxRrqW+hNF/LgdC1pDRsApR/73Dgyzg62NgLUSEFg3f6q6vOvOt68zSYWh5HYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id35bl8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535A8C4CEE3;
	Thu, 10 Jul 2025 23:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752188484;
	bh=7ZHvFCmV3/wqSVJYpykZn9eCOEAwB+1FKd0S0WN3FJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Id35bl8RsiWp5XMT7ujO65piGM28PG24E9ifGZSh5VQwSCi9hhfjkhRUKHd4iTuhp
	 BK93YsSjoGS07SIW3HAatdra9mZZ6to86sX8UlbPVZQEZWuNPHekOyk0gopFCu3UXm
	 UEj8axrjiiJqrwUkMHOjWKJwsgpxOfBYHZpJk2MS1M0JM82gPm4en2ske4uwIMsnPO
	 R5I5xPg6EgqfcpNx1iRUeRHVOfWG6k66jsdEvHC2yma/xKIprWj34/RUYOPRl0c/Y3
	 KqL0UyWXSNRW0Npd2e8MmQvlEhzhcM39SJ1VuHnQTQfC0hyHHTrSzdEDHpcG1LUnnd
	 M2gbS6Jzncyrg==
Date: Thu, 10 Jul 2025 18:01:18 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v8 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250710230118.GA31751-robh@kernel.org>
References: <20250710134533.596123-1-maxime.chevallier@bootlin.com>
 <20250710134533.596123-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710134533.596123-2-maxime.chevallier@bootlin.com>

On Thu, Jul 10, 2025 at 03:45:18PM +0200, Maxime Chevallier wrote:
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
>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/net/ethernet-connector.yaml      | 47 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> new file mode 100644
> index 000000000000..8765efc6e233
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> @@ -0,0 +1,47 @@
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
> +  An Ethernet Connectr represents the output of a network component such as

typo.

> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> +
> +properties:
> +
> +  lanes:
> +    description:
> +      Defines the number of lanes on the port, that is the number of physical
> +      channels used to convey the data with the link partner.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  media:
> +    description:
> +      The mediums, as defined in 802.3, that can be used on the port.
> +    items:
> +      enum:
> +        - BaseT
> +        - BaseK
> +        - BaseS
> +        - BaseC
> +        - BaseL
> +        - BaseD
> +        - BaseE
> +        - BaseF
> +        - BaseV
> +        - BaseMLD
> +    maxItems: 1

Drop 'items' and 'maxItems' and then it is implicitly only 1.

> +
> +required:
> +  - lanes
> +  - media
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 71e2cd32580f..6bf670beb66f 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -277,6 +277,17 @@ properties:
>  
>      additionalProperties: false
>  
> +  mdi:
> +    type: object
> +
> +    patternProperties:
> +      '^connector-[a-f0-9]+$':
> +        $ref: /schemas/net/ethernet-connector.yaml#
> +
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
>  required:
>    - reg
>  
> @@ -313,5 +324,12 @@ examples:
>                      default-state = "keep";
>                  };
>              };
> +
> +            mdi {
> +              connector-0 {
> +                lanes = <2>;
> +                media = "BaseT";
> +              };

Your indentation is not consistent.

I think we should consider a compatible here. Soon as you want to 
distinguish one connector from another you will need one. Though we 
could always retrofit that later.

> +            };
>          };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 881a1f08e665..b584f8dfdb24 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8959,6 +8959,7 @@ R:	Russell King <linux@armlinux.org.uk>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-class-net-phydev
> +F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
> -- 
> 2.49.0
> 

