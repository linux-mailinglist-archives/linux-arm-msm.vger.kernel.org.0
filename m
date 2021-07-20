Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4433CF220
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 04:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345344AbhGTCB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 22:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344653AbhGTBuS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 21:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7FBF460FF3;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626748250;
        bh=0uYBKCXTHjIWAqMpvHXM9Hf/ZA4EOjcvLvSJAvshJZ0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OqyRrYJa6Ul1EpJ4dpZ6md7DGiVageqjmdnjV8LZEFlywXBjg5gMfkgIK0eKNNo6H
         l6NOtx1XsOQ5OIsXYst1UIud7F1RHlyjCgvy3Xsotr3bvtf54BE1uoyjDSq+NPlIMH
         NZJ8gpXC6QtBqtJIi7G/KLyn6cMettgM+TKCYb3OCbRJFYJTnDIiHDQBQayzT98Q4y
         GtxK8UvL7FkYCa9eFrIpM47kdWopIUqlzykvhdlHV08ysquSo16AQvDiCMatV8snQk
         zbbBkX+Nj/Ygoy5/iJw1SgPHePWZSMYzt2eiuNewsisGpT2CGPAoXeuwj1DdzQggM2
         gfK537szD56+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 72BC960C2A;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] irqchip/qcom-pdc: Switch to IRQCHIP_PLATFORM_DRIVER and
 allow as a module
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162674825046.10695.11840447551670517421.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Jul 2021 02:30:50 +0000
References: <20210518211922.3474368-1-john.stultz@linaro.org>
In-Reply-To: <20210518211922.3474368-1-john.stultz@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 18 May 2021 21:19:21 +0000 you wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This patch revives changes from Saravana Kannan to switch the
> qcom-pdc driver to use IRQCHIP_PLATFORM_DRIVER helper macros,
> and allows qcom-pdc driver to be loaded as a permanent module.
> 
> Earlier attempts at this ran into trouble with loading
> dependencies, but with Saravana's fw_devlink=on set by default
> now we should avoid those.
> 
> [...]

Here is the summary with links:
  - [1/2] irqchip/qcom-pdc: Switch to IRQCHIP_PLATFORM_DRIVER and allow as a module
    https://git.kernel.org/qcom/c/4acd8a4be614
  - [2/2] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a permenent module
    https://git.kernel.org/qcom/c/b42000e4b874

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


