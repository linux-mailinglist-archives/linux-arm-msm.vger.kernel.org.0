Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACBE2AC556
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 20:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgKITsI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 14:48:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:43176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730379AbgKITsI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 14:48:08 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0275206E3;
        Mon,  9 Nov 2020 19:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604951287;
        bh=FYfmW8xxjbT53wT8eCWTN+eqI1IgYtV7lRvsksS17XI=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=Nq7gkvHwLVvMurmEn+w6Wqkmn0NzD78Q23fZkKNOyhOpwkn60VdMVXf2WfhIqWETM
         FiO9+PrUmnte4662kv8IH+bfzusvB8ablPUcLAOCYsqPA8AZK8k9DUthbxifhCG5r6
         6V8Y11eIaqR/OOBcWeTpYvAZGlxeZVUpXn2IJkGM=
Date:   Mon, 09 Nov 2020 19:47:53 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>,
        linux-kernel@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        xuyuqing@huaqin.corp-partner.google.com, dgreid@chromium.org,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, judyhsiao@chromium.org,
        Takashi Iwai <tiwai@suse.com>,
        Patrick Lai <plai@codeaurora.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rohit kumar <rohitkr@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, tzungbi@chromium.org,
        Srinivasa Rao <srivasam@codeaurora.org>,
        Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201109103415.607495-1-cychiang@chromium.org>
References: <20201109103415.607495-1-cychiang@chromium.org>
Subject: Re: [PATCH] ASoC: qcom: sc7180: Add missing PM ops
Message-Id: <160495125733.49154.11647929702514464617.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 9 Nov 2020 18:34:15 +0800, Cheng-Yi Chiang wrote:
> Use PM ops snd_soc_pm_ops to handle suspend/resume like other machine
> drivers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: Add missing PM ops
      commit: b2fc3029308dd1bace4c11c733eca2ef941b0e29

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
