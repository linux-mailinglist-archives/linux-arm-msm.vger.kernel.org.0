Return-Path: <linux-arm-msm+bounces-82413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F80C6C90A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BDA9734CBD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D792EA158;
	Wed, 19 Nov 2025 03:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tz3RVSUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B82E8B81;
	Wed, 19 Nov 2025 03:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522284; cv=none; b=V5WIWtaF96ATyumA4S0GBnXF/ccZcfz2QI2j8jfHDn/Q2xdKFsg+X9UyXeLIncs08D9UuxG7cwbcsKiqodf4igsYeRxdGft9mGU2ho8KyhLGY/Wmw0iEfRVFBMFlY35E9wVoa0beNsbIzxxYTdj5jggGC/j7kIkIYh+eBN/ODwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522284; c=relaxed/simple;
	bh=gxvdTPLxCEGTom2KcOW4d2OIxzZkBK8tZnnpHG/Yqoo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hQGuhP+d++KZZzTDx/Fn2d5+9UlEVlZ1YVlxmoym/6pFkeaw1VQS7wtANqyrg/9/b4eK4i5CoZDk4TiK/LX2RrThyn3G5c4Ro5QsDQTVLQgyM1z2kNV7mQPwrPCjeU94mlPJbMzu+K6Qi1IM2p91qtDyVKcL4VW9ZO4Bc1aMmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tz3RVSUy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C28C4AF17;
	Wed, 19 Nov 2025 03:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522283;
	bh=gxvdTPLxCEGTom2KcOW4d2OIxzZkBK8tZnnpHG/Yqoo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tz3RVSUy64qcOSIcwGieM3noZcd3gVKOBEsnFaJrFLXtpbA/sXEgOIkMFERtQTbrb
	 QTKvesIgOdtS5i3FRmBXs7ketsUPEin/mSp8UmqjIWq4OFdocC67Awp06GItVRjDgy
	 tTrNzx6NEEZNcpeMgtk3TkwS4JZxK5fhT2cR881LhEsLu3rHB62Huwxh5Wv6Vq4B16
	 97EH5U6In+fmrPnMMJd9CX3/fwL3GuVMQXnaWt+ph17MMrpUKRorloA8YTQAq3CNnb
	 L8JvbyckRFfPAgOBSC4kpAgwVkaGZsdH8pa6sSjp5O7JDr03peT2fZJ7Aw86EJzc5X
	 4v8jmCJGZS3Mg==
Date: Tue, 18 Nov 2025 19:17:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v16 15/15] Documentation: networking: Document
 the phy_port infrastructure
Message-ID: <20251118191759.28d14e32@kernel.org>
In-Reply-To: <20251113081418.180557-16-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-16-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 09:14:17 +0100 Maxime Chevallier wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9281,6 +9281,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>  F:	Documentation/devicetree/bindings/net/mdio*
>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
> +F:	Documentation/networking/phy-port.rst

I think you should add a MAINTAINERS entry like the one we have for
NETWORKING [ETHTOOL PHY TOPOLOGY] no? Please include some keyword matches
on the relevant driver-facing APIs if you can:)

