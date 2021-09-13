Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EB140897D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 12:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239335AbhIMKzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 06:55:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239281AbhIMKzt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 06:55:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B0C3461004;
        Mon, 13 Sep 2021 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631530474;
        bh=CBaronYiroxiOitWnu3/lsS9n0AaVmXWm4fRuQVuEZQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LqpGszfcgQvhMbh8xPL1iFBRDyfWeUBd3GxrMGbBTN1L/Pp6ZwJRMTQG1Tps2d0Mo
         phCkfV+v+XsTHGXMjYEKzoNCNwK1KmO54oT9IbNuz7hIhx55BRMc6QIT/gfCIzzNqL
         0kMRP7Z69c0dRXJtXbcHIYDgjlymVl3hC53N3dGq/rjOGgGchxr8nc2mxquqrNpQFo
         CQ7xY32MD13Z8/zjNagnHhPtMnEoeOAkycZtqs7YPJ0xAescQA2gHSjQWeTysaseWt
         bD5yU7RmLC0yOKPLTpRJ7hQMG2uXq/+0EMvFd3xCcMFSqn95yPgOp2eb5bYxjzU6hx
         Tj4M9W4780mVQ==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, perex@perex.cz, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        rohitkr@codeaurora.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, plai@codeaurora.org,
        tiwai@suse.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        judyhsiao@chromium.org
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: lpass: add binding headers for digital codecs
Date:   Mon, 13 Sep 2021 11:53:14 +0100
Message-Id: <163152996586.45703.5277154686084016527.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
References: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Sep 2021 19:33:51 +0530, Srinivasa Rao Mandadapu wrote:
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: lpass: add binding headers for digital codecs
      commit: bfad37c53ae6168d03ab06868ea44e77995c43d5

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
