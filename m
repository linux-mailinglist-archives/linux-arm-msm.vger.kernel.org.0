Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFFC51AC0D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 20:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357531AbiEDSF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 14:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237278AbiEDSFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 14:05:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7351FC74
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 10:20:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2D6B61A7B
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43522C385A5;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651684813;
        bh=h8milHzhhQ6DIV6aJWfL1o/9xfmFcOKtq+oly6IsXyY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=R8YxnICMP1TADp/R/ua/olArA0pugXV7T6i8DzXjZB29ChQnMWtaQByErrE9Vspfr
         TPDRf+TclYLCgNDBwJLxRWnToZwPxneKHLSNvdZ6g6HyHCGX3AZeUAHhSK1kzOZuAe
         yg6UPZAxxrKx8ndLILHyN10/G2W2TTD6rY9Lf92KEO4TgeI5Y86idos8O3OdcVv1Zi
         4IlZROTi4ZiLqJ8KPf+l01VdVpZqwrYtlKeeG8fVHXwupEQyKc60+hnIEW0hUl40Q2
         hHcPsfPyx0o1og0Pm0qBr1jL4fBq9OV7YV9jjJ0mEEaQp0621gVTobCTW0J0wztIDN
         KcXNpnkurfeNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1CFB7F0384A;
        Wed,  4 May 2022 17:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] arm64: qcom: sm8350-duo2: enable battery charger
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <165168481310.20209.4873775422611184715.git-patchwork-notify@kernel.org>
Date:   Wed, 04 May 2022 17:20:13 +0000
References: <20211207231736.1762503-1-kaperez@linux.microsoft.com>
In-Reply-To: <20211207231736.1762503-1-kaperez@linux.microsoft.com>
To:     Katherine Perez <kaperez@linux.microsoft.com>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

On Tue,  7 Dec 2021 15:17:35 -0800 you wrote:
> Enable the battery charger for Microsoft Surface Duo 2.
> 
> Katherine Perez (1):
>   arm64: dts: qcom: sm8350-duo2: enable battery charger
> 
>  .../boot/dts/qcom/sm8350-microsoft-surface-duo2.dts  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> [...]

Here is the summary with links:
  - [1/1] arm64: dts: qcom: sm8350-duo2: enable battery charger
    https://git.kernel.org/qcom/c/aadc48f7c4ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


