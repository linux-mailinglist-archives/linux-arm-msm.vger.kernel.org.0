Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE6784FF8F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 16:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiDMOcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 10:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235866AbiDMOcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 10:32:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF344160A
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 07:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6285361C0C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C045DC385A8;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649860220;
        bh=n8SDngpkfZAsBoILm8n5WhBh265AqdwxCEoxSO1aWTo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bU1YpC9J3YkvjzpWAX/IeLmUriCF484tA3X4nqvMxLd2gea1+94UDN5xkDtHMpsU5
         Yw+5UiC2Z/6C8/nibBovowSNv1yPBUHt5eSwiNEVjlDGQNg/07ryEplUEYrYT+C6ti
         c+hiie5l+X/VIYNEYrYwcxmkdh39bFJGZLN8SoP2Ll2bDsDFtamG5xDv268S2gcvoN
         cqjacVTBs0XA4p5vRQMUjKLtqzyPls7fee9xIMle9t6DnjQYphJDDJzSFlZNFvSFlI
         95ruUDxank1iDSgsxLHaPtkyXAx5ReLvYy2WaR0ED3TJhGSgC++7iymdmxCYRZ/6mR
         fg2iXPavu80FA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9DA08E8DD69;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/5] PCI: qcom: rework pipe_clk/pipe_clk_src handling
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164986022064.5431.6951097451871658645.git-patchwork-notify@kernel.org>
Date:   Wed, 13 Apr 2022 14:30:20 +0000
References: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220412193839.2545814-1-dmitry.baryshkov@linaro.org>
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

On Tue, 12 Apr 2022 22:38:34 +0300 you wrote:
> PCIe pipe clk (and some other clocks) must be parked to the "safe"
> source (bi_tcxo) when corresponding GDSC is turned off and on again.
> Currently this is handcoded in the PCIe driver by reparenting the
> gcc_pipe_N_clk_src clock.
> 
> Instead of doing it manually, follow the approach used by
> clk_rcg2_shared_ops and implement this parking in the enable() and
> disable() clock operations for respective pipe clocks.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] clk: qcom: regmap-mux: add pipe clk implementation
    https://git.kernel.org/qcom/c/e9a4c7f667ed
  - [v2,2/5] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
    https://git.kernel.org/qcom/c/fa5ad5c51706
  - [v2,3/5] clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
    https://git.kernel.org/qcom/c/a9ed9e2bf794
  - [v2,4/5] PCI: qcom: Remove unnecessary pipe_clk handling
    (no matching commit)
  - [v2,5/5] PCI: qcom: Drop manual pipe_clk_src handling
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


