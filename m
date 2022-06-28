Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BE255E478
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242243AbiF1N2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 09:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346395AbiF1N1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 09:27:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC3B132ECF;
        Tue, 28 Jun 2022 06:25:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8C49DB81E1D;
        Tue, 28 Jun 2022 13:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34723C341CD;
        Tue, 28 Jun 2022 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656422728;
        bh=YkY3YRpWZjvY3kzFvaZglL+Asozb4pp9bZcELGWrGP8=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=fSjGTW16tfddElttpgXGHZGOCkexNrDlFnx52h3IqdSzQcDln9QZJ76un6mbTjaEi
         3OpLPiRCAcgBBq8nggxSh4YZAJy/AlmjQF84WXQLTHO+iG3EG6pal8A3g56XJaIkPc
         75abf7TZSzKL2MNgWxUfBjLpl59aK9G5tMxfbVyTj4GxIv1Pe4gD/6sw5gBhM3STX/
         N6x8OrmFjOahz2y9YJFuOrh6MU3xkxkxiLZldmJu17w7+8Q77R1o5SEDRtvveXRWul
         4Z/dSTQxmJeAgfSwdB5Y8GeVo0RRWJ166v9l7M1F6YYjbGj6/lftIgdSMuSjJ6+Nbj
         VnQEi7jp74ayg==
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com, bryan.odonoghue@linaro.org,
        bjorn.andersson@linaro.org
Cc:     perex@perex.cz, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org, tiwai@suse.com,
        robh+dt@kernel.org
In-Reply-To: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
References: <20220628002858.2638442-1-bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH v4 0/2] Fix apq8016 compat string
Message-Id: <165642272593.1448965.607600751272662680.b4-ty@kernel.org>
Date:   Tue, 28 Jun 2022 14:25:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 28 Jun 2022 01:28:56 +0100, Bryan O'Donoghue wrote:
> V4:
> - Adds Bjorn's RB to first patch
> - Adds missing people to To/Cc list
> 
> V3:
> - Marks qcom,lpass-cpu-apq8016 as deprecated instead of removing - Bjorn
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: lpass: Fix apq8016 compat string to match yaml
      commit: 2a2ef688b1b03eea3a5b020d9bef50d015f619be

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
