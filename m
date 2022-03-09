Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F454D28BF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiCIGLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiCIGLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0957C10818B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 00597B81F48
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF934C36AE3;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=vvDFiqD8DXZ5III/AAXAtQYratSAnLj36Fc13mWgNw4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G0pAeuOEZxVh+nIlS5X/amtGYszWq/jHirj5yc2svU/rI+kSNUoX409i3eOcSQLzf
         BfM3m41OiN1y+dHDJr2stF/PUzNJwd4or+xZ9Ysw06Wu3vS28h66HAFgjdwzP9Rb7i
         gEqCGSaID0C2uMqGdxqpmiLinX70pXesITl4Np/PhV/Bq9V39/NiCmTonQSxpTr4zN
         cKqU6uOlECqs0hvac8LhH/vQrW/I6o/dFSgHZIH2V/3e0K36Dx87sA5Xlt6EASwvbc
         w5X8qFWOf3TOhY3ZTbvuWoaQSBYYj9l9ui/SWBMOFZfzKXjLcSv1Al48O4d9FHF7Rh
         hH1rsBy2rBERQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E47BF0383C;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 00/15] Multiple addition and improvement to ipq8064 gcc
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621864.4478.5803746388316247490.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220226135235.10051-1-ansuelsmth@gmail.com>
In-Reply-To: <20220226135235.10051-1-ansuelsmth@gmail.com>
To:     Ansuel Smith <ansuelsmth@gmail.com>
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

On Sat, 26 Feb 2022 14:52:20 +0100 you wrote:
> This is an attempt in making the ipq8064 SoC actually usable. Currently
> many feature are missing for this SoC and devs user off-the-tree patches
> to make it work (example patch for missing clock, patch for cpufreq
> driver, patch to add missing node in the dts)
> 
> I notice there was some work in modernizing the gcc driver for other
> qcom target but this wasn't done for ipq806x. This does exactly this, we
> drop any parent_names stuff and we switch to the parent_data way. We
> also drop the pxo and cxo source clk from gcc driver and we refer to the
> dts for it.
> 
> [...]

Here is the summary with links:
  - [v6,01/15] dt-bindings: clock: split qcom,gcc.yaml to common and specific schema
    https://git.kernel.org/qcom/c/a03965ed1310
  - [v6,02/15] dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation
    https://git.kernel.org/qcom/c/a469bf89a009
  - [v6,03/15] dt-bindings: clock: document qcom,gcc-ipq8064 binding
    https://git.kernel.org/qcom/c/85e125878b4a
  - [v6,04/15] clk: qcom: gcc-ipq806x: fix wrong naming for gcc_pxo_pll8_pll0
    https://git.kernel.org/qcom/c/e95e825333ed
  - [v6,05/15] clk: qcom: gcc-ipq806x: convert parent_names to parent_data
    https://git.kernel.org/qcom/c/cb02866f9a74
  - [v6,06/15] clk: qcom: gcc-ipq806x: use ARRAY_SIZE for num_parents
    https://git.kernel.org/qcom/c/a6aedd653213
  - [v6,07/15] clk: qcom: gcc-ipq806x: add additional freq nss cores
    https://git.kernel.org/qcom/c/512ea2edfe15
  - [v6,08/15] clk: qcom: gcc-ipq806x: add unusued flag for critical clock
    https://git.kernel.org/qcom/c/28aa450d38e5
  - [v6,09/15] clk: qcom: clk-rcg: add clk_rcg_floor_ops ops
    https://git.kernel.org/qcom/c/33958ad3fc02
  - [v6,10/15] clk: qcom: gcc-ipq806x: add additional freq for sdc table
    https://git.kernel.org/qcom/c/7e726f34c782
  - [v6,11/15] dt-bindings: clock: add ipq8064 ce5 clk define
    https://git.kernel.org/qcom/c/b565d66403e3
  - [v6,12/15] clk: qcom: gcc-ipq806x: add CryptoEngine clocks
    https://git.kernel.org/qcom/c/b293510f3961
  - [v6,13/15] dt-bindings: reset: add ipq8064 ce5 resets
    (no matching commit)
  - [v6,14/15] clk: qcom: gcc-ipq806x: add CryptoEngine resets
    https://git.kernel.org/qcom/c/4f865bdcb44f
  - [v6,15/15] ARM: dts: qcom: add syscon and cxo/pxo clock to gcc node for ipq8064
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


