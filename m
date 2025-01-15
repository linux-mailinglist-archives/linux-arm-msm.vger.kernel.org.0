Return-Path: <linux-arm-msm+bounces-45062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E186BA1169F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FA113A529A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC02E4644E;
	Wed, 15 Jan 2025 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poCMdomj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7907622075;
	Wed, 15 Jan 2025 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904613; cv=none; b=elo2WoKZkDFbOHtqxPRK4CQfqKtzKg61sxW4UXj3Hm3wWoGvq1VxxVG3EWVOy5Ju7ilYAjZ20NAceWLkqtWvSvQ8enO53V1sUIMwqgmZOYeSwvoOKOFQXZ0IdPYzkin/CRTpsIV93zGnmYmOJ9QbtFkhu9XvOK7YDrdn0lcGWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904613; c=relaxed/simple;
	bh=JGayQbeENovujuBJWgRZ/GamXKwMqxtIrxDsX3uD4PM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YvulVMMPPGQI+Ae/je/Sz1N+T6j2xepLhE1J5LRJwfY+xe6rQ2XZ5D3R65Lla8LrmQGRUw91hrWdY3eOx1jdjmhHolymzBSeJYegBwpajnsQz9I5yPp0KTY/dJxh/zbznZCDujS07OHGkp5fQaR+KO0vCHsO8avhbHKAjU/cE1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poCMdomj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF51C4CEDD;
	Wed, 15 Jan 2025 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736904613;
	bh=JGayQbeENovujuBJWgRZ/GamXKwMqxtIrxDsX3uD4PM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=poCMdomjGUuv1enZWrMvQBGikq7XqoWdPgtThSf6VzWj1cHh6JoKhVxbdVGVV5Ikg
	 5oizYvsuhFMUEDjOVaFAvsIREsVuQIWJI17F0inIkQrpxtB2W8hS/8kMDKB4r2bHQA
	 jC/kW3Joug10ioV5ozO8enrCq6Ybc5t92fwjCG+rGoArewA56P0xfQFTuDtPSK4ewu
	 0wgZiobEWDpWuaU3zbC/xzlXm7UFuoPY6xjkWL0On2mGgWwzv1T0sB+WqsPqTGDpWx
	 cprgUbxTRDIRj9yv6OcZAm8QfTHoSmIH1Yye3D9IUgvo3u3nxqkSdxITZWNGMEbRFa
	 qk6GtI/rG+6zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB9DF380AA5F;
	Wed, 15 Jan 2025 01:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173690463579.211072.4197459392952353174.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 01:30:35 +0000
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: michael.hennerich@analog.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com, richardcochran@gmail.com, kabel@kernel.org,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, arun.ramadoss@microchip.com,
 UNGLinuxDriver@microchip.com, lxu@maxlinear.com,
 piergiorgio.beruto@gmail.com, andrei.botila@oss.nxp.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 12 Jan 2025 15:14:50 +0100 you wrote:
> 'struct mdio_device_id' is not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: Constify struct mdio_device_id
    https://git.kernel.org/netdev/net-next/c/b01b59a4fa87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



