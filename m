Return-Path: <linux-arm-msm+bounces-48585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6D8A3CFEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E433BB5DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 03:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC431E2823;
	Thu, 20 Feb 2025 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2oaMXVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16A21E25F9;
	Thu, 20 Feb 2025 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740021014; cv=none; b=reurNzH2/URYJJBzRnXmAAKHYejY8Gw79iLRVsM4u10GpaCHunSeJ2kmsVGSjrCrbdffx2qZ0OrgrU5wZ8e0jGlfyyYNwnq+zZYjVQ8rC4Wm6Y39aLjyJ08IzOJThAGcts7xdbhTwh3m1Z/AIecQONpTXEtYLPVg8SUOUkAq3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740021014; c=relaxed/simple;
	bh=pD8ROzU5v7v1zdafWRXLtlZbryQ4ts3yYyJZ3srYQyg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e0CAMw+8zD2hTus6Uh9AWXNDssvt+jUJAtku3DGaC7QTZYqg4i5Gtea+f1sliWwXKRZ/cWVFju/4/gHbVU/+zPaITtCIQYRT52xJjssoXo1nX7INFyciwkMKFjl2RQS/63K+H0LGQltgfJPKxHKIyQ1OnRWN+WJrGusjrIKuSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2oaMXVK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298CEC4CED1;
	Thu, 20 Feb 2025 03:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740021014;
	bh=pD8ROzU5v7v1zdafWRXLtlZbryQ4ts3yYyJZ3srYQyg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G2oaMXVKsFb+JmWdJyesdE7HFJck9SKKH6+yl1iffdn7Jn4KoKlMyY5tsuvzOoKfl
	 OsGvNE+vA6UPc8O9po9+irs/OY7dLy3a2YC1sEwltFWfEwFy9IylUSo+hsyDTe6Bmi
	 HLsOqePxhNr53LF6jAyzP6+YTdameuuAUsJkDqKhWjSuJmtZvtsSdnp5NVZo7BiCzy
	 bpPtC4jh3fChd4AXeeA2BTYgwMFz0iyO/oxtKLkEux9FsKW5pJCA9McLZ9gELXtsTD
	 RWeVMDNzJmuWDYCyhdWyVIUUPKPDe28OJVUyO2WsK3cFb4y2B9QZ/cxj7s8EPlHxS+
	 ozc6TvNglFVaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFAA380AAEC;
	Thu, 20 Feb 2025 03:10:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: stmmac: further cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174002104449.825980.800457478148266618.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 03:10:44 +0000
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net, drew@pdp7.com,
 kernel@esmil.dk, edumazet@google.com, festevam@gmail.com, wefu@redhat.com,
 guoren@kernel.org, imx@lists.linux.dev, kuba@kernel.org,
 jan.petrous@oss.nxp.com, jernej.skrabec@gmail.com, jbrunet@baylibre.com,
 khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, martin.blumenstingl@googlemail.com,
 mcoquelin.stm32@gmail.com, minda.chen@starfivetech.com,
 neil.armstrong@linaro.org, nobuhiro1.iwamatsu@toshiba.co.jp, s32@nxp.com,
 pabeni@redhat.com, kernel@pengutronix.de, samuel@sholland.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, vkoul@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 18 Feb 2025 10:24:25 +0000 you wrote:
> Hi,
> 
> This small series does further cleanups to the stmmac driver:
> 
> 1. Name priv->pause to indicate that it's a timeout and clarify the
> units of the "pause" module parameter
> 2. Remove useless priv->flow_ctrl member and deprecate the useless
> "flow_ctrl" module parameter
> 3. Fix long-standing signed-ness issue with "speed" passed around the
> driver from the mac_link_up method.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: stmmac: clarify priv->pause and pause module parameter
    https://git.kernel.org/netdev/net-next/c/ff1a9b2e311f
  - [net-next,2/3] net: stmmac: remove useless priv->flow_ctrl
    https://git.kernel.org/netdev/net-next/c/bc9d75b0aaed
  - [net-next,3/3] net: stmmac: "speed" passed to fix_mac_speed is an int
    https://git.kernel.org/netdev/net-next/c/ac9a8587edc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



