Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0FB4C370E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBXUur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiBXUuq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:50:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F77F269A8F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:50:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 47D31B82334
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6715C340F2;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645735813;
        bh=1T3FQYfBGwj9otAE6QNXhIG+BmlZ5pbtgz0ATDsLUUo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a693SNejBW8tXG2nmr9WjvIvkGRtx46TRUcpqXnRJFn1AOXX39JQr4nzi+IsfTmBS
         yvzUW3NajR7DEYhCJxISPEZADmY+1py4s0HhoWTn37SyV0j/exRpoXTsyOq4r9Eies
         cobWwWcOfRMFWMGKn42TngvW5SKBu2pT4fQBE864Pdi9gosH/sUni0LVJYqy/hJDS+
         vTMrBEAglq3Fw9RfTBUFNgWEIkJEOK7Ggo782a+elKfv+IM7r/m6S6R0y8v0qG9BlC
         sBp3xa1wfqMnMcWaqNQRsbdCqSw5VQqGc2ncWP9n1wfJrFmPiahdc2RntodTBB9kLJ
         cLiL6QCzHqFbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2EE8F03839;
        Thu, 24 Feb 2022 20:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: ipq8074: Use floor ops for SDCC1 clock
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164573581379.20860.9162455110673129029.git-patchwork-notify@kernel.org>
Date:   Thu, 24 Feb 2022 20:50:13 +0000
References: <20220210173100.505128-1-robimarko@gmail.com>
In-Reply-To: <20220210173100.505128-1-robimarko@gmail.com>
To:     Robert Marko <robimarko@gmail.com>
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

On Thu, 10 Feb 2022 18:31:00 +0100 you wrote:
> From: Dirk Buchwalder <buchwalder@posteo.de>
> 
> Use floor ops on SDCC1 APPS clock in order to round down selected clock
> frequency and avoid overclocking SD/eMMC cards.
> 
> For example, currently HS200 cards were failling tuning as they were
> actually being clocked at 384MHz instead of 192MHz.
> This caused some boards to disable 1.8V I/O and force the eMMC into the
> standard HS mode (50MHz) and that appeared to work despite the eMMC being
> overclocked to 96Mhz in that case.
> 
> [...]

Here is the summary with links:
  - clk: qcom: ipq8074: Use floor ops for SDCC1 clock
    https://git.kernel.org/qcom/c/b77d8306d84f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


