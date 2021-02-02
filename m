Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4897E30C5F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 17:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbhBBQft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 11:35:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:59190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236455AbhBBQdc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 11:33:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E067364F79;
        Tue,  2 Feb 2021 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612283571;
        bh=YWHfyr2/AnPgY4UlYi+YIrWZvY9TvUAJqBz883GtN+8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=WuZY4PzrKxLZei/0QrkUSLj7JT7R/qQ4uj0khxMrvXs1jDuFWY3gPFcyTB7ClHQ6Y
         rlkDcyg0QxZiZiQYhKoDX0v3Fu/DQ9j4B5H9DaP3MOOMSFymuifCK2rDGbETRbUOfm
         3BdU/8TSArNJFBGQP0x0RX5OVD1F8o6aAPEk6Sc8lPnpfSLmImp2xTeO5slq/VTbDm
         fB7q39XdtFE19LcJ0a9NzmJx1GfmHMmekaObpoA+jKEMjCTY1WESa0Zyu2Eb3dRb6G
         z1+JaaLA6AIjEnQ55+MsIXKkbLhCz4DYCyqigrWFNh2d8tFb+7eBUzr9lDw34Jsjil
         GnL+UmAV1ODnQ==
From:   Mark Brown <broonie@kernel.org>
To:     mazziesaccount@gmail.com,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
References: <0400d7471571144bfeba27e3a80a24eb17d81f4d.1612249657.git.matti.vaittinen@fi.rohmeurope.com>
Subject: Re: (subset) [PATCH 1/2] regulator: qcom-labibb: avoid unbalanced IRQ enable
Message-Id: <161228352412.18127.16657481619745854565.b4-ty@kernel.org>
Date:   Tue, 02 Feb 2021 16:32:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2 Feb 2021 09:36:34 +0200, Matti Vaittinen wrote:
> If a spurious OCP IRQ occurs the isr schedules delayed work
> but does not disable the IRQ. The delayed work assumes IRQ was
> disabled in handler and attempts enabling it again causing
> unbalanced enable.
> 
> Fixes: 390af53e04114 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[2/2] regulator: qcom-labibb: Use disable_irq_nosync from isr
      commit: 337710b3121a4f4183c38ff056f6f9ef516cc34f

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
