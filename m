Return-Path: <linux-arm-msm+bounces-100191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F0sGSv8xWmOEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:40:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 685EB33EDD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A339B302826D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1F336EA9B;
	Fri, 27 Mar 2026 03:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbRTZ+aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF636D9E6;
	Fri, 27 Mar 2026 03:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774582820; cv=none; b=u1TxsCTakme+jhnqI4v/rn22dk1H62u171qSzHf2yEcGeaT/mqply/hnYZKHtyBqjRwGEFP3D7jsTe6yq/1SOu9Fjy/KzPcHO4FEoXncTc9L1pmRFlEaS73l070sIAz0hk55Grj2vgAaEWdNn62KNezzLnnO1FbBwGONPmE/FPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774582820; c=relaxed/simple;
	bh=gE7KMmVBMRpPER+wtbVUeqXwIsZUFAHyeuliTqSSXqU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=icISPOjev78DlUS029Yc8/0Xq+DiEvPJhKbT5YKsUvg+WuyCIvO7opT+ikWzHbNRfwBrKvtKpegnEkR87tzA24QTT9gaESghfq5kCkyrgNZMDtGlfgB3vn+jlP6RbskBOrSvnfiz3t7UaOSeHfNmEBMvVM72HVutdcOmp3XTbaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbRTZ+aQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E4AC19423;
	Fri, 27 Mar 2026 03:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774582819;
	bh=gE7KMmVBMRpPER+wtbVUeqXwIsZUFAHyeuliTqSSXqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bbRTZ+aQOtZN5caZtZF2ctJDOIi/zNleAZnludnjI1Ip4OxpbDY5LXsSXBeFzCet4
	 bTLPccpJo1DmSQ+h+At8Sjd+/8EvLP89X6qGpvKjAGvXn/JBG6qLedotoFD5yoVays
	 B+fBizCz2UOWpv+ElSWrw9EELpdf8Toloy5MYt68rvWZ/v1EdnHG6xFFaQSpCnDii6
	 cm6AzG0YN4fCbjIX5zYXi2KbMv488uT0Zl7sMV0q/OKGGCZfVpKUeG8hdJdM6ZPKzb
	 PtwTnmmgUzfYd/FGWbY/aJLet57VIs/2XONlk8gmuuWlml987ucB9hugxAZ3kJWhdH
	 WBB+W3seprVaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DE73809A0B;
	Fri, 27 Mar 2026 03:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v1] net: qrtr: replace qrtr_tx_flow radix_tree with
 xarray
 to fix memory leak
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177458280579.3288619.17825648611260843625.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 03:40:05 +0000
References: <20260324080645.290197-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260324080645.290197-1-jiayuan.chen@linux.dev>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, jiayuan.chen@shopee.com,
 syzbot+006987d1be3586e13555@syzkaller.appspotmail.com, mani@kernel.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100191-lists,linux-arm-msm=lfdr.de,netdevbpf];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,006987d1be3586e13555];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,shopee.com:email]
X-Rspamd-Queue-Id: 685EB33EDD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Mar 2026 16:06:44 +0800 you wrote:
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> 
> __radix_tree_create() allocates and links intermediate nodes into the
> tree one by one. If a subsequent allocation fails, the already-linked
> nodes remain in the tree with no corresponding leaf entry. These orphaned
> internal nodes are never reclaimed because radix_tree_for_each_slot()
> only visits slots containing leaf values.
> 
> [...]

Here is the summary with links:
  - [net,v1] net: qrtr: replace qrtr_tx_flow radix_tree with xarray to fix memory leak
    https://git.kernel.org/netdev/net/c/2428083101f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



