Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432004C370F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233891AbiBXUuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbiBXUup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:50:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71CA269A8F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:50:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66FFC618D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 20:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C87CEC340E9;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645735813;
        bh=orkDrOIHP6rEi1FcnGqhju/qttSTVXA7HUNUsXiWPL8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rK5FU6e4tR9WAoLwqnV1oh8o8f2OS1xbhFIV+6Q+102cgvmhzxrX46T6fbZhXgyIs
         Mj0HEddFyzlmUWVpJ6RKGyCFIr2vmpa7DStEV36GKYP4g0DeDMKULEvc+5XEVWzy+a
         VUqR85tQkyDEwf7MQrQgPqIUGNG0PjRqT1KtlzTMxXU57WgeLEC5f6XeDPlA/lEggD
         HK0BZQfA1PSkIqYAQbG0+LyC6+/42zLtaB+OAGgshQ1mRVyL98bMAy+GC85BsmmRrr
         +++tK6He4JPPRnE4C6gkR7VKvZkAuwBHu1Ot14Mi3s1nrBPVsQ1crzGgDvQtmdLHOO
         uDQzteOr9uSsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD20BEAC081;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/10] Initial MSM8953 & Fairphone 3 support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164573581370.20860.13865460627585693325.git-patchwork-notify@kernel.org>
Date:   Thu, 24 Feb 2022 20:50:13 +0000
References: <20220220201909.445468-1-luca@z3ntu.xyz>
In-Reply-To: <20220220201909.445468-1-luca@z3ntu.xyz>
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

On Sun, 20 Feb 2022 21:18:53 +0100 you wrote:
> This series adds initial support for MSM8953 (and SDM632 which is based
> on MSM8953) and the Fairphone 3 smartphone.
> 
> Only relatively basic functionality is supported like storage, volume
> keys and USB.
> 
> There is currently close-to-mainline support for other components for
> this SoC including GPU, WiFi and audio, this series adds only basic
> support so that the other components can start getting upstreamed
> easier.
> 
> [...]

Here is the summary with links:
  - [v2,01/10] dt-bindings: mfd: qcom,tcsr: Document msm8953 compatible
    (no matching commit)
  - [v2,02/10] dt-bindings: thermal: tsens: Add msm8953 compatible
    (no matching commit)
  - [v2,03/10] dt-bindings: usb: qcom,dwc3: Add msm8953 compatible
    (no matching commit)
  - [v2,04/10] dt-bindings: arm: cpus: Add Kryo 250 CPUs
    (no matching commit)
  - [v2,05/10] rpmsg: smd: allow opening rpm_requests even if already opened
    (no matching commit)
  - [v2,06/10] arm64: dts: qcom: Add MSM8953 device tree
    https://git.kernel.org/qcom/c/9fb08c801923
  - [v2,07/10] arm64: dts: qcom: Add PM8953 PMIC
    https://git.kernel.org/qcom/c/06ea71e42975
  - [v2,08/10] arm64: dts: qcom: Add SDM632 device tree
    https://git.kernel.org/qcom/c/24af02271ca7
  - [v2,09/10] dt-bindings: arm: qcom: Document sdm632 and fairphone,fp3 board
    https://git.kernel.org/qcom/c/cb898d5e59b4
  - [v2,10/10] arm64: dts: qcom: sdm632: Add device tree for Fairphone 3
    https://git.kernel.org/qcom/c/308b26cddb04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


