Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59ABC2B550B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 00:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgKPXdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 18:33:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:41012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgKPXdj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 18:33:39 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBD95222E9;
        Mon, 16 Nov 2020 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605569619;
        bh=b5ELcT0j1+gXK/DBMCkE0hOgfeoQgXNezWmZaFt2BhQ=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=xQmF8unbBa604qPLYUQyT5DXD+nMaV8le+rEqJ2IR+RMK+uzA8n/7zPRe+EUYNddG
         6kpHyZoi6SHJ6pKvzuDdH0EbvkU7h3XPaLefc8dRfhI6fuuY+uJfd+5I6bZkUMQrL6
         9tEoxbuCPvZpWl532zBzmXdx6ogf+hya2Hd+RrWk=
Date:   Mon, 16 Nov 2020 23:33:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        lgirdwood@gmail.com, bgoswami@codeaurora.org,
        rohitkr@codeaurora.org, robh+dt@kernel.org, tiwai@suse.com,
        perex@perex.cz, plai@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        alsa-devel@alsa-project.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>
In-Reply-To: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
References: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: sc7180: Register shutdown handler for lpass platform
Message-Id: <160556956527.29683.12943309254001939669.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 14 Nov 2020 00:08:22 +0530, Srinivasa Rao Mandadapu wrote:
> Register shutdown handler to stop sc7180 lpass platform driver
> and to disable audio clocks.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: Register shutdown handler for lpass platform
      commit: 60a973862f3c41bc8d4b7a74bd45eda220e248e8

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
