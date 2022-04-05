Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F52A4F35B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 15:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbiDEKyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 06:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346800AbiDEJpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 05:45:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60BADBD07
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 02:31:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 60D24616D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 09:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF9CC385A8;
        Tue,  5 Apr 2022 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649151112;
        bh=86V35tezb7CnVylE5xhcOrRZJnrJztG/nm4t18+1yUk=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=cgaphUKPI+f4uVShNLg3NRNpwdZ7b84IuOhO5OSefGnWv3VRUTRgWBR9cTlKAkPC0
         qOK4leaT5YVrerXCeE2R7WAA1rcaWnV0pOS5fM/rSmYWdiCZwBBHVvxNPQ74jxQVIC
         /AsqTeRA+guAKOWTijKZ0CgWOIDMoDYLqgxEvcHv12iBpQbRfrQ1tN0Z0EIr9BoB+Q
         JNVcua9PMUUtZfcjZHrOxbHYt+TbIzgSxtbftttbVVSo0IUOf//shbNr+zZHbmLlXL
         rbuM5UvcdsEdoLUXwDz9wg4i59nRvb5VmzFKqdlU7v5uk2Q7P48bQ9duifOtcmOPme
         GHagk96RP9o7w==
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Takashi Iwai <tiwai@suse.com>, yuhsuan@chromium.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, judyhsiao@google.com,
        alsa-devel@alsa-project.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        swboyd@chromium.org, dianders@chromium.org, cychiang@google.com,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20220331084201.62815-1-judyhsiao@chromium.org>
References: <20220331084201.62815-1-judyhsiao@chromium.org>
Subject: Re: [v2] ASoC: qcom: Add driver support for ALC5682I-VS
Message-Id: <164915111030.276574.7396913741525054470.b4-ty@kernel.org>
Date:   Tue, 05 Apr 2022 10:31:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Mar 2022 16:42:01 +0800, Judy Hsiao wrote:
> Add Machine driver support for ALC5682I-VS codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add driver support for ALC5682I-VS
      commit: c5198db82d4c257d4d9fb9dc0db329482f3d08b9

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
