Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20E536466B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhDSOum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 10:50:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240557AbhDSOul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 10:50:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A6B9361246;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618843811;
        bh=EXKfmwNY9xD2e0AN9oUrrXRmm/4M9OB6NMTkwHR93OY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H9rH+Q2G9wQPVL8xYjvpAryTP9FCyMu7uyG25Ygsc2dykQBqH6NiGf2kIHFRKrzxj
         fF8l7ECVAhuoRjeOy3X2sHhOT9eHXYkjYTgROj6XqAUcYgaB37p7LGx5SvToc7HnPT
         3N+EumkYNUmeYfvf+jOv/65c4nKkLK4GC/WWpNkWQKy8oXBbj45ixFtrBx9RQCV9Y6
         jYjKnMHpRHxW02o5ZKFch9Ti3lf0GSfcFD23kKtTuHSB6LlbFidQ8eYZwitRMp7UJL
         FGsvDKyARBiyHpMtlTLgRxZLNee0i3mI4VVaxZ9o19QhQW4B7bdUudB/9ez06v8wvG
         mFac35AYtydrw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9B39E60970;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] SDX55 defconfig updates for v5.13
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161884381163.13392.3295428754211241933.git-patchwork-notify@kernel.org>
Date:   Mon, 19 Apr 2021 14:50:11 +0000
References: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210408170930.91834-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  8 Apr 2021 22:39:23 +0530 you wrote:
> Hi Bjorn,
> 
> This series updates the qcom_defconfig by enabling the drivers required
> for the SDX55 platform.
> 
> Please consider merging!
> 
> [...]

Here is the summary with links:
  - [1/7] ARM: configs: qcom_defconfig: Enable APCS IPC mailbox driver
    https://git.kernel.org/qcom/c/a4ce57235842
  - [2/7] ARM: configs: qcom_defconfig: Enable SDX55 A7 PLL and APCS clock driver
    https://git.kernel.org/qcom/c/fde56f62a103
  - [3/7] ARM: configs: qcom_defconfig: Enable CPUFreq support
    https://git.kernel.org/qcom/c/cdb6c63d2cc5
  - [4/7] ARM: configs: qcom_defconfig: Enable Q6V5_PAS remoteproc driver
    https://git.kernel.org/qcom/c/15f54d0100c4
  - [5/7] ARM: configs: qcom_defconfig: Enable SDX55 interconnect driver
    https://git.kernel.org/qcom/c/05c35d83852b
  - [6/7] ARM: configs: qcom_defconfig: Enable GLINK SMEM driver
    https://git.kernel.org/qcom/c/436d35bdd9fd
  - [7/7] ARM: configs: qcom_defconfig: Reduce CMA size to 64MB
    https://git.kernel.org/qcom/c/7de91b665600

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


