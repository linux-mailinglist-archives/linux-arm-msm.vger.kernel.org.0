Return-Path: <linux-arm-msm+bounces-95707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Nu6M+tKqmmIOwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:32:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607821B208
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 04:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B90F43026A8E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F905344DBD;
	Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiZHaT+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1634028D;
	Fri,  6 Mar 2026 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767972; cv=none; b=Ff3Lf3Z4gsMzUCCYa/GoahJEdFfRbBtyZoOeQDuID/GWhGQTTJBDUP3KT4caoweBv0ZGgn4PWIiubzRZ341rgakP2Gnw7sXx+gM2qNYJtt6SkuBAKMu/kEb9qdnckjtdrVcBOOvIHuqr6ToSS60DaarEi3dhyp6iakpigWmYhnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767972; c=relaxed/simple;
	bh=J5WNpI9IFOZTn+5xxMTNRdxLsLhlZZ5pCnKzZHghzHU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HRP1fcKkiTTvT6w0vNM7utUuMY0qRtB5O3KHrs4kNYEFsguLa9pFFjqjsl3lYxR1VWg2v+gDwWEg5CjJqWI7rZomWSv/142sc1QYgG5HE3+8Pwl9pZxfWYPpQ63sODQo92W3gyAJbJ5eTqj/IS/tavvvch8zEgU5qB67C8C8d1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiZHaT+i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63326C116C6;
	Fri,  6 Mar 2026 03:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772767972;
	bh=J5WNpI9IFOZTn+5xxMTNRdxLsLhlZZ5pCnKzZHghzHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CiZHaT+iDF0JBJhKP5j+xHrw3HKoiJahdSNW1m5LuGTPLlSgRRlmggtREW6U1dtdu
	 eO1inZLnbuc81n2FDTFA5ImteQHR8K7Bg0t6726FgJf63jOJgUMvBSTLS2j1wuHiER
	 lDbPDz7PQ9WNn8Hh7HDoNbMVNAdO1dIXOyEPYVHlwcgA9Vay8p1Loo5INeR+2dSc30
	 ktxCqHrbbLEEdO0HgR2MbJBI4EysmfY3ATloJ0dJpvTT1IIx0axex6J4tS6bF9v5gF
	 Jn46/XT8RyMWYDrDfXYEaa5+Sp+KCyB8zeR/2CJUzESI2HgZT7uPBFh01v29Nzc94a
	 PyFl4bi2dPmbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEF53808200;
	Fri,  6 Mar 2026 03:32:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: qcom-ethqos: further serdes
 reorganisation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177276797180.3348267.4879154054522782350.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 03:32:51 +0000
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, pabeni@redhat.com, vkoul@kernel.org
X-Rspamd-Queue-Id: 7607821B208
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-95707-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 3 Mar 2026 15:53:02 +0000 you wrote:
> This is part 2 of the qcom-ethqos series, part 1 and patch 2 of part 2
> has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
    https://git.kernel.org/netdev/net-next/c/fc8ca5da896e
  - [net-next,v2,2/7] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
    https://git.kernel.org/netdev/net-next/c/4999e0a2ab34
  - [net-next,v2,3/7] phy: qcom-sgmii-eth: remove .set_speed() implementation
    https://git.kernel.org/netdev/net-next/c/b7721597547d
  - [net-next,v2,4/7] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
    https://git.kernel.org/netdev/net-next/c/d2b20acdaed8
  - [net-next,v2,5/7] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
    https://git.kernel.org/netdev/net-next/c/f82210ce8cb8
  - [net-next,v2,6/7] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    https://git.kernel.org/netdev/net-next/c/ebe8b48b88ad
  - [net-next,v2,7/7] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
    https://git.kernel.org/netdev/net-next/c/038a8e8eb90d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



