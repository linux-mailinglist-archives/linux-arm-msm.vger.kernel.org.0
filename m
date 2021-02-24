Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29E7A3242CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 18:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhBXRBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 12:01:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:47328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236104AbhBXQ7v (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 11:59:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 855D264F0B;
        Wed, 24 Feb 2021 16:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614185950;
        bh=+Ui4SGs2u3B4NnHzGVlGF+aHvhazAJ+LpD5ghDfbZbc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=bOi0riYoBxCrsDCEUmP5eEjqNTgXlU5Zmsk2KzVuZGLW8FzOwLGJ6nUuEtZueEorc
         hOrZaXGIo0J5Qfn1qYxqqjJYlJFxX9PBsOmYAaUP8rK0M4mIdF9vmE5ZrZ6HsOFSot
         IxnXWh5aeXhNI541r/nOydQtHAGduK460UJCoGeN8ALoPZntkD4DQyCn6f0bW1ReSB
         J2UTfit9dLL4uHCyRvMzikL8eRoYJIuPDX6AZjB519vjWQt0nQNYVoIKepz31U+hmr
         tlwXshmWwm123W2eKyuaNuSoz/SlX+YNiT8HDgdwFkW1mTnrWNiKFBqroNgTMRMAYA
         OfqaffFpIoWJQ==
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        satya priya <skakit@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, kgunda@codeaurora.org
In-Reply-To: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
Subject: Re: (subset) [PATCH 0/7] Add PM7325/PM8350C/PMR735A regulator support
Message-Id: <161418588691.2546.13874123016197949820.b4-ty@kernel.org>
Date:   Wed, 24 Feb 2021 16:58:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Feb 2021 14:03:05 +0530, satya priya wrote:
> This series is dependent on below series which adds DT files for SC7280 SoC
> https://lore.kernel.org/patchwork/project/lkml/list/?series=484757
> 
> satya priya (7):
>   dt-bindings: regulator: Convert regulator bindings to YAML
>   dt-bindings: regulator: Add compatibles for PM7325/PMR735A
>   regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
>   regulator: qcom-rpmh: Add pmic5_ftsmps520 buck
>   regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
>   regulator: qcom-rpmh: Use correct buck for S1C regulator
>   arm64: dts: qcom: sc7280: Add RPMh regulators for sc7280-idp
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515 buck
      commit: 62861a478e06d87dbfbb0ed3684056ba19a9886e
[6/7] regulator: qcom-rpmh: Use correct buck for S1C regulator
      commit: 8fb4acb880e9467adca913e51adf5c1f96fbbeb9

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
