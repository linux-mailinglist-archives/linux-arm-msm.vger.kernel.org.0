Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8743233798A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhCKQiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:38:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:56498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229552AbhCKQhl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:37:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58F4264F9F;
        Thu, 11 Mar 2021 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615480660;
        bh=dYVRLS5VWyX7gUG8Qu6LM+nvJxKlncbsX9vvCiH5n6c=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=TynJDyYJwdun1XTklSWx6zrN0N1SohDKb4A1N1d2Tmln9pdMPFGolSENcL96TgdoZ
         GUxO14zs+Oi0RXf/9XuTuZUQyHeNuqmnBxwLlozaGyy4x7wp4KDNHXZoOzkuYRK/+R
         Wg1X0piNwK+YTX3M5PQ13YwIlV4c2NJZp9IcDKXRTGvJlrueTuQyKeVGF4fPHYzxQe
         jq9Qw9l0VzjWFtQUtU6jzmrAjltr/hi6tGvDPZ6dw0IQwRUa0zfLSz/yA9DB+stik0
         Ubf8TJwLE+inEMzQph+w7WCrLgc0j6rX9NIrgCUgUR8F7c+zIOgjy9EaMn79nZJv8r
         r0Lbioz+Ux1hw==
From:   Mark Brown <broonie@kernel.org>
To:     tiwai@suse.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
        judyhsiao@chromium.org, robh+dt@kernel.org,
        bgoswami@codeaurora.org, agross@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        bjorn.andersson@linaro.org, alsa-devel@alsa-project.org,
        perex@perex.cz
In-Reply-To: <20210311081805.20424-1-srivasam@codeaurora.org>
References: <20210311081805.20424-1-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
Message-Id: <161548058820.3429.7412298596711968916.b4-ty@kernel.org>
Date:   Thu, 11 Mar 2021 16:36:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021 13:48:05 +0530, Srinivasa Rao Mandadapu wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
> 
> Fixes: cd3484f7f1386 (ASoC: dt-bindings: lpass: Fix and common up lpass dai ids)

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
