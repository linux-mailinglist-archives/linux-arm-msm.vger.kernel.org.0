Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A9C299B0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 00:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408402AbgJZXrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 19:47:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408400AbgJZXrY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 19:47:24 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34F4B20872;
        Mon, 26 Oct 2020 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756043;
        bh=CCd/1eClEmV4GdkYGGj4s8i+deHWYDJGw3SoCtNf2O8=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=HEJKt+S9wdzTfdcyniRnE8GEYdxxMBjI4RH+tQDmKl+RC2dU/9SdSyui3E7dsz6Z0
         mUBHYtTOGfwRwTWGDVW7XbDz2ng6Ck+gBlEW6x+HbAjKjoO5BvwnmitmzHiefY1Dvq
         hM2QD+afILHXb5BCNVUFGshMpVbGIWJb5WqnBvVk=
Date:   Mon, 26 Oct 2020 23:47:19 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
References: <20201023131925.334864-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/5]
Message-Id: <160375603445.32304.15800152990447798405.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 23 Oct 2020 16:19:20 +0300, Dmitry Baryshkov wrote:
> On SM8250 MDSS_GDSC (and the rest of display clock controller) is
> supplied power by MMCX power domain. Handle this link in GDSC code by
> binding the power domain in dts file.
> 
> This patchset depends on [1]
> 
> Changes since v1:
>  - Define fixed-regulator-domain regulator using power domain
>    performance state for enabling/disabling.
>  - Rework to use new fixed regulator type (fixed-regulator-domain)
>    instead of controlling power domain directly from gdsc code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: fixed: provide bindings using power domain
      commit: d4189bc55d5c40251abaa1f341796aac84ddfb10
[2/2] regulator: fixed: support using power domain for enable/disable
      commit: bf3a28cf42412c0a85631da94f198048bb37a8e5

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
