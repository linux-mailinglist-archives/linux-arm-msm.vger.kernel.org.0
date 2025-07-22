Return-Path: <linux-arm-msm+bounces-65974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E0BB0CEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 02:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DF416C5E51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 00:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC96413D8A4;
	Tue, 22 Jul 2025 00:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhTYHwIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8D13C81B;
	Tue, 22 Jul 2025 00:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753145390; cv=none; b=S7ht1t3MnXzEHPe9RCXiHNp+ouXidOJ36GcL3jsmDB3M5Nk1yAdcChFYvWu5z8cuKWDr+8dBNLZL3Ky6nXJc1EqkYAv6wIgkPOHvbhh/h5QVz/2XHCf9c9gX0xNKwbEgOky/87FxGLlCM85zG55Ln7m+6Btborfwu6t0YuJXMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753145390; c=relaxed/simple;
	bh=qqVtg7wIZdHVzZMMsK9AjxJx4S/Xq3p0wGOEHw6p0V4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uCY52bX0RUXAG+izheYhhSvPY+RSVqYczvXkECPm5oeVqoH5i/1fDC6CMm4O974LGqpNr/znf0NRoPxcevjJX4dxea5G54EbV8ondKYDlSugD9MM8ijLxWdKeUnzxpZ9V+n1+3s0G5wr5FNWvKNYHG7rRN944yteCLb1eYncGNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhTYHwIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C89C4CEED;
	Tue, 22 Jul 2025 00:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753145390;
	bh=qqVtg7wIZdHVzZMMsK9AjxJx4S/Xq3p0wGOEHw6p0V4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DhTYHwIRAQuW4LM7++mtXEFNLpWYAjOi0dkD4mGH/Az+QiTol5w/HG6Cu0ARKO/NF
	 qw/+DC+3c5eksZhZmV9AFsXploQrV+hjHiAxdr1z1Cm3OHqT8eKVlf4kSk0ee1Dzgx
	 LJVHbWa1yWNNO0c9Dqr9t/ujCrJP7zZ3tmuBaDzI0ak3C2OBcgHJcXsCbWEPUymHlm
	 34MHuY67ipSRXUDxJz43vRz6uBaS7p8Pk0T/Xo3rQ8IrINrmotTPMFagJDqZSjoagC
	 MLzHgklQmR5iTMiFxC0pqKPzD3IFTbC21LM6wJPbC9F9BKWjbn+ZZHq/UIZqQQeTIt
	 v0f0MVA50XDeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E1767383B267;
	Tue, 22 Jul 2025 00:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: qcom: qca807x: Enable WoL support
 using
 shared library
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175314540876.247888.8839150831029400214.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 00:50:08 +0000
References: <20250718-qca807x_wol_support-v1-1-cfe323cbb4e8@quicinc.com>
In-Reply-To: <20250718-qca807x_wol_support-v1-1-cfe323cbb4e8@quicinc.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.chevallier@bootlin.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 18 Jul 2025 21:57:48 +0800 you wrote:
> The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
> to that of the AT8031. WoL support for QCA807x is enabled by utilizing
> the at8031_set_wol() function provided in the shared library.
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: qcom: qca807x: Enable WoL support using shared library
    https://git.kernel.org/netdev/net-next/c/14e710d7080f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



