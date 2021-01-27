Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7CA3061C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 18:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhA0RS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 12:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:39750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234807AbhA0RPo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 12:15:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95F3364DA6;
        Wed, 27 Jan 2021 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611767703;
        bh=Jwcav97hQHhQBoXQqSHH19U0iri8g3r7wuWgGbnyEyc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Xbh0Cj2rU2kVgw/qGpWIGxF3c0FVaTzje28tPlfWz4whBd4p0ot1XBusTKRnbtPV8
         hojCiP259Mt5Ix4G14IewiS/mNeqK0oF3C391uPlX8MGX2nAK43AUDcQgGxNQOrg+G
         2cpSiA1i0uEPkv55fCKt3ovZXDEvUn3z1/sABS+8s5y5nMAXY72EamupR52l4G7zJ6
         6HVd8trU+t4zEi0rUepYVbc6ewliAHaITEUBEZpl/7aUn1P55Bq2qw+MbkMzLi38U8
         d1IT8ViAJTZyO6WAwMZTeS2h5gB6YpYXowVfnw68LE3g/veuu0tY9lBFoMBj1lbGxa
         Q1etK/YOnN69g==
From:   Mark Brown <broonie@kernel.org>
To:     linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Cc:     dianders@chromium.org, Rob Herring <robh+dt@kernel.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <tdas@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        tzungbi@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrick Lai <plai@codeaurora.org>,
        Judy Hsiao <judyhsiao@google.com>, dgreid@chromium.org,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, cychiang@google.com,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210127134847.1143535-1-judyhsiao@chromium.org>
References: <20210127134847.1143535-1-judyhsiao@chromium.org>
Subject: Re: [PATCH] ASoC: max98373: Fixes a typo max98373_feedback_get
Message-Id: <161176762855.34530.12866385579369703713.b4-ty@kernel.org>
Date:   Wed, 27 Jan 2021 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 27 Jan 2021 21:48:47 +0800, Judy Hsiao wrote:
> The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
> to snd_soc_gut_volsw.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: Fixes a typo max98373_feedback_get
      commit: ded055eea679139f11bd808795d9697b430d1c7d

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
