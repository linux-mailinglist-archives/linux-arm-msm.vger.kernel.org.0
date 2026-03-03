Return-Path: <linux-arm-msm+bounces-95032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC5AIIkkpmlrLAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 01:00:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 295881E6E34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 01:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C225301116F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 00:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E75234028B;
	Tue,  3 Mar 2026 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fdju579P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE453382C3;
	Tue,  3 Mar 2026 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772496006; cv=none; b=ZU345fFijrobhYulHZW0/p+8D+Igx10j4eJE2X35TE3KBCBKB61H8UfmMC9xJP79GdEOYH6hCQYDrJYQkyLIR/XVfZkPEqfk5l4stflQoGc60R90wvXbf5W4DjYQuhyASEXFD/s5gkJxdcvaqLHjcmBKLJT/THWloAcEjw197rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772496006; c=relaxed/simple;
	bh=9WFEYNOuqCrSyAGA3CeVfGc+jKdXN1vYdI9bNg/0Pq0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K2FmheTcnwPeQMSfuvgOKyJ5jXRG79N+Tf3HF69ZyEc3VES8esDEQflTco78l/uIKrBcmgS5XXjmHY0EF9irL+meu6scXG+EdLmASi4OgbN8ZB7yIo4g5nHkz5Pt1+5st25bDzXCfOzU1AWOfjn9rNLF8IsMaL6qyk+xeISphwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fdju579P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095EFC19423;
	Tue,  3 Mar 2026 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772496006;
	bh=9WFEYNOuqCrSyAGA3CeVfGc+jKdXN1vYdI9bNg/0Pq0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Fdju579PUyOlYvVyU0vSlZB4C1SEcSwQtNObDG1EPO+lSO1gswy2HDmiL89aaeRJM
	 BQwdSqsvkbKrRdVO3v3GAxqNaZLzscsulYinu8mp40L8QBAeTohyt+lpKsBjkmFQQb
	 djTIktJmVZDz+TcY5T7Rvs5Sp/n/dBFGGAdzcb04hQ0uRDwFh3jg3tCAsRZ0SaDJTU
	 fUwW1vLp/K3JoO+X3nERh8bqE+Z0fW4AT/+umaW657zVvwE1sOP+NeZOBB/VkXqOTs
	 7xKAy1oH3liZcoAMdd1VScjlecDeP7Lqxum6sfTesiySXuzG+r0vkjmaefthjsPUbb
	 fL0mdaDPzDJ2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA09D3809A80;
	Tue,  3 Mar 2026 00:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177249600754.587100.4626990163271059988.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 00:00:07 +0000
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 mohd.anwar@oss.qualcomm.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, pabeni@redhat.com, vkoul@kernel.org
X-Rspamd-Queue-Id: 295881E6E34
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95032-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 26 Feb 2026 23:07:16 +0000 you wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> [...]

Here is the summary with links:
  - [RESEND2,net-next,1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
    (no matching commit)
  - [RESEND2,net-next,2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
    https://git.kernel.org/netdev/net-next/c/4ff5801f45b4
  - [RESEND2,net-next,3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
    (no matching commit)
  - [RESEND2,net-next,4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
    (no matching commit)
  - [RESEND2,net-next,5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
    (no matching commit)
  - [RESEND2,net-next,6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
    (no matching commit)
  - [RESEND2,net-next,7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
    (no matching commit)
  - [RESEND2,net-next,8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



