Return-Path: <linux-arm-msm+bounces-88895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F819D1C313
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 04:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1401302E312
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 03:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA513324B20;
	Wed, 14 Jan 2026 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWD5rE6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94464324B3B;
	Wed, 14 Jan 2026 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359849; cv=none; b=HzZrgOYu6hoI3OZavYs8iKvzpKC1NaMWXaqOgdgqpwIeR6aZ3OIvn7MrS+U43RkZ18dJ8z01YPYRECbu1op+0UIXIS4b4tX7GyULH67FquM8Pty3jlebvNZQYn2lK4x/Gq06oLgdJiJYJ21X8+mozqUVWyfNOfZ8ka+qd0T7A/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359849; c=relaxed/simple;
	bh=jJVWTKrbZnnrbSSyMrERZV7TPbUDbyAnpakRYlfbiWE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eTfjIm622Kw1Wle3O9IGCNpjBNKLVJIyLGrWLofuO0Grx2xO0zEeFFftPS4hwoHBEPsZ0CmEKIGqCM9lh5wfdF4ODcbzG6wa4YHKjrkkaPrNQAVhT0lBF7s/n4pp6DWNRYVVX6sm/PMqFQR5w+7HbNv81xncMtFP1/HH5OUbXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWD5rE6+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A330C19423;
	Wed, 14 Jan 2026 03:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768359849;
	bh=jJVWTKrbZnnrbSSyMrERZV7TPbUDbyAnpakRYlfbiWE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NWD5rE6+pXNTWgwxgdJh+3zWszpwjjMyTMfd6sG/wGgRdujF8GeSf5UXNMsTgpvYt
	 6WSrJOuOn+CTYXmfUd30Gmg/v+iQtOJmyX8WIiRnwp+7RnMng2qENI321/tAQqfmAc
	 rKoyogVmV83ymAyX0x5hpHNQtaPw7O1CNKsSpR1QHgVCjZTBSTUux6sC4xB7YSUQUT
	 fWwcJNVt2a6wHwqYr+nKeaqeooq9/0KBYVcgWl0gYkklRvxFEEYZcGclIChI2sRGsG
	 jZ1AutkgWo9HFWL04xFyHRtOF0Qw4W3hEJPNhecunfECJUmmV/+LQ577tXSf/G/W9D
	 ISJJpL1YLMpeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B649F3808200;
	Wed, 14 Jan 2026 03:00:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v22 00/14]  net: phy: Introduce PHY ports
 representation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176835964227.2565069.4308063830365885517.git-patchwork-notify@kernel.org>
Date: Wed, 14 Jan 2026 03:00:42 +0000
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, andrew@lunn.ch,
 kuba@kernel.org, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@csgroup.eu, herve.codina@bootlin.com, f.fainelli@gmail.com,
 hkallweit1@gmail.com, vladimir.oltean@nxp.com, kory.maincent@bootlin.com,
 kabel@kernel.org, o.rempel@pengutronix.de, nicveronese@gmail.com,
 horms@kernel.org, mwojtas@chromium.org, atenart@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, romain.gantois@bootlin.com, daniel@makrotopia.org,
 dimitri.fedrau@liebherr.com, tariqt@nvidia.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  8 Jan 2026 09:00:25 +0100 you wrote:
> Hi everyone,
> 
> This is v22 of the phy_port work. Main items from this versions are :
> 
>  - Rebase on net-next :)
>  - Removed a "contains" keyword in the binding
>  - Added a comment for phy_port SFP implementation
> 
> [...]

Here is the summary with links:
  - [net-next,v22,01/14] dt-bindings: net: Introduce the ethernet-connector description
    https://git.kernel.org/netdev/net-next/c/fb7a8d0786e4
  - [net-next,v22,02/14] net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
    https://git.kernel.org/netdev/net-next/c/3f25ff740950
  - [net-next,v22,03/14] net: phy: Introduce PHY ports representation
    https://git.kernel.org/netdev/net-next/c/589e934d2735
  - [net-next,v22,04/14] net: phy: dp83822: Add support for phy_port representation
    https://git.kernel.org/netdev/net-next/c/333c29a27f96
  - [net-next,v22,05/14] dt-bindings: net: dp83822: Deprecate ti,fiber-mode
    https://git.kernel.org/netdev/net-next/c/ffb8587363a3
  - [net-next,v22,06/14] net: phy: Create a phy_port for PHY-driven SFPs
    https://git.kernel.org/netdev/net-next/c/07f3ca9e092c
  - [net-next,v22,07/14] net: phy: Introduce generic SFP handling for PHY drivers
    https://git.kernel.org/netdev/net-next/c/d7c6082f7e77
  - [net-next,v22,08/14] net: phy: marvell-88x2222: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/ea317f077a38
  - [net-next,v22,09/14] net: phy: marvell: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/1384e1383829
  - [net-next,v22,10/14] net: phy: marvell10g: Support SFP through phy_port
    https://git.kernel.org/netdev/net-next/c/35d1a5464b47
  - [net-next,v22,11/14] net: phy: at803x: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/4e26a284b9be
  - [net-next,v22,12/14] net: phy: qca807x: Support SFP through phy_port interface
    https://git.kernel.org/netdev/net-next/c/154bc3b66c31
  - [net-next,v22,13/14] net: phy: Only rely on phy_port for PHY-driven SFP
    https://git.kernel.org/netdev/net-next/c/bad869b5e41a
  - [net-next,v22,14/14] Documentation: networking: Document the phy_port infrastructure
    https://git.kernel.org/netdev/net-next/c/62518b5b3d8e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



