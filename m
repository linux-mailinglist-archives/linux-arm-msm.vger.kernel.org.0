Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E40C24DB7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 18:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgHUQlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 12:41:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728638AbgHUQkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 12:40:47 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BC872076E;
        Fri, 21 Aug 2020 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598028046;
        bh=EvjYX8VGFAkdYRMoROfW5zmgZVwotJ8Uvmvse9ytBIQ=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=CeUhHNdBc9hId5eHJUHIDLQrdIWsAKSe02c8cGLV+g1ypbuJjt0Y8Ef7aZ8jnEFtj
         Wph7/zFTp9CimZU/MqWma8jD//zRYkCxXgVrZMvXTeOQO0Ks6Rukt6sAZ4EjO1RpFh
         TrfJrle1LosE+gzUk+697ian3F4pCfZsxwZGbrQg=
Date:   Fri, 21 Aug 2020 17:40:13 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Icenowy Zheng <icenowy@aosc.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
Subject: Re: [PATCH v2 00/15] regulator: Fix W=1 build warning when CONFIG_OF=n
Message-Id: <159802800846.25815.3400807374016781922.b4-ty@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 Aug 2020 11:11:35 +0800, Jisheng Zhang wrote:
> Fixing W=1 build warning when no support for device tree is there.
> 
> Since v1:
>   - fix the warning with __maybe_unused instead of CONFIG_OF macro
>   - add 3 more patches to fix the same issue
> 
> Jisheng Zhang (15):
>   regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
>   regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
>   regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
>   regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
>   regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
>   regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
>   regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
>   regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
>   regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
>   regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n
>   regulator: qcom-rpmh: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-booster: Fix W=1 build warning when CONFIG_OF=n
>   regulator: tps65023: Fix W=1 build warning when CONFIG_OF=n
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/15] regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
        commit: e11e068ccbdb038e21e24ad2ee0157c902e3c9fc
[02/15] regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
        commit: 2d2a84ae30a3bda57a22b283c55be8e9e6fd158b
[03/15] regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
        commit: 5e97d7e809a1fd8a2401429df13e0410b77d2142
[04/15] regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
        commit: 0f037255008386f4ac15a201678e8e4565cd91a3
[05/15] regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
        commit: 8ece31564f1964d52eb1180ee33314c63533947e
[06/15] regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
        commit: 1d4c1e02b96ea579f68412980ee1fe5f2ce57d8c
[07/15] regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
        commit: 44bc5d168dc209bddafb3269f72a74c3cbb0d820
[08/15] regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
        commit: 7bf0a29c354fc1855dc478916211b5194bab4393
[09/15] regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
        commit: dc8c5ea3574e08e3c7105bbba5af5bb9c055903b
[10/15] regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
        commit: a94a11ce0d5235e53bb74d54bbd5399c23abfd87
[11/15] regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
        commit: d5579e7a2c6aa49a183440eb4e199f4a71543762
[12/15] regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n
        commit: bbe26107204eb64e7be1b3433e8b2252edc0b375
[13/15] regulator: qcom-rpmh: Fix W=1 build warning when CONFIG_OF=n
        commit: a2508eeb8dbdf621518f8c3538d3adcb6960619c
[14/15] regulator: stm32-booster: Fix W=1 build warning when CONFIG_OF=n
        commit: b461ac1cc6c0a0bc4a788d5d65cfd82e5f3bd856
[15/15] regulator: tps65023: Fix W=1 build warning when CONFIG_OF=n
        commit: 8536bf811dd7a25d90d9128f9db98b5ed8e5bd5c

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
