Return-Path: <linux-arm-msm+bounces-109122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKJuIzcuD2r+HQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:09:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284555A8EF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 18:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 905C5314B12F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9DD3672AB;
	Thu, 21 May 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE+QGGZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371321B9F6;
	Thu, 21 May 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377411; cv=none; b=kJJRE0WLr0RUQgvbbcQrcxNAA/UzT/cfVuYRFuSFaEk7R7JkJaBX+melpbq+O6twn42OKRleS+MdvwRAwEmsOoVDk70PD3NCzqrntHi2z1/5yLfxoV4by+RQghiiNHZ3kkzhS2Jsb7KwOVf44sde3ijkLx4egaJ5S7uaUUK0J30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377411; c=relaxed/simple;
	bh=otlNBy5uFE0/T7c3GqC1TfuG6DpqvH5OKWSSeg9pZzA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cuZvUnwMuvSLuyUXTRopSReFhPWoQSvpZM3Rhk47j/8rhcDSP03IiKMKJUwZd7eo0YwavTPB5xbJl83t3Jjccfk32JdGmSvjbf+vZnZM6kSO/EkhvHeGyM05y5x9t6gDgY1PqZ7EsAO7CvlHl7HOLucvhrbc24TorPBxe3IWCyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE+QGGZP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054701F00A3B;
	Thu, 21 May 2026 15:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779377410;
	bh=z8/MiZU1IUBpOtYJJGKz2o96s5ea7NWEcWYxykF9vqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NE+QGGZPde43kl4MT/JfyFYNO4eV6i+/d0u9uvvn99F1GO/6JpXsO3ge1BxUcR+7N
	 WxbLCV0njbEOOvfDITYOTqNdFk4rEEABwZYdhTvi472jdtZWwVsJfx6FAEvxL7LURb
	 kBY5bRzEd+0/82YvGsBAEaN6lOnRNtAJ5GO2gjzuUfIMCLwLoCh2Zp9I4/A5vW8KJ5
	 V7djyc7slTw1CMye7Rcqdvg22mOg5bPB0IxNWdZCgvXvWsemSv3bRjyg6hfMB6qIrV
	 b4LFmMjKE3bxaZ6+a2I7Ky2R9xvYs+KV1WvwblxsJTFEv815CBV0qYuB/YNxq8uCU8
	 I/lkoaaZKWPCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1984B3930E02;
	Thu, 21 May 2026 15:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: btusb: Allow firmware re-download when
 version
 matches
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177937741964.384060.1194018588221994045.git-patchwork-notify@kernel.org>
Date: Thu, 21 May 2026 15:30:19 +0000
References: <20260521052547.2862803-1-shuaz@qti.qualcomm.com>
In-Reply-To: <20260521052547.2862803-1-shuaz@qti.qualcomm.com>
To: Shuai Zhang <shuaz@qti.qualcomm.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 shuai.zhang@oss.qualcomm.com, stable@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109122-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,intel.com:email]
X-Rspamd-Queue-Id: 284555A8EF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 21 May 2026 13:25:47 +0800 you wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> The Bluetooth host decides whether to download firmware by reading the
> controller firmware download completion flag and firmware version
> information.
> 
> If a USB error occurs during the firmware download process (for example
> due to a USB disconnect), the download is aborted immediately. An
> incomplete firmware transfer does not cause the controller to set the
> download completion flag, but the firmware version information may be
> updated at an early stage of the download process.
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: btusb: Allow firmware re-download when version matches
    https://git.kernel.org/bluetooth/bluetooth-next/c/3c2c428f25e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



