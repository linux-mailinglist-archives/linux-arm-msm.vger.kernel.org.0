Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B949396972
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231714AbhEaVvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:39240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231717AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 648B26138C;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=uWoLZ8riGSmLC+oyuPRr0ZT1aue3hOHKtw7NjqV2Jg8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L+D8c4p3UfMZ/5jwGLgjsYF78ABbXZUpqF3hpbBrjTDYg/43ANqEMNRsG76EbhDIB
         SYgIpcR0dw+kcCOsw7JfKprumddkOXf8ZLUdJzL2nlqyuBeDYNELugpqQT1pIXKH46
         R6VJZdyr26R5YHD+69DIthV6mQ7SizrReHYv8g0eT1Z7oLLjDsPLlWF4XATEjIPZgf
         saQoaPHMJkBNccYUCgkgatEy2UKAkWjPPlMJceYLdbF3BOTyAfJYxz6zgxgT17p461
         R32xLiaj7eff3usJAjAOgvTb3T29UoN07pSy1MtY0a09KHemFdbIsLjXXfz/pGPUQn
         JyPeeLpujo/Aw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5DE39609D9;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Make CPUCC actually probe (and
 work)
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780638.3521.16465222067672598653.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210527192958.775434-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210527192958.775434-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 27 May 2021 21:29:58 +0200 you wrote:
> Fix the compatible to make the driver probe and tell the
> driver where to look for the "xo" clock to make sure everything
> works.
> 
> Then we get a happy (eh, happier) 8996:
> 
> somainline-sdcard:/home/konrad# cat /sys/kernel/debug/clk/pwrcl_pll/clk_rate
> 1152000000
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8996: Make CPUCC actually probe (and work)
    https://git.kernel.org/qcom/c/0a275a35ceab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


