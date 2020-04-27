Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2E71BA543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 15:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgD0NoM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 09:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727834AbgD0NoM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 09:44:12 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A25B206B6;
        Mon, 27 Apr 2020 13:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587995052;
        bh=OhxRsSwwdvnGxdpaeF4FzeJ/8kd+1iigCwEMEzTAriA=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=b/spQsEs9VVzo3Kdr0A9ZLsBkBHmawqed3tSX6DJ3TLn/CcAHoS3m2q2UcWkVhu3T
         SPec862zYs/vJjVWrhth2UKYCna5yxChwTIzCKwKCHx03Wfjrv/18KT3Y8HsX71lcg
         iMOSVJwmPKRiWrBHIw9y+yQ7So4KryOoD8x4ooMg=
Date:   Mon, 27 Apr 2020 14:44:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20200425125335.2674534-1-iskren.chernev@gmail.com>
References: <20200425125335.2674534-1-iskren.chernev@gmail.com>
Subject: Re: [PATCH] regulator: max77826: Remove erroneous additionalProperties
Message-Id: <158799504950.16924.8566981464657105053.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 25 Apr 2020 15:53:35 +0300, Iskren Chernev wrote:
> In this particular location additionalProperties actually declares a property
> named `additionalProperties` instead of specifying there should be no other
> properties.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> Fix bindings documentation for max77826 regulator as discussed in
> https://lore.kernel.org/lkml/20200413164440.1138178-1-iskren.chernev@gmail.com/T/#m9e9904560e68bcd98980fa0e68fe190525033af6
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.8

Thanks!

[1/1] regulator: max77826: Remove erroneous additionalProperties
      commit: 48dd1a7938e37d6d6414a20266394f858b37f10a

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
