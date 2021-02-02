Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6727930C404
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 16:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhBBPib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 10:38:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:44700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235403AbhBBPgV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 10:36:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6488764F68;
        Tue,  2 Feb 2021 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612280140;
        bh=8RZE4kmI/Rwh/V6PZg/jIICmaP1SJ5gy/78kCN3vvbQ=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=pE6vmN63LdtZ8mHWuOqqSsGaEPkduFJy0WaHqrzkEx40UPniEJeSbrPfQbZPqKQAp
         LvGsLDikOdWsnI4aZpbqrLmDfBix/H9b8e/5ab5tXeoI9bhSvjwQEz0weCGDTrodFd
         USIVRk7xPuRjdRZjIknuT/DfwH9TKmY4qJxl1Cl+pb6almvclqY9CzR12fMaCMTjE/
         /XUAswbYf+PNZw7zqY5Om9+Pa/sH3ep2xC/B8nz/EHxM4MrVHf8SAnq0T8G4/V7Nnf
         yfXzh1iDJU/BCt3BPZr0hLxhDK+xYbNFe9YZN4RAVOfkG5p+oZxefL6jNNW96kmmUx
         /RvLu+Mq9r62A==
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, perex@perex.cz,
        alsa-devel@alsa-project.org, agross@kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        bgoswami@codeaurora.org, swboyd@chromium.org, plai@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
In-Reply-To: <20210202062727.22469-1-srivasam@codeaurora.org>
References: <20210202062727.22469-1-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
Message-Id: <161228008450.11888.13128911236969601728.b4-ty@kernel.org>
Date:   Tue, 02 Feb 2021 15:34:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 Feb 2021 11:57:27 +0530, Srinivasa Rao Mandadapu wrote:
> Had a typo in lpass platform driver that resulted in crash
> during suspend/resume with an HDMI dongle connected.
> 
> The regmap read/write/volatile regesters validation callbacks in lpass-cpu
> were using MI2S rdma_channels count instead of hdmi_rdma_channels.
> 
> This typo error causing to read registers from the regmap beyond the length
> of the mapping created by ioremap().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
      commit: 6c9123068815ed0bc1e8fa5a5029eef5ee3866c3

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
