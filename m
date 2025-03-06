Return-Path: <linux-arm-msm+bounces-50434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB4A54128
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D77A16F2F2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F3F192D8F;
	Thu,  6 Mar 2025 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaxBoBek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFB18DB1E;
	Thu,  6 Mar 2025 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741231201; cv=none; b=MeyzJvs2Pk7cdgDSn3OUO2H9oe0b15tUBykIfDYG1Ffk3H1FPN6UDI2Q4H/1UWiyQiyoCR7iLTpkh7ZJHTEO1QdrVz5SzGCRxF80tB66gEsMeXSEXmjrrTeey8z/ZD1gPlABh9TI6zgjfC1jm3chKN78GzOZ9eH3EeoAU1UdiO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741231201; c=relaxed/simple;
	bh=ldpseiZdwbk12xd//hJkl8SkTToSHiL6VywDH4TCwFs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=q6s/EmB61bxcrASqLBUqhC57iJpg3iIzgqdgsWPFLkLnYoBKnmR/0sNZbSMTWz9h2UOcx4r764XpFyIgWjM82cALGfCl7+L/nnsSXPq8A/XPvILnKSLNBnyZwTIx23gvpPkCrQd8e0O02/hnTsnkw28H7eoTfPRygFdPa2EYMhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaxBoBek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC6FC4CED1;
	Thu,  6 Mar 2025 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741231201;
	bh=ldpseiZdwbk12xd//hJkl8SkTToSHiL6VywDH4TCwFs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KaxBoBekBiKcBUHabZEgWALw3F8Nh0J2upfew+y2V3QUsiTxcdEA7qE7laE8r3NdC
	 Z71TwxipZfcyfoeHwawduMzD+HtzyE9Kz9aaujw33rKOSAm9hmLiCYcvg0hAwnjiy+
	 UCMZ4yVWvFyHBfwhsLEk+oZGXGw3/OYaolfEH2KtKkKj3221/5vN/IuKWZS3XLXtXb
	 H/dN/11RyUrP+2SIiwA1UCzJsFN3U6SJKgxgfrtTM5+U4qbf0XjERz7IWJnNeeUnJH
	 7ub25Q7J5GY8V8WPDyMt58J1i9p7Wn4iGPiD5Ull9lbfaCKTmN8NqIPZpNemXi4ljx
	 EKkXF7nn/WOyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71D08380CFF3;
	Thu,  6 Mar 2025 03:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/8] net: phy: move PHY package code to its own
 source file
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174123123425.1112346.6998420178306205592.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 03:20:34 +0000
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, edumazet@google.com, daniel@makrotopia.org,
 dqfext@gmail.com, SkyLake.Huang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, richardcochran@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 robimarko@gmail.com, kory.maincent@bootlin.com, rosenp@gmail.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 3 Mar 2025 21:13:05 +0100 you wrote:
> This series contributes to cleaning up phylib by moving PHY package
> related code to its own source file.
> 
> v2:
> - rename the getters
> - add a new header file phylib.h, which is used by PHY drivers only
> v3:
> - include phylib.h in bcm54140.c
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/8] net: phy: move PHY package code from phy_device.c to own source file
    https://git.kernel.org/netdev/net-next/c/61dc9cae8727
  - [net-next,v3,2/8] net: phy: add getters for public members in struct phy_package_shared
    https://git.kernel.org/netdev/net-next/c/2c8cd9783f46
  - [net-next,v3,3/8] net: phy: qca807x: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/947030f3c32b
  - [net-next,v3,4/8] net: phy: micrel: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/890fe6841d81
  - [net-next,v3,5/8] net: phy: mediatek: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/dc5a6164feda
  - [net-next,v3,6/8] net: phy: mscc: use new phy_package_shared getters
    https://git.kernel.org/netdev/net-next/c/e0327e9f8597
  - [net-next,v3,7/8] net: phy: move PHY package related code from phy.h to phy_package.c
    https://git.kernel.org/netdev/net-next/c/e7f984e925d2
  - [net-next,v3,8/8] net: phy: remove remaining PHY package related definitions from phy.h
    https://git.kernel.org/netdev/net-next/c/a40028497769

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



