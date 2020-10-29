Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B9529EBFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 13:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726361AbgJ2MkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 08:40:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:52956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbgJ2MkW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 08:40:22 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DD0C20809;
        Thu, 29 Oct 2020 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603975221;
        bh=fPrirToVDeWiBXGhzdGLCnc48Zdw7+8TGyRC7szzpq0=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=k7uitV9Jro8A3P74bQTJwyhnCaOrWxBlJPgEUuca3JVgkj96SXM3vCAw59a4tQTsO
         /LAaZ3UWyZuVQHLanIa32IH57Ss2OhsvbAjlQ50YVT7owWKidgLvlhLJ0XkuWhLx5E
         pOPho6XxMs7ioKmgYG6gMW/9rhHyuJWo7Q4orL+0=
Date:   Thu, 29 Oct 2020 12:40:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, perex@perex.cz, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        srinivas.kandagatla@linaro.org, agross@kernel.org,
        plai@codeaurora.org, linux-arm-msm@vger.kernel.org,
        lgirdwood@gmail.com, bgoswami@codeaurora.org, tiwai@suse.com,
        bjorn.andersson@linaro.org, alsa-devel@alsa-project.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
In-Reply-To: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
References: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-cpu: Fix clock disable failure
Message-Id: <160397520897.55401.4677277662633686101.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 19 Oct 2020 14:36:03 +0530, Srinivasa Rao Mandadapu wrote:
> Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase instead of
> shutdown time. Acheive this by invoking clk_disable API from
> cpu daiops trigger instead of cpu daiops shutdown.
> Change non-atomic API "clk_prepare_enable" to atomic API
> "clk_enable" in trigger, as trigger is being called from atomic context.
> 
> Fixes: commit 7e6799d8f87d ("ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix clock disable failure
      commit: 6ec6c3693a389841d8ca952072aea8020da54ef4

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
