Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B094E233B5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 00:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730641AbgG3W3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 18:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730024AbgG3W3E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 18:29:04 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA27320838;
        Thu, 30 Jul 2020 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596148144;
        bh=3E2zv9US9vLZ0at3kxD0+KN3nNVdL4vqBHT/gU3kpKg=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=TCa1Fr1V54rnXcOaXy7ogD1GOXg392RrdbZxgon1IDI3C5rvcPSqCBlOQrzxnkWiZ
         HeubyUagR8xBdeL87DACfSBiFFP9fWqlhMDuJhXgqnFqZ1an6TtMoAw1/p/3pVwLqt
         /4RugqH3IL+I7EmI2w0jU2ooRr0IMW0qCsjzIkCQ=
Date:   Thu, 30 Jul 2020 23:28:44 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, sivaprak@codeaurora.org
In-Reply-To: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
References: <1596098964-19878-1-git-send-email-kathirav@codeaurora.org>
Subject: Re: [PATCH 0/3] Enable DVFS support for IPQ6018
Message-Id: <159614812412.1677.11866049151869161352.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Jul 2020 14:19:21 +0530, Kathiravan T wrote:
> Add A53 PLL, APCS clock, RPM Glink, RPM message RAM, cpu-opp-table,
> SMPA2 regulator to enable the cpu frequency on IPQ6018.
> 
> Kathiravan T (3):
>   dt-bindings: mailbox: add compatible for the IPQ6018 SoC
>   dt-bindings: regulator: add the sub node names for the MP5496 PMIC
>   arm64: dts: ipq6018: enable DVFS support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: add the sub node names for the MP5496 PMIC
      commit: bcb3b2a7639db2412875520cddc3abd179068793

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
