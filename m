Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7DA32930A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243843AbhCAU5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57171 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243906AbhCAUx1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6868A64F31;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=+rVEBlRQ2hsGKcTT1YnMk/KqS/a1SOVyj2SFhN8TMXA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bjJCNnfgTyVxsBqEjYI23k0bMXjsuiProbTcXXbslX0Ej1U5yStr+HLTKx2Cb/PH2
         mwfF2aT5fLLkOlrss9QvaJWq0NFrv76eVahUkgOrcLjVK1yrls+lkrJUjUXZw91FBT
         q+2bG1IyQ6MqdAf+F/f7SU/CL+p/E4GM/SFS+1d1/dxRIcArQcVCRnlrCVWIf6GYdY
         HRX2is/0tt9UrbZeLKn1F5TDfn3cB5q4jlXs3Uf7EgAeNfwg3PY2um+h1kn+Ic86J1
         S6eMPuRosTkPzWnSxDwJKKxyCjl7rQKw1HOTkI0+XtgDpLH1u1DilG3+hKb4ZnFCaA
         xS71dQKsGvqbw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 650E160C27;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ASoC: max98373: Fixes a typo in max98373_feedback_get
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878541.6187.3531726636949306876.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210127135620.1143942-1-judyhsiao@chromium.org>
In-Reply-To: <20210127135620.1143942-1-judyhsiao@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 27 Jan 2021 21:56:20 +0800 you wrote:
> From: Judy Hsiao <judyhsiao@google.com>
> 
> The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
> to snd_soc_get_volsw.
> 
> Fixes: 349dd23931d1 ("ASoC: max98373: don't access volatile registers in bias level off")
> Signed-off-by: Judy Hsiao <judyhsiao@google.com>
> 
> [...]

Here is the summary with links:
  - [v2] ASoC: max98373: Fixes a typo in max98373_feedback_get
    https://git.kernel.org/qcom/c/ded055eea679

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


