Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98022C6950
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 17:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730876AbgK0QUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 11:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:45512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbgK0QUh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 11:20:37 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E2C221534;
        Fri, 27 Nov 2020 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606494037;
        bh=zddLxlCzjvQCUIKJPRApQIgwKgr/yV43vpmOZuV1TM8=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=maormRB/zuu98AI/ktz2A2ccUFQq7PSAMdadNz+5tYYOcWbyJT++1WbTnFmN+V9iU
         VLeDGgE2VspenC0bPNpvnp9ZPmazSKJ/WN3428Dvs0af/OAriFSlEejhQtXB2sGQMs
         3oayn/WXqLNqtQFO/0s1zOImbpeyh/MPj637m2cg=
Date:   Fri, 27 Nov 2020 16:20:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>,
        linux-kernel@vger.kernel.org
Cc:     dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, judyhsiao@chromium.org,
        Patrick Lai <plai@codeaurora.org>, cychiang@chromium.org,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>,
        alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v1 0/1] Fix 32 bit format for adau7002
Message-Id: <160649401225.51911.879572172271559224.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Nov 2020 08:58:57 +0800, xuyuqing wrote:
> the microphone is attached to external codec(adau7002)
> instead of rt5682.We need to always use 32 bit format on sc7180
> to meet the clock requirement of adau7002:
> The ADAU7002 requires a BCLK rate
> that is a minimum of 64× the LRCLK sample rate
> 
> xuyuqing (1):
>   ASoC: qcom: sc7180: fix 32 bit format for adau7002
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: fix 32 bit format for adau7002
      commit: 7f2c63d6ae0754e5389c5942cb3bd670ea6cff40

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
