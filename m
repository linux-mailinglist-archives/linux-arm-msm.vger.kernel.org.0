Return-Path: <linux-arm-msm+bounces-78065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA3BF428D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 02:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F01D3B5B31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 00:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D0D1F2C34;
	Tue, 21 Oct 2025 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RuVmwOUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9691C695;
	Tue, 21 Oct 2025 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761007251; cv=none; b=DCvK4wtl+3NE5SKzw2cZ7Sn/mrt/BfztDLe1sMgfdEm//hbqE50wd86WfjDnsFQnNpYHv3L6JyfyMUgsla+13fmngmnsNTvqnETjwMG++eP+A8Dj9bl19i3psTo9Re5V3uqIhzU1ykCOuXSJsExZaWs6Tw14f9kFisQXyIzHrJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761007251; c=relaxed/simple;
	bh=UU1RkXwZN8NwOrfKRqz1pbaC+bNTIeLHOSMus2MSmCI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tYowRB/HSRo5g5/kVWY1bPMnBYgQJynnIoWSNShIztGujfC+OjSIAe78HGSq1t9og1BlDy7wsau/RS7BGrzy6+/DhAxnS8b1mTLoQRWzL+kViy6c1g7baudk96e5EimJgkOwMtvaYt7bH02ZmqRLduHdCb6Sw1QeW/hgqjBklAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RuVmwOUX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F8AC4CEFB;
	Tue, 21 Oct 2025 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761007250;
	bh=UU1RkXwZN8NwOrfKRqz1pbaC+bNTIeLHOSMus2MSmCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RuVmwOUXaDCl969T+Def4jubbj5ikNZL1Jx+dMTQsZsDS/LntPH3l06U4H+N30OaJ
	 0iJUOXcIrix6lyQw/c0S5arVQH19mYzFYMxfDmHLYV10LYhcnA5wToKukUmz3TfFcd
	 UhpG5GehVxOG9PrEA2NWHu+QaoG8iQz6vY19Zow4+5SvQh/B6T4o8Qt7dcHJJb+rtm
	 7fYIZnsdZxRgs52WtPeOThufbn/RooNRUOnd9shGeA16HyvZItmqx7NAU2AILD2gsQ
	 3jyVQv/3Yup5sCGwmxrLirr0UYNWqw4fgY+Vl3YUdBeWN8UHqdQgqEtwYAIwlfFEoz
	 8ARJgAhOeJJSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADEF33A4102D;
	Tue, 21 Oct 2025 00:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: phylink PCS conversion
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176100723252.470828.3402215548050414141.git-patchwork-notify@kernel.org>
Date: Tue, 21 Oct 2025 00:40:32 +0000
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, quic_abchauha@quicinc.com,
 alexandre.torgue@foss.st.com, alexis.lothore@bootlin.com,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 yong.liang.choong@linux.intel.com, daniel.machon@microchip.com,
 davem@davemloft.net, dfustini@tenstorrent.com,
 emil.renner.berthing@canonical.com, edumazet@google.com,
 faizal.abdul.rahim@linux.intel.com, 0x1207@gmail.com, inochiama@gmail.com,
 jacob.e.keller@intel.com, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jszhang@kernel.org, kees@kernel.org, hayashi.kunihiko@socionext.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, leyfoon.tan@starfivetech.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, matthew.gerlach@altera.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 michal.swiatkowski@linux.intel.com, netdev@vger.kernel.org,
 o.rempel@pengutronix.de, pabeni@redhat.com, rohan.g.thomas@altera.com,
 shenwei.wang@nxp.com, horms@kernel.org, yoong.siang.song@intel.com,
 swathi.ks@samsung.com, yangtiezhu@loongson.cn, vkoul@kernel.org,
 olteanv@gmail.com, vladimir.oltean@nxp.com, eleanor15x@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 16 Oct 2025 15:35:22 +0100 you wrote:
> This series is radical - it takes the brave step of ripping out much of
> the existing PCS support code and throwing it all away.
> 
> I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> flag with Bartosz Golaszewski, and the conclusion I came to is that
> this is to workaround the breakage that I've been going on about
> concerning the phylink conversion for the last five or six years.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/14] net: stmmac: remove broken PCS code
    https://git.kernel.org/netdev/net-next/c/813882ae2275
  - [net-next,v2,02/14] net: stmmac: remove xstats.pcs_* members
    https://git.kernel.org/netdev/net-next/c/14f74bc6dc69
  - [net-next,v2,03/14] net: stmmac: remove SGMII/RGMII/SMII interrupt handling
    https://git.kernel.org/netdev/net-next/c/2e2c878a3141
  - [net-next,v2,04/14] net: stmmac: remove PCS "mode" pause handling
    https://git.kernel.org/netdev/net-next/c/ebc5d656b78c
  - [net-next,v2,05/14] net: stmmac: remove unused PCS loopback support
    https://git.kernel.org/netdev/net-next/c/19064a58bd3c
  - [net-next,v2,06/14] net: stmmac: remove hw->ps xxx_core_init() hardware setup
    https://git.kernel.org/netdev/net-next/c/aa1b6775aef7
  - [net-next,v2,07/14] net: stmmac: remove RGMII "pcs" mode
    https://git.kernel.org/netdev/net-next/c/70589b05a03e
  - [net-next,v2,08/14] net: stmmac: move reverse-"pcs" mode setup to stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/c7b0d7874de0
  - [net-next,v2,09/14] net: stmmac: simplify stmmac_check_pcs_mode()
    https://git.kernel.org/netdev/net-next/c/412d5f32cb36
  - [net-next,v2,10/14] net: stmmac: hw->ps becomes hw->reverse_sgmii_enable
    https://git.kernel.org/netdev/net-next/c/5d1e7621f869
  - [net-next,v2,11/14] net: stmmac: do not require snps,ps-speed for SGMII
    https://git.kernel.org/netdev/net-next/c/5c61db08d9ae
  - [net-next,v2,12/14] net: stmmac: only call stmmac_pcs_ctrl_ane() for integrated SGMII PCS
    https://git.kernel.org/netdev/net-next/c/045d7e5727c4
  - [net-next,v2,13/14] net: stmmac: provide PCS initialisation hook
    https://git.kernel.org/netdev/net-next/c/237e54caeaef
  - [net-next,v2,14/14] net: stmmac: convert to phylink PCS support
    https://git.kernel.org/netdev/net-next/c/2c81f3357136

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



