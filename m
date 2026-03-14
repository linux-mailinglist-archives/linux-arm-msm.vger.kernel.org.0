Return-Path: <linux-arm-msm+bounces-97706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK5rIFO3tWkj4AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 20:30:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591E28E992
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 20:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DB6B300ACA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 19:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA47267B07;
	Sat, 14 Mar 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBG4Cnp8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F6CA52;
	Sat, 14 Mar 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773516625; cv=none; b=JyWBuZfjkCbB5J0adnmULdiyBu7+CgQljaHCl0m1VGZ48tp4I2ZJZCDvqH8XZMFk/kbS0tS7n015kYexQo/vRkO4Va8hqLRnprQ/B+I4YEovLHTHIra5xRPKYnD/e/fiTvw8uhsXwFVo51p2hR8iyH9JTqinz+aiVB4teiWgbeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773516625; c=relaxed/simple;
	bh=APmw1QrkydnSiEcDg6aTb/isY0wGSJupEcg3DG3VK6w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q8Rc1tO4miaOb9vXCjNH0E5AWkZsn3uudm00QiykSI/hLzMcI4L0eWDpBya6du1HaFxBRsSAMJ8mGjUDVroNtYudEtx9Pujf6ocfilV83KJ2Ru1NhX1Qd/KpZbvuw8qT1p1WoAG2KC76A4FwLRs5zZ7eCrmpaOlT9cUQ0PSxLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBG4Cnp8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5B6C116C6;
	Sat, 14 Mar 2026 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773516624;
	bh=APmw1QrkydnSiEcDg6aTb/isY0wGSJupEcg3DG3VK6w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MBG4Cnp8TmSjYJ/nPnxaC9+u2NQoMP5Cuns3a18+6BsdMwq9YZ2NcgatqyssIO/b7
	 WRdMneJ1Q0MBpcryi8nG3wDYPAIRKGv+KQgfJ2SwuSrkblVhuYBhuZ7URoUzgkB/D8
	 CasuGk9/Vhz7SeKuOeCaXo2xctKobdWBw2EYfECkMCJeip56kGhSX377yFKzD+tirE
	 LvgF3hW192z/pFCLEPUHIOVOSYB1yxQNseNgEK79wl9Dt/Tb+jigpAdOUZBMfj+BRH
	 y4BV8zPhsbdhvYpu/SGqTQaNYj4Nm9qjf6jVDh+4klURhPzMzZ0XJ88KxTXJaCg8sS
	 SToMnoVEOdOGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4007B3808200;
	Sat, 14 Mar 2026 19:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/5] net: phy: further decouple provider from
 consumer part
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177351661903.1763199.2542451163758230122.git-patchwork-notify@kernel.org>
Date: Sat, 14 Mar 2026 19:30:19 +0000
References: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
In-Reply-To: <9d5724bc-e525-4f8f-b3f8-b16dd5a1164e@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, pabeni@redhat.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97706-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2591E28E992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 9 Mar 2026 18:01:16 +0100 you wrote:
> This series aims at further decoupling the provider and consumer part
> in phylib.
> 
> v2:
> - patch 2: add needed Kconfig dependency changes
> - patch 5: explain false positive checkpatch error
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/5] net: phy: move mdio_device reset handling functions in the code
    https://git.kernel.org/netdev/net-next/c/2d7bebc9dd79
  - [v2,net-next,2/5] net: phy: make mdio_device.c part of libphy
    https://git.kernel.org/netdev/net-next/c/6df1459605ce
  - [v2,net-next,3/5] net: phy: move (of_)mdio_find_bus to mdio_bus_provider.c
    https://git.kernel.org/netdev/net-next/c/b69ceb387aca
  - [v2,net-next,4/5] net: phy: move registering mdio_bus_class and mdio_bus_type to libphy
    https://git.kernel.org/netdev/net-next/c/25b23d828318
  - [v2,net-next,5/5] net: phy: move remaining provider code to mdio_bus_provider.c
    https://git.kernel.org/netdev/net-next/c/c4399af5e556

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



