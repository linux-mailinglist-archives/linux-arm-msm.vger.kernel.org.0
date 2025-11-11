Return-Path: <linux-arm-msm+bounces-81173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B4C4B71A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314A23BB35B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F210B31A55B;
	Tue, 11 Nov 2025 04:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="JZPytzXF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD9C33987;
	Tue, 11 Nov 2025 04:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762834303; cv=none; b=OkjCflzG/5O1z0DbIenlPhDk+YTSHw0m/zzBNm7MT2lG7o45MHUpYAtxJfXfc42uKRN42agz+qVe4K076rKr4gAGK0aQSvENGyrMMEeFXrsWQDoWb0FuEIkZ5KC1CYMjnENn/NE6IJArdmelbd8aakdOf/w3u3dbVKrbMOZZkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762834303; c=relaxed/simple;
	bh=CobPXz5uURwOv386V1OmSFqu0LXr8SDsWHn+XUgopdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj7IGl8KKh4KhIPXvaGicMfTF+5NEIA3q7Ull3W4QomUtwnkjz/8lKSvp2DsgQKrY3xlWEeNnb3CuJK8axiCzNBWv2ZUnsmxsGWMmLwcmLJudBc3S2wJauQx4eKK1+PM9F45aC7G8VJVmyjfLQ2XFLB8H0AboDw3i6AQH/0FsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=JZPytzXF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/Fo1e2aPtAR+InvmfqQJdNsNmWu5GCVuPvozKsi/Gns=; b=JZPytzXFYtcpQGrQwbgkIwH0m0
	VKA3+fKZLAGVdrCi0UpOlZGbPUcrHmEjK9okLNhU2kBqDNBsNoCMsT5bDrzBhZaCr3dZOpIufWU+D
	Y47RDT/7/U11rttqiY/n+Bg/AQAQ+vIGCULi/35Z2FZJDMlG99z2kQMOAcbjV4qpwdpM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfj8-00DafP-0v; Tue, 11 Nov 2025 05:11:30 +0100
Date: Tue, 11 Nov 2025 05:11:30 +0100
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
Subject: Re: [PATCH net-next v15 15/15] Documentation: networking: Document
 the phy_port infrastructure
Message-ID: <8faf0011-c272-4b30-a657-7bdbd2ad18e9@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-16-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-16-maxime.chevallier@bootlin.com>

> +This model however starts showing its limitations when we consider devices that
> +have more than one media interface. In such a case, only information about the
> +actively used interface is reported, and it's not possible to know what the
> +other interfaces can do. In fact, we have very few information about whether or

'very little information' would be the more normal English phrase.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

