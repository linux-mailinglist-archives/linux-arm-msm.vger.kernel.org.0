Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE814D28C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiCIGLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiCIGLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D44D108546
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D6F061913
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05CD8C340F3;
        Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806219;
        bh=i3Mwl+sKRXrAEbwueMcN4Wt/xiYG2ZTuV70EXqx+2PA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Wn/4jGYZSDPhE2mLc2D6zcg89tJCdKXEIkN/WBVyfrnTBjE8EIo6fEYZVgMCvwQq9
         qqUGRfUtSBriyOdBril4R5lJhj+RDmIvWANbU8izmrz6pjrQe6rxzWJOGSf4zXvBRC
         GkJXP4jvzpviQzK3aqZX3SplwhbC9VFXZ0gbthuJ34EIiiFNZ4Oc+3kqUkDjVNBZ1f
         I20Dy1NUDrCNypn7dunly46QX+CXOh0TQ30neldi/elMFVLt2OQOm7UvdZobV3sbGs
         HR7zxmyRTWvP7yZbxCFQ6iK/AeYqV1Y10LhTzk2N4ocAX9Uk6qol0vzp/1An2eip0A
         YY7JK3P6Ybepg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DDECEF0383C;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] clk: qcom: Add display clock controller driver for
 SM6125
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621890.4478.7093340992411402919.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220303131812.302302-1-marijn.suijten@somainline.org>
In-Reply-To: <20220303131812.302302-1-marijn.suijten@somainline.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Thu,  3 Mar 2022 14:18:09 +0100 you wrote:
> Changes since v2:
> - dt-bindings: Use a sensible `&dsi1_phy 1` example clock for the
>   mandatory "dsi1_phy_pll_out_dsiclk", instead of a null phandle.
> 
> v2: https://lore.kernel.org/phone-devel/20220226200911.230030-1-marijn.suijten@somainline.org/
> 
> Changes since v1:
> - Documentation is dual-licensed;
> - Documentation example now uses zero-clock for dsi1_phy pixel clock;
> - SDX_GCC_65 is sorted in Kconfig/Makefile to easen adding this driver
>   in the correct alphabetic spot;
> - clk.h is replaced with clk-provider.h;
> - ahb, mdp and rot source clocks use rcg2_shared_ops instead of standard
>   ops;
> - Unnecessary line breaks are removed when remaining under 80 chars.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] clk: qcom: Fix sorting of SDX_GCC_65 in Makefile and Kconfig
    https://git.kernel.org/qcom/c/4f7788e55c60
  - [v3,2/3] dt-bindings: clock: add QCOM SM6125 display clock bindings
    https://git.kernel.org/qcom/c/912b5cdd6730
  - [v3,3/3] clk: qcom: Add display clock controller driver for SM6125
    https://git.kernel.org/qcom/c/d9d6a568b083

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


