Return-Path: <linux-arm-msm+bounces-64122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F50AFDFFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 08:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4452D3AA980
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 06:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D78026B2DB;
	Wed,  9 Jul 2025 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KRn8V0Zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17011BE6C;
	Wed,  9 Jul 2025 06:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752042999; cv=none; b=eCKWV7AQsOOR0WMcWnvBBT/ItQkpTGBsdSGqiD7EkDdDC8z8H3EUBwFeblf57izHLG+4smOrJCmUxwKYpoZnIdgyU/m9XEWUdvKOftx1u55ZSZIr+L7PK/HwklEVEaNP38sJQNFXK2Md8nMAKDzwXpN45gx105DkU3HOs8NuAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752042999; c=relaxed/simple;
	bh=t7TNE8T/BN5q/u1c7kQTCoIQImHkT+2oHgODk/uKb1k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ab8dBbQUYcpH+WBtFc4F2MAF08/7pyDFO5209QNpiYFsr4anJrhqTI3ZVKmpy+35rXciLFrq0pWGMcwneu8AZ/0TEFik7pyDx14xw7sRVDYPAwLpasIx9tzli4QEhwqwnbM6yqsyKjRWDnogqYvnnTaC3O3NdezAs11hEVOcTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KRn8V0Zu; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CBC64435E;
	Wed,  9 Jul 2025 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752042994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vUc1rTTw2VyF7BAekd7omjo2Z8aYGYza6CVNbqcGY2U=;
	b=KRn8V0Zu0jfIjR28YR78LyIj8tqF3rpxEbNoc3XNnxRi4aiiY/gECZ+tae/K/8LhdGI9tD
	UpSGuZpA8HRAJL7Upe2d7+exLpLO1ditmmG2MwmYf5tuI+EkAz4JCWrWmOCEAZ280BveNy
	uAuDKP/tG/i+8krVn1cYjqS451yYW3M0bubz7NN1UkBgB0urhghuq+jtdJRUly0mOHD9Zz
	KdT1ByLn3BPKYv7vu0mnLVu602OfAhMjLmjQKxtJqU2cpqfy7XWDfbxSwJQGpPZUHjC9GB
	anUGsx253/1Obtp2OXvDkdMhT9gzxIPqjGVf8B1xqWaBrS2uxNsHCck9FVzbOw==
Date: Wed, 9 Jul 2025 08:36:29 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>, Dimitri
 Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v7 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250709083629.51c95507@fedora>
In-Reply-To: <20250708155733.GA481837-robh@kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
	<20250630143315.250879-2-maxime.chevallier@bootlin.com>
	<20250708155733.GA481837-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvudehfffgudefhfefgeeufeekkeekheeufeeiudehtdehuddtgedvvdfhueeuteenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesv
 hhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi Rob,

On Tue, 8 Jul 2025 10:57:33 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, Jun 30, 2025 at 04:33:00PM +0200, Maxime Chevallier wrote:
> > The ability to describe the physical ports of Ethernet devices is useful
> > to describe multi-port devices, as well as to remove any ambiguity with
> > regard to the nature of the port.
> > 
> > Moreover, describing ports allows for a better description of features
> > that are tied to connectors, such as PoE through the PSE-PD devices.
> > 
> > Introduce a binding to allow describing the ports, for now with 2
> > attributes :
> > 
> >  - The number of lanes, which is a quite generic property that allows
> >    differentating between multiple similar technologies such as BaseT1
> >    and "regular" BaseT (which usually means BaseT4).
> > 
> >  - The media that can be used on that port, such as BaseT for Twisted
> >    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
> >    ethernet, etc. This allows defining the nature of the port, and
> >    therefore avoids the need for vendor-specific properties such as
> >    "micrel,fiber-mode" or "ti,fiber-mode".
> > 
> > The port description lives in its own file, as it is intended in the
> > future to allow describing the ports for phy-less devices.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  .../bindings/net/ethernet-connector.yaml      | 47 +++++++++++++++++++
> >  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
> >  MAINTAINERS                                   |  1 +
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-connector.yaml b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> > new file mode 100644
> > index 000000000000..2aa28e6c1523
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ethernet-connector.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/ethernet-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Generic Ethernet Connector
> > +
> > +maintainers:
> > +  - Maxime Chevallier <maxime.chevallier@bootlin.com>
> > +
> > +description:
> > +  An Ethernet Connectr represents the output of a network component such as  
> 
> typo
> 
> > +  a PHY, an Ethernet controller with no PHY, or an SFP module.
> > +
> > +properties:
> > +
> > +  lanes:
> > +    description:
> > +      Defines the number of lanes on the port, that is the number of physical
> > +      channels used to convey the data with the link partner.
> > +    $ref: /schemas/types.yaml#/definitions/uint32  
> 
> maximum?
> 
> Or I'd guess this is power of 2 values?

All values that exist so far are indeed power of 2 values, but that's
not a strict requirement, there may be other values one day. I'll add
all possible values (1, 2 , 4 , 8) so far.
> 
> > +
> > +  media:
> > +    description:
> > +      The mediums, as defined in 802.3, that can be used on the port.
> > +    items:
> > +      enum:
> > +        - BaseT
> > +        - BaseK
> > +        - BaseS
> > +        - BaseC
> > +        - BaseL
> > +        - BaseD
> > +        - BaseE
> > +        - BaseF
> > +        - BaseV
> > +        - BaseMLD
> > +        - BaseX  

Heh I need to remove BaseX

> 
> This can be multiple values? But then how does one know what is actually 
> attached?

I don't see a scenario where we would put multiple values actually. I
need to update the code accordingly, but if we are in the case where we
need to specify in DT which medium we use, then that means we can only
use one.

Thanks you for reviewing,

Maxime

