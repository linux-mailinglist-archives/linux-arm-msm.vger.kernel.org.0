Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E517E425F3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242066AbhJGVkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:40:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:51986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242333AbhJGVkE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:40:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F86B61245;
        Thu,  7 Oct 2021 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633642690;
        bh=4vRh1y+xg/pfgwZWyOIc9oYS+SyNhWVKlApXMzlafFM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qk+xMv47J8u8vh4QEs92r0oEkKY4tQReLijaMwkLCJDbxpMGAKb6Is8y7+feI7RvE
         pp3akkZeROrwMosXVTOt/Lu0ulZX5o5Btdvkp+5bqj+mSqlPQBwTV9+93UfpPS5Ypr
         qryJocO/3lgs+VVhBWxpxs2kHfZchef/OnAgIZ+rphytjuU09fRPtvlS65wUMe5nkd
         GXdy6kCg0TUpp6xa+G/hmE6d4h8DBGsp0rJe7zsPS+Ykshz6PtrWg1Uo2zB0fGksxm
         rhlSNRO1xEJEGjZw0CVezPdJXgonfmA6MakV2ZHUr5Yd6r2gYJ17CWMLuLdEBII3jf
         yAWq16282CdKg==
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, agross@kernel.org,
        rohitkr@codeaurora.org, robh+dt@kernel.org, perex@perex.cz,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        swboyd@chromium.org, plai@codeaurora.org,
        srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
        judyhsiao@chromium.org, bgoswami@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        tiwai@suse.com, bjorn.andersson@linaro.org
Cc:     Mark Brown <broonie@kernel.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH] ASoC: wcd938x: Fix jack detection issue
Date:   Thu,  7 Oct 2021 22:37:34 +0100
Message-Id: <163364264608.649699.14554141644947512653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633614619-27026-1-git-send-email-srivasam@codeaurora.org>
References: <1633614619-27026-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Oct 2021 19:20:19 +0530, Srinivasa Rao Mandadapu wrote:
> This patch is to fix audio 3.5mm jack detection failure
> on wcd938x codec based target.
> 
> Fixes: bcee7ed09b8e (ASoC: codecs: wcd938x: add Multi Button Headset Control support)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd938x: Fix jack detection issue
      commit: db0767b8a6e620b99459d2e688c1983c2e5add0d

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
