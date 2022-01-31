Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7063D4A50B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 22:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbiAaVAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 16:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiAaVAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 16:00:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD7AC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 13:00:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2D818B82CA0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9EECC340ED;
        Mon, 31 Jan 2022 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643662814;
        bh=F9HZ5MryyTbpAZ8R4X6ZWyK4lH6cKBShshJNvsQWr1Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rUgCHJK5ReUAD1KB1LpMAcQLJ/tLQXQRV+I21cg045J9hGin8l7lObuPauUl2uOEb
         mVJemG1FerBGsAb/S8SVkX+u0jbRK1sF6C31XxOMIU3bbe+G835Cfta0nX/8mdZZ2p
         X53PdcpIOP/xqVZVfdvdwrbHlEwtCxY8GLCS+P+FrvycuBJVHRELIRTvTulkDp/jwc
         M9gZ8ovqKwYUUV82ltdr6ajfY/y9KzEi02Y0wHWY3Wld3hTbuYHXS2d1M5TJEk68Fj
         +kZVHXVdu5U29rahQpTjuybOLdf1g2zdknkRlteJsZjubvzS8BvL/n6YE+uCFKJ103
         FxKdMMiGALDew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9CF2E5D08C;
        Mon, 31 Jan 2022 21:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] msm8994-huawei-angler and msm8992-lg-bullhead sdhc1 fixes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164366281469.9160.11636865721002054288.git-patchwork-notify@kernel.org>
Date:   Mon, 31 Jan 2022 21:00:14 +0000
References: <20220113233358.17972-1-petr.vorel@gmail.com>
In-Reply-To: <20220113233358.17972-1-petr.vorel@gmail.com>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Fri, 14 Jan 2022 00:33:52 +0100 you wrote:
> Hi,
> 
> Besides fixing sdhc1 for msm8994-huawei-angler and msm8992-lg-bullhead
> I also rebased and reposted Jean's patches (Makefile didn't apply on
> current for-next) and also rename angler's DTS.
> 
> sdhc1 (i.e. mmc0) is working on both, but there are overclocking
> warnings. I suspected issue similar to using clk_rcg2_ops instead of
> clk_rcg2_floor_ops (i.e. 3f905469c8ce ("clk: qcom: gcc: Use floor ops
> for SDCC clocks") or 148ddaa89d4a ("clk: qcom: gcc-sc7180: Use floor ops
> for the correct sdcc1 clk"), but it looks to be correct for gcc-msm8994.c.
> 
> [...]

Here is the summary with links:
  - [1/6] arm64: dts: qcom: msm8992-lg-bullhead: Place LG Bullhead generic code into a DTSI file
    https://git.kernel.org/qcom/c/3f99518c6f65
  - [2/6] arm64: dts: qcom: msm8992-lg-bullhead: Add support for LG Bullhead rev 1.0
    https://git.kernel.org/qcom/c/cd4bd4704ec8
  - [3/6] arm64: dts: qcom: msm8994: Provide missing "xo_board" and "sleep_clk" to GCC
    (no matching commit)
  - [4/6] arm64: dts: qcom: msm8994-huawei-angler: Add vendor name huawei
    (no matching commit)
  - [5/6] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc{1,2} definitions
    (no matching commit)
  - [6/6] arm64: dts: qcom: msm8992-lg-bullhead: Disable sdhc2
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


