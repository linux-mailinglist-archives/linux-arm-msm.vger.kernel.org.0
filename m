Return-Path: <linux-arm-msm+bounces-69292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E33B271A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC343173969
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA2027FD44;
	Thu, 14 Aug 2025 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPRDvgWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2B923D7E2;
	Thu, 14 Aug 2025 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210868; cv=none; b=GnbV7zRfth74tNcHhR9qbqpbQ+Pesi7o7rVrY17gICWdRVssYctAJAZQAGRpKg5TB48bjh1kmzchhocrHuJGK9ywxqUsDO42sEQ21vu8QxQf9lt0r9JAwzlhmFHKx6XJL2hMNpnp9pXiKs7V6k69T8lbn391ybuGcrCwWSzZmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210868; c=relaxed/simple;
	bh=r5sVScVg8A+4RvvS2qufgrLSgNQ4hfZIM+ozBjWCA/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlwDhkEIUeiifkjpzuYJGv1TTtKhBlnTrHKctlGIPyuCjtoqVu6MMWiaaFQRckjrkT+v4gzIyL8BgxbTPt+xrP7omAXjwKw0apq3oPfHyxl6HPdko2O9MD23rXfH++JdGn/TizpWN+0+r276/YPlrm+kjgQ1ksLPfqUZDeh7mXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPRDvgWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E2BC4CEED;
	Thu, 14 Aug 2025 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210867;
	bh=r5sVScVg8A+4RvvS2qufgrLSgNQ4hfZIM+ozBjWCA/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPRDvgWKPpmzN7VJ2NuXCIhNUk20jsFdncWyMVJdPSCtDm2Mdpuqbyu2KbYY4Ctou
	 kQffSmYPoX7edg9+ZK2Ls6HIS1AGhO6N+RJ0jew1OVOCBGbC+YDl1DahkKC9bZcfTJ
	 jrCz2yko6n+qQfbrEhqNM+yUNY57d52ic1AIALYx3poUO30Dryfgw4kTknvlwQfTAN
	 FHei49OlsWYktOT61tiSUY850UnjADhShH2EkJTh2vMB+ur0yieyhTd/HErDvRTNjv
	 TSkq1CCv1Rbo8WmCfZBi0xkZ4hMdoBk3psBqOxtZ2yNb4n+w0fWTZCtCQIRfLkDpnX
	 YF842IRv9Va1g==
Date: Thu, 14 Aug 2025 17:34:26 -0500
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
Subject: Re: [PATCH net-next v11 06/16] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
Message-ID: <20250814223426.GA4036754-robh@kernel.org>
References: <20250814135832.174911-1-maxime.chevallier@bootlin.com>
 <20250814135832.174911-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-7-maxime.chevallier@bootlin.com>

On Thu, Aug 14, 2025 at 03:58:21PM +0200, Maxime Chevallier wrote:
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../devicetree/bindings/net/ti,dp83822.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,dp83822.yaml b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> index 28a0bddb9af9..c1fd6f0a8ce5 100644
> --- a/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,dp83822.yaml
> @@ -47,6 +47,9 @@ properties:
>         is disabled.
>         In fiber mode, auto-negotiation is disabled and the PHY can only work in
>         100base-fx (full and half duplex) modes.
> +       This property is deprecated, for details please refer to
> +       Documentation/devicetree/bindings/net/ethernet-connector.yaml
> +    deprecated: true
>  
>    rx-internal-delay-ps:
>      description: |
> @@ -143,5 +146,20 @@ examples:
>          mac-termination-ohms = <43>;
>        };
>      };
> +  - |
> +    mdio1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      fiberphy0: ethernet-phy@0 {
> +        reg = <0>;
> +        mdi {
> +          connector-0 {
> +            lanes = <1>;
> +            media = "BaseF";
> +          };

If you respin, just add this to the existing example.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

