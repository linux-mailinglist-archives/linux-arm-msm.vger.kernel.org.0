Return-Path: <linux-arm-msm+bounces-94018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA/LChtbnmlSUwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 03:14:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A42EC190C33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 03:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95DB03025726
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 01:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD0B2765ED;
	Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbsBe58x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E38275864;
	Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984226; cv=none; b=Nr/VAxSkhn+pmVvZalqNO8Ur41HkJT6EkXLhTsPEKdUE1SsO6IUipSWI768kB366QHPl2u/j0JehfGtlg8QGVE8e6TelmUaKNhOmlWOpA/8qbv2rYFD7rR4puOnMv0qnXN+5d6yPpQLeyDBfZXdwEzw3Q/uLm1AYTAdewnHtaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984226; c=relaxed/simple;
	bh=hqHD9RFlh+gmpegg8cL1nP31Ba7mVMoIC+E34e8sKf0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fZ5F4hqqOwC0v8RvNCsupxEeqCXdoAoldpk/oB35N0iNpaPdJjttIIFkKM6C35wARLCxglAvUr+VjzBD4fx0/NsQAwUtlQsL0GMgIjDra2ujvLQrDzhmpy2rzzfkyatR8PpFd+mO4UbLiiApZf2KCDpTDcRcc5LFJw2Y4d2b+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbsBe58x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697D1C2BC87;
	Wed, 25 Feb 2026 01:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984226;
	bh=hqHD9RFlh+gmpegg8cL1nP31Ba7mVMoIC+E34e8sKf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gbsBe58xM8CPUL4NRKk/zy0iv7QuA1oH0MYcKYyoq8dcNj6DZ7ckecjm8AXhi0KjI
	 DOyD8Hrzissdqy71F50GykotYh8GgeYmZruknBLJXVvD2WGL4eApqDPJXCvn/lzeWl
	 zhDXV0FkCdus+JAGYSKvddZxsyvXoKOyIBUWxiRu9i/2XgPwVQocPueik48gQbJ81r
	 xeXfzP7jIcTs+/jM447N51dKgVgO9VF68eaZjloZzqZp1X3QFfBbZVJMOxA0vccWZN
	 ECmLaOkZ+tgfwlwX1zBgfFrNHI8GB6IIBSKQnJ0fCFjaoyZG4k8YUywLJorp527BAy
	 GH1G8qlv65iPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D8C3808203;
	Wed, 25 Feb 2026 01:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/10] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177198423153.31093.1747668496554974371.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 01:50:31 +0000
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
In-Reply-To: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, Frank.Li@nxp.com,
 imx@lists.linux.dev, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, vkoul@kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-94018-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A42EC190C33
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Feb 2026 09:33:52 +0000 you wrote:
> Hi,
> 
> As the last series had issues with stability, I've changed the approach
> in this series to concentrate on keeping much of the SerDes related
> code within the qcom-ethqos driver rather than trying to move it out at
> this stage. This means it should be possible to bisect these patches and
> pinpoint exactly the code movement that causes any instability.
> 
> [...]

Here is the summary with links:
  - [net-next,01/10] net: stmmac: qcom-ethqos: rename "por" members to "rgmii_por"
    https://git.kernel.org/netdev/net-next/c/ebfc2be12ec5
  - [net-next,02/10] net: stmmac: qcom-ethqos: remove register field value obfuscations
    https://git.kernel.org/netdev/net-next/c/e6f43a41ba62
  - [net-next,03/10] net: stmmac: qcom-ethqos: change ethqos_configure*() to return void
    https://git.kernel.org/netdev/net-next/c/649a00c3926f
  - [net-next,04/10] net: stmmac: qcom-ethqos: move qcom_ethqos_set_sgmii_loopback() up
    https://git.kernel.org/netdev/net-next/c/3baa791f19be
  - [net-next,05/10] net: stmmac: qcom-ethqos: move loopback disable to .mac_finish()
    https://git.kernel.org/netdev/net-next/c/834c72ca306c
  - [net-next,06/10] net: stmmac: pass interface mode into fix_mac_speed() method
    https://git.kernel.org/netdev/net-next/c/cd0aa6515350
  - [net-next,07/10] net: stmmac: qcom-ethqos: pass phy interface mode to configs
    https://git.kernel.org/netdev/net-next/c/b560938163db
  - [net-next,08/10] net: stmmac: qcom-ethqos: use phy interface mode for inband
    https://git.kernel.org/netdev/net-next/c/b8ab32315e22
  - [net-next,09/10] net: stmmac: qcom-ethqos: move SerDes speed configuration
    https://git.kernel.org/netdev/net-next/c/fb42f19e671f
  - [net-next,10/10] net: stmmac: qcom-ethqos: convert to set_clk_tx_rate() method
    https://git.kernel.org/netdev/net-next/c/9192320a65b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



