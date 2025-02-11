Return-Path: <linux-arm-msm+bounces-47597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEDDA30DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 200B71888415
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AAE24F581;
	Tue, 11 Feb 2025 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QNZeXL/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBC215799;
	Tue, 11 Feb 2025 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282690; cv=none; b=P+WG4Cc3mnl2GsN7C3Cis7PLyfTUbkMPvHOk2CaS7Er57ZkWwbFN/2WIPtvJ0khbyBAd0COhzsZakXKybi4kUOSLr+csVIacyskH4/4IuoOAK6AJ/g9gS2Eb7BfKchkT1Kwwx6SPlW7FBFOhvBi4yirxpflOMFn46MQJFrzAL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282690; c=relaxed/simple;
	bh=5Dq8VZkw9xNox4d9nXP+NDsofsDFpbC12ldyftrP/PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnxOTS6oOwmAUD4licrOHU2N5kInx92KN1gaQHG0Quc2L5eDeRzu5L0bxpA3XejNZxrmVyHyk44Ru4g9TmRSr6F4G1MI1mMr5EL6rHl4Yg+R1VQoTNbAixccqtr5pFOCvzmAbI1ZbIqUsWmtTWAr/mMT7DStmIbgyZAZRYuOZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QNZeXL/p; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VSeuhfOw8yfHQ+TWsCEpeuHvxKiIbFJlwEB/VaRLJIo=; b=QNZeXL/pfPJhHnQAz1R1qzLi/w
	OXuJqpxpgy+GIdKnoz+ivHnrTcVOJCAocPLD/vCv7xQKdndoeO0D2qz5w+wltF5y9aOof+SxqAzKM
	KSWnELbT/2kglIv9CgYbcoMgLbTf7acKQyJ29q2shPGklCJADXPgB5JOHE4ek1FKiLtk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thqsF-00D4ti-T7; Tue, 11 Feb 2025 15:04:27 +0100
Date: Tue, 11 Feb 2025 15:04:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 03/13] net: phy: Introduce PHY ports
 representation
Message-ID: <0ae41811-e16b-4e64-9fc4-9cb4ea1da697@lunn.ch>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
 <20250207223634.600218-4-maxime.chevallier@bootlin.com>
 <20250211143209.74f84a10@kmaincent-XPS-13-7390>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211143209.74f84a10@kmaincent-XPS-13-7390>

> With net drivers having PHY managed by the firmware or DSA, there is no linux
> description of their PHYs.

DSA should not be special, Linux is driving the PHY so it has to exist
as a linux device.

Firmware is a different case. If the firmware has decided to hide the
PHY, the MAC driver is using a higher level API, generally just
ksetting_set etc. It would be up to the MAC driver to export its PHY
topology and provide whatever other firmware calls are needed. We
should keep this in mind when designing the kAPI, but don't need to
actually implement it. The kAPI should not directly reference a
phydev/phylink instance, but an abstract object which represents a
PHY.

	Andrew


