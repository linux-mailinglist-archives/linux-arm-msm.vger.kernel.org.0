Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C033353959
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhDDSKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:37300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231144AbhDDSKR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EE0F561365;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559812;
        bh=nv3Ea7gRvQ8hDw47fUIcV/GvkJM3io607/5g1WFETJo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Pvl1iOMUScDKzcEVlLkgxjOpZVyLJ5HLwEvPlU/LM8UYOzRlilbRr5d5v19C7SZHM
         QaBR2aeScYeUkq1fdvPdCItqsBZ+s4e1C9Nv3CmIVBcYXONt1O35bkMtCh8J/wg6tS
         ecQvDpGIIF+I3spmyhBRuJhiFu2vZc5ptntLSGlkIXFGVMwscLfHDDZZhlyVRo5+QS
         RY9QVdM+yNQ4wMpnvoLe5pFIAyMnIReW6Yc3jbk7sFXobPQY8InhUk17+JRpRQBbrE
         sCBPSoiekSp1H2V+CaoFcd+cmMRao30JITgCas/x6HNKbPijZn/hSu9e7dZ3tdiUk8
         ADrZmaylhGRVA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E41C76095D;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981192.6823.10170110915676919262.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210403105902.1867344-1-luca@z3ntu.xyz>
In-Reply-To: <20210403105902.1867344-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  3 Apr 2021 12:59:03 +0200 you wrote:
> Configure the mount matrix to account for the sensor placement on the
> board.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU
    https://git.kernel.org/qcom/c/73c9729f0fb5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


