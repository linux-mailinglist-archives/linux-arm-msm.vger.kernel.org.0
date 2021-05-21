Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF2638C9C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 17:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbhEUPJe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 11:09:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:49298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232206AbhEUPJe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 11:09:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F0F7613CB;
        Fri, 21 May 2021 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621609691;
        bh=+s3tbWsUsJ09qhWtcfTtaWKIFSjqWd/CEMzp6/HYzbY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ogm/5ZQld7rsZ/9TfQAff2RHEDW8OVM39rnphBcnTamJind06DP1tBjVo5zNHBGy4
         KIeeQdnHzwt/a1czwHEiM4jywDNn6gkVVB8ii5Zvou9dxNtN4vemj1gYmjk86uwWpB
         03J/fxJ3eKGYNiNUnbr75jgAlr8H6oos14jcUhE4y9EIbTFLDFax8LjG8oXiCQ4Hnq
         bnhi70IkNbh4yGczKoq136z6SZrA2nrB2hVAnuXvFIlIMz8NZrmFa1UbZAHNwC5fEM
         ON4RTHp6H4sYL9PfDc9q9Qfw6xo4W9KtdeaJdUXIlm/Gyqvltc5GOG060H15PiwPDW
         jCPf+SBmG15Iw==
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Use optional clk APIs
Date:   Fri, 21 May 2021 16:08:01 +0100
Message-Id: <162160953475.10636.11463749705483843535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520014807.3749797-1-swboyd@chromium.org>
References: <20210520014807.3749797-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 19 May 2021 18:48:07 -0700, Stephen Boyd wrote:
> This driver spits out a warning for me at boot:
> 
>  sc7180-lpass-cpu 62f00000.lpass: asoc_qcom_lpass_cpu_platform_probe() error getting optional null: -2
> 
> but it looks like it is all an optional clk. Use the optional clk APIs
> here so that we don't see this message and everything else is the same.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Use optional clk APIs
      commit: af2702549d68519ac78228e915d9b2c199056787

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
