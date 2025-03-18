Return-Path: <linux-arm-msm+bounces-51756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F25A6773D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 577691892141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B6C20E6E1;
	Tue, 18 Mar 2025 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7BIYDHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA620468F;
	Tue, 18 Mar 2025 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309999; cv=none; b=QL9w8lNG6Ewr0J1Ng747Fs2iyJ9ggmhKzruAlwutG8AqQhHeydmHbTZWTcd++rOrhd8zBi2J8zE8d2MeHg8qOmS87aYfKCXcJe6TjFIhvgQ29J7SWEgS+KYBdeAB/qaFMEhE2mgtXACLtd6mVR9OcTtG5WzrwsATKl/PQduvy9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309999; c=relaxed/simple;
	bh=r0NrzcNDxEAo6t+Xoz4A+ZsjzVa5mHQEjDvSbM8+ItM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D4DmxnWlalXKhAQCcNgF3DdpZvZcTTJBxiLk7JlNNslFFhEMChaHZVvlMgNdpihKZuBRdg0pXBz4v7OhpEMsyyEwPGbPnr1719CsXH7vd4KXaMVifvzXKaqv2Ex3ctzaZAdybzMDF/9BeohHVQVPmldLS1vtbG7NiwGjOlBVN0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7BIYDHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8457EC4CEE3;
	Tue, 18 Mar 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742309998;
	bh=r0NrzcNDxEAo6t+Xoz4A+ZsjzVa5mHQEjDvSbM8+ItM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Y7BIYDHM86vWww2amj46/mLjgIS9Pd+7uQlOXialHBqRDb8TRbN8eHCTUEXr44qjw
	 aOIsxiBVjuJYca07fp8YJLOmvV2xbFRNjwOTK8w5dGpjOC458+667lzGFnKd2sgF/1
	 MEqYnxpu7gk3iP8HTvN1PWsLX0tL2Uj55mHuE+F3f28JLUTnj9Z4g7dyNsZ3F+4/H6
	 R50JhgxMv4KAL7casbv0AMtCC8Z+tM+JYOUVRCDLWi9HIqN1ZRbUBrCJxUCMly60Ol
	 WGvhYD4LhyMINquvspNJGrgYwK7dKnt2Dl9H9NLPMMwWUBPcz/3jkWkeTnNeNlWhPd
	 3mvxeqCe3WO5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FFB380DBE8;
	Tue, 18 Mar 2025 15:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174231003400.344268.9977818669398853411.git-patchwork-notify@kernel.org>
Date: Tue, 18 Mar 2025 15:00:34 +0000
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 wens@csie.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 jernej.skrabec@gmail.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 martin.blumenstingl@googlemail.com, matthias.bgg@gmail.com,
 mcoquelin.stm32@gmail.com, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 pabeni@redhat.com, samuel@sholland.org, vkoul@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 09:14:53 +0000 you wrote:
> Hi,
> 
> This series removes unnecessary of_get_phy_mode() calls from the stmmac
> glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
> already gets the interface mode using device_get_phy_mode() and stores
> it in plat_dat->phy_interface.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: stmmac: qcom-ethqos: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/8ee1c926f31e
  - [net-next,v2,2/9] net: stmmac: mediatek: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/46f84d700cb8
  - [net-next,v2,3/9] net: stmmac: anarion: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/e3ef12172a83
  - [net-next,v2,4/9] net: stmmac: ipq806x: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/f07cb4b4b481
  - [net-next,v2,5/9] net: stmmac: meson8b: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e5833060efb
  - [net-next,v2,6/9] net: stmmac: rk: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/9886718ad1c5
  - [net-next,v2,7/9] net: stmmac: sti: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3e2858bb3f59
  - [net-next,v2,8/9] net: stmmac: sun8i: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/3d9e9dfce04c
  - [net-next,v2,9/9] net: stmmac: sunxi: remove of_get_phy_mode()
    https://git.kernel.org/netdev/net-next/c/00d2c3c07124

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



