Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30FA2ADB1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 17:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgKJQCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 11:02:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:44492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730200AbgKJQCl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 11:02:41 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9ACB3206E3;
        Tue, 10 Nov 2020 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605024160;
        bh=ie3J/2MS7vjiEfSv1p0lPveL076A6s9sdaz+Gma5P0I=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=1k015RohfC/Wu6QB7nZOjPM+lM2kV/rT9j6zbS0aDS5FqRmbbsxkxF+Bs0NZEZVrl
         vw9pKdZFgog48gHWXb+kUXXmdnswWO6E2S/afEmfkPywjmchiikFaYmO6CciHNK1AH
         qXfBaNaMZyJu9tLYvxCeOwyzUlYYqGPH4FI6e6z0=
Date:   Tue, 10 Nov 2020 16:02:26 +0000
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org, Ajye Huang <ajye.huang@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>, robh@kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        cychiang@chromium.org, tzungbi@chromium.org,
        devicetree@vger.kernel.org, srinivas.kandagatla@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Rohit kumar <rohitkr@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, dianders@chromium.org,
        Banajit Goswami <bgoswami@codeaurora.org>
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180 sound card
Message-Id: <160502414080.45830.11882063016977646088.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Nov 2020 14:14:31 +0800, Ajye Huang wrote:
> Note:
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
> 
> v6:
> - Documentation: Addressed suggestions from Rob Herring.
>   - Define "maxItems: 1" in dmic-gpios property.
>   - Only keep one example and add dmic-gpios property in.
> v5:
> - Machine driver:
>   - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
>     detailed info at https://lore.kernel.org/patchwork/patch/1331087/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
      commit: 0e38d93493c7b11bc250113dd5b7b9d17ba8c54d
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
