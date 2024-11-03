Return-Path: <linux-arm-msm+bounces-36854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BFC9BA79D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 20:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26711F21BCF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 19:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A641218B478;
	Sun,  3 Nov 2024 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOnEPC4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877A18A95B;
	Sun,  3 Nov 2024 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730661623; cv=none; b=PajshxF2t7PPWjRRJnsedl9aP7Mo4o/RepReIq4xKA84DoHRqX5ZQGB76qoCifAJq7wr2ktrrmfnxDovnunCYfcPzRl0SmPJQbE7krZ59/JsdnPxXdObQgkqoHs3LqmIzlU55AitYXqOkoQjUYUAdwAIihfhEfBacQqJtxYSJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730661623; c=relaxed/simple;
	bh=guA4XfWxKeUR5/wa7WoZlY8S7+D9ddGQ1ON0NdFMaow=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UNogrgTCDIOJssnCUOHJ1WCo8Qo35qpsmsYwOrsePdf+lyeO3fQ6pkDzyyBAFZzT6jSSKQxnHHzWEiZptA7d8i2UvyonJwgrPog5JWaRX4HQVLFxEhnj/+madGGBquZn8xE3amzcdTJIYohPjFe7wqbCiSj1oGwW4K0LPTpxQmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOnEPC4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A77C4CECD;
	Sun,  3 Nov 2024 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730661623;
	bh=guA4XfWxKeUR5/wa7WoZlY8S7+D9ddGQ1ON0NdFMaow=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gOnEPC4Fv1p3ZCOTEHjp7eudQW7oaTS82aLRYFcn5j+/2vjsJU8BMvVCCxWcYtlUo
	 2esI1saTtOKp6PoLxkcA2r0/A8FFoSVLU214e1iIZlGukbHNnUHgn/OqmJ24xqYD/s
	 5xWoncZOmyuQ2YLCtBflwqU0Gb5bPxeCZo6qJONANmxV5KklvcB2+pr7SKp2Q+GcG5
	 63ByRyRPJx/70mAaNmErimZHZtFXBZZ7DJZHpQouOCTrCoeZ/S2t7EPd10w8aoZwiP
	 GpyWIzjoWF6gDJ5BtAB1OI8B9pgjoyxfZY+9G7f8BebMUByJhfX9zQUTHe+8Rw2Bfa
	 WHsMbc+T7a1kQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED338363C3;
	Sun,  3 Nov 2024 19:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: use ethtool string helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173066163149.3236514.2076673237259299128.git-patchwork-notify@kernel.org>
Date: Sun, 03 Nov 2024 19:20:31 +0000
References: <20241029234641.11448-1-rosenp@gmail.com>
In-Reply-To: <20241029234641.11448-1-rosenp@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, michael.hennerich@analog.com, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrei.botila@oss.nxp.com, ansuelsmth@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Oct 2024 16:46:41 -0700 you wrote:
> These are the preferred way to copy ethtool strings.
> 
> Avoids incrementing pointers all over the place.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/phy/adin.c            |  6 ++----
>  drivers/net/phy/icplus.c          |  3 +--
>  drivers/net/phy/marvell.c         | 12 ++++--------
>  drivers/net/phy/micrel.c          |  6 ++----
>  drivers/net/phy/mscc/mscc_main.c  |  3 +--
>  drivers/net/phy/nxp-c45-tja11xx.c |  6 ++----
>  drivers/net/phy/nxp-cbtx.c        |  2 +-
>  drivers/net/phy/qcom/qca83xx.c    |  6 ++----
>  8 files changed, 15 insertions(+), 29 deletions(-)

Here is the summary with links:
  - [net-next] net: phy: use ethtool string helpers
    https://git.kernel.org/netdev/net-next/c/1441df3a37ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



