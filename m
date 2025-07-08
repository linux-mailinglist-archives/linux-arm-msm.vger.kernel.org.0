Return-Path: <linux-arm-msm+bounces-64063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB8AFCFD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8841B16F964
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22322E266F;
	Tue,  8 Jul 2025 15:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1jepkKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4B2E2651;
	Tue,  8 Jul 2025 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990257; cv=none; b=LSWnIvO1xOdjhoqTK+bQHEo2bYD1V4ZOFZCWaZK+9k13xt/tNJ5wfpr6fgMFAdd/pfFwNshpTl1+DWZ2NnBB4aFMq7zxcIF9z6hF+1JxB3PU+fpONUMWVFTWxRW2OtnIiLhg4z7V9vjyIa1NqJjygol/33V2N7Z7VLr5NOMtyCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990257; c=relaxed/simple;
	bh=L2yUgoap+0fIAC1x2Nd6QW3SBW0rBu5+7f0Tcjm9Ywc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKMfCQve8MkQT5sNbsLyt8kfux73x0KyKpVkqsC9H0sAwGc5baJRgeA6+B2vlhXm4XzZ8+1byHI8CxR/pXEox/wmLVdWBdCM65CKhgdYORX/Crj7nU7URuUdcDFI1i0o6YkYl5/JYiCU754aI6iwDSUFy6EvH9WDDjJTMgxnFL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1jepkKC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F95C4CEED;
	Tue,  8 Jul 2025 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990255;
	bh=L2yUgoap+0fIAC1x2Nd6QW3SBW0rBu5+7f0Tcjm9Ywc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1jepkKCv2aJV5MgoCfhIinofXQ9i5ADG62GKPZyENWSaZ46dAiG/HxVlJgr94pAz
	 xfRhdveay8Eidb8cO4D+UyHmAQa8v0b9AoqF3U3S1YBD4E2mFXVukQyZxs+Qy3O9tJ
	 yy16ab348jwfbbLmIoAMWRUxFvaq99BScncWZbiIlN1u990ERXUtwAKU9H4czUrKiG
	 BqqUspmFPms+Cnep6drugVPK6oYZsWupxJDVah0QcAH480jBiXfNyaetaxBASmAw+V
	 kbUkzq1wi0Bjw+/00BA6CA/CiNpHC3CquXYI5DsJsu3ptmVlLN8CSnlD7usZvblvZg
	 ryFPdYYH3yvxQ==
Date: Tue, 8 Jul 2025 10:57:33 -0500
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
Subject: Re: [PATCH net-next v7 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250708155733.GA481837-robh@kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
 <20250630143315.250879-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-2-maxime.chevallier@bootlin.com>

On Mon, Jun 30, 2025 at 04:33:00PM +0200, Maxime Chevallier wrote:
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
> index 000000000000..2aa28e6c1523
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

typo

> +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> +
> +properties:
> +
> +  lanes:
> +    description:
> +      Defines the number of lanes on the port, that is the number of physical
> +      channels used to convey the data with the link partner.
> +    $ref: /schemas/types.yaml#/definitions/uint32

maximum?

Or I'd guess this is power of 2 values?

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
> +        - BaseX

This can be multiple values? But then how does one know what is actually 
attached?

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
> +            };
>          };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bb9df569a3ff..20806cfc1003 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8946,6 +8946,7 @@ R:	Russell King <linux@armlinux.org.uk>
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

