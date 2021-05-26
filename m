Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C516391FFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbhEZTFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235164AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 68E4D6143F;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=dwnD5eIWkNOJ6sZ1XYLnU385OCE8jRDAaIsHjpwFWoU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cFNH397CsK4UZdiB0gUrClUyu4C09TS4H1Gu1bdBXImxYp5u5C74dyeIHjYBuRMsB
         UeGFmZtlCn0okjDz+k/RsFqXnvJ+IoUQbnSwq3SnrpmPN7R/xzuLB6eKoy7hNCYEpk
         fn9/RQVT5Uszgu5Dj/DPywoLKPa9099N31Dip1lAP3Yu96wCFbmYEsKqHscaHouhOz
         RX6Vm/KwADaSIrT5b1LLRhYVFwGu2VcOkj0J/WsmzjSRLWzlchg2OsUhW3FT/It38/
         BIcC26pZKfcsi1libvqCbPjprTYh3pb8dO8Nx8liLeDEWS5bsEKM0p9roweomSrvfa
         7madAyA71k0fA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6464A60CFD;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] MFC private ctrls to std ctrls
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580440.26840.8937386363310069448.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210115092607.29849-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 11:26:03 +0200 you wrote:
> Hello,
> 
> Changes in v2:
> 
>  * use _DEC_ instead of _DECODER_ in the name of the new controls (Hans)
>  * rebase on top of media master branch
> 
> [...]

Here is the summary with links:
  - [v2,1/4] v4l2-ctrl: Make display delay and display enable std controls
    https://git.kernel.org/qcom/c/9f3d1056ea54
  - [v2,2/4] venus: vdec: Add support for display delay and delay enable controls
    https://git.kernel.org/qcom/c/8ec0b7b0b598
  - [v2,3/4] s5p-mfc: Use display delay and display enable std controls
    https://git.kernel.org/qcom/c/c3042bff918a
  - [v2,4/4] docs: Deprecate mfc display delay controls
    https://git.kernel.org/qcom/c/644bcc0315f2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


