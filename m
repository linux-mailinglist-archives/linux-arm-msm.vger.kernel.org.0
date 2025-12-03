Return-Path: <linux-arm-msm+bounces-84265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E8CA1870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 21:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91D2C3007E51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 20:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1253081DF;
	Wed,  3 Dec 2025 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svOTou35"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2F27586C;
	Wed,  3 Dec 2025 20:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764792788; cv=none; b=pi6b8mNQuT4/RHOySlYMvgBD8wXqplvsBUwwj+OMbn+D81Y1MDjoU5ri2u+igNY2zaloDzpctLWlcDMY7RtSVI0h7rRPz831GtRtun890hTb2LIR1VVV1c/NqAsEN2qZ/rka+4tHbOlisvbQYPU/lf3nWGkafEmLY/FzIcLatR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764792788; c=relaxed/simple;
	bh=DgnB0s/7+0WQvzp/ZgDb+DmQMmCwijxjQYhs3oVXbGY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WmABWXCIOV6SDh3VnoBnwxn+3R5pfjECvoDTbCEK5Bb/w2dS1jqyMeGLhzJh2xr5VJXYlAh68NLQ4byzPjd07tPI8vbFg4rAIf+GLYB0euUxcb1TqCD+Rc0j3ox8XV5qDGbGToxiqCxJ2aY2ZZR2MWYxyWm6L2ponFs2PwwTm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svOTou35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A4FC4CEF5;
	Wed,  3 Dec 2025 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764792786;
	bh=DgnB0s/7+0WQvzp/ZgDb+DmQMmCwijxjQYhs3oVXbGY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=svOTou353a1+ZIiiwpiFx/+pSZrRHIYVJE4qkOLeEXeABdRyXntvP+wQw5Uy7ao42
	 ru2om1WMqkFg88cTgTYgLMXOg5hiYldreR6E2K4s2MBBD27+vbYfpmo26MDzCXwooz
	 LvgpxfXTcTe5wAfCz0xlge9dYQzbROGWcdAVtJ+zVGb9GDaXDa+PjvYaoj6h9dnoRT
	 mgOM/39wyFwV1TDD9ssJqSN+48zbtUbkWal2S7i4EYrNZedhZYDR7BnxMN3rYaV5jx
	 uVD++eBbjJSHxXnwSlxWq0+TiSPd4vJMQ+dS0P+1Z5pNo639XPVsd+TGBNnr3X63Xm
	 WoA/JagbP0//A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B669D3AA943C;
	Wed,  3 Dec 2025 20:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v13 0/1] Bluetooth: hci_qca: Fix SSR (SubSystem Restart)
 fail
 when BT_EN is pulled up by hw
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176479260553.58993.16345476131618638097.git-patchwork-notify@kernel.org>
Date: Wed, 03 Dec 2025 20:10:05 +0000
References: <20251203033712.446632-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20251203033712.446632-1-shuai.zhang@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
 wei.deng@oss.qualcomm.com

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  3 Dec 2025 11:37:11 +0800 you wrote:
> Changes in v13:
>  - Resending only to trigger CI, no code changes.
>  - V12 Link
>    https://lore.kernel.org/all/20250916140259.400285-1-quic_shuaz@quicinc.com/
> 
> Shuai Zhang (1):
>   Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is
>     pulled up by hw
> 
> [...]

Here is the summary with links:
  - [v13,1/1] Bluetooth: hci_qca: Fix SSR (SubSystem Restart) fail when BT_EN is pulled up by hw
    https://git.kernel.org/bluetooth/bluetooth-next/c/4746e2cd0e18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



