Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158E72C16F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 21:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgKWUjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 15:39:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:46416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727847AbgKWUjE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 15:39:04 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D34620721;
        Mon, 23 Nov 2020 20:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606163943;
        bh=tkAsjlRH2HuuhR8vmGPp7i9n4IBY/yYjedNX3O0GBWc=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=cDp47rsTXsD0Zxg1b/NsKf4lt7RpderIZ8vEEF8LAZ/nAR/0mX69QF205d2zkKrt6
         3vVajqui2HbJsZC/07W/zA6na//Z6rL/akH9ipLZlV+MubFknfBW9YGRXE7PqxndCU
         BfE02ZLtAdkDwsNlGi5YF4eq580KbUBy4R3Xw/QE=
Date:   Mon, 23 Nov 2020 20:38:40 +0000
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, rohitkr@codeaurora.org, plai@codeaurora.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        bgoswami@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com, lgirdwood@gmail.com,
        srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
In-Reply-To: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
References: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state
Message-Id: <160616391558.20973.7389509283379786250.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Nov 2020 21:47:53 +0530, Srinivasa Rao Mandadapu wrote:
> Fix enabling BCLK and LRCLK only when LPAIF is invalid state and
> bit clock in enable state.
> In device suspend/resume scenario LPAIF is going to reset state.
> which is causing LRCLK disable and BCLK enable.
> Avoid such inconsitency by removing unnecessary cpu dai prepare API,
> which is doing LRCLK enable, and by maintaining BLCK  state information.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state
      commit: b1824968221ccc498625750d8c49cf0d7d39a4de

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
