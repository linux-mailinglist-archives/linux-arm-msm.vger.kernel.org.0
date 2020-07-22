Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B56228D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 02:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgGVA5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 20:57:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731474AbgGVA5d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 20:57:33 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A85FC208E4;
        Wed, 22 Jul 2020 00:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595379453;
        bh=YFc1Ge3NE0T3bXCC5Gf3GooNVqwqCIBxiYL/YiH8W8o=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=BtVqH/lPGZbQNQGutQe2W2b5gVSMnKSuKUu9razqy0V/4QB6v0uzos6diTaXDgi5Y
         ojvuOZHz6MlAuRhVLl2NN5Czj87Es2jqzCWEImv5i0aRinMrbQcR7ZypStWJNtVL76
         HT51hxX9SEkI6yDGv0E9euRMGQ7tmvgzumvwblow=
Date:   Wed, 22 Jul 2020 01:57:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com
Cc:     sricharan@codeaurora.org, sivaprak@codeaurora.org
In-Reply-To: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
References: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
Subject: Re: [PATCH V3 0/4] Add frequency / voltage scaling support for IPQ6018 SoC
Message-Id: <159537943520.49645.2118659765116943270.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Jul 2020 11:42:19 +0530, Kathiravan T wrote:
> IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
> controls the APSS and SDCC voltage scaling respectively. Add support
> for the same.
> 
> changes since V2:
> 	- Rebased on top of linux-next 20200717 tag
> 	- Addressed Rob's comment to drop the 'syscon' node in qcom,smd-rpm.yaml
> 	- Picked up the Reviewed-by tag for qcom,smd-rpm-regulator.yaml
> 	- Regulator patches part of V2 was picked up by Mark and it's available in linux-next tree
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: convert QCOM SMD-RPM regulator document to YAML schema
      commit: 175a1d84154d4077da437b873319bd094b266ab8

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
