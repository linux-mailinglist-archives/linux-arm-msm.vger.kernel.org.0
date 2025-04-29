Return-Path: <linux-arm-msm+bounces-55994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D88A9FE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 02:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0116D1891FE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 00:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A0353A7;
	Tue, 29 Apr 2025 00:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpbcXX+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49E84C76;
	Tue, 29 Apr 2025 00:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745885497; cv=none; b=OIcLK98OxOVrWlcQ0sZqfOQVhhytK65zhH2HJiRatTErplycrgT5XhWyVqwAUuOj5yTUzBWWjNXfRYnbphinsyf8XL0URrnrHMjqg7vwtLpNgy2mNAtXad5MPnO3oalovOnKFt+3ckRGRiqXReED+R+yuFIDjnFjhK2rEPE/0pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745885497; c=relaxed/simple;
	bh=DVrq0+ozLB00QEXt1bw4mWGuFzEpnQXpfPtB1VF5uj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhYHEv2eW3gtKa4PWbe5QHcgrO2ywniOsJ95sxHlPPNva9p36exGoga/lftBPbXhoH2APRgERY5bGLjm7zBU30zg8M8aaoKSozEgtQYnPRqyb0FA8X/3lLBN2vr7LIQGkrK8rrW4DBx+hqWNpCfJaGUe7Zq8X32mzf24YUUmC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpbcXX+p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA52C4CEE4;
	Tue, 29 Apr 2025 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745885496;
	bh=DVrq0+ozLB00QEXt1bw4mWGuFzEpnQXpfPtB1VF5uj8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZpbcXX+ptzph1vmsG8OSHi+Sv2+ELaqX4uePfZQK1xgMaUZIHYpG3V7TPbWgxbCvs
	 DSGylViVIt8xpKawd4ImFuCqOL0nVcQ6L9WjyKyhy6d1OPug31VO5kTo/cLMGkVxsY
	 t+iPNgNcwVW/L0Loyt1FNckWNPnRgN15L8QaJ9XdJ7H8y+pwqLitq0qqtexVNggPtX
	 l6OgNW5EFPVbkzJlqMneEvgOLCUB/KJC7b+x3at+B+hFdOCAD9haJe7fOo4ejDTMXn
	 v0rBVvePXL57h/myOO2UVU4cDV0VcKZ8st9eL9OzF9WOqf+dC9jo2tcxjVlpILIpHW
	 JJ5hIEb7xwo9A==
Date: Mon, 28 Apr 2025 17:11:35 -0700
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
Subject: Re: [PATCH net-next v5 07/14] net: phy: marvell-88x2222: Support
 SFP through phy_port interface
Message-ID: <20250428171135.2fb182b4@kernel.org>
In-Reply-To: <20250425141511.182537-8-maxime.chevallier@bootlin.com>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
	<20250425141511.182537-8-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Apr 2025 16:15:00 +0200 Maxime Chevallier wrote:
> The 88x2222 PHY from Marvell only supports serialised modes as its
> line-facing interfaces. Convert that driver to the generic phylib SFP
> handling.

Transient unhappiness:

drivers/net/phy/marvell-88x2222.c:523:34: warning: unused variable 'mv2222_port_ops' [-Wunused-const-variable]
  523 | static const struct phy_port_ops mv2222_port_ops = {
      |                                  ^~~~~~~~~~~~~~~

