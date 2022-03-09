Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1867E4D28B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiCIGLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiCIGLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1A21081A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2BE0B81F8E
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2E58C36AEC;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=Osm9r58GW8ImjG9Wj2j/mrZOeBvkGuBbe+KMfJBM9Qo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kIQrjT2sK410T+KtX/UCCn0QggOS9UfGwCgy4DPaXov1QNMBA9um+DXKWpenBBKqP
         e9804UHuqm77BpGSIlGG85tFJPs2py9sfQgHgK4ODvdumHZs54VieLuGayi+BDYSHr
         Mq9G44gs+28OVfm0eUi7+rCoBGohvwSKhH+ndHc3RZD4uy/6K2nuNpHUfSXGy/uiN2
         kT8TgxyJyGgefMDnhWLvZ8QQfqaZuXF4TaHmX3sejVQeK1I54uIsNHv+cR8mvyP1Qs
         py2zy8Atg1jkJwmQf91NsXTOO7JORsLHsNR2xkTW08wt4XOUEkDszg8DtMHKOlQGRB
         wG/Qp7GOZQ4ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBDAFF0383A;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/7] Add PCIe support for SM8150 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621882.4478.11946329226561941857.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220302203045.184500-1-bhupesh.sharma@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
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

On Thu,  3 Mar 2022 02:00:38 +0530 you wrote:
> Changes since v2:
> -----------------
> - v2 can be found here: https://lore.kernel.org/linux-arm-msm/20220301072511.117818-1-bhupesh.sharma@linaro.org/T/
> - Fixed review comments from Dmitry and Bjorn.
> - Modified [PATCH 3/7] from v1 to include gdsc driver structs and
>   support code for PCIe0 and PCIe1 (in addition to defines for the
>   same).
> 
> [...]

Here is the summary with links:
  - [v3,1/7] dt-bindings: pci: qcom: Document PCIe bindings for SM8150 SoC
    (no matching commit)
  - [v3,2/7] dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
    (no matching commit)
  - [v3,3/7] clk: qcom: gcc: Add PCIe0 and PCIe1 GDSC for SM8150
    https://git.kernel.org/qcom/c/8bd02d087e6c
  - [v3,4/7] phy: qcom-qmp: Add SM8150 PCIe QMP PHYs
    (no matching commit)
  - [v3,5/7] PCI: qcom: Add SM8150 SoC support
    (no matching commit)
  - [v3,6/7] arm64: dts: qcom: sm8150: Add PCIe nodes
    (no matching commit)
  - [v3,7/7] arm64: dts: qcom: sa8155: Enable PCIe nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


