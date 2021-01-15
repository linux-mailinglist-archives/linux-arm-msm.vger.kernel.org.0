Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832152F842E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 19:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388716AbhAOSVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 13:21:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:43792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733119AbhAOSVL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 13:21:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD0CE23AFC;
        Fri, 15 Jan 2021 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610734831;
        bh=Rzl9zISM7Y5XM+HBsSUTizk0jJUUmy+FRaBFRx/4l6k=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=WauPeOggsiDQYj0OYxsMCCfd4Qi5EIRi4zXd5ufHqyld595ou5xlTPNnupVLBKImw
         umdSQZn7wRsIHf1W7FoQ5VxIbQi/2Fw9lcO+3JuRlyDZyG+vwriyr7yxAHRmHezdFY
         0JbZccCcEXcnOnWNlLZ5XeFjbgjecPoDef8TiEn1Fw03dbA5q4bZ3r87BBDMNut3gF
         Q6ypZWdMaSIChCuP6QCpxiemsZ7lu0mWjZuAoraDm/woIi/+b2B2Xw2fBwUtZhz7Lx
         Qy7JMzAaVWvaUQlL5h5q5P497kY/DCdCW4eAcmJegvJbAb3hrAvzTDJyMCm0qL1NMK
         VCcPW+azH7DUA==
From:   Mark Brown <broonie@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, sumit.semwal@linaro.org,
        martin.botka@somainline.org, robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        phone-devel@vger.kernel.org, marijn.suijten@somainline.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
Subject: Re: (subset) [PATCH v2 0/7] Really implement Qualcomm LAB/IBB regulators
Message-Id: <161073479108.12431.17135576809621290489.b4-ty@kernel.org>
Date:   Fri, 15 Jan 2021 18:19:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Jan 2021 20:42:07 +0100, AngeloGioacchino Del Regno wrote:
> Okay, the title may be a little "aggressive"? However, the qcom-labibb
> driver wasn't really .. doing much.
> The current form of this driver is only taking care of enabling or
> disabling the regulators, which is pretty useless if they were not
> pre-set from the bootloader, which sets them only if continuous
> splash is enabled.
> Moreover, some bootloaders are setting a higher voltage and/or a higher
> current limit compared to what's actually required by the attached
> hardware (which is, in 99.9% of the cases, a display) and this produces
> a higher power consumption, higher heat output and a risk of actually
> burning the display if kept up for a very long time: for example, this
> is true on at least some Sony Xperia MSM8998 (Yoshino platform) and
> especially on some Sony Xperia SDM845 (Tama platform) smartphones.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/7] regulator: qcom-labibb: Implement voltage selector ops
      commit: dd582369c6c1f39ec475af6191a934f3e57fda35

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
