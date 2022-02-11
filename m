Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6C64B2B5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238888AbiBKRKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbiBKRKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CC42E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 617EC61ADE
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47BCC340E9;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=8IFrt+pP/U0EDY4w+heYG3JTkgaEAvtegdC3FqmwPiU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hi5DKtukCmiV/lHXoDOYtOZMDEvdPo6K1oyS7pPgJ4PbmFyAzAbLNV+MefDmxRdUp
         IRDCK6FPma3H9f6s0/ZIJpwrzaO9Pu/OMNcXbjE2jpUL1+mIkZTvu6Zk4SM3oOFO8f
         lahjrhVU2rbuJ6/4ruRT3sISgvDqEOU2ICtn4tnJ88XhWQarMsN1YBgVlEK79O4ioG
         bA5ag9hTiFJ8yBTCmKo+cfuyqDVqAadqAWt5b+1vdxT8V1ES5zJO7vU18xSZ5heFvf
         Q5Zjd5V4kOsjh1XRtQdjKTPN3QnC1JDhd+R9AVSId/VZpYh1kssOW9ztwS3hWrc6uz
         aBDZRLT36tcVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1989E5CF96;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] MSM8226 Multimedia Clock Controller
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941872.13057.6537892608455536727.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
In-Reply-To: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
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

On Mon,  7 Feb 2022 19:54:09 +0100 you wrote:
> Implement the MSM8226 MMCC on the top of existing MSM8974 driver.
> 
> version 2 changes:
> -replace `of_match_device()` with `of_device_get_match_data()`
> 
> Bartosz Dudziak (2):
>   dt-bindings: clock: Add support for the MSM8226 mmcc
>   clk: qcom: Add MSM8226 Multimedia Clock Controller support
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: clock: Add support for the MSM8226 mmcc
    https://git.kernel.org/qcom/c/ef36263aa03b
  - [v2,2/2] clk: qcom: Add MSM8226 Multimedia Clock Controller support
    https://git.kernel.org/qcom/c/e6db8c8be7ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


