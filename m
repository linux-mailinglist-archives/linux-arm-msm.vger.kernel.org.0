Return-Path: <linux-arm-msm+bounces-112509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r7N9KEaKKWoaZAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:01:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3902266B1DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JgFpzQOs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112509-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112509-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F173F301681D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C0043635E;
	Wed, 10 Jun 2026 15:40:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917D42DFF7;
	Wed, 10 Jun 2026 15:40:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106024; cv=none; b=ub5XAlVkAscqMdRo1vCTYoJIgbGPrzdso25tCNNVzBFk5ttbmfOZAAQIgxniZ9p+YFGV1H9qW/7YCYKwIH5of34f2+MR+kZ84aSW3EdFvObHDY0ilm5AEqGTUxSXE2rO/tQxl2+4YEqxB/h//4Q70smWQ+PjggNxNE8RZNKWaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106024; c=relaxed/simple;
	bh=MhqTkfEOxi8woU1Lp2JJsWhV4onOU2Sz05pZXCzQB8U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Tnff7TyqH1kyZkkE1wHOI1oXVbsc9L6LMvoLBCy7YmIrXJRlcnQDFR/TeuphlCo8pBnoouftrqd5/wPLbVqK0SBopUw3j+Faxnpt0EPAc9gOgghmvHE73IH5gEZzQSAQSsqHp7+9rI1PSpatIk2aY4FPE7vRbG3LQSMLVRg1g5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgFpzQOs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC231F00893;
	Wed, 10 Jun 2026 15:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781106022;
	bh=DubEQuvvvUndkNK7MlijMPCoZ3DCUbTVDGG2fPII0cU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JgFpzQOsX/im3KEJ2IhiVFeYvnW5Y1ek3VPCJLcUJLG7xnx5FzcxVrOOIQ8ONl6G7
	 HwT4jMh2SujXb/pscg9NepWm4nnqm64FoZaqFSrXYfEmjhrZXscOKfQoB3UaJjBj0a
	 n+8B+0G6dYEK5lgaUnZnZtBaqebKDI84vXdHWU4ysk87U+nyh4VDDDtwL+B4lRzOEE
	 wagAuSy7nXLE3QcdsILJnYkQk41FAtz4z2LnXOtY046R3v1l5vg95HasL8oYl+aCgd
	 kqCJ426ECcyQrk5FHQUMAxwhX/FQ8l974TbD4im8PoTgWlgEo4tWami0H5tvWk9wWO
	 ddc3c5TqG2KAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A663930D7A;
	Wed, 10 Jun 2026 15:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: qca: Add BT FW build version log
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <178110602038.3101197.11961968582425706354.git-patchwork-notify@kernel.org>
Date: Wed, 10 Jun 2026 15:40:20 +0000
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
In-Reply-To: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com>
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112509-lists,linux-arm-msm=lfdr.de,bluetooth];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3902266B1DD

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue,  9 Jun 2026 15:54:17 +0800 you wrote:
> Printf BT FW build version log after BT FW downloaded.
> 
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btqca.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [v1] Bluetooth: qca: Add BT FW build version log
    https://git.kernel.org/bluetooth/bluetooth-next/c/559cab24b04e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



