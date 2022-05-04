Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6C4351AC0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359870AbiEDSGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354203AbiEDSFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:05:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320F225D
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:20:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91B23B8279D
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53EBBC385AF;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651684813;
        bh=+CPOxCK0fNe3vDkHh+1y+2H8QyDH8WSWNdrw3qLi0Bc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J1zL7wK8svgBX/RByxg6unt64oQNAOjFLIS4V6xcTpNkmZPNnVZdsS4IvB2DAGfp4
         c3fjx5199SwLQXSwt0U0Rq+3Jx46aGOzOSaWaQOAggsYiWnubYDWfB34lBqlpXeSMQ
         oUmr5lI0aSgQLWF1kFWbl1dGPg4POjB0cZnav65rlj9pjCPiyLB21exVAv/vw3obQR
         gOsRyOx68vxHTIZx8EpcSnPF4ZXJUUoRI7Pl3W267Kzbu/K07ABbweEhBO9ZDMv1eY
         O72ASufaaV8kmHc2e71SZi6T1ZH9O9/ls4PaQH9O2M97Hgt82Y8LC9zLnr3yqdBMU/
         tL8b2JgYpaOcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 290B3F03847;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Add another ID for sc7180
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <165168481316.20209.10352267699404882613.git-patchwork-notify@kernel.org>
Date:   Wed, 04 May 2022 17:20:13 +0000
References: <20220502173338.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
In-Reply-To: <20220502173338.1.I26eca1856f99e6160d30de6d50ecab60e6226354@changeid>
To:     Doug Anderson <dianders@chromium.org>
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

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Mon,  2 May 2022 17:33:45 -0700 you wrote:
> It appears the some sc7180 devices, like the one in my
> sc7180-trogdor-homestar, report an ID of 407 instead of 425. Add
> another ID into the list.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> [...]

Here is the summary with links:
  - soc: qcom: socinfo: Add another ID for sc7180
    https://git.kernel.org/qcom/c/c35886d60560

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


