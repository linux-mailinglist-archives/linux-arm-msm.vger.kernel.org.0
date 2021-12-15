Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3747B4750AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 03:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239044AbhLOCEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 21:04:07 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43996 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238932AbhLOCEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 21:04:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 053BDB816C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 02:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3399CC34601;
        Wed, 15 Dec 2021 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639533842;
        bh=I2Cnmary5Jqy04437jsTV6wE8dmrgoA/icM9J4+h0YM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=eFuZjpx7HcZeGDYFfGrLEB8CArZbZ6uo3TWjhhDP9K3bDGJDAWISy3BFjpNljIsuE
         AmKbKfERMNFU+/WHJL8y5mXCQY+A8r/X/3tnmVPqBpG0Vq5acykBSSb3fR1xKpulcc
         YQ0JmkeSn0eV1G87E9V9A6Ds5MMiSq/oBjlNpAedOFNTE+z7BmQoOQtjDMMzev7EOn
         iP9AbOU6codGS1ftnUEcjAdeVPdGjKziytZnxw+wB+sOxmHEH/P3htJjPXsXKIOTnz
         YwNNSeDJxD0LXcq4HLiihZhnKEqLv56+CKB2RNoGuSPn5pSLdfIaFBVz9XdsN7+XPw
         j1f2z+QOnrtwA==
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        yuhsuan@chromium.org, dianders@chromium.org,
        Jaroslav Kysela <perex@perex.cz>, cychiang@google.com,
        Banajit Goswami <bgoswami@codeaurora.org>
In-Reply-To: <20211214022509.1288245-1-judyhsiao@chromium.org>
References: <20211214022509.1288245-1-judyhsiao@chromium.org>
Subject: Re: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-Id: <163953383992.1515253.6537590429675017997.b4-ty@kernel.org>
Date:   Wed, 15 Dec 2021 02:03:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Dec 2021 10:25:09 +0800, Judy Hsiao wrote:
> Distinguish which headset codec is on the board by codec_dai->name
> instead of card->name.
> 
> It fixes the crash of being unable to handle kernel paging requests
> at virtual address ADDR by initializing the correct audio codec on
> the board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] SoC: qcom: Distinguish headset codec by codec_dai->name
      commit: 833a94aac572d7f0fe3f51329e0eb9f2884cf665

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
