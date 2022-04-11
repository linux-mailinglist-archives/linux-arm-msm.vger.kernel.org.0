Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E23A4FC643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349976AbiDKVCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349983AbiDKVCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FF42A734
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3368B818C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EBE3C385A3;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=bfUF7T1oPeqTRQTSPbSaS6ZmacqAbh7DuxDQoATl3Fo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=plRb6Q4a4QhwpAH4CTzYtNOpxe/KR0mye9IPIQkZZzSk+Ouxj5Qeb9kaLRTWl8dfE
         J7ZF7KwNYZT1XVr50/x1TMStZuINHDFBzUJ/xqLfyNBpco9pUu1tfLHbREpgrW4vZP
         6u5voSMcIxsuGpEtMomJCs3VZ1A0ST2Kma6bN7f4iLFWpB0+jb+r6Ewp0oJnJ58Y6D
         YJUFyxCrQZ6MuxCVNuoR2K9/MGNqLDEOW+XF20PmPVOE+3KjbsvsPATfaqzaRFwsZg
         BHNE0/XhhcqcAiJJBKseyWEs1zVgLU/wuYnyWbo0NJYIajk9pKtWa1oP1edx4HPAj2
         2m5qaluLojPCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44CCBE8DD5E;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm PCIe Gen2 PHY
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081527.4542.849046632974596365.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220217040205.1898644-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220217040205.1898644-1-bjorn.andersson@linaro.org>
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

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed, 16 Feb 2022 20:02:05 -0800 you wrote:
> The Qualcomm QCS404 platform uses the PCIe Gen2 PHY, enable the driver
> for this to ensure that PCIe is functional.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: Enable Qualcomm PCIe Gen2 PHY
    https://git.kernel.org/qcom/c/b49ceddc4b19

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


