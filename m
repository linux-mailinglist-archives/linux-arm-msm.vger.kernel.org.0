Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050174B2B61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbiBKRKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbiBKRKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D8A3B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AFA8261A43
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3F0FC340F9;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599419;
        bh=bW9dtFkewz0qP0tQ4whhsDfnJR4m+/c2jvDn5Y0BjTk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sPEemYIIBbGIJ172qH7R7G2XndzEazGtA54ncqB0mHHXOy7bQ7MZut0gg+X5Lzu4P
         CRXvVuhzsof1gXId0tP1svRwngzrf5atB4+4zkFaoYrqst8LsNE/hLblQlfGsqobuT
         8DtXTGO+lcAEOXOAATwULIoC3gAnqjZcq77MbLs165htR16WDjacPSFWHCoiGnts++
         AWH/aTMsMXqOdLNzROtbNwxTFf1rJM33+JRVVZgX3YHu6nVFu9Kpbu1ovfbfGxjqEs
         W7Mreza74xAUcsWF+C+vsTJ2fbXH0EjM3DxWBz2YQZ6et8oV1IDTJPlxSbOa0B2RZ1
         SOuVcBMUgUrxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2D6BE6BB38;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Add some more PMICs and SoCs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941892.13057.17395302223235088471.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220210051043.748275-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220210051043.748275-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Wed,  9 Feb 2022 21:10:43 -0800 you wrote:
> Add SM8350, SC8280XP, SA8540P and one more SM8450 and various PMICs
> found on boards on these platforms to the socinfo driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Here is the summary with links:
  - soc: qcom: socinfo: Add some more PMICs and SoCs
    https://git.kernel.org/qcom/c/76ee15ae1b13

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


