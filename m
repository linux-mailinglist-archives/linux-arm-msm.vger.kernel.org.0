Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038B9221013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 17:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgGOO7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 10:59:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbgGOO7l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 10:59:41 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0656F206D5;
        Wed, 15 Jul 2020 14:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594825180;
        bh=oY0bSa2V0EHeW/S+pZKL8cobHCUlI74YE8WVvDT9Rn4=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=SWuws3Q8Dh9CyWLs4Pp/5SUMxnBsypK69Fr/ueXX5wTTyL6IXR9j8vFPl0tCverVt
         z1eEvA4CLjjD3R0X5T099EYI4n18xI8tSLVT29kywsL52Cuc+TLYjz4zE69lVX/e/f
         SUhUCupduGtIVSEQZ4OBFVL++wSv7gg2Aje3/Ka4=
Date:   Wed, 15 Jul 2020 15:59:30 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>, lgirdwood@gmail.com,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     rnayak@codeaurora.org, nishakumari@codeaurora.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kgunda@codeaurora.org
In-Reply-To: <20200622124110.20971-1-sumit.semwal@linaro.org>
References: <20200622124110.20971-1-sumit.semwal@linaro.org>
Subject: Re: [PATCH v5 0/4] Qualcomm labibb regulator driver
Message-Id: <159482517093.44733.5508630525614600992.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 22 Jun 2020 18:11:06 +0530, Sumit Semwal wrote:
> This series adds a driver for LAB/IBB regulators found on some Qualcomm SoCs.
> These regulators provide positive and/or negative boost power supplies
> for LCD/LED display panels connected to the SoC.
> 
> This series adds the support for pmi8998 PMIC found in SDM845 family of SoCs.
> 
> Changes from v4:
> - v4 Review comments incorporated
>   - simplified the driver: removed of_get_child_by_name(); use ENABLE_CTL
>     register and switch over to use the regulator_*_regmap helpers
>   - improved kerneldoc
>   - From the dt-bindings, removed interrupt-names, changed to dual license,
>     added unevaluatedProperties: false, removed interrupt-names, since there
>     is only one interrupt per node
>   - Since the Short Circuit handling needs more details from QC engineers,
>     drop the SC handling patch from this series, to submit it later
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: Allow regulators to verify enabled during enable()
      commit: f7d7ad42a9dc2d63cab6a79fe31e6732a30dacf5
[2/3] regulator: Add labibb regulator binding
      commit: 88c14de2b6786ef503fd1bc2c952159e65fe45cc
[3/3] regulator: qcom: Add labibb driver
      commit: 498ab2fdf8554690c9567c1eee436b858637e3ff

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
