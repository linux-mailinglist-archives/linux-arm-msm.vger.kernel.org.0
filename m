Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F8C4AA2AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244968AbiBDWAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245177AbiBDWAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:00:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3113C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:00:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 99893B836EA
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3294FC340ED;
        Fri,  4 Feb 2022 22:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644012010;
        bh=y/09lmM1btvIzTaylruUgYyoelcvJV75jng8eVaPIu0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=i/wjvBojN/EdkqNOZ2aVTJfsymxGEsbcOVxBY6d6u/WfH3jMKq5Zehfrhe0d1Ydqu
         2ao9mYnaAieWw46Ly+wiHUDRXBLxu/gBhtFBdUEmqWCMXsdvAq9bxUZkdb3odrkJLA
         yBjxEmqA/o00JzFZ3SkZKJJovwkizBUYfsudgZSVDe/6iveTSdwZQ0Gtw8Y7Xfrwur
         DYlt4Vgp6Bz1jA4C0uIaRpKfR+BjIQFbL+eFAV7Cbq1oNpiWWDZaBnQOequLGRV1OL
         PYwCUtL3zsJjgStYHh0FvZksjQpCZq/A2/gUypqwcLIw7+BZ1tuwnles84mfOhzzT9
         aUzsysk2HsoyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10D00C6D4EA;
        Fri,  4 Feb 2022 22:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] arm64: dts: qcom: sc7x80: A smattering of misc dts
 cleanups
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164401201006.7476.14495606117955806004.git-patchwork-notify@kernel.org>
Date:   Fri, 04 Feb 2022 22:00:10 +0000
References: <20220201001042.3724523-1-dianders@chromium.org>
In-Reply-To: <20220201001042.3724523-1-dianders@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Mon, 31 Jan 2022 16:10:37 -0800 you wrote:
> There's nothing really holding this series together except that it
> fixes a smattering of random dts stuff that I noticed recently. There
> are no real dependencies other than the second "sdc" change depends on
> the first.
> 
> Hopefully these look OK and can be applied quickly to avoid conflicts
> with other work going on.
> 
> [...]

Here is the summary with links:
  - [1/5] arm64: dts: qcom: sc7180-trogdor: Add "-regulator" suffix to pp3300_hub
    https://git.kernel.org/qcom/c/171bac46700f
  - [2/5] arm64: dts: qcom: sc7280-herobrine: Consistently add "-regulator" suffix
    https://git.kernel.org/qcom/c/7a86ac040565
  - [3/5] arm64: dts: qcom: sc7280: Properly sort sdc pinctrl lines
    https://git.kernel.org/qcom/c/b1969bc52218
  - [4/5] arm64: dts: qcom: sc7280: Clean up sdc1 / sdc2 pinctrl
    (no matching commit)
  - [5/5] arm64: dts: qcom: sc7280-idp: No need for "input-enable" on sw_ctrl
    https://git.kernel.org/qcom/c/8fdedd6c6464

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


