Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382F2248C0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgHRQyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:54:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgHRQyP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:54:15 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C48A20786;
        Tue, 18 Aug 2020 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597769650;
        bh=PxM9+n8vVIqpRf0jfe4HVoCR3Hxu6WufuYAJnUBROT4=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=gUYGs4eMGo9kZaPbLsgoa9Ac73rnnbET5oal91nJ1x5zii7YwFryJq3BN3ZcuMXb4
         +7MkNCsRLfFlMxKfJH0UR+bn9MXQ798+2obQ7OurbpMjqL7fO4qZuA+LxcrD+EYFGU
         VqKfIY1uCkI02fGwhtF1gilroLiY3RAY5aRrR29U=
Date:   Tue, 18 Aug 2020 17:53:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com,
        plai@codeaurora.org, Rohit kumar <rohitkr@codeaurora.org>,
        lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, perex@perex.cz
In-Reply-To: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
Subject: Re: [PATCH v6 00/12] ASoC: qcom: Add support for SC7180 lpass variant
Message-Id: <159776961933.56094.17007093151985279828.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 14 Aug 2020 16:22:56 +0530, Rohit kumar wrote:
> This patch chain add audio support for SC7180 soc by doing the required
> modification in existing common lpass-cpu/lpass-platform driver.
> This also fixes some concurrency issue.
> 
> This patch series is already tested by Srinivas on Dragon Board 410c.
> Changes since v5:
>         - Fixed remove api in lpass-sc7180.c
>         - Addressed comments by Rob in yaml Documentation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: qcom: Add common array to initialize soc based core clocks
        commit: 1220f6a76e77af8ac14fe67a11fcd7806764ea46
[02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
        commit: a503567d70eca91796a4ab23053d4c70df8e1e3e
[03/12] ASoC: qcom: lpass-platform: Replace card->dev with component->dev
        commit: 784771863abae5f8878c62e9c624111c51bebe7c
[04/12] ASoC: qcom: lpass-platform: fix memory leak
        commit: 5fd188215d4eb52703600d8986b22311099a5940
[05/12] ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
        commit: b5022a36d28f6a99c1a57f54246e8b566cf094d5
[06/12] ASoC: qcom: lpass-cpu: fix concurrency issue
        commit: 753a6e17942f6f425ca622e1610625998312ad89
[07/12] ASoC: Add sc7180 lpass cpu node
        commit: 2a7a3797ed2de6a55e1467bd11002fa7b13e12f3
[08/12] ASoC: Add sc7180-lpass bindings header
        commit: 68d8904b25df28821425753eaebc8fe992dde236
[09/12] ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
        commit: 24caf8d9eb108c52e144bcc7af94bb1edcb70700
[10/12] ASoC: qcom: lpass-cpu: Use platform_get_resource
        commit: 93dbbd657167a796583506834cc03950ce25bce1
[11/12] ASoC: qcom: lpass-platform: Use platform_get_irq
        commit: b05372c84d61ad2a905274db7e3d63a65c835463
[12/12] ASoC: lpass-cpu: Move to yaml format
        commit: 4b381d7e86fd0b767456e07c49982fb4896e1166

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
