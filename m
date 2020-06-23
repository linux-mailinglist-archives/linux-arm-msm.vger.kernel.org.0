Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8941C2052AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 14:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732513AbgFWMjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 08:39:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:51704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729667AbgFWMjt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 08:39:49 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4245220776;
        Tue, 23 Jun 2020 12:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592915988;
        bh=Sf31bbv+NizJQ/qfUekYBQVAKaQoqsrAkLY4dLIG+kw=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=nirshNN0aFNNjSoexxgBlu3LFSV/A7dCq9dEs54XwdLipJdJZI2dIMYBwVLzlOIux
         gEJO2xMSvsDvUB9qSGN8dlNlAOyF/nqQpS3cKoYSGiNqpXkLYcPsyMR+u6Dd0DhSgQ
         OeFAt7QY8Xs3Eu3wv3HphKRraiQpqo1IGrybx0gQ=
Date:   Tue, 23 Jun 2020 13:39:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     skrzynka@konradybcio.pl, Konrad Dybcio <konradybcio@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Colin Cross <ccross@android.com>
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
Subject: Re: [PATCH 00/21] MSM8994 peripheral enablement, DTS updates
Message-Id: <159291598139.44727.6998255676582744850.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 20 Jun 2020 16:46:16 +0200, Konrad Dybcio wrote:
> In this series I added support for various buses and peripherals
> such as I2C or SMD RPM. I also did some housekeeping when it comes
> to the DTS. This series also includes a new board (SoMC Kitakami
> Sumire / Xperia Z5).
> 
> I have a MMCC driver coming along with GCC updates/completion
> (almost ready, need to polish a few things) and I sincerely
> hope somebody is going to write a 20nm DSI PLL driver (for 8992/4)
> as I have no clue how that works.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom_smd: Fix pmi8994 label
      commit: 0d46f69881c34351b6ec523c31225b90ea89ee20

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
