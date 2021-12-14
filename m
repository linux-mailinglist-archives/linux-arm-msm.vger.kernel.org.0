Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E2B474367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhLNNZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbhLNNZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:25:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1F1C061748;
        Tue, 14 Dec 2021 05:25:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54B08B819AC;
        Tue, 14 Dec 2021 13:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CA2C34605;
        Tue, 14 Dec 2021 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639488332;
        bh=+FyMOj1y47J0jKkiU7/fNkq+8RT+GijdYH8HXwKy9UM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=K3hKjq/Upt25FBJ1BBPN71lKZHUzxMW0Bev6LE+t+EG5KTwVqghwvEGBNBAkFF6fu
         aCMPYWhrpje5mTlIkIAmzVIrF9sf9it3U93yklsiUiPjY0bp4NWTcruukG1QluXtk5
         oE4wJcA5wvcxnKADPHis9WBgJH9B8+tT0e2NqiR0H+o9ycsXDiEsRmfemwtKog49uZ
         u/KQTIhumt8czyKtdsKzBKr/VFXXsS40vepyYSC6CffeziPmW628Sh6BWd5Q26OgYG
         ETeqJATzGFnBJMlV+E2UvFWVEUKCVoQPmTVDMUbEKz/qfTfYK9JLRDX463/DUSVSrF
         r1pAREIfnrQ8w==
From:   Mark Brown <broonie@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        alsa-devel@alsa-project.org
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
Subject: Re: [PATCH 0/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
Message-Id: <163948832993.2865729.5795229789612585528.b4-ty@kernel.org>
Date:   Tue, 14 Dec 2021 13:25:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Dec 2021 15:55:00 +0100, Stephan Gerhold wrote:
> This series makes it possible to route audio through the combined
> audio/modem DSP on MSM8916/APQ8016 devices instead of bypassing it using
> the LPASS drivers. This is necessary to support certain functionality such
> as voice call audio. See PATCH 4/5 for details.
> 
> Also, qcom,apq8016-sbc.txt is converted to DT schema by adding it to the
> existing qcom,sm8250.yaml. The bindings are similar enough that it is easier
> to share a single schema instead of duplicating everything into multiple ones.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant MultiMedia routes
      commit: c55676ec292e0ff83261eb61efaf99a91079a3b8
[2/5] ASoC: dt-bindings: qcom: sm8250: Document "aux-devs"
      commit: 1875ae76f82c5c9acd7b7f44bd9226fbcbe858b7
[3/5] ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,sm8250 DT schema
      commit: b7875d88bf70100d2fe0dc08072018f994ccd6c4
[4/5] ASoC: dt-bindings: qcom: Document qcom,msm8916-qdsp6-sndcard compatible
      commit: 38192dc36f1fe1615b7a12cc78b9354d6b4ba8b7
[5/5] ASoC: qcom: apq8016_sbc: Allow routing audio through QDSP6
      commit: 190357e1e09f271566e91fcd108c161f7e25a253

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
