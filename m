Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC9443BA4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 21:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhJZTJR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Oct 2021 15:09:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:44918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234008AbhJZTJQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Oct 2021 15:09:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68A45610A1;
        Tue, 26 Oct 2021 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635275212;
        bh=DBEx9t2CB+8MmSY7UjuuCdmlBwQL3CUhnAaUE+XYyRQ=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=A60IOoRMMZGy3t3QJ/KgLxG6B68GkrknhmQv60RG9RzcnPF+kGVJLYBZNyaJAbIP7
         mH0xmyBZ0YOwFw3zFWEbeZ0AfMbrWdViwtX2wIJ/j88Gwlf8J0u+TzDP3JhYn/szgM
         D6UX937++toP4t4hWIUfesB5c4t/p80Akjnh3NaPMrXCmRi/WhpmawY3qsNsGTQxpf
         Wl94+wQBPcbmaCaMJl2t9Ul3CyX5E2bBfqXRWVOgRCZYuK5pUCw7F3DV4syn6UL1Nt
         a5QirX7LtfktYZO3DMw3ITf2tg1Suyn4sSUbnRHiDFcfhz3hLAisSLF+w/IddH3uUL
         nZwANVZMl/Kpg==
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        judyhsiao@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, bgoswami@codeaurora.org,
        alsa-devel@alsa-project.org, plai@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com, swboyd@chromium.org,
        srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, perex@perex.cz
In-Reply-To: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
References: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 0/5] Update Lpass digital codec macro drivers
Message-Id: <163527520915.2033755.14378859701858526354.b4-ty@kernel.org>
Date:   Tue, 26 Oct 2021 20:06:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Oct 2021 13:13:03 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for lpass sc7280 based targets.
> Upadate compatible name and change of bulk clock voting to optional
> clock voting in digital codecs va, rx, tx macro drivers.
> 
> Changes Since V3:
>     -- Removed fixes tag.
>     -- Change signedoff by sequence.
> Changes Since V2:
>     -- Add Tx macro deafults for lpass sc7280
> Changes Since V1:
>     -- Removed individual clock voting and used bulk clock optional.
>     -- Removed volatile changes and fixed default values.
>     -- Typo errors.
> Srinivasa Rao Mandadapu (5):
>   ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
>     sc7280
>   ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
>     codecs
>   ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
>   ASoC: codecs: tx-macro: Update tx default values
>   ASoC: codecs: Change bulk clock voting to optional voting in digital
>     codecs
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for sc7280
      commit: 9d8c69814d7d8abf299998dd1d3f4a0b595cddca
[2/5] ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital codecs
      commit: 6e3b196e5ad2e4cd23498935ba32cecedae53642
[3/5] ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
      commit: 864b9b5856ae74a350933782399934bdde5df989
[4/5] ASoC: codecs: tx-macro: Update tx default values
      commit: 7b285c74e422d35b02349650a62d32f8ec78f51d
[5/5] ASoC: codecs: Change bulk clock voting to optional voting in digital codecs
      commit: 9f589cf0f91485c8591775acad056c80378a2d34

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
