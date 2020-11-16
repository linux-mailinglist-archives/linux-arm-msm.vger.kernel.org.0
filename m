Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D162B550F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 00:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgKPXdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 18:33:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:41090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726227AbgKPXdp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 18:33:45 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D008221F8;
        Mon, 16 Nov 2020 23:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605569624;
        bh=xq62QE7/u63IXnVdwILr5LgN6HXfl7A05MOWRxR9rQM=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=ryoK4Lwc59YFEyyt3FAm+7RwQG1ifZTE2mCd5UeCHc/FFGCNsJZA12xS8yUPG80vf
         yHgNh1KWRxg1x7ImzybvPfzH8fV0H2Mlh7ZetMEE8OkyMUdgPg5aGAMf96XfMCGgQx
         QCBOElpU7MScukLx7NG95ocbJdav4f4iVYfU48Xw=
Date:   Mon, 16 Nov 2020 23:33:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
        bgoswami@codeaurora.org, rohitkr@codeaurora.org,
        robh+dt@kernel.org, perex@perex.cz, plai@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Pavel Machek <pavel@ucw.cz>
In-Reply-To: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
References: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
Message-Id: <160556956526.29683.2121148120940564064.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 15 Nov 2020 10:26:50 +0530, Srinivasa Rao Mandadapu wrote:
> lpass_pcm_data is not freed in error paths. Free it in
> error paths to avoid memory leak.
> 
> Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-platform: Fix memory leak
      commit: bd6327fda2f3ded85b69b3c3125c99aaa51c7881

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
