Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69722E73D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgL2USj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EE8A722E03;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=xYFo3teDxdzHUijXLxlePHWAdlDc4D14q/C7hva7V94=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nfEjzPGaj10uPrfMwq+PT6YSqMTibMoM9PPsfXXEveCbytAfybSs2Ec4yH1+ok68s
         WWfrTb8l0RSUmY9Wj0/BPA91/QugDNSMGjf7qqk0IgShxzzX4Ssku+Z9Xy2yc4qZeA
         cq9hQQrDbIa2uASgPYRxs/0Gb9qyqWOASatDdEUbNtCnRRnd7FsqSVFJ+0SaTpm8ZJ
         s4Hu+eCzdKMeE/Ea45p01ETjlX77G3uQdlTrWz2AcBkIpsnqdD5tcGV6voxCFKUPGp
         Z0rgjLvfQ8k5cIU6tVdIShDKc8LT6dq+cevrBoGkzB89TQiixdc4Hj73OG4NpknvgP
         qSFxIhC0rbc4g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id EAEE260626;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] drm/msm/dp: return correct connection status after suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293595.13751.11679831649533669819.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201014171103.30098-1-khsieh@codeaurora.org>
In-Reply-To: <20201014171103.30098-1-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 14 Oct 2020 10:11:03 -0700 you wrote:
> During suspend, dp host controller and hpd block are disabled due to
> both ahb and aux clock are disabled. Therefore hpd plug/unplug interrupts
> will not be generated. At dp_pm_resume(), reinitialize both dp host
> controller and hpd block so that hpd plug/unplug interrupts will be
> generated and handled by driver so that hpd connection state is updated
> correctly. This patch will fix link training flaky issues.
> 
> [...]

Here is the summary with links:
  - [v5] drm/msm/dp: return correct connection status after suspend
    https://git.kernel.org/qcom/c/19e52bcb27c2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


