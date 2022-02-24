Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24004C3710
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234425AbiBXUur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234426AbiBXUur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:50:47 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9CA269A8F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:50:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id ADD62CE20E5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D29EFC36AE2;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645735813;
        bh=+IapzCvE+pAdmFPLIftAs6a5ET8NAlOm7e/PDL45WZQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ep2UNNK1nSnOVSTUYqaMeF6FzM9S3DzGwZLm5tbss96PbOMtaiHHyphv22I7EO2Tm
         gj4+/KD/QZgIHcvsOjhlku+RqYpUNDGek8jZ+WxGmcNBr/qiLLLq1Yt58nWCqayTqv
         WdU/5b1zwm+WiiVnTyMfovyp+5Vt/VeKAO1zx/vPsKQIn3xxEvx8L+JyPcJf37yqsY
         8J8xSJWFmp1lEEOdafSZ8hX90ibWyJqqhyhCPkd0f0LRFn92e9C74QQt6qM0OrVk1R
         MrsnkJZjzVrrva/d+brdsbFxgM2jckyTElPAtdZURozfB7yCsLdoXOHF7s3ZEe27dI
         kg+XhNlh9xFmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B93ECE6D3DE;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8150: Add light and
 proximity sensor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164573581375.20860.15189102432087748892.git-patchwork-notify@kernel.org>
Date:   Thu, 24 Feb 2022 20:50:13 +0000
References: <20220219145140.84712-1-nikita@trvn.ru>
In-Reply-To: <20220219145140.84712-1-nikita@trvn.ru>
To:     Nikita Travkin <nikita@trvn.ru>
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

On Sat, 19 Feb 2022 19:51:40 +0500 you wrote:
> L8150 uses LTR559 as a light and proximity sensor. Add it to the
> devicetree.
> 
> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: msm8916-longcheer-l8150: Add light and proximity sensor
    https://git.kernel.org/qcom/c/3016af34ef8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


