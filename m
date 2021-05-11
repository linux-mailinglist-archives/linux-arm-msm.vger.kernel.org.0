Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D6337A1D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 10:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhEKI2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 04:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231163AbhEKI2U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 04:28:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2398461622;
        Tue, 11 May 2021 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721634;
        bh=yNahv4s2ZyD/O1JsVRA0U9WyNwFTOmybewgtOHHYFAc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OSROV3xr/KtLtILJOm3UYIOXSyfOh3pPLQLflibkOGDr5gxjp/9A7gJVRNIzCkdY8
         IGbp89O/7JN2u7yXLZ1j4S7cKJnlLqab7UUHb3XcgvajMoMI9F0c7UEsF/mos/23A7
         uhj8pkxMSKm232C7eiZizP7pmdGAVquqbcQ4LuhTffGJLyEfGM/yklRi3uVPhHb+gT
         OWrMOHZj9p/zfeWJuGOvFWPTAAxYrgx8S65Ox8DseKfOyjEXrY0mqFr+z9bcCCwn9t
         G+vHUe3TveZA2SitU7EsxFcb9GYdJxPdR+DWz60cVpc/727AVy4liRnvmEUbKs1ds3
         tBgvSL+Ifo+sA==
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        devicetree@vger.kernel.org, robh@kernel.org
Cc:     Mark Brown <broonie@kernel.org>, wcheng@codeaurora.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] Enable VBUS current boost on pm8150b platforms
Date:   Tue, 11 May 2021 09:25:40 +0100
Message-Id: <162072067394.33366.791621175467822202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
References: <20210427130712.2005456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Apr 2021 14:07:10 +0100, Bryan O'Donoghue wrote:
> V3:
> - Drop the SoC regulator constraints for
>   regulator-min-microamp
>   regulator-max-microamp
>   These will be applied on a per-board basis - Mark Brown
> 
> V2:
> The first version of this patch set the current limit to 3 amps as was done
> in downstream. Mark indicated a preference to set this on a per-system
> basis instead of blitzing it, as in downstream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: Add a routine to set the current limit for QCOM PMIC VBUS
      commit: 67823d9dadd4dddee4b6bd075f6852b6ade5604a

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
