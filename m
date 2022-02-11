Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFFA4B2B64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243619AbiBKRKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242360AbiBKRKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A72BD3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EF6F0B82B0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A081AC340ED;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=ispczcFp9C8dtKy8P35V2Q2YohZKl4+InCCWruQ6yNE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ihQ2l69X4/lBBS7U/Tq4BpmUqrWfwNUri5JkFf2pnUkpszBsWgEGLexrw8vrTsIsf
         DpV9ngc/N0vfEmm6COEowFwF8YqwXXRajyBqrI3wVjJvxozFZ/I5nsMpFsbTJzRKZA
         UUXk7I82u1df0foTInnf8AE1EZrEclb4mViK6QAc6BfcZJCtCIi2/X6P82ARGZkkd0
         wfnVfE+TrkLhLJz4aT2pFt2C7XBWQSNZHwI9duNBhaCCTGaq352ySkB8vsf7rpezfS
         fcB1YpaN5OIQqyYd0/1L04hNYAJmW+wEr2tn873zrhwWVW4Hfjmf2HBRAwvy7hZ8Ac
         DJLk6Ud4C2CRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C162E5D09D;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 01/16] clk: qcom: gpucc-sdm660: fix two clocks with
 parent_names
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941856.13057.9242876637878918488.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20211228045415.20543-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211228045415.20543-2-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, 28 Dec 2021 07:54:00 +0300 you wrote:
> Two clocks are still using parent_names, use parent_hws instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/clk/qcom/gpucc-sdm660.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - [v4,01/16] clk: qcom: gpucc-sdm660: fix two clocks with parent_names
    https://git.kernel.org/qcom/c/30ac9f356f50
  - [v4,02/16] clk: qcom: gpucc-sdm660: get rid of the test clock
    https://git.kernel.org/qcom/c/6985fdc0c80c
  - [v4,03/16] clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
    https://git.kernel.org/qcom/c/ba9b57dcac4f
  - [v4,04/16] clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
    https://git.kernel.org/qcom/c/3ca901712156
  - [v4,05/16] clk: qcom: camcc-sc7180: get rid of the test clock
    https://git.kernel.org/qcom/c/5d57a18f2569
  - [v4,06/16] clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
    https://git.kernel.org/qcom/c/f1697f36196e
  - [v4,07/16] clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
    https://git.kernel.org/qcom/c/cf4cd3dcb79a
  - [v4,08/16] clk: qcom: camcc-sdm845: get rid of the test clock
    https://git.kernel.org/qcom/c/6b7ef45f7aa9
  - [v4,09/16] clk: qcom: camcc-sdm845: move clock parent tables down
    https://git.kernel.org/qcom/c/b4e2d27ec748
  - [v4,10/16] clk: qcom: camcc-sdm845: convert to parent_hws/_data
    https://git.kernel.org/qcom/c/0cc3bd80610c
  - [v4,11/16] clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
    https://git.kernel.org/qcom/c/38d40dd3ed38
  - [v4,12/16] clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
    https://git.kernel.org/qcom/c/ed96df3d461e
  - [v4,13/16] clk: qcom: gcc-msm8996: drop unsupported clock sources
    https://git.kernel.org/qcom/c/b554a687b497
  - [v4,14/16] clk: qcom: gcc-msm8996: move clock parent tables down
    https://git.kernel.org/qcom/c/1a2789cff03c
  - [v4,15/16] clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names
    https://git.kernel.org/qcom/c/b3867679d460
  - [v4,16/16] clk: qcom: gcc-msm8996: start getting rid of xo clk
    https://git.kernel.org/qcom/c/fb4701307ce7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


