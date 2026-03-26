Return-Path: <linux-arm-msm+bounces-100149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ECeLRF8xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63B33A277
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B174D3045E1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9BA39FCDF;
	Thu, 26 Mar 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6LD93N9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561083976BB;
	Thu, 26 Mar 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549819; cv=none; b=iG0oQIisM2ZoBt/0cF0bJwIMq95N2XS+hoqNKqjyUiUGU9+D8qzBWEEsMq0EMynQ9JBq/HTKSqS5h9V4OToXkInkckwDZsAYRP9inyUJGa6URUhwwpgXm/xnRvUGVjjxhRcDRdmVU3VC2EVPG556WeHYYh2wswIutFhnmftGcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549819; c=relaxed/simple;
	bh=g+6QI5FgvaeuM24QYnQTHVdSlngrRlyb/ApyZyu2YaU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nAGQilwNWtMiuh9jcnVez7SloW92ZnnKlagVxPtJ0GPwS6GJogYBl8KDKIy45M0pHruch6IMXnZxmzuIKQsjMQJx6U+GGMAllRSoSyGNmwLLMh0o8yrDWt9U1W92j7zAEQCuqboksoe9L6KNA2VpfgYP0G2sn4dPBAOuaEYkpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6LD93N9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0667AC116C6;
	Thu, 26 Mar 2026 18:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774549819;
	bh=g+6QI5FgvaeuM24QYnQTHVdSlngrRlyb/ApyZyu2YaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l6LD93N9ByGwdr4ENFu/4LyHFlgU95giiD9WppWO6D3IeVrhZeEqEKgexg6BoTtZi
	 J13Ega2d151VjX3FSCOQulfta95Ng9SWYynrByKZTsrXJYtLws/AJz1JZQk7K/Kd/0
	 hwTnrNpwVHtHn8BY504Ylvag5W+c0+hTRnN2uEfPGDRRf0EKILgUHHrP3ejQjgVjiR
	 PhKR5RNPk9g7tDCPKmT40/ErO+PIXC+9/RlnjJoJ0iGuoSLcD6lxXQjLQP2whDWTGz
	 3ZTckQMe1PKzeey88cIxcI+M9EhTq3QtAnN5+RmuMDJCT/xvowr3JHduwx+mYAIgFI
	 MgV1BUhM8ENGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FCD39F2038;
	Thu, 26 Mar 2026 18:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: hci_qca: disable power control for WCN7850
 when
 bt_en is not defined
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177454980529.3124616.11598462892322603776.git-patchwork-notify@kernel.org>
Date: Thu, 26 Mar 2026 18:30:05 +0000
References: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260324023016.3889062-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
 jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100149-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F63B33A277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 24 Mar 2026 10:30:16 +0800 you wrote:
> On platforms using an M.2 slot with both UART and USB support, bt_en is
> pulled high by hardware. In this case, software-based power control
> should be disabled. The current platforms are Lemans-EVK and Monaco-EVK.
> 
> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
> cleared when bt_en is not software-controlled (or absent), aligning its
> behavior with WCN6750 and WCN6855
> 
> [...]

Here is the summary with links:
  - [v3] Bluetooth: hci_qca: disable power control for WCN7850 when bt_en is not defined
    https://git.kernel.org/bluetooth/bluetooth-next/c/a94b3460712c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



