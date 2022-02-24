Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18F04C3712
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:50:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiBXUuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233891AbiBXUup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:50:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5734277930
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:50:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FE50618EB
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 20:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBD14C340F1;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645735813;
        bh=zr9E9ssD5brw+nuxYtZqWsrIVMVF09LHt1z02ih3I7M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GI11wp9x8Wm7J50WPAr6t+jYhahaNnhAAz33DGBIYMBMxTEi/Q0BxYIAf1Xzxk2Lh
         1yHOUnstQFH8QvwmOD10WRndjJqDIakC3nHqpB5KYvku4/OnwOE6ojaM7U+efq9IEd
         wq12vj6NPsXJj/xUJLWtNpZl5Y0Q+c+GK2Bga77IqTjHd8TNOzKPCfWM3Z4f9BquBy
         UEDVvOZVIOCPBaoYq1OnGzPJnO2QN4Z3r/46hKR/JFBYWPpBUXEncnUqzymj5EtmWH
         GXDG0yRrhVb89iU2J5Sdzz/reSUQMMfysH3elTTTPKgoYIZclA5Gn0UFSKrE4NFiUQ
         ktAEg2IwzuRog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF22DEAC09C;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] dt-bindings: power: rpmpd: Add MSM8226 to rpmpd binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164573581371.20860.7193275477399025068.git-patchwork-notify@kernel.org>
Date:   Thu, 24 Feb 2022 20:50:13 +0000
References: <20220220223004.507739-1-luca@z3ntu.xyz>
In-Reply-To: <20220220223004.507739-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
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

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Sun, 20 Feb 2022 23:30:01 +0100 you wrote:
> Add compatible and constants for the power domains exposed by the
> MSM8226 RPM.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 5 +++++
>  2 files changed, 6 insertions(+)

Here is the summary with links:
  - [1/3] dt-bindings: power: rpmpd: Add MSM8226 to rpmpd binding
    (no matching commit)
  - [2/3] soc: qcom: rpmpd: Add MSM8226 support
    https://git.kernel.org/qcom/c/20f36361b7dd
  - [3/3] ARM: dts: qcom: msm8226: add power domains
    https://git.kernel.org/qcom/c/134553625187

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


