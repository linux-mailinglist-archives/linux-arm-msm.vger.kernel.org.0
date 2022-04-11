Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4695D4FC63D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349953AbiDKVCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349976AbiDKVCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF07F2A730
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B52BB817AA
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EF6BC385AD;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=b7tj8l69fgn74gD92hB8VCO/o0uwhHGjjK7tTHKnnXQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H7RUb8WlBb0smO/LN7fW87eC1DCqucLKJT/b66KHPektHknfuQJ12W0v/m3Q+cV4u
         FytD7JVIVQxJbDD9EAJZgvF3c7jvvFCAgTBVrPzD3DjSQWKAZXnacb7wQVeus7Ep/S
         01q/hcaXuKIWxh8olDqhqH9K1UB4BTU8/PcOQy2vG9lznMl+6nmbeprKasMzJ8uRCg
         UcAjGdIxmeiBhc9S0ql9XJxFBmcKtk7Dfw7Jm0zb6FRCZV2XX5Y9fTvRFibmZccZUe
         DS3yYQoZWdSIHY4cQBXFPiR5yMZ7LZj1nu30wbxcmsiERFbCz6Gjcn6VjQgCzlxqkl
         CNXuvpO7fzP6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32116E7399B;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081520.4542.651748009010283485.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220324223331.876199-1-swboyd@chromium.org>
In-Reply-To: <20220324223331.876199-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 24 Mar 2022 15:33:31 -0700 you wrote:
> This node should be named sar1-irq-odl, not sar0-irq-odl. Otherwise
> we'll overwrite the settings for sar0 with what is intended for sar1,
> leading to probe failures for sar1 that are quite confusing.
> 
> Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name
    https://git.kernel.org/qcom/c/f31c834d3976

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


