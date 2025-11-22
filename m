Return-Path: <linux-arm-msm+bounces-82925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CE6C7C2C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 03:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB6F14E1553
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 02:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AC426F476;
	Sat, 22 Nov 2025 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDn0ls5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E01F2A1AA;
	Sat, 22 Nov 2025 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763778052; cv=none; b=s9gWCPjQ0JTxB9CVvFx/JyXgvqfv4RFOs6gt8XZgoTERggRzzIWHMykFaY+yXMP02YEZTzg2YkhlUoAuIwgR7b1HQVEZqgnTLpB+KgWjNJSql/cuQUoLnVt7xX8W3FRfGsgLGufs+IwLk5pHqBnNhD5orus2em5L5uyKawFRwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763778052; c=relaxed/simple;
	bh=N/GqJc5kp4W33XuSJpLT2jBZ4MHlInurgmhHBSKSiAc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IQ1WJNmz8HbuJQy0RNZqrNqMd+pldQMKKiR3r9G3BIqDkvtodcRnWmRMtZG6cPFFk+DV+SL7jWEf6Uq4KoJS+f6b7CWJcoPcNrIeYmIzygJVq26Ca6iFhTT6ltMpskTqDx4MfzmXvcA4ASBBTTDL3c9iU4lIMQHsNz3pskzGxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDn0ls5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2420C4CEF1;
	Sat, 22 Nov 2025 02:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763778051;
	bh=N/GqJc5kp4W33XuSJpLT2jBZ4MHlInurgmhHBSKSiAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vDn0ls5eNfi3PLIKOS56zjr42iSAO/TrxI3WymCFuEAFPjhcCZ3eA0VS8kcZpg64c
	 Cs7v3QTZLXc73kfsOBaVBjuvB/MU/SMYC/X6FIJtWaYN4A2EMnxwj9c5UmmuEfGBW6
	 nx4jfhsQwsC6+c7FUSn5nupGkj4Y1Bf+pE2E8+Q9446/SfGM2cHGwt3eiwPeFzA4cZ
	 MIz6LTQ5gQLHZgJ+I7I5rNvKjsOXSWnDz8GVu+9IIDXcH4gRhhyM4moZ2YjdokbH+W
	 4DIW9rDvbmpbmUlbAgkfiyvOaMftePQ/eRq8wyzaM7Jw+yUiESHieKRACIlNf86e8Y
	 +EW5qOFPd+GmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7112F3A78B25;
	Sat, 22 Nov 2025 02:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: stmmac: qcon-ethqos: "rgmii"
 accessor
 cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176377801599.2657243.16800744775068465298.git-patchwork-notify@kernel.org>
Date: Sat, 22 Nov 2025 02:20:15 +0000
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
In-Reply-To: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 20 Nov 2025 11:24:59 +0000 you wrote:
> This series cleans up the "rgmii" accessors in qcom-ethqos.
> 
> readl() and writel() return and take a u32 for the value. Rather than
> implicitly casting this to an int, keep it as a u32.
> 
> Add set/clear functions to reduce the code and make it easier to read.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: qcom-ethqos: use u32 for rgmii read/write/update
    https://git.kernel.org/netdev/net-next/c/f54bbd390f5f
  - [net-next,v2,2/3] net: stmmac: qcom-ethqos: add rgmii set/clear functions
    https://git.kernel.org/netdev/net-next/c/819212185ae5
  - [net-next,v2,3/3] net: stmmac: qcom-ethqos: use read_poll_timeout_atomic()
    https://git.kernel.org/netdev/net-next/c/9b60ba512c7f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



