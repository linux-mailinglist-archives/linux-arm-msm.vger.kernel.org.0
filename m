Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B9F51413D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 06:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237225AbiD2EXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 00:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237206AbiD2EXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 00:23:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB36BF7C
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 21:20:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 912856223E
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 04:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC563C385A4;
        Fri, 29 Apr 2022 04:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651206012;
        bh=qbVHVWcdprLRsUP4HEWxRoEqPdq726jfJi/fxAOdhQY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RpMGGoy3qiyGvE8hA//oR003szdSYle6vJ0e0n6wSFkmfdo8jPAzyFCCGHv1bwJMq
         Ax7SECEc0kcdzfuyn8b28HlDuQUulJ6Ov+hN9aw3+kn6RDz8a5lxEttJF0V0w9V5w0
         Su6xeIiotFC/+RP9sjeG4wyDl6bUShnq3yfr02mH6Ezro1Pu5XStVfoD5jx4MNqzHg
         /p1LZZXfNZAoGhmaY7zdEDJ8QOYNOjZ0gN/e6v5v3ytCulnr9XQzt9l8ekL2wp9Io1
         sG3oSPGmM1Sll8Yy1AP6SW0loEE9nDB099RUQeRrT0NDnUBo4OPYuIUXBg7XxDCD9a
         up2lyxZ7DSyHA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF4F4F67CA0;
        Fri, 29 Apr 2022 04:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: smd: Update MSM8976 RPM clocks.
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <165120601184.19961.14294365940575873800.git-patchwork-notify@kernel.org>
Date:   Fri, 29 Apr 2022 04:20:11 +0000
References: <20220426090226.27293-1-a39.skl@gmail.com>
In-Reply-To: <20220426090226.27293-1-a39.skl@gmail.com>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue, 26 Apr 2022 11:02:17 +0200 you wrote:
> MSM8976 does not have rpm clock named mmssnoc,
> instead it's called sysmmnoc, drop define and reuse.
> While we are at it add XO clock to list.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - clk: qcom: smd: Update MSM8976 RPM clocks.
    https://git.kernel.org/qcom/c/665ca429bc41

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


