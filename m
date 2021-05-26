Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5712E391FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbhEZTE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235164AbhEZTEz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AD9EC613B5;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=iFvHK3fl0n0VoZNRpvls+ojWYzCm4YURuQsueLbn0+I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TSVq7VgmFjw9yPt/4dTi2uIdg1/wqtGgsBgBs1hL26GRjbe1OW+ojekcSDNDbVTh6
         Ho4ZrgYYXKrsK+bzgf5FkHTtTEG5SFrVlfRkU6zCPrD+UN9x2voVkH7PDH6ZUcSd1c
         9yOeahRiLkCaqHEh+BwAsLOBfiDFsaaZ9Qt/nODeOSH4D7Tbnn/2I/+NYvHcf5M96E
         PMQG+4Dq07CKfht+XEyEeCveQzUZtLgA2WPlF5fOpIAcalGJSRdnjAaS8DaK9jnIhI
         wDemxlLHQTh99tqRB+kndYZXKjem8Jb/ajMARur9p3nmnXaO5hMEo8DF7kE2uNWTlv
         hJcj+jgZL+YDA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9DA28609ED;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/25] media: venus: Enable 6xx support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580364.26840.16991932603574398756.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  2 Apr 2021 11:06:23 +0100 you wrote:
> V3:
> - Adds Acked-by as indicated - Stan
> - Sets bufreq->size = 0 instead of returning -EINVAL
>   in hfi_plat_bufs_v6.c when a buffer type is unknown - Dikshita
> - Applies work-mode fix to 4xx and 6xx - Stan
> 
> Tested on rb5, rb3 and db410c
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250
> 
> [...]

Here is the summary with links:
  - [v3,01/25] media: venus: Update v6 buffer descriptors
    https://git.kernel.org/qcom/c/daba0a10c585
  - [v3,02/25] media: venus: core,pm: Add handling for resets
    https://git.kernel.org/qcom/c/3bca43585e22
  - [v3,03/25] media: venus: core: add sm8250 DT compatible and resource data
    https://git.kernel.org/qcom/c/0aeabfa29a9c
  - [v3,04/25] media: venus: core: Add io base variables for each block
    https://git.kernel.org/qcom/c/b4053a2097ec
  - [v3,05/25] media: venus: hfi,pm,firmware: Convert to block relative addressing
    https://git.kernel.org/qcom/c/ff2a7013b3e6
  - [v3,06/25] media: venus: hfi: Define block offsets for V6 hardware
    https://git.kernel.org/qcom/c/3c5e894dd30a
  - [v3,07/25] media: venus: hfi: Define additional 6xx registers
    https://git.kernel.org/qcom/c/7f6631295f46
  - [v3,08/25] media: venus: core: Add differentiator IS_V6(core)
    https://git.kernel.org/qcom/c/ff027906308f
  - [v3,09/25] media: venus: core: Add an io base for TZ wrapper regs
    https://git.kernel.org/qcom/c/94e6ed2b2db3
  - [v3,10/25] media: venus: core: Add an io base for AON regs
    https://git.kernel.org/qcom/c/e6dd8c3adf43
  - [v3,11/25] media: venus: core: Hook to V6 base registers when appropriate
    https://git.kernel.org/qcom/c/3f9acde81d6e
  - [v3,12/25] media: venus: hfi: Add a 6xx boot logic
    https://git.kernel.org/qcom/c/255385ca433c
  - [v3,13/25] media: venus: hfi: Add 6xx interrupt support
    https://git.kernel.org/qcom/c/24fcc0522d87
  - [v3,14/25] media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
    https://git.kernel.org/qcom/c/e396e75fc254
  - [v3,15/25] media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if locations
    https://git.kernel.org/qcom/c/7ed9e0b3393c
  - [v3,16/25] media: venus: pm: Hook 6xx pm ops into 4xx pm ops
    https://git.kernel.org/qcom/c/f24afa95bb2e
  - [v3,17/25] media: venus: core,pm: Vote for min clk freq during venus boot
    https://git.kernel.org/qcom/c/c22b1a29497c
  - [v3,18/25] media: venus: hfi: Add 6xx AXI halt logic
    https://git.kernel.org/qcom/c/4b0b6e147dc9
  - [v3,19/25] media: venus: pm: Toggle 6xx wrapper power in vcodec_control
    https://git.kernel.org/qcom/c/64afe82740b3
  - [v3,20/25] media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
    https://git.kernel.org/qcom/c/ec7ad11740b3
  - [v3,21/25] media: venus: helpers: Add internal buffer list for v6
    https://git.kernel.org/qcom/c/c934d9d4ca28
  - [v3,22/25] media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
    https://git.kernel.org/qcom/c/bc28936bbba9
  - [v3,23/25] media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
    https://git.kernel.org/qcom/c/df67e3584475
  - [v3,24/25] media: venus: helper: Decide work mode
    https://git.kernel.org/qcom/c/1ad175952bbc
  - [v3,25/25] media: venus: vdec: Fix decoder cmd STOP issue
    https://git.kernel.org/qcom/c/83af5738dc13

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


