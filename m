Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE1BF4D28BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbiCIGLT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiCIGLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EAA10818B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53A6361919
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5851C36AE2;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=nt0LDdpIpNGnUk02sis/UqtgwtC8oeU2aUhEuNmTyUw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o3XLQycFGyajkLy6zENQzdCaFln7bk+htlhor851dl4YoHJ9mapYDey1+m+M/5P4m
         flnDvJZojMCzZ8qPEQTVd6UhuX2lo8b7XAz6AMySDP6GOzKXdz2+Es6j3A6Yq7Jt00
         1QEfk+E6rIT7pF6EJEQkvsOywjNd7h9LjZLZCoeolVdFRwpgeN13nZN+fN4VKoBEmK
         XrXhL907c6UwrLpdECrjsNGEnMVeA7svhrE+FZp6ve2O93v/oYdXOXSWPAK/kqG8ND
         ivXIz1afx6XLT/FYwvn+seqgW2goBQyj0PAUgFy+pqMfC/cHvt3A7H5ZgPd9vJ/78N
         cDSJdi3Ldu75A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94CC2E73C2D;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v3 1/2] clk: qcom: clk-rcg2: Update logic to calculate D value for
 RCG
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621860.4478.16616258277235999500.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220227175536.3131-1-tdas@codeaurora.org>
In-Reply-To: <20220227175536.3131-1-tdas@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
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

On Sun, 27 Feb 2022 23:25:35 +0530 you wrote:
> The display pixel clock has a requirement on certain newer platforms to
> support M/N as (2/3) and the final D value calculated results in
> underflow errors.
> As the current implementation does not check for D value is within
> the accepted range for a given M & N value. Update the logic to
> calculate the final D value based on the range.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
    https://git.kernel.org/qcom/c/3857b7b03eb5
  - [v3,2/2] clk: qcom: clk-rcg2: Update the frac table for pixel clock
    https://git.kernel.org/qcom/c/170961200c69

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


