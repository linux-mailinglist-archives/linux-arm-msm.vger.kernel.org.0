Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42904D28C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiCIGLV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiCIGLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A91110854F
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EAE1BB81F6A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABC71C340E8;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=R0hIdwp2ZkSGoDcuU73K9DFOOoKTOQk+en7BybowIdQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KK5cn3VNdT2xhxOQlN9PLzrz/RgotxgPPiAcNjDpnCnWkG1ETpYzovXTGsUfu0ks8
         WhmtulgcOdYwBYTEDgJcFTxjIkft2nTVq22+fiZs7+l8OkNx0OynEx8b0HgN90eAlw
         VvzGET7wDmdiNiTELlD7PG23AKTVa0QyrMypyoPbcWJ51vftQPyzVyIVkfyNYNGLGD
         nWry1NdrsXdHVzkbeWmZuQO2ey5k3qsZ0dwXDoAwu+K7FOQ5YDa+9ehs/aRVYwbpDg
         O8o0tkgRSpy0lq8ve1hBPe5fhbd3BEgo6q5pN+xAS/NzcjQ4zpbLr1DEfG8JArU1rT
         448QXtW9mXMlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B258F0383A;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] dt-bindings: clock: add QCOM SM6350 display clock
 bindings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621855.4478.3479473198543594370.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220222011534.3502-1-konrad.dybcio@somainline.org>
In-Reply-To: <20220222011534.3502-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Tue, 22 Feb 2022 02:15:28 +0100 you wrote:
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM6350 SoC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm6350.yaml    | 86 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm6350.h    | 48 +++++++++++
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6350.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6350.h

Here is the summary with links:
  - [1/4] dt-bindings: clock: add QCOM SM6350 display clock bindings
    https://git.kernel.org/qcom/c/6914b82f3721
  - [2/4] clk: qcom: Add display clock controller driver for SM6350
    https://git.kernel.org/qcom/c/837519775f1d
  - [3/4] dt-bindings: clock: add SM6350 QCOM Graphics clock bindings
    https://git.kernel.org/qcom/c/7b91b9d8cc6c
  - [4/4] clk: qcom: Add GPU clock controller driver for SM6350
    https://git.kernel.org/qcom/c/013804a727a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


