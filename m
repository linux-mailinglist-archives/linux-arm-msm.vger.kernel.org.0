Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A833292D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243794AbhCAUwf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:56448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243654AbhCAUu3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C14564F0C;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=9TcoOC+bOlQcuMqd4qnF88MvYs4cgIULxVN7hBxBkEQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TwT/FSPm080Ep2xg7vwzkb+uDjQffW2IH8HyfFvW/Heb1Yzc30jGpNHJynufxiR1r
         zeZ58nJggZnKCrTKGIhdhDUGdZR0NcS1+iVzFZc0LgZVmNe8mN8tEgmJI947XtOpw1
         dmDimN8X7tYSJmwoKRSpTaa2SWFxngjxdhllQgKDLjrcaJ9BCVX4+PxtAt+d0Nn3MP
         PsoKw1fGWvrGX2BBaP1bwB5ek6PziXQtDc4ayWRq0YZooKn/qR69Zi3JA5WPq8KEGb
         SydgbQtyO3hPF64YEZyeb1nLRTqSlQLN41qLBI7IQzk/g5ilycu8D47NPp3TqLYc8f
         FvqK2UisdGuKA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 885D960997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878455.6187.9799239261412669846.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20210126150241.10009-1-saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 26 Jan 2021 20:32:41 +0530 you wrote:
> As per register documentation, QCOM_WDT_ENABLE_IRQ which is BIT(1)
> of watchdog control register is wakeup interrupt enable bit and
> not related to bark interrupt at all, BIT(0) is used for that.
> So remove incorrect usage of this bit when supporting bark irq for
> pre-timeout notification. Currently with this bit set and bark
> interrupt specified, pre-timeout notification and/or watchdog
> reset/bite does not occur.
> 
> [...]

Here is the summary with links:
  - watchdog: qcom: Remove incorrect usage of QCOM_WDT_ENABLE_IRQ
    https://git.kernel.org/qcom/c/a4f3407c4160

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


