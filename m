Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257C92FDE53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 02:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbhAUA7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:59:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:54592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390369AbhAUAJI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 19:09:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79B7C23730;
        Thu, 21 Jan 2021 00:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611187700;
        bh=AtC5q2W2oLkfDoZzLgASSBt9b4kFplLrpoUru6BPG4g=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=VwRIy3GP+8gDpjzd9jJZMwZrpCuYm+Z5t82CXBMh8nTKRUNV2jjRLu20Gm/yA3CT1
         6+ducthmEeo2uO5q0NDMipcdYhbAJLJ+8aVvS+q7YLLZ/dA9m9b8xXDn1so1g9LV8t
         +jiTJJHWvrppzaBPfkEwMZ45MsE2FPd6sQdv7XcXF3uRES4YzRxBrnB4Ry7/TQTI4T
         5ztrKsd4UCtj3zGN6mfa/4qeAmKmBWaycDwOs6ckJWph83CVDEEh7/OkIYkE0eCElx
         9+X6K91Ic9dl+9IDsaTdZ0ysTa2w2xEw3FNtff35RfyEMfH4YzdJIDGqeHIiKDYNan
         god6FAfLcBzTw==
From:   Mark Brown <broonie@kernel.org>
To:     linux-arm-msm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        phone-devel@vger.kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, marijn.suijten@somainline.org,
        lgirdwood@gmail.com
In-Reply-To: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
References: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
Subject: Re: (subset) [PATCH v4 0/7] Really implement Qualcomm LAB/IBB regulators
Message-Id: <161118766212.46058.17597385912492952608.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 00:07:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Jan 2021 18:44:14 +0100, AngeloGioacchino Del Regno wrote:
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

[1/7] regulator: qcom-labibb: Switch voltage ops from linear_range to linear
      commit: 9a12eb704ea27826ece4414cb8822388ec54883c
[2/7] regulator: qcom-labibb: Implement current limiting
      commit: 8056704ba948c1c54c7a67d78a8399a749f2d04b
[3/7] regulator: qcom-labibb: Implement pull-down, softstart, active discharge
      commit: 3bc7cb99fb6eafae5a40bf71ded444df70a425f7
[4/7] dt-bindings: regulator: qcom-labibb: Document soft start properties
      commit: 5581304004659ddc8d0d45561c1f2abfe080b4d4
[5/7] regulator: qcom-labibb: Implement short-circuit and over-current IRQs
      commit: 390af53e04114f790d60b63802a4de9d815ade03
[6/7] dt-bindings: regulator: qcom-labibb: Document SCP/OCP interrupts
      commit: 9499200484669fe33c20c735a3d5a29a0dc0e9d4

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
