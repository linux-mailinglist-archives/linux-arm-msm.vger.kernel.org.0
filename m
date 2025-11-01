Return-Path: <linux-arm-msm+bounces-79967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5BC273D7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 01:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90A444E2719
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 00:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C9860B8A;
	Sat,  1 Nov 2025 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DlPuYkCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C034D3B4;
	Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761955231; cv=none; b=BvyliyEhB1uc8DOWtldWMNExdvUe2U2+bgOAGLtGBr2K/K1Ja9I2rRRIUCvKLgovVYudhe51SbeaeUfijekS9rECxl190JKhqWVWmp6V/KZOm9XKJtzGPbsnQX/XCCYLMzKN8N/bq+X52Bmw3Waa7KoLeb3AfKAATpQNHHJau5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761955231; c=relaxed/simple;
	bh=yk3VPIdVlbmUTYp0UAYa5Xrpps2+T2/IAQpUgIigqeA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WS8CyZ9hZ31oF/VkSJamOBOiaAY6InRRFP0ZD90XJjm2CzPmuyxxcou88KqeOWXvT71Z8HJmlIYu7hOi1SRT8F66FyLQW8lk5OJJakAPggG58AS+uoDHdFEya4rfZNjels+cU5j2k5yDVqgAQZXNz41no5xB8RNAxRdkPCml3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DlPuYkCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E6C4CEE7;
	Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761955230;
	bh=yk3VPIdVlbmUTYp0UAYa5Xrpps2+T2/IAQpUgIigqeA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DlPuYkCbIncnNePeguGMl9kzj+u6izK/5C0oaLQGiBK3DL2/xB0bwRL/KxOd334xB
	 J2UoCVHBO26eF4h/Jf2MZWvGCjFYXJSM+GUow2OQSZIE/GDRgeCsA8f5/6btYStaWg
	 eb93Mb0E+6IwAd1GhU2QUVLcutfsjkcz8sWmFJtsgyyUdbz5qQCiSqLus9gyt+6y5M
	 DhsZIU0UiChHvN4+O9Zgrj7bPXbupDgBQV1MK1GXBzsRKthyxYE/rd3akpy5p1bWCq
	 RBP5ckng562+aGygmINndgCrKwXS6xHRkKCYCakn7MeuROJiekrAHdoXX85q4SRrIt
	 WKUx6mk4iYIhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0153809A00;
	Sat,  1 Nov 2025 00:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176195520650.673072.17303889570192464247.git-patchwork-notify@kernel.org>
Date: Sat, 01 Nov 2025 00:00:06 +0000
References: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Oct 2025 10:20:32 +0000 you wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification
    https://git.kernel.org/netdev/net-next/c/9b443e58a896

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



