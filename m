Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DF94FF8F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 16:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235866AbiDMOcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235984AbiDMOco (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 10:32:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F8B41617
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 07:30:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08B29B824F6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2FE6C385A4;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649860220;
        bh=TtOWgaTNMPAvtcN+MOpDTZpJCb6PuParjClWvoD8jms=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LDGxNmv77t/YA4DIPdr9y0b5PTZlnqLh8JGee9GQ8OZzhLEfmYEu7qJV+E1HoYXDh
         b1SwlM6dMZ+AYimGMhzcKRH2OW4X16o36X7ktNGr9hj9fv/jCmpGelv704gXQVzesX
         b3FfkcFKwnM6/H+uXQv0SIITLa49kxmT5ruyReUF5OAsCT5Ob1JwYllhRGBaI4ngmJ
         ThnS5rcT+Ee6sGo+dXrH28dI4Nn3zEBj6R9LNlaQyXTVC6tD9HFxwdOaNvOgmlIIOr
         P2qumryeShL47kN9U/RgYorKLTEUPrqxmbIHJpqMK4OXHv2qpRB4QuzDruENfZrjZq
         Pc477CinwvneA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D10FE8DD5E;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] Add support for LPASS Core and Audio Clock for SC7280
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164986022057.5431.1494884054717989884.git-patchwork-notify@kernel.org>
Date:   Wed, 13 Apr 2022 14:30:20 +0000
References: <20220126081236.25255-1-tdas@codeaurora.org>
In-Reply-To: <20220126081236.25255-1-tdas@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
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

On Wed, 26 Jan 2022 13:42:34 +0530 you wrote:
> [v4]
>  * Cleanup header file inclusion in the clock controller files.
>  * Update the regmap_config max_registers in all clock controller
>    probes.
> 
> [v3]
>  * Fix 'pm_clk_suspend' expansion warning in lpass_audio_cc_sc7280_probe
>    and lpass_aon_cc_sc7280_probe.
>  * Update the vco table frequencies.
>  * Update 'regmap_config' name for all clock controllers.
>  * Fix the missing 'const' for clk_init_data.
>  * Update the binding for 'lpass_aon' CC.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
    https://git.kernel.org/qcom/c/4185b27b3bef
  - [v4,2/2] clk: qcom: lpass: Add support for LPASS clock controller for SC7280
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


