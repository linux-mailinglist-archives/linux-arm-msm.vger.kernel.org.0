Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EB02BB855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 22:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbgKTV3u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 16:29:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:49830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbgKTV3t (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 16:29:49 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8145922D0A;
        Fri, 20 Nov 2020 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605907789;
        bh=fQE+1W08XxfCBd7vF8smIoqVAulL/tkcJGLL3E4/rVY=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=uCo7ggpryoJ+4ZxoCs595QBY0KXftijwNbCpkeHPKSAvYZO5Uo1TqDrocj77x5TCU
         dZokeZiEi35PVxkI+PPo8ZNT4UClj8PBFDdzhP+uj3Ig3qH9vTATOJzY0HqVP85lKq
         xHN2xE2pKfoTqdksZozEYuKedZJlBFhjzeOjOEb4=
Date:   Fri, 20 Nov 2020 21:29:27 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Banajit Goswami <bgoswami@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org
In-Reply-To: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
References: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
Message-Id: <160590773741.47461.18033846696938877967.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 19 Nov 2020 15:31:45 +0300, Dmitry Baryshkov wrote:
> Current code does not setup CPU dai (causing -EIO errors on playback)
> and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
> errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
> on RB5 platform.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: fix HDMI audio playback
      commit: ddf1c4b3944add7939f6778d8fb71df01e74d45f

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
