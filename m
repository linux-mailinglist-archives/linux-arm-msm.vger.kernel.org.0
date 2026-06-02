Return-Path: <linux-arm-msm+bounces-110695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCZFEwhKHmq+iQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 05:12:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F6C627954
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 05:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E17293045AB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 03:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C1E3672BA;
	Tue,  2 Jun 2026 03:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4heG3oq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CBF368D52;
	Tue,  2 Jun 2026 03:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780369823; cv=none; b=sacKo6FHNdM4SIcweqRsdnJ+05dw/YPIs9gQ9IRpr5LjbvX/1zbHljbUDpCFOyWBuga1OQqP69TbB//PTN20KvOr3+f3aqhNh9bVpPlSjm5DQ+9QX4g7WhPjvtYpVQeWw61i0yKTchDC2Au2sd+cm0RcHv54xM7ncoDrH2zgLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780369823; c=relaxed/simple;
	bh=WJN8CzofN/W0ri4BTYKZJBNpzfigOeT/kKTG4JrPMog=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kr3PBTBMJLW2ClbRKPZ9TTz0DUImFH7y3p2b4psUP8t7PxV66oTRFwYejTxIHHVhT9V6JH7cn4bDC9k0nzojpROdBrZpAFmGURBs4PgYDusIn8rUNBebh2lYlcYFarfilM221EGbKQ17XJrX2ARcbhTY88lJSvevQqHkcy9Z2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4heG3oq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E409E1F00893;
	Tue,  2 Jun 2026 03:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780369819;
	bh=KnK8K8pQoH/ek10Er8yHN1BaRBv//G/62A3/HJNKdWA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E4heG3oqaUKDcQWfXO20xPtkAQcO9ymXseCLnVR44Ex3QfbnDaYrJwxCY2/F+mM2k
	 hKSczFJfIOmk7/feLlOlQOjjk5NwbIHFY9XAPoYUEdIDddJDQN19iC3dfXoO5YDh41
	 STmw5Y9dti8GaGEiIwCWtOFBHXhRwYajg/Q5+qVmhnFEWcT6FMmN2J6km07/Fl5sMa
	 +KXDmu75BglQkLMDEPnCiimI/lOE2ri66ad29dFIBpvIJbzR9OmQD5xAvg9u/vDZWu
	 cuosPsS9cdhWpQur7z9eV+7nfEkTR4Z11pQ6PkjGXJEdKJsk+cRpa+kpQSN2dFmeWT
	 b8JwZ76LcffTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BDC38119F9;
	Tue,  2 Jun 2026 03:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: fix node refcount leak on ctrl packet alloc
 failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178036982189.224606.10962942847177813465.git-patchwork-notify@kernel.org>
Date: Tue, 02 Jun 2026 03:10:21 +0000
References: <20260528080019.1176700-1-vulab@iscas.ac.cn>
In-Reply-To: <20260528080019.1176700-1-vulab@iscas.ac.cn>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-110695-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E1F6C627954
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 28 May 2026 08:00:19 +0000 you wrote:
> qrtr_send_resume_tx() calls qrtr_node_lookup() which takes a
> reference on the returned node. If the subsequent call to
> qrtr_alloc_ctrl_packet() fails due to memory allocation failure, the
> function returns -ENOMEM without calling qrtr_node_release() to
> release the node reference.
> 
> Add qrtr_node_release(node) before returning on the allocation failure
> path to properly release the reference.
> 
> [...]

Here is the summary with links:
  - net: qrtr: fix node refcount leak on ctrl packet alloc failure
    https://git.kernel.org/netdev/net-next/c/3b09ff541145

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



