Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C31A32928A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhCAUr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:53308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234767AbhCAUnm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DA37F64E89;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=+UuFqsn5FfTfo5CpOsmiwFe3PvrwCU2XUye9QvUrKnw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PqzCSbT7eDll8XbsfIQYlyI7UCr1D+lQeuwfROf+h3MxE/dgMTr2uYOjv1VmYpmpf
         Zj1mSuepj2aKfDyO2P0l7jKMHCwb4BbfOKEP2vkLA9d6LCuE30A+/8U4Bne0q6tUEA
         Y55ny8M8TXZMoJ7YeVch/tR0RUYGlgzcZ/WD2QThjBCMIQVpt+3Xd9ITkWUFXlfeCV
         bj7tNBB4ip5xBIlKjssQrA5AovD5QJpEg4UnMscVIPj45JcT28lqu6sBnyP4tM/MmJ
         1MlfcQAq8OZinPfyo3Td0YR3oum1X8zUXPkVGRkUHcIllh/OouFqsrobrE897gD1j7
         Be4ES1SadnzTg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D6A9F60C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/4] spi: spi-geni-qcom: Fix geni_spi_isr() NULL
 dereference in timeout case
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878287.6187.10711169453453083059.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
In-Reply-To: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 17 Dec 2020 14:29:11 -0800 you wrote:
> In commit 7ba9bdcb91f6 ("spi: spi-geni-qcom: Don't keep a local state
> variable") we changed handle_fifo_timeout() so that we set
> "mas->cur_xfer" to NULL to make absolutely sure that we don't mess
> with the buffers from the previous transfer in the timeout case.
> 
> Unfortunately, this caused the IRQ handler to dereference NULL in some
> cases.  One case:
> 
> [...]

Here is the summary with links:
  - [v3,1/4] spi: spi-geni-qcom: Fix geni_spi_isr() NULL dereference in timeout case
    https://git.kernel.org/qcom/c/4aa1464acbe3
  - [v3,2/4] spi: spi-geni-qcom: Fail new xfers if xfer/cancel/abort pending
    https://git.kernel.org/qcom/c/690d8b917bbe
  - [v3,3/4] spi: spi-geni-qcom: Don't try to set CS if an xfer is pending
    https://git.kernel.org/qcom/c/3d7d916f9bc9
  - [v3,4/4] spi: spi-geni-qcom: Print an error when we timeout setting the CS
    https://git.kernel.org/qcom/c/17fa81aa702e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


