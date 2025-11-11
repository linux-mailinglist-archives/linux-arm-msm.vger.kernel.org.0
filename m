Return-Path: <linux-arm-msm+bounces-81169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A9C4B6E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CA9E3BA0F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A5D330B3A;
	Tue, 11 Nov 2025 04:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kIJQogxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2D26ED36;
	Tue, 11 Nov 2025 04:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833994; cv=none; b=oDxSy0jlVSFoiG0idVdSaOah0Ufcl7+EvnZOMpmJNl7Gy+kO+zksTwG6sObNYPqhT0CM/oHzIU9wm5/gbI4xfsNUI4Vg4Y3tTt8rK0ZhcDaYMoolmhdqWLgHUswKNUSc+PRCKvYnfSdLleDLP6u6bblxkVwHiEr/v2WiexbiIU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833994; c=relaxed/simple;
	bh=X4m/8txw4qvLTjcfIDw7zPWD3dyH1I8XrpGEO7vVXrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sI8SNnE3N30h8/Bkym+p1OxupjsnCkRbdaKt0u2+3WQu+AlBovkCLQmKZqQmBJU0RPEZghs/ugRib222J0pkUepJsf/+20s7uLSfQPLsr/NrZOg46Pj/SJ+C7TgqxVjgNT4SLcIfA0euOAc5eSN0KTvNFdM1OpSF0IH/OKUqhlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kIJQogxE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=e43Mw9XYBP4YftlCJIlT61yxyiHaExE3+CHDtUjIQM8=; b=kIJQogxEZjSBtul0GXnj5VJp2R
	KcuSDFid5ZtBvAEp0yHVtNu9hSRlS1pezFsDKLk/p5HMWL9XO4UrBs66hQj18vihrIB56VhvFbG1F
	r16REZfkTPWWyv/qBXcEo6Ly2tC/s+TzsG7NpCWTUygkMq9chs6l09+eUsSiqMM5pm34=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfeA-00DacX-G0; Tue, 11 Nov 2025 05:06:22 +0100
Date: Tue, 11 Nov 2025 05:06:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
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
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 12/15] net: phy: qca807x: Support SFP
 through phy_port interface
Message-ID: <e2455f29-8709-4628-bd54-566b87143646@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-13-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-13-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:37AM +0100, Maxime Chevallier wrote:
> QCA8072/8075 may be used as combo-port PHYs, with Serdes (100/1000BaseX)
>  and Copper interfaces. The PHY has the ability to read the configuration
> it's in.  If the configuration indicates the PHY is in combo mode, allow
> registering up to 2 ports.
> 
> Register a dedicated set of port ops to handle the serdes port, and rely
> on generic phylib SFP support for the SFP handling.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

