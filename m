Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AC22F83FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 19:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388237AbhAOSUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 13:20:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:42778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388063AbhAOSUM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 13:20:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16925222B3;
        Fri, 15 Jan 2021 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610734771;
        bh=3rRDT+rU1u3GZvGDwrSbAniCXS09VSj6vZ/alOvP+cQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=luOgCmD3g2dKfofk01BU11o3YgKeJEe3zxEpjOWvZE6xhZ2FNIp6iDzXBui8Ddpkr
         FTLKNceUkIIn1qaztis+xvtvdPg28RuRE4MNtn4YHszzRMJrJZroQ/ZOS5G8iqAQzk
         e0xICRheUSWsmLwKu6crP6LKCy6InUrnn37H69KQAXpor429zGr5ExC7WdTppkykhI
         X+kGcc3GOzhT1YWzszmzZVJ6vpRt+6T0IiLrKjn1jveDn1gAZ4YgfFJjrbrVGlzuqk
         yae8KH7K8lFIGxY2M46zqR1j7aI/nc8vXDrBRp+nbzcB6Qin0OOLwHEq8JzZVw7UsY
         vrIAZCrtmXJCw==
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Cheng-Yi Chiang <cychiang@chromium.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
References: <20210115034327.617223-1-swboyd@chromium.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: Minor code cleanups for lpass-cpu
Message-Id: <161073473698.12268.9934599691128446500.b4-ty@kernel.org>
Date:   Fri, 15 Jan 2021 18:18:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Jan 2021 19:43:23 -0800, Stephen Boyd wrote:
> Here's some minor code cleanups for the lpass-cpu driver. I noticed that
> it casts away const from the driver data from DT. That's not great but
> fixing it is a little more involved. I'll get to it later. There's also
> some questionable clk_get() usage that should probably be
> clk_get_optional(). For now this should help a little.
> 
> Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Cc: Srinivasa Rao <srivasam@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Remove useless debug print
      commit: 16117beb16f01a470d40339960ffae1e287c03be
[2/4] ASoC: qcom: Add some names to regmap configs
      commit: 03b49bf9a92b18bbfcc3b5eb206cca8447e9f2cb
[3/4] ASoC: qcom: Stop casting away __iomem for error pointers
      commit: e697df66876c182927899950971c3b4888df3e6e
[4/4] ASoC: qcom: Remove duplicate error messages on ioremap
      commit: 4e15f5060d34dd28591cf3af43d3086a4b76c965

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
