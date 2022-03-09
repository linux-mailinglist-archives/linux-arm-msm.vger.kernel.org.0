Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7454F4D28BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 07:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiCIGLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 01:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiCIGLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 01:11:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8C71081A3
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 22:10:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B15E1B81F8D
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 06:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF207C340EF;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646806219;
        bh=nL59na0iTReTBAIq/+uODzBKalqh+y/UU1DeZg1jteI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DgYPd+sfsk3zM96VekZCDTHzDVLvt8tQJ0/43hrd+Bt4Abz28uYZXwWIz6k1IqBH5
         yAbd4Ev1cZq9L+uDt3dEYRM5dRhiCHBk08yV9KuRVp6XnCO1R0zYLB0+ZR6rvTQ9sR
         lmgH0bomvS56Ii0qOg2iwu121qF1bF425q6Iw1nywMvwNBEZYXdRNUD1wLl09FJonP
         1KCnJh5B9NYB13mcxegEaP3DRRJvafpkD37KkDX6k3vz/XPaqlLKhPgVgpSJdQMIy9
         xiXrc1b3gh6JTHD1uikohmyjVo4KpesIvTk8lbpdmV0sFrlutwyWeUpUUWXjaiY0QN
         F9e81meKzKW3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D5BCEE73C2D;
        Wed,  9 Mar 2022 06:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: rpmcc: Add RPM Modem SubSystem
 (MSS) clocks
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164680621887.4478.3173970754002578371.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Mar 2022 06:10:18 +0000
References: <20220226214126.21209-1-konrad.dybcio@somainline.org>
In-Reply-To: <20220226214126.21209-1-konrad.dybcio@somainline.org>
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

On Sat, 26 Feb 2022 22:41:24 +0100 you wrote:
> Add the missing clock definitions.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [1/3] dt-bindings: clock: qcom: rpmcc: Add RPM Modem SubSystem (MSS) clocks
    https://git.kernel.org/qcom/c/5b2fa289c0d4
  - [2/3] clk: qcom: smd: Add missing RPM clocks for msm8992/4
    https://git.kernel.org/qcom/c/ea58caed9926
  - [3/3] clk: qcom: smd: Add missing MSM8998 RPM clocks
    https://git.kernel.org/qcom/c/6b977074a894

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


