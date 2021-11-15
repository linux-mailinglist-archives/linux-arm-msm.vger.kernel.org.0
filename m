Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5399D451AE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 00:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236253AbhKOXpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 18:45:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:45368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355337AbhKOXlA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 18:41:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B65786325B;
        Mon, 15 Nov 2021 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637019319;
        bh=sepJeKAqWD8OEq16yv5uQxj8oK3WHPvL+LfRcZh0niI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=dChFpCCkDxohYHTlOa+kJKHYpjYgV2kJNoJjZS9AIeP6IzOBQXUTvKC+IdcKRsmWJ
         fUqaXJZfT4aAdPolbpqvut7vCnP2VpqZV5vkQlBSJFAWC6xoDegTyMcWPB2XjqM1yt
         hJh0cFuIrTpkTCCuvcBGkNhc4mMcroWm3L4hcCSOve1py6hjutrLJLsI5y9VXnDu9g
         nAQdZrJShGkQ2MblqrPDP1962r6dGehUcxW9Q7c6l3CzYCbna/FoBR5ReoZVDb7YTZ
         9RrECdd6AYXgVLbsGmx3M+Y8Iegx+IP0/VkgKzMb8GxJ+RgzleQdKlBvihI8Rtq1uB
         yviu9M6AEoNHw==
From:   Mark Brown <broonie@kernel.org>
To:     swboyd@chromium.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        rohitkr@codeaurora.org, robh+dt@kernel.org,
        alsa-devel@alsa-project.org, plai@codeaurora.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com, bgoswami@codeaurora.org, agross@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
In-Reply-To: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
References: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
Message-Id: <163701931648.675370.4567378408146703552.b4-ty@kernel.org>
Date:   Mon, 15 Nov 2021 23:35:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021 12:41:28 +0530, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
> 
> Changes Since V1:
>     -- Fix typo errors.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: MBHC: Add support for special headset
      commit: 3c8a3ad4019126f06016ab0128dde11817502f52

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
