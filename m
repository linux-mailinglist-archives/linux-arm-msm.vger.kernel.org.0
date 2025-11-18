Return-Path: <linux-arm-msm+bounces-82342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A9C6A235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D7CF14EE12E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6F035BDBE;
	Tue, 18 Nov 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7rOXQoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A24355020;
	Tue, 18 Nov 2025 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477428; cv=none; b=f9Yurk8j65ChgcXvj6SvmLUuB3teiZ2zHPlO7quFfPVDWUO52UvWZ4uX436G9bGDyscrWCd0HybLnFu8U0570ua+/qpwfPX0xqW5Hv7g1FLLQRh7Cr2LiqgaFyChpl3pMOLxM2fC2x3MWZfoKGavYELAp4GQU2WSCn+Vv6X+y20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477428; c=relaxed/simple;
	bh=1E4X4gefkIzYTETLSk5bvLuWm/KtogFFY1CDdvW0meU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3q+m+pOaXE/Iia3/DQBwXd+Hh5oh0wW+DanmpcbItQ/5uhMU7eg6++RQ+pApObah5TUGCUMUdPY25Wudk6loeqTdmBfc4Oi2HCa5cuwVZmQpaI9AJ6RJRFVWG9Pwfq1zE2eYuvqaY9rQGjLVuzLQdtlWhSPgY9Z8iHZtco4rJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7rOXQoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2768C4CEF1;
	Tue, 18 Nov 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763477428;
	bh=1E4X4gefkIzYTETLSk5bvLuWm/KtogFFY1CDdvW0meU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7rOXQoIC0LO3wczFpoOQkwAuSw/7ccNNDU0xkAt6kMBsNFiC7Grv6uzr3Jdg+aJf
	 xatZa4QuZIveV8uod2MgfDR/jbedLBEq3f0wVmruwv/5JoErT9nXzlOSErGMQZ/hBE
	 Jpl6chGel83nyc3+/mxHgkG6T2tOEOd8tXDH+VzOyVHZbuqZ4BNziVcJ47R7Gh2e+J
	 uc8sxipRcDiRMPEPJ0bg7yLwLlrpRzM2pFiaS+nRTy68gAuYu5/atdRyaIWFKe70ch
	 AN/Gx0+4HQkh8zegPQvCEBX2GPDpAjghwXKS0ENrlouwlQJcfSE+MhTp05ax1fMsD0
	 PdRSVsPzP6kPg==
Date: Tue, 18 Nov 2025 08:50:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>, davem@davemloft.net,
	linux-arm-msm@vger.kernel.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v16 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <176347742560.3223087.13861755734926034941.robh@kernel.org>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113081418.180557-2-maxime.chevallier@bootlin.com>


On Thu, 13 Nov 2025 09:14:03 +0100, Maxime Chevallier wrote:
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
>  - The number of pairs, which is a quite generic property that allows
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
>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


