Return-Path: <linux-arm-msm+bounces-101744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPjaKDFJ0Glu5gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 01:11:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F513398F91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 01:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 426453012BE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 23:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE0638D6B8;
	Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyU06L9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D24538D6A2;
	Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775257864; cv=none; b=emQkgjN+zjbk856StoZWMv3h9PZTKP7je1RAdPLPWAsVrGpUsZHNuD0uW5N+bJ+E+ranGjfG6Bk793pnHqN2/iafSfbmrzgArcmru0CZiOZmg2UI8x0ZuLnYwZi0oKSCyxuDC+adpnPzC5RDazQ7s8Rjoax92lIINgY/JFhlpME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775257864; c=relaxed/simple;
	bh=2A0r+UE5+pZzmP0NV8rxJD+zsPZ9QB1jSvMXTLu2Ruk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=V4IHO225YeZX+Ojo71/NEUFbxH8fDSCq3qub5zAm8/aSt6UQNqfMAyZ0VfYSB5EntAPqvSfVn3TMnHAt1muxyABtT1vLMYb3wEqCbH+rQj+udnIYkankkuHfr+yEhmwmHcut30ePP9/8trz58FDdM/Sf6Jzf+Bm99hU/51sbHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyU06L9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C08C2BCB4;
	Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775257864;
	bh=2A0r+UE5+pZzmP0NV8rxJD+zsPZ9QB1jSvMXTLu2Ruk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FyU06L9mYRKB/h2h7IPur11i1Wsp8wXpo+vZmEoNVth2G+LY1gWL/1qE94g72ZI0p
	 Ig3AqnmLV7DYLUmE6O1ZHNLrFfv8jVaegiFaNLxpo9lWRryCV6J2YKeXk4MfrIB/Jv
	 3DYyddrTk9/vn0yH8rYIrlFtxCmIfOgeiVTDXRtkoCFNuCsYH9PtLamSEAaUP/EoIa
	 de2SseFZnafpvd76tFhRWls8kYia35FWrKWlSaMFiOfu/iMsrDUSCe076ddbwmkvXY
	 uURK963UR8ucsigR4FK3bJPnkQdE4zeA8kVsAYkhq/05Mlj/al20ScKB2Hbz9D/M/9
	 LKtmMX+SMQrKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9D923809A14;
	Fri,  3 Apr 2026 23:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: set clk_csr
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177525784528.1484550.15000658564250210925.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 23:10:45 +0000
References: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101744-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F513398F91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 02 Apr 2026 15:47:53 +0100 you wrote:
> The clocks for qcom-ethqos return a rate of zero as firmware manages
> their rate. According to hardware documentation, the clock which is
> fed to the slave AHB interface can range between 50 to 100MHz for
> non-RGMII and 30 to 75MHz for boards with a RGMII interfaces.
> 
> Currently, stmmac uses an undefined divisor value. Instead, use
> STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
> since this will generate:
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: set clk_csr
    https://git.kernel.org/netdev/net-next/c/789ec16eb397

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



