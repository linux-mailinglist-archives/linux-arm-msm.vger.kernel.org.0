Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EFA329278
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbhCAUqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:54488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238876AbhCAUnX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A8D6F64E66;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=mscokDMHnXpsO3VOuNH93XZ4YL8U3v95FUxfLPCpzLQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RjVv+E31pP8gdoUFGJfne72SYjkkPWq8tDKcRahf6zBpfcczBAPaNtpuLyMG0Mjis
         JHILVuH7cAA0IFiJ3/guhXR3jxb5yOgaHUhgVt/aM01AR+EWjAna/1WdMAntiHk7J2
         l/6BlUiKRS+ISduzq3rJ3Z5Bn/9OyJjhronWXt8pF0LeeMJVmtwxJ3qshDVs/mwPh6
         dNlDlzN9mYbSMb845nGEajyXIBX5VrCO+F+vB+oOWdyEksi8MMjTew5BUCAvP1F+zi
         VtOYg5RXCPmK7v6TcJ4t9UuCAcuLUeQ7ZuApPqxL4LjYHpl4pHygtbquiygPIdv9jf
         TGKTzeBKA9UHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A575760A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] drm/msm/a6xx: LLCC related fix and cleanup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878267.6187.10770105143273200562.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 17:34:07 +0530 you wrote:
> Patch 1 is a fix to not set the attributes when CONFIG_QCOM_LLCC
> is disabled and Patch 2 is a cleanup to create an a6xx specific address
> space.
> 
> Sai Prakash Ranjan (2):
>   drm/msm: Add proper checks for GPU LLCC support
>   drm/msm/a6xx: Create an A6XX GPU specific address space
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm: Add proper checks for GPU LLCC support
    https://git.kernel.org/qcom/c/276619c0923f
  - [2/2] drm/msm/a6xx: Create an A6XX GPU specific address space
    https://git.kernel.org/qcom/c/45596f254061

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


