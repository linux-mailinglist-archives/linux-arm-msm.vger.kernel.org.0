Return-Path: <linux-arm-msm+bounces-48761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD01A3E69E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 22:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E34423B2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 21:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5667264F86;
	Thu, 20 Feb 2025 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHwigoPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843AE26460A;
	Thu, 20 Feb 2025 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087007; cv=none; b=EPfNJWe1WspIvvVwah+AG7wv7rbecqnPSsR+x+IwUMjxYeSDzwmKzz3gadOG5JZDWzXJ7quQtd+FFmy8fIFUE422Knf1VoiF08FI2xeIP/XjTfWIkEh80qFWb7BhyHkbCxHiBoX+FyZRT7dyGT2PpnOMaL0PtI/omd5EKGxi8Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087007; c=relaxed/simple;
	bh=IrGuwkOpoDRzNvVxvWEQXzfeXssUh7/GHZ2bQ+VzqmI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IJpRu9P+Br/yGBGkCnVzcXwteAeN5mqyfb+X+MSh/dv6FlnVo30rPfGKkYQlbQPbs21JBkNKzwH5G3GXkOQ2dHFMxc/ionJUED5YGBDZvmipGG3jLWyqYXzK84GjWO+K37RpwtOdow7ygmxvl7gGsObrvess9teKPorxHlUejKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHwigoPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02198C4CED1;
	Thu, 20 Feb 2025 21:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740087007;
	bh=IrGuwkOpoDRzNvVxvWEQXzfeXssUh7/GHZ2bQ+VzqmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OHwigoPySNZ9VMXC6gP0JGoy68hAZhY1293SNhncGP9rDAQwqsIqRluGbEhli+cj6
	 fbyrkR1EgjJvq/h9NEOtwWbU32dX5C6qTn6PMymKRqQ9ejihBZsvuCKAa/OmyB0tqY
	 z7qgUPPLV+ARlgDCnQIM5/HpcYUv9iDXdfZkJIAVmI5K7xeMYI4UXLmUDAUZip3hix
	 b5YCIDBZ/s6E+mlk8jZeXwQH4krvlRJouSHo4V9N1ln1j1uQ/jOebAjDbzYSisnAOg
	 qbHrC2hi17aICeygxpbCC2C+2yfIV31fSSvWCNcDtueCQzBEqxxz7e4mL4pa0gwVAR
	 WttukDKbVh6Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1BE380CEE2;
	Thu, 20 Feb 2025 21:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net PATCH] net: phy: qcom: qca807x fix condition for
 DAC_DSP_BIAS_CURRENT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174008703778.1463107.59097793612648237.git-patchwork-notify@kernel.org>
Date: Thu, 20 Feb 2025 21:30:37 +0000
References: <20250219130923.7216-1-ansuelsmth@gmail.com>
In-Reply-To: <20250219130923.7216-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, christophe.leroy@csgroup.eu, robh@kernel.org,
 robimarko@gmail.com, christophe.jaillet@wanadoo.fr,
 george.moussalem@outlook.com, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Feb 2025 14:09:21 +0100 you wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> While setting the DAC value, the wrong boolean value is evaluated to set
> the DSP bias current. So let's correct the conditional statement and use
> the right boolean value read from the DTS set in the priv.
> 
> Cc: stable@vger.kernel.org
> Fixes: d1cb613efbd3 ("net: phy: qcom: add support for QCA807x PHY Family")
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] net: phy: qcom: qca807x fix condition for DAC_DSP_BIAS_CURRENT
    https://git.kernel.org/netdev/net/c/992ee3ed6e9f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



