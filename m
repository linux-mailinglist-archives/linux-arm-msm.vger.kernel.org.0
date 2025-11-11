Return-Path: <linux-arm-msm+bounces-81166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD34C4B650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2AD2B34D83E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B732571AD;
	Tue, 11 Nov 2025 04:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="LwmDUyON"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF6320ED;
	Tue, 11 Nov 2025 04:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833817; cv=none; b=HHRaDu4b15K4emhEH9QUHuX8yCkIwhes0AwZOY0zIX4YuQhm/+9R1QjlYUvU5QRL3CkAIUhSqtBhI/PALi3rlf0xyxhaloZ58aH9/rJ/ioryaY9ah60Ih/5mvSz6/k6Yxn0DlGSBys0FmuUOVlNCgjrC3bilB2AEyWHT4Qva1qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833817; c=relaxed/simple;
	bh=RE0vv8UkeUfdxSTKXH+ylxEdakNDDWR5nViAQdL94W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Brz/Rue0u1L2MKz9Eni+FBN3FWzPV/gnNFtFB9MUxg8iEXc17pFC3vt7UfXMdY1riCJbvgeT1Ok5oeaPGifhkkMhQ70PJ3DfGdr7mCYN20Y8TWJoYY5t3cVfJfRNQ1fXgQQnK9v+4xU/kuuqfFhZvfWjd7xivc+BbiD2ZCkyx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=LwmDUyON; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WamB7IrVQXbNC1AWUtZflj8xdjdIjLDhhoTJ27g6W6Q=; b=LwmDUyONmHSmFUPTYR0jq+8zYn
	Jz6/D/dxempI/NaRiCTkcC14KGwzk7kEVpGdcjNCAQoCntAsi+wFMJo2NKK2VulHnYkGOwkYSSXVW
	AB6dXr0NyNsSp8SmWyid3ng7BTrSVZT/YgOjwjO9jnwcdCibWzpF6CVGdwYME96vQYTQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfbJ-00DaaN-Js; Tue, 11 Nov 2025 05:03:25 +0100
Date: Tue, 11 Nov 2025 05:03:25 +0100
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
Subject: Re: [PATCH net-next v15 10/15] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <5c41cea9-e268-43bc-af3a-13eb1ba5d4c9@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-11-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-11-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:35AM +0100, Maxime Chevallier wrote:
> Convert the Marvell10G driver to use the generic SFP handling, through a
> dedicated .attach_port() handler to populate the port's supported
> interfaces.
> 
> As the 88x3310 supports multiple MDI, the .attach_port() logic handles
> both SFP attach with 10GBaseR support, and support for the "regular"
> port that usually is a BaseT port.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

