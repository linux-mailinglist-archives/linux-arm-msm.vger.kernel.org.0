Return-Path: <linux-arm-msm+bounces-106996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEzvAnguAmq/ogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 21:31:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C1515234
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 21:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B677C3019198
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE572F617C;
	Mon, 11 May 2026 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpLt2h8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8792BDC0F;
	Mon, 11 May 2026 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527860; cv=none; b=LeoRJy2FK/2hIjwWq5+IY71s2AgwedvnWTAa5fbbLUIv+zdgBmP12+xw1g2VeVLXBV05WkQTey5OrAZGIokXJv0rXB5n1yHcmXabFdHKyrMD3LhXe6mDcAkXemTuvkAfuQArXEhUp+8W4MBe67F+sWIAMe8rQLWVujsOwPwHd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527860; c=relaxed/simple;
	bh=wbDsHXH35zMX/reUbV3yQziB4Q55GyKhc/O1wSDXsDM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f/AlkLrLnNIn7TUzuvPvOgWAtmDBJuDX8j7mHeuhWAds1mvWkO/8n4I/zJvLejJvavuSgjhcMxHBR4Gdc6aE+lhC8QXNNn/6j3usWGubmsPCqAVplxfRjZdJ4mrydaAomh0DgnzJ9NL1MXFKRxEvDcbMdi7vRA15gWp58eAI3JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpLt2h8z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD75BC2BCB0;
	Mon, 11 May 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778527859;
	bh=wbDsHXH35zMX/reUbV3yQziB4Q55GyKhc/O1wSDXsDM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QpLt2h8zbugvP9IG9Ifwe5KB0+cxisbwVmanFoLqUfGHZGjL0Mo3jlLaqlzCN82mF
	 oGxoIGH6sAYxX1z+08unarJMPEnuuXWoBV1Quwf9nY3DRrb5lqcPW0hs47IYu2TFdd
	 pipE6duAY5/jpXNe//EuDDuDFVfmpNkhFKxUXKA6GZU/8yQ9vavGOBYGw8d64zrtoT
	 MQXULL5hbW2Thj5rJWS+THqfXC9tBdmMD8+tOZzZ87kqDM7qmxTCVNcbYo+upCLW9R
	 A2hWlI4Th6iS4jh4IdduIun0YTyJDSVdbXjDjG0iQLBcws0JGemgJzzVoVpLikuFT2
	 5Irs4/9LW1qHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D3639307A2;
	Mon, 11 May 2026 19:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] Bluetooth: hci_qca: Convert timeout from jiffies to ms
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177852780480.2428736.14134229951295592073.git-patchwork-notify@kernel.org>
Date: Mon, 11 May 2026 19:30:04 +0000
References: <20260511135837.3967550-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260511135837.3967550-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 stable@vger.kernel.org, pmenzel@molgen.mpg.de, bartosz.golaszewski@linaro.org
X-Rspamd-Queue-Id: 4E9C1515234
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106996-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com,molgen.mpg.de,linaro.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 11 May 2026 21:58:37 +0800 you wrote:
> Since the timer uses jiffies as its unit rather than ms, the timeout value
> must be converted from ms to jiffies when configuring the timer. Otherwise,
> the intended 8s timeout is incorrectly set to approximately 33s.
> 
> To improve readability, embed msecs_to_jiffies() directly in the macro
> definitions and drop the _MS suffix from macros that now yield jiffies
> values: MEMDUMP_TIMEOUT, FW_DOWNLOAD_TIMEOUT, IBS_DISABLE_SSR_TIMEOUT,
> CMD_TRANS_TIMEOUT, and IBS_BTSOC_TX_IDLE_TIMEOUT.
> 
> [...]

Here is the summary with links:
  - [v6] Bluetooth: hci_qca: Convert timeout from jiffies to ms
    https://git.kernel.org/bluetooth/bluetooth-next/c/c2f0079e8c42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



