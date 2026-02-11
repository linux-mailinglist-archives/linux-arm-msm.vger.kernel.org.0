Return-Path: <linux-arm-msm+bounces-92618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAtzAjPbjGm3uAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:40:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB4127378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD96630209CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A51C356A07;
	Wed, 11 Feb 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sosWoQQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C73563FB;
	Wed, 11 Feb 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838812; cv=none; b=Lij3at4rZoIx8oYVuvMuXK9I/D0t/zX2q85l1XlPIT7O3K8CqPSieE8YgRIkSuY6c4o66DcH5Um2sD+8CmDzHzIDj0PY7EX6E1C0X7kgYrRlGPDXP+YuuKF/uWO5sVzgsaQq02cTZEeLf69OASHrjRUJ49BtqNBPi3W+VhDvL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838812; c=relaxed/simple;
	bh=ylkijntF6b8qB/UpxOEE+EQeD3zPm1mGPfjFA64Ia4I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=g9axJ0qgvhciLZELs/96IBRurglh2wcYk63lWQcvszooDEuRbSjwyKkcXnQlU7bY9vohBA2QHEsf9N+ylopg/FSNhDMa9m+1gY6ocIKRJfBQy94wv6XoZD0QjxBnQH1Ni64hexqWbNmLbb2WbybkTlfUQoxLroor95jNfm23cRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sosWoQQm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102A8C19424;
	Wed, 11 Feb 2026 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770838812;
	bh=ylkijntF6b8qB/UpxOEE+EQeD3zPm1mGPfjFA64Ia4I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sosWoQQmNOJZARi/cA6SgQD8k69p21tjDFrVbNaoCS+yMOMKP2BeK5HZXXEPU8kAe
	 E3aiJre62mt3zbK+jI6MO2AGiitnyq59j2pa2d56SJc4sKoeQD9uVx0794tTbylbor
	 ynbE+szE74lX56fWyThrIj0lKpQmsAoNeJYSY5WZqoLR680HO1K2yC18vHHjwSut2z
	 PHA4vPqpQuCyYfCav95XiIBpTa6ZjviocnTAE+1ttMQ30Q98mkhmCQBvARFa5edkG6
	 ww8UL4LVhQ5PaZn0Z2LlhqsPHXS4fo48KL+lYY2dN5pHpfaJgL9ZNA68D1UTFSoNOV
	 XKgaPk03fgQbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B38D39EF964;
	Wed, 11 Feb 2026 19:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] Bluetooth: hci_qca: Cleanup on all setup failures
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177083880682.688115.3353711638661870802.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 19:40:06 +0000
References: <20260205062600.590342-1-jinwang.li@oss.qualcomm.com>
In-Reply-To: <20260205062600.590342-1-jinwang.li@oss.qualcomm.com>
To: Jinwang Li <jinwang.li@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 abhishekpandit@chromium.org, quic_bgodavar@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 bartosz.golaszewski@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92618-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,chromium.org,quicinc.com,vger.kernel.org,oss.qualcomm.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 83FB4127378
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu,  5 Feb 2026 14:26:00 +0800 you wrote:
> The setup process previously combined error handling and retry gating
> under one condition. As a result, the final failed attempt exited
> without performing cleanup.
> 
> Update the failure path to always perform power and port cleanup on
> setup failure, and reopen the port only when retrying.
> 
> [...]

Here is the summary with links:
  - [v5] Bluetooth: hci_qca: Cleanup on all setup failures
    https://git.kernel.org/bluetooth/bluetooth-next/c/f266be5c8533

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



