Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98AB36466D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 16:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240559AbhDSOun (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 10:50:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240158AbhDSOul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 10:50:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AECAA61245;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618843811;
        bh=+wpL7HJA0Y3MH2+mHvYt9XiKxP8SsQScjyZ2fgdjOAU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SqjQlYcp4oQa/R8FRmxTp3GnmlvsWA/y1pdUs6ze0h+yBqE6jXVeU6LF9Bt11w9Il
         XI/40YPA+r5i31pUHsMNV1oGMOe/fsr60M5mqld8x76hOHutV7ipOt1O91PcDxQF2g
         9e4bnm3DAu24kLnc4xTDmoN137zjQUOnBrZS+/PIYsi8rCDw0o+E8vvtQuIo8alvi9
         cisDXmGVw52Z+OhIegNIA+oj3Exq0d6i1DPv918vkiGqGuQHI/PEu6/H5/Ubc5h9pV
         I06ewcm252WyCgUfHhhiEVOAmF9Hkp6hoAVNAAJ9AfaPzbtu4D0duoBXbn/GWG+DyT
         j7QWP5r/Vqqtg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A4EBE60A2A;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add "dmic_clk_en" for
 sc7180-trogdor-coachz
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161884381167.13392.10558769748991999842.git-patchwork-notify@kernel.org>
Date:   Mon, 19 Apr 2021 14:50:11 +0000
References: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
In-Reply-To: <20210315133924.v2.1.I601a051cad7cfd0923e55b69ef7e5748910a6096@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 15 Mar 2021 13:39:30 -0700 you wrote:
> This was present downstream. Add upstream too. NOTE: upstream I
> managed to get some sort of halfway state and got one pinctrl entry in
> the coachz-r1 device tree. Remove that as part of this since it's now
> in the dtsi.
> 
> Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Cc: Ajit Pandey <ajitp@codeaurora.org>
> Cc: Judy Hsiao <judyhsiao@chromium.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] arm64: dts: qcom: Add "dmic_clk_en" for sc7180-trogdor-coachz
    https://git.kernel.org/qcom/c/7dc936edb2b0
  - [v2,2/2] arm64: dts: qcom: Add "dmic_clk_en" + sound model for sc7180-trogdor-pompom
    https://git.kernel.org/qcom/c/3965f55d96c2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


