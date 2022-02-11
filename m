Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA4544B2B65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241138AbiBKRKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245027AbiBKRKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2F4BD6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DDA2B82AF0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8A78C340F4;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=dHUza6XkyNn2HDmSIvAFQG8TRs/JXz35arBl9O+xVVU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TQY/+B3TNpsXySdeUDRfEdXIQm/6wWS47at/GPQOsmWLI5obum77zyhUNUT1lM36V
         Q2sp+4jWvhG/OgRrRUrF9R1DVfAmbS1XQavxkgAw96YQ2vIie4ZZCvYu0sUXZvHUzE
         tUu1kOqv7WNkfD4MP94jbdsrcOiOQQyIXgPWoHFs/OKYdm5wbt1rMtky3wKLcY3zzR
         JHLlKJLDNy+qnb4Rgbrlc6/23RE+EnOnXeO7t/YFNFzhRrohoqOt4OEliIb5nP4PKx
         EEAtJPdkbMGeg6VBUVY7lwIQFskBk2Y4xiPhVwQRrBhloiG5lem3TiBcRmkhRdeM51
         clfXfpT2jN8Uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6540E6BBD2;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8450: add interconnect nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941880.13057.2091405125402021313.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220203002936.3009402-1-vkoul@kernel.org>
In-Reply-To: <20220203002936.3009402-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
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

On Thu,  3 Feb 2022 05:59:36 +0530 you wrote:
> And the various interconnect nodes found in SM8450 SoC and use it for
> UFS controller.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> 
> Changes in v2:
> 	- Fix the mc_virt node
> 	- Add clk_virt node
> 	- Rebase to rc1
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: sm8450: add interconnect nodes
    https://git.kernel.org/qcom/c/aa2d0bf04a3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


