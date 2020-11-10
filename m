Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7F72ADB27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 17:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732620AbgKJQDF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 11:03:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:44902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732582AbgKJQDE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 11:03:04 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DCED20829;
        Tue, 10 Nov 2020 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605024183;
        bh=arSU7iObv5TKvnOj6naRt5mQLdMTSeyl4JneYSecfts=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=aoUlOLUo8fWOL4ebcQd9XF/ZfKTW4mTZ+5YkQb53YE2DJ76QTKZq09jrZtxsyfrtb
         Gne4/wjoyQfVjF7BwPMw+KFcqJr/dcs0xtV/rF8gsIEHK828Vir2rfMTmq4ViQw1pr
         CYm2jTOzaUiPEaOC2rll/wqA2TovOvW+4C3aB9ZY=
Date:   Tue, 10 Nov 2020 16:02:49 +0000
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org, Ajye Huang <ajye.huang@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        cychiang@chromium.org, devicetree@vger.kernel.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        dianders@chromium.org
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1 0/2] Modify documentation and machine driver for SC7180 sound card
Message-Id: <160502414078.45830.11309600092998215198.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Sep 2020 14:37:42 +0800, Ajye Huang wrote:
> Note:
> - This patch depends on this patch series
>  ASoC: qcom: dt-bindings: Add sc7180 machine bindings
>  https://patchwork.kernel.org/patch/11773221/
>  ASoC: qcom: sc7180: Add machine driver for sound card registration
>  https://patchwork.kernel.org/patch/11773223/
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine bindings
      (no commit info)
[2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
      commit: 3cfbf07c6d2779d24a6f5b999a91f400256b1d4e

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
