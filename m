Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DE32E73E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgL2USm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726602AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 582EB22EBD;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=sffjZ9Cw9pdYXO0QfiFwwJC2WtjTmDVaxG3Cq85KUN8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KDH5iAp6U0irsr325vMobm0G0XbAStBHwGHfyxrLyhhifUK2npupyr66xmt5D47N2
         /Qz4WiLB4teFDNxdHp6nPpwruUpHzqEMlrJD/j+UG5GYsJ40y7OLWTBohaaTt54LWc
         qdZSge04viuSEk1nMxEdtyBnteDg8AJSvuH+Qf5Jyj22h06mok9XDnJEMRRQpELf2e
         bJf2+9fW2/rNVVdMaOl2nQe/5w3zuc8yCsMaJEGJU47SR7ODVYBB7Ch25WYXhs4wjC
         R2cpo2Wqd61M/p5XaXKqKse8ckSxOKg0NJZgC6DBoSm3zRx/HBDco+CLE5cVV2qRze
         T03lLX7oUo5Bw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 54C6560626;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] coresight: etf/etb: NULL Pointer dereference crash fixes 
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293634.13751.4284440507610596860.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Oct 2020 18:30:23 +0530 you wrote:
> There was a report of NULL pointer dereference in ETF enable
> path for perf CS mode with PID monitoring. It is almost 100%
> reproducible when the process to monitor is something very
> active such as chrome and with ETF as the sink and not ETR.
> Currently in a bid to find the pid, the owner is dereferenced
> via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
> owner being NULL, we get a NULL pointer dereference.
> 
> [...]

Here is the summary with links:
  - [1/2] coresight: tmc-etf: Fix NULL ptr dereference in tmc_enable_etf_sink_perf()
    https://git.kernel.org/qcom/c/868663dd5d69
  - [2/2] coresight: etb10: Fix possible NULL ptr dereference in etb_enable_perf()
    https://git.kernel.org/qcom/c/22b2beaa7f16

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


