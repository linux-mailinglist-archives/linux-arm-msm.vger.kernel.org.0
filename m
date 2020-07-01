Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845572115D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 00:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgGAWXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 18:23:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726257AbgGAWXy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 18:23:54 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE43A2082F;
        Wed,  1 Jul 2020 22:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593642234;
        bh=nrLm50/DFztfbXKPpIFpYoIWkeLNWvJ5kWxiTa+wd8I=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=EIgu0Ta5BB0f13llEDdfIqF/NJ4AlyVwptaYb6n7oun7/EwHsXk4SafLUq6mvfPW7
         tC921rrPLT9YADDPfSkNuWrmJ84Bp8smXNkAa/nc4jai7rciDWHd79R9X4yaZVXiv3
         AtRpt13lAbhIgPdY+7CjSITrpX2BkB84KGUHBRoE=
Date:   Wed, 01 Jul 2020 23:23:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>, lgirdwood@gmail.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     sivaprak@codeaurora.org
In-Reply-To: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
Subject: Re: [PATCH V2 0/6] Add frequency / voltage scaling support for IPQ6018 SoC
Message-Id: <159364222730.10880.10457847599595105286.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Jun 2020 10:47:46 +0530, Kathiravan T wrote:
> IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
> controls the APSS and SDCC voltage scaling respectively. Add support
> for the same.
> 
> changes since V1:
> 	- Moved YAML conversion to the last as per Mark's comments
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: add MP5496 regulator compatible
      commit: 93e39d096d7312e38cf502be4e516cff7acf34fa
[2/2] regulator: qcom_smd: Add MP5496 regulators
      commit: 47894c859479a9e3472657c7acf2c7ba35778059

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
