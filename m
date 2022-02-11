Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9A504B2B67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245005AbiBKRKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245075AbiBKRKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E39C2E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B20B8B82B22
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9B3BC340F6;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=EtOuC5Snyhs34pbmMnb+L6v4YQ7L26rdSaknJz/I4AU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L2EpzV7cTjbwISAgSa5YKaBSUqpnZ9DrjEmbIk5BPjdxOmqwV39xVuKcg70462n11
         aATqauqOeLjaOwOGbwVSPrxY9WbjMWRTXIJx7cuGeyhIK01WA4EYGHpRgwXQWrlqK+
         HztaavGbqlzhC8iqRXecyt3n+O3IHaw4D4o1tWe0XJmb3ImZQPCTQI9XK0dGgqCw7x
         zN325wr5y3bYr57u0AaiRyR4ww9qfBo4uoo6+n9hioiGz7FlWHvmDajT2yL4xta4oi
         mQzH/AOw13+Ag5QFBCJFTRPXuowjdXjKBNeUHfJsL+fHueMSoCzAmAz4k8dA0mGck+
         jOqQQMb5KX1Fg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8BDEE6D45A;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: qcom: c630: Add backlight controller
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941888.13057.12278811936597086121.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220208041606.144039-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220208041606.144039-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Mon,  7 Feb 2022 22:16:05 -0600 you wrote:
> The Lenovo Yoga C630 uses the PWM controller in the TI SN65DSI86 bridge
> chip to provide a signal for the backlight control and has TLMM GPIO 11
> attached to some regulator that drives the backlight.
> 
> Unfortunately the regulator attached to this gpio is also powering the
> camera, so turning off backlight result in the detachment of the camera
> as well.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: c630: Add backlight controller
    https://git.kernel.org/qcom/c/a28106a2734f
  - [2/2] arm64: dts: qcom: c630: Move panel to aux-bus
    https://git.kernel.org/qcom/c/ff899133fdae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


