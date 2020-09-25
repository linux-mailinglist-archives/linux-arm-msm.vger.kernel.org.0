Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED125279265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 22:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbgIYUmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 16:42:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIYUml (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 16:42:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0484720838;
        Fri, 25 Sep 2020 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601066561;
        bh=cLGCGu0fXOBAhLAOL+Vx73SUpPBBubCY99whgp9Yt8I=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=cG6tfkw8+C5FbHzdHYHvGWf4Fo7TnI/OTRixxNF84vXWT/Ckzorapdlp82RIjpVX/
         TvvlmpqCjG6goIBUzFF8/vqjgiK7i81XLHNNReq1qg86lOCiWvDpgKLWgCLK2eGp7t
         4INvxD+3aZed8nHelL1Zgmi+E9F5Q5QGvzU/WYJI=
Date:   Fri, 25 Sep 2020 21:41:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
        lgirdwood@gmail.com, tiwai@suse.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        perex@perex.cz, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, rohitkr@codeaurora.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc:     vsujithk <vsujithk@codeaurora.org>
In-Reply-To: <1600448073-6709-1-git-send-email-srivasam@codeaurora.org>
References: <1600448073-6709-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together
Message-Id: <160106647646.2866.13772789972277251884.b4-ty@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 18 Sep 2020 22:24:33 +0530, Srinivasa Rao Mandadapu wrote:
> Update lpass-cpu.c to enable I2S BCLK and LRCLK together.
> Remove BCLK enable in lpass_cpu_daiops_startup and
> add in lpass_cpu_daiops_trigger API.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together
      commit: 7e6799d8f87d7ab7ae55a229654d161b5bfae874

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
