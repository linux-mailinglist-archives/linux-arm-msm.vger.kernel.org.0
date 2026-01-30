Return-Path: <linux-arm-msm+bounces-91230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJQNAIkcfGmAKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:50:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42EB6906
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E5AF30041D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAE9335564;
	Fri, 30 Jan 2026 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2J7m/XR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E15334C24;
	Fri, 30 Jan 2026 02:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769741440; cv=none; b=tUyVtgr+eg84bFX6kemROQAjUE/TmOEekWf8RXNzxo80maeLPlbbqk0vnz2tUwuLKeW7C77bDIT1VHGu6UKQrsx6VOOd9oojbcD83j2Y9Q/FgMvdRed63y03nnc1P4cpzADKaOqxQsflmn90sC1G0V3YmbS389VY/5lWWnyfpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769741440; c=relaxed/simple;
	bh=fFgZmrixKo+SlJgXhkmwmrwWZxofEJUJAMLt9IoJXLM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fFgJXCowUZwhnn7QadAc/F1KCNt7ukxQjlBAXe5zUZA2KcPVmaQ7TUNHdV+M1ITcdsg5EYEcMx/x+cpmgLK9SZLBv/rhZBh0e5V3U8SDgP1pUyTCzH9erBmGl9zTgIsRhvMrDRBvKzpPtOb+WrVrbldg3fSLOKMxlWX5HF6I3Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2J7m/XR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E027EC19422;
	Fri, 30 Jan 2026 02:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769741439;
	bh=fFgZmrixKo+SlJgXhkmwmrwWZxofEJUJAMLt9IoJXLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=C2J7m/XRRBFXSSXPheKz/iyRCfTpPfDgpBariyA+Ed38qU9AIFnqf+uemOUJV7ZPJ
	 8lFbJd43qu/LfhtLc+LUThihjkLCC5A7OqGJoe5ZMpVH5joczyBujzCai4ufGTV8gS
	 FOfq9QPg/bxK+vhFUU4AqS17KznsMHgguDXPCRI55IXdLg+ocV4E/9LIrpmyaUfTNO
	 H+V1h5r6bizUhIuKjd/vDeMh1H14NHrf6B7sJcxtKtYbLCIDTnZYLHV1tkV0pKj8Gt
	 4HCsgmtnHkLetkLL6Y18o6GQwzRDuYHEEJxGjRSuRlznRIfuzlEwzrr3ArhXEGrbCX
	 VgfNru9HDua9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8DB1380CEE0;
	Fri, 30 Jan 2026 02:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove mac_base
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176974143235.3149010.13136116647525256549.git-patchwork-notify@kernel.org>
Date: Fri, 30 Jan 2026 02:50:32 +0000
References: <E1vl39x-00000006uvc-0A3S@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vl39x-00000006uvc-0A3S@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com, vkoul@kernel.org
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
	TAGGED_FROM(0.00)[bounces-91230-lists,linux-arm-msm=lfdr.de,netdevbpf];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD42EB6906
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 28 Jan 2026 10:52:29 +0000 you wrote:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: remove mac_base
    https://git.kernel.org/netdev/net-next/c/d414ed34a861

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



