Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833A92E7364
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgL2UQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B8E4922262;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=9XyfZDgHxQQBt4FILGQgnkd9n+1MTUg+1xtkjzUS8FM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oeHvDtwjhMHgwdDdr+gCLjk9/yKgZ+v06B+zn5fEIwBFA3K/6n8osB5okOFgiqMS/
         QCntLCYALtrX8AxI8NpEtRQd2dYMuaqzo36aXkFLske2hys2qjRgdswYJX5L6XlNu9
         gjGo5WC2TuoapK32MgQfKq/Q296qzKtUt88ahuCEixD0cMcR16KlJRcCUTMpLz13ss
         ecdnceBk/U1OEynICsvvzmZHH3Qvl8g19KFQPws2wSI7JVLenx4gxOX2OCQytst7E8
         eIyXAHZjvRJZUoZS9NxS+jZuMsm7b2XDAxlcaGZpIKyMP3A85Bl09JYuZBNniVmzru
         Wx3mqc+mvyCbQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B36CF6063B;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180 board
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293073.13751.14719840010494478162.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 13:23:04 +0300 you wrote:
> c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
> display") has added support for handling bandwidth voting in kms path in
> addition to old mdss path. However this broke all other platforms since
> _dpu_core_perf_crtc_update_bus() will now error out instead of properly
> calculating bandwidth and core clocks. Fix
> _dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
> of returning an error in case kms->num_paths == 0 (MDSS is used for
> bandwidth management).
> 
> [...]

Here is the summary with links:
  - drm/msm/dpu: fix clock scaling on non-sc7180 board
    https://git.kernel.org/qcom/c/cccdeda362fa

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


