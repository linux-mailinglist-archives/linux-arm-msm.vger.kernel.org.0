Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250D2212872
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 17:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgGBPrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 11:47:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgGBPrK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 11:47:10 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23ECB2088E;
        Thu,  2 Jul 2020 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593704829;
        bh=QzXEbm91ZHjeK+U2ufKA+zyN3DYIjWJ/5Ng9zrnJgPU=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=I/da2YHGzWZ+Auh0JgtvgMU4K3Q2xGbjFSad2+s+VaG9S7CRXzGy7ILl6bYjstoCP
         GGtyA1VW3Dut6mB/3BHxLqx7jkcAt7XYwS3KkH/5syFoVfVV4Uk8qRVTnrB5MOYEuL
         +UjHfeV2TBIT9aBuSFi7bxXiNac+D5u/BLRN1tdk=
Date:   Thu, 02 Jul 2020 16:47:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Colin King <colin.king@canonical.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200702115659.38208-1-colin.king@canonical.com>
References: <20200702115659.38208-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] regulator: fix null pointer check on regmap
Message-Id: <159370481231.5599.12177973052182986447.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Jul 2020 12:56:59 +0100, Colin King wrote:
> The null pointer check on regmap that checks for a dev_get_regmap failure
> is currently returning -ENOENT if the regmap succeeded. Fix this by adding
> in the missing ! operator.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fix null pointer check on regmap
      commit: 94462138f368a5e079d53d578509276e4366d0c1

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
