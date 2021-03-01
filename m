Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE59329240
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243534AbhCAUmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:52940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243678AbhCAUi4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:38:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A906864D8F;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=hKIq81szyazMraaAy4RpBeAvGIkdJuRzY9G+mgUozD0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vFCTyDqT0VXKHv2atoKKCMCXcL8yNyXKdVDJNbFE1okvlYKMOLCTwsvVVGC/dHERH
         Thu2PSWulc+PhTAobvFQCJ+oX0rrE1Kuo4sSFyzGAi5nd3v/Z2etLbvhuKxB5f5CLo
         P3MNJLgCso7Dooh7eFaKgEJFzcIDM/t/2YznCfw3gDGllY7gkcyzJT8W75gOudAEE/
         yWrFKYAQz8BxmXCdkeaunCxIBoqXXPamarC6royy6bGcCfhtqIoRgBLSkPUAKolI2z
         wvRhC6nE+Gflt6QOhoMes2HF2YGers8RXqIAcQPbXrszfM6l0dRIRuoajw/EzaA04L
         FQYHH8qC9HPtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A7EB60A1B;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] Venus encoder improvements
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878162.6187.7743963292834108071.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 12:01:35 +0200 you wrote:
> Hello,
> 
> Changes since v1:
>   * 1/4 - fixed error handling in hfi_session_deinit (Alex)
>         - keep venc_set_properties invocation from start_streaming (Dikshita)
>   * 2/4 - keep original mutex_lock (Alex)
>   * 3/4 - move msg queue inside if statement (Fritz)
>         - move rx_req setting before triggering soft interrupt (Alex)
>   * Add one more patch 4/4 to address comments for hfi_session_init
>     EINVAL return error code (Alex)
> 
> [...]

Here is the summary with links:
  - [v2,1/4] venus: venc: Init the session only once in queue_setup
    https://git.kernel.org/qcom/c/5f2ca73dcca9
  - [v2,2/4] venus: Limit HFI sessions to the maximum supported
    https://git.kernel.org/qcom/c/20891170f339
  - [v2,3/4] media: venus: request for interrupt from venus
    https://git.kernel.org/qcom/c/7f339fdc3756
  - [v2,4/4] venus: hfi: Correct session init return error
    https://git.kernel.org/qcom/c/e922a33e0228

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


