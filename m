Return-Path: <linux-arm-msm+bounces-96822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKDWJtPasGmHnwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:00:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68B25B39C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36E0E302A42C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B421D5CD1;
	Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBo62BpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A111D5174;
	Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198028; cv=none; b=dPttDge1ItUFjok+Mk+XPQZPP05kFj2/nhUcazI4jU9W/GxuE2uEXtL5FFXTkArNtB/MnGs9brDqADUDOsW3+MDDfbw3+hyjOLZsZloa4uHO7ilVs2Tk/58bSo2ZUuawdVkz39rVr9ea8niJ9Z8xEqJD9gOurAdYHrgiI/OXPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198028; c=relaxed/simple;
	bh=bOXGmh6jsTxCsgYCU4QHEri4xQgWhuXk6jt33pBkt/M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CoLk8Oc9tIi9AmoaYL3yjNX57GCiQf9h3Mrz/RB0UlY/GQaa5D7Mf3qPaTUMgXPM4/hT4cKx8FSSrhRuhORcDGGr6w6WADU7dqtmCU236fLjWBE7vXVchgeRp5yTMUXo1ddbm10U2a3VbguKTKj9kro3wrY3tBc2UbgkT+3QnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBo62BpP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1298CC19423;
	Wed, 11 Mar 2026 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773198028;
	bh=bOXGmh6jsTxCsgYCU4QHEri4xQgWhuXk6jt33pBkt/M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MBo62BpPJVP29oqsWlvaUEmQVEicBzq1LzxONNHQoQJeAlOHFN27fwIYhsEkwpaUf
	 543muqKkM5o5/dNrAJRZigmxY2M5WVe/1QCjnsHxq0Mcj6jR+1xkc+2RCaU2IwQxrD
	 8OgHEkmTQoJAw3xcls+LC8RLLSGdUfS9cRTaEyfHqnau6evdCT0yl2CbgAW3GNHzQo
	 uXZZ3ur23R3qcmztDAFeJ4hQoEMzpQjWuBdaFQCFYCdoE8yAwMNPNbWjq/Hguns5vE
	 1tAT4z+YuaROAdOa0CEyQs/19Dtnb7TN9at5Tao5oFzqNZZe0R2S/6Pnx5s7vWg4fI
	 Ck8Kh3oKcVFEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F783808200;
	Wed, 11 Mar 2026 03:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177319802455.3019253.1878262013471339195.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 03:00:24 +0000
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, wens@kernel.org,
 davem@davemloft.net, edumazet@google.com, Frank.Li@nxp.com,
 imx@lists.linux.dev, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, maxime.chevallier@bootlin.com,
 mohd.anwar@oss.qualcomm.com, netdev@vger.kernel.org, pabeni@redhat.com,
 kernel@pengutronix.de, s32@nxp.com, samuel@sholland.org,
 s.hauer@pengutronix.de, me@ziyao.cc
X-Rspamd-Queue-Id: 8F68B25B39C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96822-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 9 Mar 2026 09:38:26 +0000 you wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: provide plat_dat->dma_cfg in stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/7a6387dec8ce
  - [net-next,v2,2/7] net: stmmac: convert plat_stmmacenet_data booleans to type bool
    https://git.kernel.org/netdev/net-next/c/c3d08424e025
  - [net-next,v2,3/7] net: stmmac: reorder structs to reduce memory consumption
    https://git.kernel.org/netdev/net-next/c/3357642e65e9
  - [net-next,v2,4/7] net: stmmac: use u8 for ?x_queues_to_use and number_?x_queues
    https://git.kernel.org/netdev/net-next/c/94808793fed7
  - [net-next,v2,5/7] net: stmmac: use u8 for host_dma_width and similar struct members
    https://git.kernel.org/netdev/net-next/c/758ed85aadd0
  - [net-next,v2,6/7] net: stmmac: add documentation for stmmac_dma_cfg members
    https://git.kernel.org/netdev/net-next/c/9fe167ab790b
  - [net-next,v2,7/7] net: stmmac: add documentation for clocks
    https://git.kernel.org/netdev/net-next/c/315bab9411f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



