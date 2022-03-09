Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE32E4D28BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiCIGLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiCIGLS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539F01081A6
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E300861912
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A6BC36AEA;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806218;
        bh=OW+sGt0Jyc+o9coQj/RrafYVe75SXMuvG6USHr6bpWQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=onRA7ovNyTOzK/S8nvTPRtR6XkC4MPlj1T1GRSzbQd48o8Ho3qISOknm6F66z+8jn
         UdCExydeSDeovCgfem4Sl3drIlb6zLMSXjuEmMmrz3IDUmg8zgGOF1RTUG83r0wiKo
         Tdvk1FVVfKEpt0kFKg6uECwy6sAo3o5gvP3VlcJMPhrEiqk3tq4rUEg/PicNWs6ynI
         L6XsWwBNbeJYb2Mb2bPc2pHQyUFaNZM8QdjdBtMjkCmMAQYB0jdDZjQB8wSlXILE/X
         y3oZwRrs809IhpraMg60aK2wjNc/+ynjkvz3QG/3KZYKfF9ba7fQjwUYbvQypeV9i9
         f0G/4Ry+5wE2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFE32F0383E;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Add ufs power-domain entries for SM8150
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621871.4478.185960432951389237.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220303082140.240745-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220303082140.240745-1-bhupesh.sharma@linaro.org>
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

On Thu,  3 Mar 2022 13:51:38 +0530 you wrote:
> Changes since v2:
> ----------------
> - v2 can be found here: https://lore.kernel.org/linux-arm-msm/20220228144607.456194-1-bhupesh.sharma@linaro.org/T/
> - Modified [PATCH 2/2] from v2 to include gdsc driver structs and
>   support code for UFS_PHY and UFS_CARD (in addition to defines for the
>   same).
> 
> [...]

Here is the summary with links:
  - [v3,1/2] clk: qcom: gcc: Add UFS_CARD and UFS_PHY GDSCs for SM8150
    https://git.kernel.org/qcom/c/53f4a832166c
  - [v3,2/2] arm64: dts: qcom: sm8150: Add ufs power-domain entries
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


