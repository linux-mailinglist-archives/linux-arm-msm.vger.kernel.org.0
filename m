Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D81733798D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhCKQiH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:38:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:56546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229677AbhCKQhs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:37:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4016C64FA3;
        Thu, 11 Mar 2021 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615480667;
        bh=pHFXEHpaYQNlJR1V5PQDUmn7CRQ5pNsHtX4fcNTco64=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=uTaA31Qv03qaGKoRKBAYaR389BGa6nMcaRXpBnpCmasmiUYhp+R1yFt4mSuLXj8e+
         X8R1AGh5xMAmnugDelpl214NugXqdzmrZkPv7d2lS70ydGqvyPnSVKUPZlT/g9JOVm
         EBZWo1qAncz8XLCCAY/QNsWl4i0VqFeKAJtxepi7eusZLazj8yrtZtJWxzaVkczUX0
         XJ1XnF5PxXoUAUWXcogFtkJiygAgNILMUpi2aB5IBcmHo15206Ybkb0DPQnFWnpgOj
         XsUo0/RtWoexiZq3SEO5kvCHK231HWm6B1lfGVWg2w32efnKSCW6AAza8UHbIM/bK5
         dSyRwfrtoLKWg==
From:   Mark Brown <broonie@kernel.org>
To:     tiwai@suse.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, bgoswami@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        srinivas.kandagatla@linaro.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        judyhsiao@chromium.org, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <20210311154557.24978-1-srivasam@codeaurora.org>
References: <20210311154557.24978-1-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-Id: <161548058821.3429.1675752758306184936.b4-ty@kernel.org>
Date:   Thu, 11 Mar 2021 16:36:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021 21:15:57 +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
> 
> Fixes: cd3484f7f138 ("ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
      commit: 9922f50f7178496e709d3d064920b5031f0d9061

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
