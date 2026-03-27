Return-Path: <linux-arm-msm+bounces-100292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDRVJXB2xmnSKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:22:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23134423F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A46003015844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63A939B4A3;
	Fri, 27 Mar 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcGZXUAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF9034EEF2;
	Fri, 27 Mar 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614019; cv=none; b=IsKHqxSHmNLD5M6QTRXLGjBzYXVin4viX2pf1WN2OGuPzLXTDa4YYjOKMLmWv15x/mjEgeA2UXbf6H03VmgFMUa1gst0NqrwsynY/DS66CWdQGCuDPkNZPIYmLiwR8Xjf2p/RdZfaNQF261clvEydCrSUlOhr72TunBBvzP6/34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614019; c=relaxed/simple;
	bh=zsB3v+Byim1FIpCocjgBST4WC+e7+POJuMKMy6Fwz4U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TZeq7oU+zSutZUzRWVMmAlxR/RgGI/UWsl1bsvzAJivgB1i9BF+sY5wTayp7twCdROFY0xPsP3sosksicJmTkYDytukAylmIIzUEwLLr3RzP6v+aZ68JOc5yoarww2EdQjrQBXb39hMOu8uRDRu9Vj33SxSuX7kdnp8Yk2W3yyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcGZXUAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4D4C19423;
	Fri, 27 Mar 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774614018;
	bh=zsB3v+Byim1FIpCocjgBST4WC+e7+POJuMKMy6Fwz4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kcGZXUAzelDetxDDvPqKkdit6V8Eh9G5PDl+WQ60pgKQIgu4V70GPhKHZydSfy8Tb
	 7n72nvc8Migm9q1+YkoUDDUeUjleAo1O4+8SGdx/vTshSaAxszaB49YzCKgGpbc0o6
	 GO770D68eYTqT9600SPWMqSMeji3yMWAU93BibX7s+/kHvZGShFpWpxS3t2NrkaOUM
	 6kzcjQRZvjNbRShn+2/uWE/laB/0S1TyWQf2EQIjQAYmjPH8IUOrCWgZfFYfIUQ/JJ
	 cBfvlu0w9cKNbAeZAsdnTOza23RdP55pqKynpUFcmcVTO0jFHtNbsdy9bQe8N1se/h
	 eE7AewxszURUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CF5393022E;
	Fri, 27 Mar 2026 12:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: qrtr: fix endian handling of confirm_rx
 field
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177461400479.3457865.940451626151313494.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 12:20:04 +0000
References: 
 <20260326-b4-qrtr-fix-confirm_rx-on-big-endian-v3-1-9ea3c855ce39@westermo.com>
In-Reply-To: 
 <20260326-b4-qrtr-fix-confirm_rx-on-big-endian-v3-1-9ea3c855ce39@westermo.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-100292-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[davemloft.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F23134423F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 26 Mar 2026 08:17:52 +0100 you wrote:
> Convert confirm_rx to little endian when enqueueing and convert it back on
> receive. This fixes control flow on big endian hosts, little endian is
> unaffected.
> 
> On transmit, store confirm_rx as __le32 using cpu_to_le32(). On receive,
> apply le32_to_cpu() before using the value. !! ensures the value is 0 or 1
> in native endianness, so the conversion isn’t strictly required here, but
> it is kept for consistency and clarity.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: qrtr: fix endian handling of confirm_rx field
    https://git.kernel.org/netdev/net-next/c/e4cf6087cab3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



