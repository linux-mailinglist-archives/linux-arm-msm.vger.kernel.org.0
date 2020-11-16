Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099BB2B5506
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 00:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbgKPXdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 18:33:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:40428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgKPXdE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 18:33:04 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8492221F8;
        Mon, 16 Nov 2020 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605569584;
        bh=IydiCbo8tDV2y2wade3NokSL+pzfPQAOkBc2FrMvzb4=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Xj/UEouX9p5sOji8xwirF6rTa/3aEKnFVRg41Hb8L+qDTNeNLANGOq7JttrzWgPiz
         qkFUbhRSe+TpwARJi9r7jx1++Zsd38juqSk8+Zgaua6jrhphLoh8/qaUytMiG7Aj0f
         XeibkFxX3vpUSZb3dlaGygzbElxZQrn7qTorVhFw=
Date:   Mon, 16 Nov 2020 23:32:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
        bgoswami@codeaurora.org, rohitkr@codeaurora.org,
        robh+dt@kernel.org, perex@perex.cz, plai@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
In-Reply-To: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
References: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Add 32 bit format support for capture
Message-Id: <160556956527.29683.2982806188163092654.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Nov 2020 13:19:15 +0530, Srinivasa Rao Mandadapu wrote:
> Add 32 bit format support for capture in lpass-sc7180
> snd_soc_dai_driver capabilities. Need to add contstraints
> in machine driver so that only specific format allowed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Add 32 bit format support for capture
      commit: 313ebec48dedcac351557b5a84b8b2239951c238

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
