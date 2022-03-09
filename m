Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E1F4D28C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiCIGLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiCIGLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B2B1081A3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73A1761920
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5794C36AE9;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=V1WlRoWFD65XIldWgc2osgVf1bU/XkbmC3TXjVmj1O4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dWbSHCkWYOtnKo1JwCEIlrR0I0F6RDbwZ8LUu12Solir0Yr7WaZc22aqS5sQo8bvr
         EXzXY6xOVxf85Z72eZ3sZbWS9dj7xkjZdX0cUjrEtvDFUDHMarzu3gB7sJmhVsWm66
         vsIq3uazkQNJ51bZ15k9LhwSxMaSsi/hGjzHZeemVFxXXk2HtBua0h4ftPp/72ecl8
         yJT911hWlQir54CReazAlcXDIM5nki2nCOkNFp9cL44AYKexLpdBNAOIwUSrg6CJRv
         jf0qN1B0sSBwQxlCCT5mjs4lm+vcLMg4YmVGQU10Ao4gVZk3FqntEsbflukb7cXm4B
         M8Wlh30eOp6pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B9732F0383D;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add sc8280xp to the RPMh clock
 controller binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621875.4478.7208010141545159762.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220223044516.3776637-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220223044516.3776637-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Tue, 22 Feb 2022 20:45:15 -0800 you wrote:
> The Qualcomm SC8280XP has a RPMh clock controller, so add a compatible
> for this to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: clock: Add sc8280xp to the RPMh clock controller binding
    https://git.kernel.org/qcom/c/8b6167a90135
  - [2/2] clk: qcom: rpmhcc: add sc8280xp support to the RPMh clock controller
    https://git.kernel.org/qcom/c/809b48289674

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


