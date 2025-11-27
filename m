Return-Path: <linux-arm-msm+bounces-83626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6FC8F6F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E773B01F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 16:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DB62C3260;
	Thu, 27 Nov 2025 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DHM9AxF5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD202773FE;
	Thu, 27 Nov 2025 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259400; cv=none; b=PjRK8oUiMp1KCMBZx1o02/JLbMBrBHEA6GVmWT2WkachlAFalWS/xfO0WRdTnwvL2CQ3+OQ+Tq3u/PHpQYmSfPbacXPz2NWU4ICAtmo9PQVWTqXooXmKTEuHW6lmUSBEChwvcNImklp0bkO4yt8CIRJQCYthpxv553GGhfU0CyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259400; c=relaxed/simple;
	bh=sbgEdlv1wPoAwZUuJe05jWfgntu+pPSzCo3LKb3oZ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyrM/QdQKys41eNDoLYVHaUSNGUS5CSkct2Hn02ypPypajdYzyN8cOEw093roWu7R2qEklQhUMwWHWQt3lmk5PpZDefg1xvSIdB4tHreGJC9sIXtuSU4j8TH/BACDQKoMMRdIJk152LV//DKhVVQBjEPjjNE4Cu76D3lHq8Qtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DHM9AxF5; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=owe7I/Y8XZS6Idd5CW00nQx+Gv8h1DU+2jb8WZ+oZIQ=; b=DHM9AxF5Kp5fPteW+s9ySpUrNc
	VxKWImbzedUNvBzw0Dzc3MofZMiuN3ZN9vkwDu6t2SVunnj3PcmjJdVloqjR7nvSXvrgSnFIn15aS
	rAtEHsjFbJKvcWfE3dFE72+9XDhg7/bG1DeP5rHxxhzW/VOeTnGnP/OFT6zCiNg4hPZk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vOeSY-00FHHL-3U; Thu, 27 Nov 2025 17:03:06 +0100
Date: Thu, 27 Nov 2025 17:03:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Mason <clm@meta.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Eric Dumazet <edumazet@google.com>,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <92076cf5-e136-4bcb-8ae7-58fdf93dcdf2@lunn.ch>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>

> It's a bit tricky I guess, as the call-site in question
> is introduced by a previous patch in the same series though.

That is an interesting point. Does the AI retain its 'memory' when
processing a patch series. Or does it see each patch individually?

We encourage developers to create lots of small patches, in a patch
series. The AI needs to be able to handle that.

	Andrew

