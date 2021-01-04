Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C212E9C41
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 18:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbhADRlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 12:41:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:36614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727341AbhADRlz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 12:41:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE7772068D;
        Mon,  4 Jan 2021 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609782074;
        bh=k5ju6+jk760rADcHCAbaKDDu3K01ibNwMCfTBSegebw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=UEeEs2fTzuJEQCK9xvUncUjHa/XX7mUxS8/FFMMzOrEBgWI1sXZjfoEp8+6gr6A0o
         zkwTFnvcO+Dvax87DLmZuxC+foGtidfmPDJDDisyUVc4rFUtlR3f7DSui3TAfSSTER
         9LgUHbvRdF0k3N60eplPVPhtVJcAbq/f+Dzk5u2RBPnaGjeW51hqtb1emZXcYjciOY
         OUvFxLatMRLDRQpQJo7U0TVNWtiWmrnjzMWOlvxX0daaL5zr36vOscoqj7jK6QUbrX
         l6+wYIcHtRC+/h/lw1H6iQ0Ka5pjEROtFXPKh8sKA7N3hsgYo6eIc3Hqaun4uGykq6
         zrcJrezT9jbfg==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
References: <20201231122348.637917-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/4] regulator: fix pm8009 bindings on sm8250
Message-Id: <160978203769.14485.17360727494427661134.b4-ty@kernel.org>
Date:   Mon, 04 Jan 2021 17:40:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Dec 2020 15:23:44 +0300, Dmitry Baryshkov wrote:
> PM8009 has special revision (P=1), which is to be used for sm8250
> platform. The major difference is the S2 regulator which supplies 0.95 V
> instead of 2.848V. Declare regulators data to be used for this chip
> revision. The datasheet calls the chip just pm8009-1, so use the same
> name.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: regulator: qcom,rpmh-regulator: add pm8009 revision
      commit: 2bf3a72b08e7f6356a2db9e1571ca65f683510bb
[2/4] regulator: qcom-rpmh-regulator: correct hfsmps515 definition
      commit: df6b92fa40050e59ea89784294bf6d04c0c47705
[3/4] regulator: qcom-rpmh-regulator: add pm8009-1 chip revision
      commit: 951384cabc5dfb09251d440dbc26058eba86f97e
[4/4] arm64: dts: qcom: qrb5165-rb5: fix pm8009 regulators
      commit: c3da02421230639bf6ee5462b70b58f5b7f3b7c6

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
