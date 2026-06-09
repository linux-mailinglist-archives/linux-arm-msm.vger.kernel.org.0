Return-Path: <linux-arm-msm+bounces-111992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R2JKC7BzJ2rUxAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:00:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884E65BC73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 04:00:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hKa0IqxF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111992-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111992-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 261C5301AF43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 02:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7B835F611;
	Tue,  9 Jun 2026 02:00:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0FB346A1C;
	Tue,  9 Jun 2026 02:00:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970412; cv=none; b=FPMS7n4SSu21VWhnJEXS3Bh/3O1JKEY+bG06HtvKNYgPYURrywHSTxV6bsBD/0Hwnk3Fd4obAt4uOI17KkhgnDuofdw1d2gAgxV05QeLB2UYHGNmtLUQcv0sx5UY2rRYnmqVotr9WVBOGAANwilh7CFPu+Eu1Bi/iogQtR/rRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970412; c=relaxed/simple;
	bh=KESPk0QeYpFFH9I9A1lE4B63HdkTTM/pgWzw9ZAdF1Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ClYnsZVxaCbe11Dgb+OKCVOFaSG6A786/5pVAnKWUl2VBzTDSPPaZEnnhX7OsueBxHo+twi56hUhl9elYbwxUgk/eJZ0I4JriC1M48+Z3Y+bz+S/9zaPEMVsPYMXT/COR7BGaJdQMF84lCi8D06ZX+5jZVevxUfBXhmwdDxzMtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKa0IqxF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9171F00893;
	Tue,  9 Jun 2026 02:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780970411;
	bh=HFAYLzKQKH47om5PVR13EZ5CvS9CvmSNS1aRsyzyMEg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hKa0IqxF9V85paARbeibuJc7gIOOeTO1xVzEY+2LDlGmw4iZtwg42J4mdhwowsARN
	 AcN4oo9QNY88ni+12hRQnB3PYiLYFCWrAKVWMcQcMbyew8RAKHSwDAicQsRfPkVXRk
	 tsUPuOaiUIpbeXQBnwAi/VjmNY+kDiHWcIu/h+MmAfMdtQ35q351S54LZZc5kCVncF
	 eM4c6iicqIQbIPrUbrLCUBjjU+Jvw4VtA3aywRvbldZh7fidW10T+99yGJOiFM4N54
	 34LWbCVJvbfaeXdbK1G7AT4hCUTOpy3ucVMKCE4KOxjhHtNBIt74Gq01/vVYUBD20o
	 2Ig2zE15dG/UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A0C3822D43;
	Tue,  9 Jun 2026 02:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: qrtr: fix refcount saturation and potential UAF
 in
 qrtr_port_remove
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178097040939.1753037.3386694182969051861.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 02:00:09 +0000
References: <20260604064801.1180388-1-w15303746062@163.com>
In-Reply-To: <20260604064801.1180388-1-w15303746062@163.com>
To: w15303746062 <w15303746062@163.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, luca@lucaweiss.eu,
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 25181214217@stu.xidian.edu.cn
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111992-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:w15303746062@163.com,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:luca@lucaweiss.eu,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:25181214217@stu.xidian.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7884E65BC73

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  4 Jun 2026 14:48:01 +0800 you wrote:
> From: Mingyu Wang <25181214217@stu.xidian.edu.cn>
> 
> In qrtr_port_remove(), the socket reference count is decremented via
> __sock_put() before the port is removed from the qrtr_ports XArray and
> before the RCU grace period elapses.
> 
> This breaks the fundamental RCU update paradigm. It exposes a race
> window where a concurrent RCU reader (such as qrtr_reset_ports() or
> qrtr_port_lookup()) can obtain a pointer to the socket from the XArray,
> and attempt to call sock_hold() on a socket whose reference count has
> already dropped to zero.
> 
> [...]

Here is the summary with links:
  - [v2] net: qrtr: fix refcount saturation and potential UAF in qrtr_port_remove
    https://git.kernel.org/netdev/net/c/a2171131ecda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



