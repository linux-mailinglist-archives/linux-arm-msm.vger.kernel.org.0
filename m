Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68A139E704
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 21:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhFGTDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 15:03:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:37612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231442AbhFGTDJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 15:03:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B98561164;
        Mon,  7 Jun 2021 19:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623092477;
        bh=BUGAoI+KqIWeSqshgoFKvoknfcZfg6rrVZ5THdPAqLc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BXFoK3hHKx/nBaxEkLMVoPl5nv2z2l1Hmk3O9qgDReAwaJL4v6VMOrrentpY7sz1l
         3GF6XyEHO03ZhOmRT2Iz4agrQowtYGHXUWYogvCU2BEpgJx9VxDHgm6Ia3Xoi37N+5
         8aTQywFvW4ls6zLSxxmzpKOaA5mpIIx3dJKoFFPrxw55rfCixkbSA0y239VbxNE27A
         LMuDoi7lgS4/1Q8fqa1L57bZfM6pqhQbiRZuCAa+a1dNSaMR0dpjsjMQEf76wqEb5z
         OTCg3NxsVHWb4QdGuUx+dKxqPlf8bcnHZtJyCWCGQdUYbVTmXX1e4YXBD2Hx4nk5sT
         yTTPnQ3zH+axg==
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>, tzungbi@chromium.org,
        swboyd@chromium.org, judyhsiao@google.com,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org, cychiang@google.com,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Jaroslav Kysela <perex@perex.cz>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Andy Gross <agross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        dianders@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
        dgreid@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [v7] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
Date:   Mon,  7 Jun 2021 20:00:46 +0100
Message-Id: <162309220525.30523.13322673130433156811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604154545.1198337-1-judyhsiao@chromium.org>
References: <20210604154545.1198337-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Jun 2021 23:45:45 +0800, Judy Hsiao wrote:
> This patch fixes PoP noise of around 15ms observed during audio
> capture begin.
> Enables BCLK and LRCLK in snd_soc_dai_ops prepare call for
> introducing some delay before capture start.
> 
> (am from https://patchwork.kernel.org/patch/12276369/)
> (also found at https://lore.kernel.org/r/20210524142114.18676-1-srivasam@codeaurora.org)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix pop noise during audio capture begin
      commit: c8a4556d98510ca05bad8d02265a4918b03a8c0b

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
