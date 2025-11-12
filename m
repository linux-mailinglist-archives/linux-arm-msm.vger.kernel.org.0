Return-Path: <linux-arm-msm+bounces-81409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E4C52516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA41D3AD7A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC2B332EBA;
	Wed, 12 Nov 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUk0566x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37C31355E;
	Wed, 12 Nov 2025 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762951437; cv=none; b=moiF0MKA1hqFYNfDipOVeXjdW+k2h8bYUoeMzk+eO2KzrN8iNrEfk8yZk/bIzqGwWpuSkRsMSodp2+tLzyuRo85sKr5mOhUITWfDSrqjLaI0vpTxdwEPJYYCGcw8ocgiEATePN3xxx6vYfAJlrpstZ0T5czxTA6hFLkcstSRH9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762951437; c=relaxed/simple;
	bh=ANqlcL/lxDVL3cKzBO7YnssgrqZZpZVjE42b8mFuB0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pi+VC2ikem0HIVtPZ0EZMnw2cDwgqwa9m/SSdS+eKmbHqUZV9BeklE6QLDFnz10spnkznp/ouxPfhLAoc9Z5i6I3HJQtsda0IU9xHjO8SicSg1+LKY1uDg5pBmxGL/HMxwzxT1Lq64OSp64zsh/zHlT4iMeSlUAtsGUVWKz1As0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUk0566x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B5BC4CEF5;
	Wed, 12 Nov 2025 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762951437;
	bh=ANqlcL/lxDVL3cKzBO7YnssgrqZZpZVjE42b8mFuB0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUk0566xFHhr4vWog7/q9K565lO4dgAtycAOW/TPTuxa4vfk7esk/hfDvvMnjNLrG
	 gzN41cH1oicqcMZFv7VoJrXBGlyjzcUUfELbqaosAAvcE5BIg6zQf6y3zNKVxYBpeg
	 g+xyw21Ts0EywcFMRD+iE7v0qUfHhE9nPb4k4xyOnjBvUeuT65iVgNBAP/AW+cxvoU
	 WlSDZhdziKymIrWxJjSRXJZMDaYLmstmFrOy7GBnnU2ggUFUta0ahJ16zzyn7gbUDq
	 uVmU0QKT9RgADeXY+Q/593T9sCj2aALNW0byALOBauNSqctTEqSfQonsMi2tmRefm/
	 Wb8/3ViXZLxZQ==
Date: Wed, 12 Nov 2025 06:43:55 -0600
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
Subject: Re: [PATCH net-next v15 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20251112124355.GA1269790-robh@kernel.org>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-2-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:26AM +0100, Maxime Chevallier wrote:
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
>  .../bindings/net/ethernet-connector.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> new file mode 100644
> index 000000000000..2b67907582c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> @@ -0,0 +1,53 @@
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

Constraints? Wouldn't 4 pairs be the max?

Is it possible you need to know which pairs are wired?

> +
> +  media:

Both of these names are a bit generic though I don't have a better 
suggestion.

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

else:
  properties:
    pairs: false

??

> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 2ec2d9fda7e3..f434768d6bae 100644
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

Unit addresses are hex, index suffixes are decimal: connector-[0-9]+


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
> +            /* Fast Ethernet port, with only 2 pairs wired */
> +            mdi {
> +                connector-0 {
> +                    pairs = <2>;
> +                    media = "BaseT";
> +                };
> +            };
>          };
>      };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1ab7e8746299..19ba82b98616 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9276,6 +9276,7 @@ R:	Russell King <linux@armlinux.org.uk>
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

