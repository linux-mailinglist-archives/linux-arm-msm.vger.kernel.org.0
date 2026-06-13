Return-Path: <linux-arm-msm+bounces-112982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JKUBMl23LGraVgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 03:50:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE567D795
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 03:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Nty8gno+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112982-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112982-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB65B301E101
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 01:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC23A3811;
	Sat, 13 Jun 2026 01:50:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C8381B00;
	Sat, 13 Jun 2026 01:50:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781315412; cv=none; b=tbsP3nT+yM39Iv49dhAF0ZNSNg13+PvV/343BERbbdkRYzJk5fouQtzb3SSlSrVMoEUx4/hB1ZQp2MCKyzbRC2vqWqQZ1SfLZwdeFeR/jdnhe/y6/1GLuHOIAxIuLdN74ZN9lssYBeOAunwby64CuQOphVaAnflomgtOEuE1qcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781315412; c=relaxed/simple;
	bh=TRzImSY2SWfPCS/SC4hzYAUtCdHbgMPdEyve7qgHvYw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b83pWgD+9GAgx44rTMQVfIO+d1oNOf8iZ9VEnUMfIBOy+2nuqJ65iU59sNTLqnYU6+UC0RKQjydC+fmkBe6QBDNX9fK1D6Wpt5rYRgDmtSCGAAsHt5fnFbsiryg4UWnCEEnlqDyg0bwjQtobap0mKkW/EK0Hhcdq5dSaI0G/aqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nty8gno+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EED1F000E9;
	Sat, 13 Jun 2026 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781315411;
	bh=BOrpAwxya2ulIk5fBuqfmGjMy6iJn8EB2CWDGvWEvVQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Nty8gno+USU0MPJhHhS/9BAxmozZ8icTE0SgdpejcL/tH2L3owgJemxxL8aTxXznI
	 0q3rWUJsuSglcxJRQXK+Yt6FoZA1nhE0BX59u3yFhswOayKo3f1814KOS8f8Ia7hLm
	 QAAGtQNClt9dgG3i0/+DDRWEt6CoumNzEa3HnyTnh3fbFFXo4Jr+P1YXp87Eu7dt3Y
	 NAt0ka22rKt7BYUSpC5it07gaFc+dOqpKDAQVcMuSr1NLIWfdIO07HmucAQIW7O+SB
	 y53SeuC9bJf5Id9YESiiYNUxAZHhelVoDbWVZ0kdaFoclmIzz7f/BZKn27IKd5GTVP
	 VHeuAlORJHwOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939A339E9607;
	Sat, 13 Jun 2026 01:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: fix 32-bit integer overflow in
 qrtr_endpoint_post()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178131540813.1328827.18042311383082528410.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 01:50:08 +0000
References: <20260611125455.2352279-1-michael.bommarito@gmail.com>
In-Reply-To: <20260611125455.2352279-1-michael.bommarito@gmail.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112982-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5AAE567D795

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jun 2026 08:54:55 -0400 you wrote:
> qrtr_endpoint_post() validates an incoming packet with
> 
> 	if (!size || len != ALIGN(size, 4) + hdrlen)
> 		goto err;
> 
> where size comes from the wire. On 32-bit, size_t is 32 bits and
> ALIGN(size, 4) wraps to 0 for size >= 0xfffffffd, so the check
> passes and skb_put_data(skb, data + hdrlen, size) writes past the
> hdrlen-sized skb and oopses the kernel. 64-bit is unaffected.
> 
> [...]

Here is the summary with links:
  - net: qrtr: fix 32-bit integer overflow in qrtr_endpoint_post()
    https://git.kernel.org/netdev/net/c/20054869770c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



