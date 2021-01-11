Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FD42F1AEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 17:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731095AbhAKQaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 11:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:37920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728949AbhAKQaI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 11:30:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 651C6221FE;
        Mon, 11 Jan 2021 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610382566;
        bh=fxnw7/lfYiILcbmwfVtG7wR3OePe2w21x200A6Facfo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Zh6vUG1HcUUHM4SRIo/3DaxXGMCUgpbZWu9q8VRkCNyKNrK6tmbzXmLBes+SS0Y9U
         DzN10v4FDOBH9501jWh7jRYxg7VLsrg7YcSOtd/TTPcU02QkGj0rJbhlHYPPhl6XrE
         zw5CG7KOkt09XFcCY9Yxy20USmJE2n1DesZZgOx9ikuwG0WakdA3E3xJWrt2KGFIkm
         IaHLPSiw2+0zHfMAaeYudMpdV6ilwPK+V+WFNAzfVHhWlLHu2ajzED3YWzLQg7RCWg
         wgN5GvBkpFCKbquVQALZ8npPjKduR9ztPlnMsqdqlBobXFwl9rV/bOFM1eCTSGsH3N
         X5Pto1DYZnZDQ==
From:   Mark Brown <broonie@kernel.org>
To:     David Collins <collinsd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race condition
Message-Id: <161038253465.32830.8002222438288106508.b4-ty@kernel.org>
Date:   Mon, 11 Jan 2021 16:28:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Jan 2021 17:16:02 -0800, David Collins wrote:
> The final step in regulator_register() is to call
> regulator_resolve_supply() for each registered regulator
> (including the one in the process of being registered).  The
> regulator_resolve_supply() function first checks if rdev->supply
> is NULL, then it performs various steps to try to find the supply.
> If successful, rdev->supply is set inside of set_supply().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: avoid regulator_resolve_supply() race condition
      commit: eaa7995c529b54d68d97a30f6344cc6ca2f214a7

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
