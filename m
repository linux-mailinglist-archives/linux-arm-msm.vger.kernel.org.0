Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C752115DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 00:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgGAWYG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 18:24:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbgGAWYE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 18:24:04 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F19207E8;
        Wed,  1 Jul 2020 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593642244;
        bh=d+icjJ6GLd3kdgYAlrHBvwkA8bkok4/9Z9kTA40mDjw=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=0sB6wOe5DEtxgCxOspH/Yz56q0iGHkXYoA+JXulPXtCXT/LBpGhVwQgzM/+b9g1VA
         e1RDreCtuxprr7Qxemo7HGUiqCWIpGXfPQ69Mi6vLCgd7U9B2daSMDUoE6ccCIQ9GF
         Ns0rWm7vH0qNrhaRyloFPZ8BSXcqBa7pjprK7d/o=
Date:   Wed, 01 Jul 2020 23:24:02 +0100
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
References: <20200629194632.8147-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH 0/2] regulator/qcom: Constify static structs
Message-Id: <159364222729.10880.5748193683459087739.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 29 Jun 2020 21:46:30 +0200, Rikard Falkeborn wrote:
> Constify some static structs to allow the compiler to put them in
> read-only memory.
> 
> Rikard Falkeborn (2):
>   regulator: qcom_rpm: Constify struct regulator_ops
>   regulator: qcom_spmi: Constify struct regulator_ops
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: qcom_rpm: Constify struct regulator_ops
      commit: 8d41df6469eec8d784137aeeebf87dca7460ce37
[2/2] regulator: qcom_spmi: Constify struct regulator_ops
      commit: 3b619e3e2d1a89f383a0a0c527818dcb2bc66f92

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
