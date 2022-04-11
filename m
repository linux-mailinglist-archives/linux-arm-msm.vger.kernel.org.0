Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 279D94FC739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 00:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239265AbiDKWCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 18:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350317AbiDKWC3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 18:02:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763E6D42
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 15:00:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 23DA6B815C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 22:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2C8CC385A5;
        Mon, 11 Apr 2022 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649714411;
        bh=aPtCPC4BldPUjhl5wyokU9+dEZAdPE6lW9D2+4V0Pdc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ldk9E+wgDZnCzuwRVEWhnWxB8m+HhBsywLmk1PccVp356h8ID1ynOj7R1YkvZf2Zg
         5LLZgcCFpgYALiaJv7w33dtbQTe73oHAD0ijjkormXAG4w7VY1HEY6CiN9rscc/nxj
         JE3aDSR1n/pxOaoOT4uw0be6fGBcUdz7s92m5zhVkpXSH2JBNmDp7jbP9dwmLuTPU+
         IY6H3cEGYn25Ww8n0Fvy2UM9jAMN6kkYhicmKNRhKLRSb0Ssa5T2v/1/c51fNrgBxZ
         jl6hiTejJtZwZ005fPOtUF4y46xfn1C+YSGyATQ5wu+Q/02mFoXNqnf59llbDtdlyq
         upCQ+tlCYyTTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C73D9E73CC8;
        Mon, 11 Apr 2022 22:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Simply SAR sensor enabling
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971441181.31261.14915644648989066345.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 22:00:11 +0000
References: <20220325211640.54228-1-swboyd@chromium.org>
In-Reply-To: <20220325211640.54228-1-swboyd@chromium.org>
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

On Fri, 25 Mar 2022 14:16:40 -0700 you wrote:
> The SAR node, ap_sar_sensor, needs to be enabled in addition to the i2c
> bus it resides on. Let's simplify this by leaving the sensor node
> enabled by default while leaving the i2c bus disabled by default. On
> boards that use the sensor, we already enable the i2c bus so we can
> simply remove the extra bit that enables the sar sensor node. This saves
> some lines but is otherwise a non-functional change.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180-trogdor: Simply SAR sensor enabling
    https://git.kernel.org/qcom/c/516ca27b6033

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


