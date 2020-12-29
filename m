Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9D82E73D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgL2USk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B25A122DA9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=a7AZrjTih0Q8/mhnUjiJIGAP1acRzHBwASahpXJrILg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=V8ETrMp39CM7h7evViQ0eSIf3ZHYorqVdAuXvCPnjGugPqnIkUqKOWNwsfnvZkP6m
         PFnQDvszgSHtjgwIHtYDxk6B5huwJDqGLVO72tdJJFWMXsSLQ51mIYWmxe79k5vbCk
         IoDm57zMYwuWS0fgDhnkOfP8aK5dAMzHGcnoCO3GoUFNjM1DQnk1JGw2O4O/jm/iDN
         RXBwIw3AnxbODMILj2yJM3zJdS57pzrS8mDT6/qmgW451sluXYcyaYFaTbOoKi+YAX
         GvufljOahSdlBEOF3/bIX/0Et8W6GVJin//efYPjo7uiaM0gMqExsgdb0IeDx5s0j2
         DC4rVct4PPogQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id AE232604D7;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] watchdog: qcom: Avoid context switch in restart handler
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293570.13751.14675429771398484369.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201207060005.21293-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201207060005.21293-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  7 Dec 2020 11:30:05 +0530 you wrote:
> The use of msleep() in the restart handler will cause scheduler to
> induce a context switch which is not desirable. This generates below
> warning on SDX55 when WDT is the only available restart source:
> 
> [   39.800188] reboot: Restarting system
> [   39.804115] ------------[ cut here ]------------
> [   39.807855] WARNING: CPU: 0 PID: 678 at kernel/rcu/tree_plugin.h:297 rcu_note_context_switch+0x190/0x764
> [   39.812538] Modules linked in:
> [   39.821954] CPU: 0 PID: 678 Comm: reboot Not tainted 5.10.0-rc1-00063-g33a9990d1d66-dirty #47
> [   39.824854] Hardware name: Generic DT based system
> [   39.833470] [<c0310fbc>] (unwind_backtrace) from [<c030c544>] (show_stack+0x10/0x14)
> [   39.838154] [<c030c544>] (show_stack) from [<c0c218f0>] (dump_stack+0x8c/0xa0)
> [   39.846049] [<c0c218f0>] (dump_stack) from [<c0322f80>] (__warn+0xd8/0xf0)
> [   39.853058] [<c0322f80>] (__warn) from [<c0c1dc08>] (warn_slowpath_fmt+0x64/0xc8)
> [   39.859925] [<c0c1dc08>] (warn_slowpath_fmt) from [<c038b6f4>] (rcu_note_context_switch+0x190/0x764)
> [   39.867503] [<c038b6f4>] (rcu_note_context_switch) from [<c0c2aa3c>] (__schedule+0x84/0x640)
> [   39.876685] [<c0c2aa3c>] (__schedule) from [<c0c2b050>] (schedule+0x58/0x10c)
> [   39.885095] [<c0c2b050>] (schedule) from [<c0c2eed0>] (schedule_timeout+0x1e8/0x3d4)
> [   39.892135] [<c0c2eed0>] (schedule_timeout) from [<c039ad40>] (msleep+0x2c/0x38)
> [   39.899947] [<c039ad40>] (msleep) from [<c0a59d0c>] (qcom_wdt_restart+0xc4/0xcc)
> [   39.907319] [<c0a59d0c>] (qcom_wdt_restart) from [<c0a58290>] (watchdog_restart_notifier+0x18/0x28)
> [   39.914715] [<c0a58290>] (watchdog_restart_notifier) from [<c03468e0>] (atomic_notifier_call_chain+0x60/0x84)
> [   39.923487] [<c03468e0>] (atomic_notifier_call_chain) from [<c030ae64>] (machine_restart+0x78/0x7c)
> [   39.933551] [<c030ae64>] (machine_restart) from [<c0348048>] (__do_sys_reboot+0xdc/0x1e0)
> [   39.942397] [<c0348048>] (__do_sys_reboot) from [<c0300060>] (ret_fast_syscall+0x0/0x54)
> [   39.950721] Exception stack(0xc3e0bfa8 to 0xc3e0bff0)
> [   39.958855] bfa0:                   0001221c bed2fe24 fee1dead 28121969 01234567 00000000
> [   39.963832] bfc0: 0001221c bed2fe24 00000003 00000058 000225e0 00000000 00000000 00000000
> [   39.971985] bfe0: b6e62560 bed2fc84 00010fd8 b6e62580
> [   39.980124] ---[ end trace 3f578288bad866e4 ]---
> 
> [...]

Here is the summary with links:
  - watchdog: qcom: Avoid context switch in restart handler
    https://git.kernel.org/qcom/c/7948fab26bcc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


