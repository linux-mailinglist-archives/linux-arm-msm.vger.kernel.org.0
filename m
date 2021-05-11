Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D3C37A1D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 10:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhEKI22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 04:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:36844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhEKI2R (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 04:28:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 427E1613C3;
        Tue, 11 May 2021 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620721631;
        bh=mCBFyU4XUfWkB55SJhQL3mqIT6VRoEqjftOBUHEEXpg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XYMXG2128GsTJB7pqGsJvAKj6VAWrrfBkFbuuC09wOhG/UKti9b+gfIR6eD3dcNFz
         8RjRK3A6+mtXC2Z2s/+xIl6JDh5u4yQr3cpO556AhY8RKPqT45eazZ98nRiiexWJVy
         NTnuDRS3nHbl95H6JxHpBZ2CvHRzIw6ZfiU/n0LLzvIfzEM999/qBOqZCQm7wjPsrB
         RGVGp38Krk+iv0+OKTn76gD27mv+GzK1+bWXpgLP5TU9Oo/ywkI4LJlmbgzsdja8gE
         egjI8jQMDqh/wV49Ht42/S8Szc3bV7QOSnIgqsnFJukAaHeZi5bPoQpMAd4BzBc5S9
         vupvzBG9yRHcQ==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, lgirdwood@gmail.com, bjorn.andersson@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        devicetree@vger.kernel.org, robh@kernel.org
Cc:     Mark Brown <broonie@kernel.org>, wcheng@codeaurora.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Enable VBUS current boost on pm8150b platforms
Date:   Tue, 11 May 2021 09:25:39 +0100
Message-Id: <162072067394.33366.15146499353870845816.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
References: <20210426221446.1852572-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 26 Apr 2021 23:14:44 +0100, Bryan O'Donoghue wrote:
> The first version of this patch set the current limit to 3 amps as was done
> in downstream. Mark indicated a preference to set this on a per-system
> basis instead of blitzing it, as in downstream.
> 
> Looking at what was upstream versus what was in my working tree I saw that
> in fact the VBUS boost driver had been upstreamed minus accompanying DTS in
> pm8150b.
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
