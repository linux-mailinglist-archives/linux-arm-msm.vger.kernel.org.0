Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6185B51AC0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359861AbiEDSGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376260AbiEDSFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:05:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEB66C95B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:20:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 66EAAB82553
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3665CC385A4;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651684813;
        bh=v9VPJXa2XXa3nLHlstJi4Jxb8MVVMt7r1gK5dkouw7A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hXJE7MKQVkWkMJo4vsQ9ezYg1Wh1AzJvIEHaEW26BGafgTcYF6pwtuPLTHnhCCTf5
         U+8xLz5bPsQc6A1SSJr/p+etRH7AsFqCpDmeUGeXnSqj3Sg7fpPpEw+GP/rWQ42qQB
         byxuYdGXzj4e0d/WPcWt8frspQgZmLO3d7U3rKGl/w8LjqIzVng2Oiy+1bwrCOcz9i
         MZHL08iHvRWbd4ECIO4DhwHchzOQSw9ASGY+OKGqGBaiUAnwQFq6aM+PlNg3xSCw40
         ZlhaPH5PLWdd+hcxoL8kVCokxKchRIi2Ajl/aysU/8DDHeW9Le/VgqjF7jWfPhFcE3
         vRYQ5Z0vuyxeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F9CCE8DD77;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] ARM: dts: msm8974-FP2: Add support for touchscreen
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <165168481304.20209.10656271282624384976.git-patchwork-notify@kernel.org>
Date:   Wed, 04 May 2022 17:20:13 +0000
References: <20220421214243.352469-1-luca@z3ntu.xyz>
In-Reply-To: <20220421214243.352469-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Thu, 21 Apr 2022 23:42:41 +0200 you wrote:
> Configure the touchscreen found on the new display module of the FP2.
> To add some detail, FP2 has two different screen/touchscreen variants
> ("display module"), the old module has Synaptics touchscreen, the new
> one this Ilitek touchscreen.
> 
> We're only supporting the new display module for now.
> 
> [...]

Here is the summary with links:
  - [1/3] ARM: dts: msm8974-FP2: Add support for touchscreen
    https://git.kernel.org/qcom/c/88044abcde58
  - [2/3] ARM: dts: msm8974-FP2: Configure charger
    https://git.kernel.org/qcom/c/da281bf9345a
  - [3/3] ARM: dts: msm8974-FP2: Add supplies for remoteprocs
    https://git.kernel.org/qcom/c/fb5e339fb1bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


