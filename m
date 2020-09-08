Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3567D2616DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731672AbgIHRVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:21:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731541AbgIHRVF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:21:05 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53DF8206B5;
        Tue,  8 Sep 2020 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599585664;
        bh=Ja9hL6KF26G2I1GvZlGJGPbFxGYhbjPc5NzEgAnOSfU=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=11JAGinwUI6ZZ8FvZzaS1tGG+gQBE+k1ZhDNyE/n1ots5Wq3+3T2GJ0Kx7/eRikzG
         63b4w5c2R85aI3LbkUfXHehRLL47tQQS6gAroQhXL+LQtFzIWuKarfG+Q9XCxmv97X
         IVT03qfQQIp6VtlW9jUbmbLy+5F+he+Xpfm9pagM=
Date:   Tue, 08 Sep 2020 18:20:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200826095141.94017-1-stephan@gerhold.net>
References: <20200826095141.94017-1-stephan@gerhold.net>
Subject: Re: [PATCH v2 0/2] ASoC: qcom: common: Parse auxiliary devices from device tree
Message-Id: <159958562064.16576.531530312246805516.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 26 Aug 2020 11:51:39 +0200, Stephan Gerhold wrote:
> In some cases we need to probe additional audio components that do
> not appear as part of the DAI links specified in the device tree.
> Examples for this are auxiliary devices such as analog amplifiers
> or codecs.
> 
> The ASoC core provides a way to probe these components by adding
> them to snd_soc_card->aux_dev.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom: Document "aux-devs" property
      commit: cdd3b8daf26e5eb2e97b6a37dfdb83597bcbdc52
[2/2] ASoC: qcom: common: Parse auxiliary devices from device tree
      commit: 1b839d3e15fd48e4278c83190725467713a5b3c6

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
