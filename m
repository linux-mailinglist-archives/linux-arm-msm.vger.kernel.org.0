Return-Path: <linux-arm-msm+bounces-102692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOzeFTcH2WnolAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCE3D8900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 16:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 063623012B77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 14:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0B73D0917;
	Fri, 10 Apr 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH1gW+5s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7113CFF79;
	Fri, 10 Apr 2026 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830831; cv=none; b=at1D9zPTpzjjQUlGuV997Nj2WNsXv84G41hSPxrY6Dz/n5gr2yAzdHbyASSwmk/Z9pzNyMTJFhhwwJqQV95UFcdBOBwT7Q9uJYfj4mB9wlAbvrlXK8DeYBslbszjIAY4V7YFL0BMc7OMM4+B2joWa+U0IeRdMfCIPfRG/qifG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830831; c=relaxed/simple;
	bh=6HFLUnc1WX+fDrN8FLsqmecs0op5nXvV33fmB091CqA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TX8WD668vY7dl/Y/GqApCkfWZX7Ne4EPlg1VWqYNXIIayuZeXpYKV30aT0RLlUVMlQF2WvuxzXzmgE8y01SNND8pm/w5LGoqehGpoE4Zf5Rai/zxyExSmYhLtpEOMIWkkDhI/gDcIUTRKULB5PUdmVVQ1wgh80JbCCl21gU7HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH1gW+5s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0599C19421;
	Fri, 10 Apr 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775830830;
	bh=6HFLUnc1WX+fDrN8FLsqmecs0op5nXvV33fmB091CqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oH1gW+5soF2EHtLss20Pqg57hElYNhMvrzwUzJZPlanS5FYdObXK2v3BMgW9SnRz1
	 ti8/HvjtTEucy5pEL/M5oeiI5lpYlHdXXpH0WuWObxPkQUOqafBKR4rZC1FDnBXP9o
	 +qpZH7IK9ZBHwzaRWQUxZlpyROQ8+TEP9UGCrBYDG4G1w9W2EoJaVNjRc5AY9duGY1
	 k6F8al40pIvBe2jseTnwt7kuy5BhlkFpXlbTY/xQNZUrcGTKqB8M/WV2IiiR6XCAvx
	 Drh8zccYCDNBQCHFa0QxHhL47wQGCiGxgux3B74dMJ9xRjROM8VQcmn8qrillBvRn8
	 x3Nj6pzw1fykQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA10D3809A22;
	Fri, 10 Apr 2026 14:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6] Bluetooth: qca: Fix delayed hw_error handling due to
 missing wakeup during SSR
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177583080530.2077665.9557977139979519182.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 14:20:05 +0000
References: <20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
 bartosz.golaszewski@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-102692-lists,linux-arm-msm=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: DEDCE3D8900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 10 Apr 2026 16:52:02 +0800 you wrote:
> When Bluetooth controller encounters a coredump, it triggers
> the Subsystem Restart (SSR) mechanism. The controller first
> reports the coredump data, and once the data upload is complete,
> it sends a hw_error event. The host relies on this event to
> proceed with subsequent recovery actions.
> 
> If the host has not finished processing the coredump data
> when the hw_error event is received,
> it sets a timer to wait until either the data processing is complete
> or the timeout expires before handling the event.
> 
> [...]

Here is the summary with links:
  - [v6] Bluetooth: qca: Fix delayed hw_error handling due to missing wakeup during SSR
    https://git.kernel.org/bluetooth/bluetooth-next/c/9f07d5d04826

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



