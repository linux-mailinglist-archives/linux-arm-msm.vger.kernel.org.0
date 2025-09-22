Return-Path: <linux-arm-msm+bounces-74478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C140DB9394D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD87F189CC09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9524C26B769;
	Mon, 22 Sep 2025 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLcCG3mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDB12550CC;
	Mon, 22 Sep 2025 23:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758583817; cv=none; b=fUZTTSIQcUEoCgioQsIvnqIQs4cPMHc17sGetn6/rNX7djnvxs+gr4dMx3ZHRBwR1Zb+y3js6Vr7d68wWtrGvFw3jByNyO01gPnNdEjvrN27Sdy375KYjYfJEJoPwAUYNjpqLaAP2BruPvn93a+7RFAKv8GIERPLjx5HuoB1cDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758583817; c=relaxed/simple;
	bh=gozE7qQmncsZ3ohGWcoqEyCBNDVtCQsEIeD5UHrPC2A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NGpHGGSirw70yt1awSKrymhXRDvyru9uVR5IUl8PvDZKyoOeyEADNf0OoMwDAN95yQI4v7tWMJVdKP8ChfwgaTKeQx8tzGZ9RUHY0TBsN+Es9U34KopZZZyPkFDPFf/ZY6qShiezz43NfXGmjCYlTvSm1Z1id3GvFYNfI3Xgf/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLcCG3mV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB234C4CEF0;
	Mon, 22 Sep 2025 23:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758583817;
	bh=gozE7qQmncsZ3ohGWcoqEyCBNDVtCQsEIeD5UHrPC2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZLcCG3mVmeeCZz+ZhLvbjTnvk5qOaAfzqrv6kWdiRmCXJcDX1xTdjNto6tNCi3jZg
	 tDNucWPTSbOg/KHfv/1OHwicyRD8w8NLVGI8bojW/WJRo+jCJqsAk40YCpDW0B9lHn
	 ERfDQKErM76QqaQ4s0mq/ddD+ebztbshL33Pu+uz5QfnEaxPL5RoK5NXzbb2td247j
	 +BG8Ka0eArvswU22kRs1TU1cj+BBMcnfKX1dHT30et68GDS+alE5KUiOqbiHn2dsAF
	 8KeSxDcUEX0OQMfgQ6iohSDA9Tcljxsx2asZgVR+q+K+c50ZxQquy86uO9K3PT2u2O
	 Em41TejfI1DiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD2439D0C20;
	Mon, 22 Sep 2025 23:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: rework SFP capability parsing and
 quirks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175858381450.1192424.1598804133619406575.git-patchwork-notify@kernel.org>
Date: Mon, 22 Sep 2025 23:30:14 +0000
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-msm@vger.kernel.org,
 kabel@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 16 Sep 2025 22:46:08 +0100 you wrote:
> The original SPF module parsing was implemented prior to gaining any
> quirks, and was designed such that the upstream calls the parsing
> functions to get the translated capabilities of the module.
> 
> SFP quirks were then added to cope with modules that didn't correctly
> fill out their ID EEPROM. The quirk function was called from
> sfp_parse_support() to allow quirks to modify the ethtool link mode
> masks.
> 
> [...]

Here is the summary with links:
  - [net-next,1/7] net: phy: add phy_interface_copy()
    https://git.kernel.org/netdev/net-next/c/a571f08d3db2
  - [net-next,2/7] net: sfp: pre-parse the module support
    https://git.kernel.org/netdev/net-next/c/ddae6127afbb
  - [net-next,3/7] net: sfp: convert sfp quirks to modify struct sfp_module_support
    https://git.kernel.org/netdev/net-next/c/a7dc35a9e49b
  - [net-next,4/7] net: sfp: provide sfp_get_module_caps()
    https://git.kernel.org/netdev/net-next/c/64fb4a3ae8a5
  - [net-next,5/7] net: phylink: use sfp_get_module_caps()
    https://git.kernel.org/netdev/net-next/c/cab116519540
  - [net-next,6/7] net: phy: update all PHYs to use sfp_get_module_caps()
    https://git.kernel.org/netdev/net-next/c/4b6276550f07
  - [net-next,7/7] net: sfp: remove old sfp_parse_* functions
    https://git.kernel.org/netdev/net-next/c/9ce138735efc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



