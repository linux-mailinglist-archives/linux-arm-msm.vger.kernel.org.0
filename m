Return-Path: <linux-arm-msm+bounces-114566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hmWRKEJWPWo51ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 18:24:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73B6C7739
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 18:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cJSGwDNT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B30630BC2D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 16:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEB93EB7E5;
	Thu, 25 Jun 2026 16:21:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90353EB109;
	Thu, 25 Jun 2026 16:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404464; cv=none; b=f+qNGLPxSjLX17zUOmsPycCC9G8l1ZsCOhGSrsck+zI5FUjGPU6IdMBoNVPSuKK0+8AL93llJp9D/YCxd/GiG5G4DHVfnxBxkPjVNwhPlzu8WEhCyXjlFo9UXK/3HyJ96cF72MUESzZz0xx55crgawpKvzm6gAOotyyNplyiaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404464; c=relaxed/simple;
	bh=xrLwSyXmtmsChkV0naETQN9onqnVo6oYYeqKKEOxBKQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fk9Ltts3Ti11HeYloeL5vgBlX2mCuy9xT9S6HHzq0niz9uOMFPoVN94W1mztYSNmdBueq5JRyhN6dlf8p9zkP/W/Z00SnCKIQ6pxLwvn1AoWWDUTC1Doq4xPA+HbadfjH382RGtQ6EhpEl6I46KoPT/9HWr0Ut7YaRE8RK2QqmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJSGwDNT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0221F000E9;
	Thu, 25 Jun 2026 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404463;
	bh=P59ValBkQNzuvvptIgrf+qBNmqFCKZvDwNjf8Im7x5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cJSGwDNT21U5KBgpUWXr42TaygGJ+W3tS2NkIfoe5FTfNAPykkYzY84HhmE1t7xn4
	 2HwvkkUPu6Ipg/UOYqVjO8jQzs99aUlqGYtVR1YdOy267hhY2Uh4U4puJTG/V4x8G5
	 wOBbqRVvaLUXrjI1m+sAPZJgvJJ/Xvlxwv5LXOO683kMqDHeRa+eyUGihz5GpkyA2R
	 IGKzifnCEdDzhUrFT+/rLYNQvL2tDOZQyMKtexkrClDFEFdCENQaVveVxALDrKMAR4
	 LVToPRDG7Mq3tcMgahQQZ3b/m2Reonqk3qmIVSNIFeuX/SVBcNl96iu4QagzyPQC4G
	 Pcm7eYo+I1J3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568F43AD449A;
	Thu, 25 Jun 2026 16:20:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and
 fix maintainer addresses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178240445086.3803792.5981466761897195144.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jun 2026 16:20:50 +0000
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jie.luo@oss.qualcomm.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 quic_leiwei@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114566-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jie.luo@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:quic_leiwei@quicinc.com,m:quic_suruchia@quicinc.com,m:quic_pavir@quicinc.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F73B6C7739

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 23 Jun 2026 09:33:08 +0200 you wrote:
> Emails to the maintainer of Qualcomm PPE Ethernet driver (Luo Jie
> <quic_luoj@quicinc.com>) bounce permanently (full mailbox), because the
> "quicinc.com" addresses were deprecated for public work.  All Qualcomm
> contributors are aware of that and were asked to fix their addresses.
> 
> Driver is not supported - in terms of how netdev understands supported
> commitment - if maintainer does not care to receive the patches for its
> code, so demote it to "maintained" to reflect true status.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: qualcomm: ppe: Demote from supported and fix maintainer addresses
    https://git.kernel.org/netdev/net/c/efd7fb21bad8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



