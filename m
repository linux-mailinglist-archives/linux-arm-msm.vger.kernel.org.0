Return-Path: <linux-arm-msm+bounces-112821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kmawK1A5K2ol4gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361B675AAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:40:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HjUgX1FB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112821-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112821-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E4C32FB104
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD939E9D6;
	Thu, 11 Jun 2026 22:40:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF753911C3;
	Thu, 11 Jun 2026 22:40:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217614; cv=none; b=oB3PRbkiRHu0AtQyEhcQdN3/Jv+pYPDc2rBQNR3L9uAwUXjdFycTMSXOqotoptYY4rJqbLJHJXtAYN8ukfaUw5vUImobw9XWt8ham4aONooQjxEwvWWQfygM5b2YVm+Iz22sCj8oiTAHDlBHB5T8z0GVF4OgdnxyqOtVkxIXJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217614; c=relaxed/simple;
	bh=RY7CxJeIveyKbuepkh6uGaQu1Y4O2yPcM3s2Fs3qnrM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aNOFiMo82YXI8FfmZaGd1nGFK51YnsEX5HCjQWw3mFPDhivrTg7ub8nYbIY3y60OeNNHVKWoPha35fxaYKqSEzVPzdClZoorHljy0djrr7zAyloSGPe8czNKJwda6a0AkYISPLFOce1R+n/pKNDP1gLtEjQ8YrUpzzjMlhXGFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjUgX1FB; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D241F000E9;
	Thu, 11 Jun 2026 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781217612;
	bh=yzBvDN3ySHiDTN0aX1O6FkoHQ6Jtqg3Qawn79gL14FA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HjUgX1FByKXb2OD6trFjME8d4Ju8zc6fbdk26+uBUdOgHSovnKnSYUF1t+ZKA6Y1O
	 v7tiRjuykWJWxcak5OfADB2bdcUzYWBs3BgDYNxBNFSv23OHSfUcSARjH9Tr6Rde9K
	 cgG5GA6h5KpIZzrFXGweodXiSukaI7n+3y0DM/RQgoMxw2e82KRt6QZJV4xUnVqeXP
	 rWHCk6Mqh9thLoZakzXNSpLx97kACHAv9RF52Zl2OcyXsHkS1c/t38jrEk8AFVGT45
	 TGnKyB2PxQPooAFq34QSAeVVFt/s8vJumrdbRbEImvjduS+P9BJcsIu6l/EKr1mVCE
	 4lpetApCZxi8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199B93930FAF;
	Thu, 11 Jun 2026 22:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] IPQ5018: Add and enable GEPHY RX and TX clocks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178121760964.392273.7381174880248445354.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 22:40:09 +0000
References: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
In-Reply-To: <20260608-ipq5018-gephy-clocks-v4-0-fb2ccd56894b@outlook.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.fainelli@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, conor.dooley@microchip.com,
 dmitry.baryshkov@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,oss.qualcomm.com,microchip.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112821-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:f.fainelli@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:conor.dooley@microchip.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0361B675AAB

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 08 Jun 2026 09:09:15 +0400 you wrote:
> Greetings,
> 
> This patch series addresses a missing hardware description issue for the
> Qualcomm IPQ5018 Internal Ethernet PHY, where the data paths fail to
> function correctly unless their dedicated RX and TX clocks are
> explicitly enabled.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] dt-bindings: net: ethernet-phy: increase max clock count to two
    https://git.kernel.org/netdev/net-next/c/19e00bdfbb1b
  - [v4,2/4] dt-bindings: net: qca,ar803x: Add clocks for IPQ5018 PHY
    https://git.kernel.org/netdev/net-next/c/fea4ae4b5b50
  - [v4,3/4] arm64: qcom: ipq5018: Add GEPHY RX and TX clocks
    (no matching commit)
  - [v4,4/4] net: phy: at803x: add RX and TX clock management for IPQ5018 PHY
    https://git.kernel.org/netdev/net-next/c/cf6077e4903f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



