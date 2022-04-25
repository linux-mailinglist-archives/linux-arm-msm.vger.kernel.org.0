Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC5DC50E71F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 19:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240184AbiDYR21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 13:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243975AbiDYR1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 13:27:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CC040E7A
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 10:24:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B038DB81923
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB177C385AC;
        Mon, 25 Apr 2022 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650907463;
        bh=GC3QoMXgEgyYur5FYAOo7I1aMNJG9cmUPkaCoB8bjXQ=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=eXQr1o1R+HIG1dXQouie8PLA0dXW5Y2hnO6K+YgNIpi1fFjAevdwBSxWnNkaZEAim
         ADfrLQIMpEoqScHHS74BHDgDSl3SeKEghfoTZcM4/QtzjaXShO2EAu0I2vMkYWNu2R
         mmYu024AgzXMGlnhjCJXcQqYUyvDnP5yquYLUXOZTGBoYaiC45mmlN+yb+Qtudyu5B
         LBr1CyPFcq0jVzpxeVaNL3g7/KLRC4SAKzfAbYwIOKvoPh2r5pEDfcjfSJdyolV9sa
         hI+CyOULXC2SxT7e6UX2p1wN8W2nLCg7q1mIxbq2tCl/TsnignR+uIv+dp1rNThGc/
         v/70MlHFVzWwA==
From:   Mark Brown <broonie@kernel.org>
To:     judyhsiao@chromium.org
Cc:     dianders@chromium.org, srinivas.kandagatla@linaro.org,
        lgirdwood@gmail.com, alsa-devel@alsa-project.org,
        yuhsuan@chromium.org, perex@perex.cz, tiwai@suse.com,
        swboyd@chromium.org, judyhsiao@google.com, cychiang@google.com,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20220419062952.356017-1-judyhsiao@chromium.org>
References: <20220419062952.356017-1-judyhsiao@chromium.org>
Subject: Re: [v1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
Message-Id: <165090746068.583823.14672760866095847003.b4-ty@kernel.org>
Date:   Mon, 25 Apr 2022 18:24:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Apr 2022 14:29:52 +0800, Judy Hsiao wrote:
> Both MCLK and BCLK can be the clock source of sysclk via PLL
> according to its datasheet.
> This patch sets MCLK as the clock source as we use MCLK in the
> previous projects.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Use MCLK as RT5682I-VS sysclk source
      commit: 4d9596d42152bfd4a57cc317acf9cd0b90769033

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
