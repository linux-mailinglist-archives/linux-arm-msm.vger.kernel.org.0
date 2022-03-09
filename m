Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7812B4D28B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiCIGLU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiCIGLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537FF1081A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E630E6191C
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA3D6C36AEB;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=iNaKSCgPnFsLrpcp4AgjlID6TL5OcBTt6QNQRVYapB4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Dicy3lfe0IqZstll7eCqiKYGc0mSLY4hkGQfxcpcIl4HXoxQwjqKJIfAdmVhJCXdK
         FVu7xdIrFI+3Gez1gt/22N6GL1PiiD4iiTSeUHqStUMlfBKZHlpEDEgxr66bij4cfO
         71b11EBk5nsTLs7kiY8FTKLRO46N9wnYfLoQ4G9MtvfqpHt8AY0SRNkPEzBo7OQ4y5
         BS9/BAiWkOHqmOnnvW+5ORmdMG+ypKIKqjwBCmG1/rqWk3Gkd2e2t0YEPci5eSCwps
         6izIk2N3B/tKoV6RiMQS/whlbDweEsHh4KG2NowvwocgEa7f06yJ1x6bGLJ0PPnSho
         JVRgm5SpIhZig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1C51E8DD5B;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/6] Add ethernet support for Qualcomm SA8155p-ADP board
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621879.4478.16186213612647351702.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
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

On Thu,  3 Mar 2022 14:18:18 +0530 you wrote:
> Changes since v2:
> -----------------
> - v2 can be seen here: https://lore.kernel.org/linux-arm-msm/20220302110508.69053-1-bhupesh.sharma@linaro.org/T
> - Fixed review comments from Dmitry - created a new [PATCH 2/6]
>   to fix some identation issues with sm8150 gcc driver.
> 
> Changes since v1:
> 
> [...]

Here is the summary with links:
  - [v3,1/6] dt-bindings: net: qcom,ethqos: Document SM8150 SoC compatible
    (no matching commit)
  - [v3,2/6] clk: qcom: gcc: sm8150: Fix some identation issues
    https://git.kernel.org/qcom/c/429a1e464c52
  - [v3,3/6] clk: qcom: gcc: Add emac GDSC support for SM8150
    https://git.kernel.org/qcom/c/d8b180fb3dcf
  - [v3,4/6] clk: qcom: gcc-sm8150: Use ALWAYS_ON flag as a workaround for emac gdsc
    (no matching commit)
  - [v3,5/6] arm64: dts: qcom: sm8150: add ethernet node
    (no matching commit)
  - [v3,6/6] arm64: dts: qcom: sa8155p-adp: Enable ethernet node
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


