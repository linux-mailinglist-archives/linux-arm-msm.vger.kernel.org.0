Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2147A593247
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Aug 2022 17:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiHOPow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Aug 2022 11:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiHOPoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Aug 2022 11:44:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19511DF62;
        Mon, 15 Aug 2022 08:44:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C6F87B80EE4;
        Mon, 15 Aug 2022 15:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29039C433D7;
        Mon, 15 Aug 2022 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660578283;
        bh=A5X+xGMzM1h8sTR3J20XfXnllhty+y5tSXqqki10rMo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=aEU2Inhpca8EezctoKdfOp4qPnusitLbq0B9rmFklwqSkJ+1jVg6e9wIVIJ5xLfwo
         ggjq9ccR/fricwS7cWCVXw240Fz51i5N5rqSfJ1DzOkdTaWfb4mlX6tLofAjTUUA4b
         5HNoaDQ0mOSFR0A5vdS7IQuighEjyYdbx4zdhQZdgNc6wpkct31agY9mJLkz0MpZw+
         FN/fpDxbKU1FgOX4WH1IPsDixFluOcF1EfK7aBMhYkqUSap/5t38Rdt79YP6/044zX
         ZIuhTBxFdvCj2LGN4doYiVJyCG3kpDaQVJ75JphhPqenFhb5RuwcF2Bzu0VQ4zt+Ea
         9QlNqD8F2c6Eg==
From:   Mark Brown <broonie@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
References: <20220726102024.1.Icc838fe7bf0ef54a014ab2fee8af311654f5342a@changeid>
Subject: Re: [PATCH] regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()
Message-Id: <166057828188.697572.9391830884435789646.b4-ty@kernel.org>
Date:   Mon, 15 Aug 2022 16:44:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 26 Jul 2022 10:20:29 -0700, Douglas Anderson wrote:
> Since we don't actually pass the load to the firmware, switch to using
> get_optimum_mode() instead of open-coding it.
> 
> This is intended to have no effect other than cleanup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom-rpmh: Implement get_optimum_mode(), not set_load()
      commit: efb0cb50c42734f868908a97f0d93e9208da1f0e

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
