Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264402C2B7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389774AbgKXPhj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:37:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:40858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389277AbgKXPhj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:37:39 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4881220715;
        Tue, 24 Nov 2020 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232258;
        bh=wH23yziWLfTWcklO4bp7dINMvSOovpGSoIUHdH8rBmo=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=BN/6oC9oYh7tbbYQQNSvqLyp6GIjE3qbGY4+4+oGMKxeKWQ2Pjg1PpXIXUMk8cqnD
         RF0f0PtilokY1Dzxjd1JoatlgjWvVdmTC8/rBbpWmMvoLrnsdf42bR0NobZ/q9qn3g
         ACYfXUQxIjioeFRsRU9Q8lLy9gNEHdBiMYUwC7VI=
Date:   Tue, 24 Nov 2020 15:37:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
In-Reply-To: <20201123222359.103822-1-john.stultz@linaro.org>
References: <20201123222359.103822-1-john.stultz@linaro.org>
Subject: Re: [PATCH v2] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies to avoid build error
Message-Id: <160623223531.5119.17981946485400763449.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 23 Nov 2020 22:23:59 +0000, John Stultz wrote:
> The kernel test robot reported the following build error:
> 
> All errors (new ones prefixed by >>):
> 
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
>    qcom-rpmh-regulator.c:(.text+0x270): undefined reference to `rpmh_write'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>    qcom-rpmh-regulator.c:(.text+0x2f2): undefined reference to `rpmh_write'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
> >> qcom-rpmh-regulator.c:(.text+0x274): undefined reference to `rpmh_write_async'
>    xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
>    qcom-rpmh-regulator.c:(.text+0x2fc): undefined reference to `rpmh_write_async'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies to avoid build error
      commit: 34c5aa2666db54c4bd330fb2759f6e4d4544ad7a

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
