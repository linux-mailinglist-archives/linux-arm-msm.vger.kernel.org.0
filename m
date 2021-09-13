Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1235C40897A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 12:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239257AbhIMKzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 06:55:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:51504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239298AbhIMKzr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 06:55:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DD4760F12;
        Mon, 13 Sep 2021 10:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631530471;
        bh=+LuT1nw1zwnEKWg8ze5we++x+gTI9O+Ydnbmy+cNIDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bNahRGyD1ZY6zifYN/gxH5aVeOELABzlt4ajoCiJRWLAPK5COx9axY0N5rjUmWE4V
         0b/4W4ggOtOwniiAcBF/ust8zByALc111DVKiZGddaPPyWPeR4Dd3moLMYNgG0gkz1
         2PFhTwWsV6p3dm3V2NYsMuyhMBJlnAHZXnBU24U9z2pxiTbxxjiWSCj7wM2tly4fHD
         3kliVyMz1SFgcQEAVBQs9YXyfQyMGkUDTy18U8vW3gdTxNObaIQGKlfUa+rrrpLJyJ
         H+3Yi2bmfRHtKIHB2xAakl9JuBB8GrFz3G7s6zOHnayTAHdXZeqP+RUKckhfZ5aUYh
         +TY/+KiIqSFyQ==
From:   Mark Brown <broonie@kernel.org>
To:     perex@perex.cz, plai@codeaurora.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        rohitkr@codeaurora.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, agross@kernel.org, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        judyhsiao@chromium.org
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital codecs
Date:   Mon, 13 Sep 2021 11:53:13 +0100
Message-Id: <163152996584.45703.6233667847951933638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Sep 2021 18:57:34 +0530, Srinivasa Rao Mandadapu wrote:
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
