Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED8C29CA72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 21:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1831856AbgJ0Uj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 16:39:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:45580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1831852AbgJ0UjX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 16:39:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BFC920791;
        Tue, 27 Oct 2020 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603831162;
        bh=Dmex8B7MuY24WP9Gh+Qt7EKTYyT+ok3PmAB+LZ5455E=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Pb8K5NLuo1CeNsg3hnSHB+nEPtvOZeMqdLccL+x0KA1VpGfE7LILNC4AiHxE18l7V
         U3YRYef8o/DS+tFLTytH+8BOD5k9MJbcgSliBRrk7j2KbWHBy3oAzlATKVGFaxY588
         5DAxYRKvN/ptmgApJ3owaHOggN4oppAXTYsO8R7Q=
Date:   Tue, 27 Oct 2020 20:39:16 +0000
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, tzungbi@chromium.org,
        Taniya Das <tdas@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>, dgreid@chromium.org,
        xuyuqing@huaqin.corp-partner.google.com,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>,
        Takashi Iwai <tiwai@suse.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Srinivasa Rao <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org,
        Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20201027032234.1705835-1-cychiang@chromium.org>
References: <20201027032234.1705835-1-cychiang@chromium.org>
Subject: Re: [PATCH v12 0/2] Add documentation and machine driver for SC7180 sound card
Message-Id: <160383115673.25818.3743728810770710217.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Oct 2020 11:22:32 +0800, Cheng-Yi Chiang wrote:
> Note:
> - The machine driver patch is made by the collaboration of
>   Cheng-Yi Chiang <cychiang@chromium.org>
>   Rohit kumar <rohitkr@codeaurora.org>
>   Ajit Pandey <ajitp@codeaurora.org>
>   But Ajit has left codeaurora.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings
      commit: e158d2d83cab59ec7f4661548627ac171c797c9d
[2/2] ASoC: qcom: sc7180: Add machine driver for sound card registration
      commit: 9e3ecb5b16818abd0bc5f3997cf4d641a710f837

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
