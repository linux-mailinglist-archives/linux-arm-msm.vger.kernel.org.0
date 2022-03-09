Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 741394D28BB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiCIGLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiCIGLT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 093CA106CBC
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 238BDB81F83
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C405BC36AE7;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=KmJ0alXnmsXX1Me7w8gmscBBIfR0O7lWRq8qNdw2MDA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=htp9kQwMeH3lyTJZjTe9b9v6xSvhLFxq7SqFdTnnr5TZCR00H5gaO3o9mM9001T4j
         QmifikRV5L/mdsj2EiOBAUVyo4PEBG4Tg+Bb46JDAGSfRiW4zdCsr3844yytdQumk1
         Mcs97V+/Di4KXnCqwBQ0WHa2KFL5KEoObW0BoZhzCvPfAIeSzir4qxshJ1flvRxUp6
         SIMalFgpka1Kr4QbWN2xTJ1yu28APKfAIlnP3D+C7bJn++9ZbHD/Kys5zznCxJb1ri
         DTNJganMWdSShJJwyYouFudyZzpxmTP22gmbdVrX9IHEoChratM9QwhWpzYYQspbEr
         tXGz/LLSCxRSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A74FEF0383B;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/5] Add APCS support for SDX65
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621868.4478.17581814090045458852.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
In-Reply-To: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
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

On Tue, 22 Feb 2022 10:26:20 +0530 you wrote:
> Hello,
> 
> Changes from v3:
>  - Removed the redundant patches after addressing Mani's comments.
>  - Rebased on top of v5.17-rc5.
> 
> Changes from v2:
>  - Addressed Stephen's comments and made necessary changes.
>  - Rebased on top
> 
> [...]

Here is the summary with links:
  - [v4,1/5] dt-bindings: clock: Add A7 PLL binding for SDX65
    https://git.kernel.org/qcom/c/2cabc4523765
  - [v4,2/5] clk: qcom: Add A7 PLL support for SDX65
    https://git.kernel.org/qcom/c/af44e3276bf8
  - [v4,3/5] ARM: dts: qcom: sdx65: Add support for A7 PLL clock
    (no matching commit)
  - [v4,4/5] ARM: dts: qcom: sdx65: Add support for APCS block
    (no matching commit)
  - [v4,5/5] clk: qcom: Add SDX65 APCS clock controller support
    https://git.kernel.org/qcom/c/2081df368ef3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


