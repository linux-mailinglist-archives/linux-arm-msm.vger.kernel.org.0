Return-Path: <linux-arm-msm+bounces-81168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9EC4B6AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 59C164F33BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E4D3148D8;
	Tue, 11 Nov 2025 04:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zh3SjUq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5126ED36;
	Tue, 11 Nov 2025 04:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833941; cv=none; b=SCatlsDFNzKPqTiyX/UYm2ylsVDQUPyeE+hIwlVGyuay+27jrlDkV4UahGpM0aTfK14JosFgG65Gb84mAIMqMlMJ5NQhz9qmfSA7C99EjU9xNMFaRyCaeSD9eIN94tPDqcLc9JVT1mTlgXP38IY4h8k3BUnHPf1g9iOzNRSnjcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833941; c=relaxed/simple;
	bh=ZLdGp5BcV9TxJfrMwhm0UFY8Mo7Iqc3UJOw84uI20Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKoINKnJItfUQTKSKzhRPVluu926Eag36H+lP8QEfPVsxDNw4l2lJfhc5DZ2XaQSErRmoYHPhKM9aVF6jdA86Q77Jb4k33zt09/ew54mz8NlAiYJzLobMPMklw2G/7VIR8c2EmWseOtcU77DXsmgi7GMhqkjpJDcEQZSXBbcNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zh3SjUq1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qbK2bCNaM2/+FmjtVO79+LIO+q1WyuCbe2JrCCHlvho=; b=zh3SjUq1cqg3OOq+e+V6JpH13Z
	1IDElN2EFxQO4Yh3rP9qUUmcK0zUh9NlZYjAy3PiTCy0lVoQlo0D+y1OrqsS7c5T3bknja4dbBghy
	DhPdVRJ4FkTDvR0g4Txk3M3hB1EjgrKnmzIk71SGuj42jSmxQucNWhrXrHj0PmtQQRMs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfdJ-00Dabl-Nj; Tue, 11 Nov 2025 05:05:29 +0100
Date: Tue, 11 Nov 2025 05:05:29 +0100
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
Subject: Re: [PATCH net-next v15 11/15] net: phy: at803x: Support SFP through
 phy_port interface
Message-ID: <9cf8558d-a1d4-475f-b552-eedfe3cba363@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-12-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-12-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:36AM +0100, Maxime Chevallier wrote:
> Convert the at803x driver to use the generic phylib SFP handling, via a
> dedicated .attach_port() callback, populating the supported interfaces.
> 
> As these devices are limited to 1000BaseX, a workaround is used to also
> support, in a very limited way, copper modules. This is done by
> supporting SGMII but limiting it to 1G full duplex (in which case it's
> somewhat compatible with 1000BaseX).
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

