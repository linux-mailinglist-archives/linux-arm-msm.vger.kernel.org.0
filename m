Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0A22B0E2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 20:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgKLTiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 14:38:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:39942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgKLTiv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 14:38:51 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D8A32223F;
        Thu, 12 Nov 2020 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605209930;
        bh=IIC3z8DoJYS3m/UUHzXZzuwRZqJYxGm5s1nx2Q+3JhY=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=0K6FdYayNjvTCAJ4CVqO3mOyTSzAHAxmGNXPS4J9kxN0T8fSB2JwSGthuw5ywbNEY
         dDIYo1ILzjWVZbiiHHVKQnm0mSrgtmZg15/jPpB52UbyCvYZH3FGXSNOCgrxlWjBc5
         TnGod5sXXG/3FodI7hxA/J9qjf38IVL+wauUk5xQ=
Date:   Thu, 12 Nov 2020 19:38:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>,
        linux-kernel@vger.kernel.org
Cc:     Liam Girdwood <lgirdwood@gmail.com>, cychiang@chromium.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        zhouguohui@huaqin.corp-partner.google.com,
        Patrick Lai <plai@codeaurora.org>, alsa-devel@alsa-project.org,
        dianders@chromium.org, dgreid@chromium.org
In-Reply-To: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v2 0/2] Support SC7180 sound card variation without headset
Message-Id: <160520990388.38586.14245119235842247312.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 Nov 2020 09:43:26 +0800, xuyuqing wrote:
> Use compatible string to let machine driver handle the case
> where ALC5682 headset codec is replaced with ADAU7002 dmic codec
> 
> xuyuqing (2):
>   ASoC: google: dt-bindings: add new compatible for sc7180-coachz
>   ASoC: qcom: sc7180: Add machine driver for sound card
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: google: dt-bindings: add new compatible for sc7180-coachz
      commit: 80e2b1208d87fc46b6980da99a173130082c7af4
[2/2] ASoC: qcom: sc7180: Modify machine driver for sound card
      commit: e936619b7ce784c808a8e2524f712a89ef245920

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
