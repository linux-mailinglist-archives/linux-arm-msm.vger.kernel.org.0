Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF31347E86B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Dec 2021 20:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350022AbhLWTjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Dec 2021 14:39:37 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:34698 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244778AbhLWTje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Dec 2021 14:39:34 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9C77ECE2178;
        Thu, 23 Dec 2021 19:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE51CC36AE9;
        Thu, 23 Dec 2021 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640288370;
        bh=k9GLyyBuOQ9Sm/cdmFUcfY4OryXSOQK/ki79q1v2xQs=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=teCi81Fa9JLCqnabKNsg/PrAlHemns/yU09FMCuiPyVEoc4luFHDOqy6qbNfnGHKJ
         ZoJr7MZzFZWiYLXcmmHGy/KRNQEXHPE/WMkuW0nld4DkxvbM3/qWP54lK5IfDlK/vL
         ali+mRB4ark07IqM5aZvCSkqogySVXBe2AQC0WSqWgVZOiLqZTfn2TFPVZg6amuIeV
         VVCikWprG9dLQluQVCfebfusXBJN4At8jeoCvdDrseJoeGgAedTXkJZLx+6Irxd129
         TPJIfMdaZUIDz+QQuNXK1Rl3d7H8pQnjGHoy6a4cuQ0KhvYPODYq0g1TiD9oTgMlEG
         LHKBL9FuYlndg==
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Paul Cercueil <paul@crapouillou.net>,
        ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20211214142049.20422-1-stephan@gerhold.net>
References: <20211214142049.20422-1-stephan@gerhold.net>
Subject: Re: [PATCH 0/4] ASoC: qcom: Parse "pin-switches" and "widgets" from DT
Message-Id: <164028836762.13551.16534248024583184241.b4-ty@kernel.org>
Date:   Thu, 23 Dec 2021 19:39:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 Dec 2021 15:20:45 +0100, Stephan Gerhold wrote:
> Some sound card setups might require extra pin switches to allow
> turning off certain audio components. simple-card supports this
> already using the "pin-switches" and "widgets" device tree property.
> This series makes it possible to use the same properties for the Qcom
> sound cards.
> 
> To implement that, the function that parses the "pin-switches" property
> in simple-card-utils.c is first moved into the ASoC core. Then two
> simple function calls are added to the common Qcom sound card DT parser.
> Finally there is a small patch for the msm8916-wcd-analog codec to make
> it possible to model sound card setups used in some MSM8916 smartphones.
> (See PATCH 2/4 for an explanation of some real example use cases.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: core: Add snd_soc_of_parse_pin_switches() from simple-card-utils
      commit: 3d4641a42ccf1593b3f3a474ee7541727acbb8e0
[2/4] ASoC: dt-bindings: qcom: sm8250: Document "pin-switches" and "widgets"
      commit: 37a49da9a7d5ac1f7128000de42ff222da46ba7a
[3/4] ASoC: qcom: common: Parse "pin-switches" and "widgets" from DT
      commit: 2623e66de125ba153e41be6a0b8af24cae8aa436
[4/4] ASoC: msm8916-wcd-analog: Use separate outputs for HPH_L/HPH_R
      commit: 319a05330f4ff3f951f9c42094958c6cdef393b3

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
