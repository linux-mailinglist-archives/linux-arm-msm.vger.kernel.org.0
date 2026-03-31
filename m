Return-Path: <linux-arm-msm+bounces-100927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLZLGGUay2lrDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:50:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E7362DA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 02:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14C60302962C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 00:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393352741C9;
	Tue, 31 Mar 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0ZIyicK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F612AD10;
	Tue, 31 Mar 2026 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918241; cv=none; b=mS1wYDvAtrLBA6rv2r8+ROk0iE78sI2ZVrfrIYlRzzuJ73IDxT09R6d/uXHFsRrxAa5/JZlZyIN0GNSaFAvDReKLs+xNemUCc2ZY0JC6AEWXIxnaF41XmzcjgGB6mLZz/ezZ/SjH3/UlsNyAjHLqDk44wGdylGtpDmXOgAwJXB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918241; c=relaxed/simple;
	bh=vOZ5ozREY8aVWVHfpkrVrUIzl1//7RR1KGfdLz9ztAc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GD0eZhd1W7DcS9rmjRwIqfhmVXtkS3d8nAlnhnQqIpcjhn/Te1Vhxl914sumcYI23DUAg0wTsVUMrPS7vp30SiVszhg3oPbAb9F728E7KymqUkyWUpbBjJGybrXTD9l2y6jUbeT++jAWbjaUT1QaQoKgfkGUxfZs3QBbZRYBiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0ZIyicK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E04C4CEF7;
	Tue, 31 Mar 2026 00:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774918240;
	bh=vOZ5ozREY8aVWVHfpkrVrUIzl1//7RR1KGfdLz9ztAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s0ZIyicKnATvyDapEsaRwx/CH1SV/5pPeZaTS9qxv0BfR7Ba83+vmnKvOunbrVL+R
	 mkrAkJYbrM1u/0m02aKj2VN5bvWl99w9GyFe9wNjehITh02pTQNc+GfVQD8tO25+lO
	 iCB+8/IOIoG2is0q9pgouteSazBXMXlYmFdA1cG66ERMGniEZkBstALfI121OW4MTB
	 P/9spjd+0u232s1hTi/MOQNnIuVndPhG9E+5UfgCNKXn3DuuSLoAVLpCsfag3oaBbV
	 7Lt6Hy6zcAxFiVBUaQul28YA5UMRNC7iNjM+FiqzpGvXv74ZJMHvwv+4qk9h5NOHg1
	 rXa482DSLQF0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA154392FF85;
	Tue, 31 Mar 2026 00:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/15] net: stmmac: qcom-ethqos: more cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177491822455.2035926.9761670989228068564.git-patchwork-notify@kernel.org>
Date: Tue, 31 Mar 2026 00:50:24 +0000
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100927-lists,linux-arm-msm=lfdr.de,netdevbpf];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D2E7362DA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 27 Mar 2026 08:42:58 +0000 you wrote:
> Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
> code, making it clearer what the differences are for each speed, thus
> making the code more readable.
> 
> I'm still not really happy with this. The speed specific configuration
> remains split between ethqos_fix_mac_speed_rgmii() and
> ethqos_rgmii_macro_init(), where the latter is only ever called from
> the former. So, I think further work is needed here - maybe it needs
> restructuring into the various componenet parts of the RGMII block?
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/15] net: stmmac: qcom-ethqos: remove ethqos_configure()
    https://git.kernel.org/netdev/net-next/c/c3dd3b1e76e0
  - [net-next,v2,02/15] net: stmmac: qcom-ethqos: pass ethqos to ethqos_pcs_set_inband()
    https://git.kernel.org/netdev/net-next/c/673416fb5b41
  - [net-next,v2,03/15] net: stmmac: qcom-ethqos: eliminate configure_func
    https://git.kernel.org/netdev/net-next/c/e9ed46a0b129
  - [net-next,v2,04/15] net: stmmac: qcom-ethqos: move detection of invalid RGMII speed
    https://git.kernel.org/netdev/net-next/c/426ce4677e81
  - [net-next,v2,05/15] net: stmmac: qcom-ethqos: move RGMII_CONFIG_DDR_MODE
    https://git.kernel.org/netdev/net-next/c/6be23c4c636a
  - [net-next,v2,06/15] net: stmmac: qcom-ethqos: move 1G vs 100M/10M RGMII settings
    https://git.kernel.org/netdev/net-next/c/82d5fdc82a33
  - [net-next,v2,07/15] net: stmmac: qcom-ethqos: move two more RGMII_IO_MACRO_CONFIG2 out
    https://git.kernel.org/netdev/net-next/c/dd07f2f9149a
  - [net-next,v2,08/15] net: stmmac: qcom-ethqos: move 100M/10M speed programming
    https://git.kernel.org/netdev/net-next/c/8b19a9184420
  - [net-next,v2,09/15] net: stmmac: qcom-ethqos: move RGMII_CONFIG2_RSVD_CONFIG15 out
    https://git.kernel.org/netdev/net-next/c/dae1de3df3e1
  - [net-next,v2,10/15] net: stmmac: qcom-ethqos: move RGMII_CONFIG2_RX_PROG_SWAP
    https://git.kernel.org/netdev/net-next/c/432c8a9f5528
  - [net-next,v2,11/15] net: stmmac: qcom-ethqos: finally eliminate the switch
    https://git.kernel.org/netdev/net-next/c/439a27f21ecc
  - [net-next,v2,12/15] net: stmmac: qcom-ethqos: simplify prg_rclk_dly programming
    https://git.kernel.org/netdev/net-next/c/3df0e86f8f8d
  - [net-next,v2,13/15] net: stmmac: qcom-ethqos: move loopback decision next to reg update
    https://git.kernel.org/netdev/net-next/c/67343aa24e59
  - [net-next,v2,14/15] net: stmmac: qcom-ethqos: correct prg_rclk_dly comment
    https://git.kernel.org/netdev/net-next/c/2d350a892aad
  - [net-next,v2,15/15] net: stmmac: qcom-ethqos: move phase_shift to register update site
    https://git.kernel.org/netdev/net-next/c/7f9f30166005

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



