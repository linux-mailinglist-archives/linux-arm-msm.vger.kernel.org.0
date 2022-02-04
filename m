Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0BB4A9F51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiBDSkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:40:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbiBDSkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:40:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6148C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:40:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E5B161C18
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 18:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03F7AC340EF;
        Fri,  4 Feb 2022 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644000013;
        bh=7j7J3wXtdSdsdo8HMX4VTEc8NgoG7J2Rpu34sxOE+Cg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CCsMVRSc4lYpLcxYnwJLi5V33aUhy5Dotk1KKktRWr7tB9jzOW8fdzPMD3EfeRTNH
         eZ2P74La4hjD+DJUR7HzSv94kHcETBMPphDDMjbj/ddkn4zf+5bfG7XAFCB6qFqF5i
         /YR1mlhB6F46RHhIj80X6ORvWp3UOSLld59KN/UfIq0S+Yn5VbDUyUdY2d859j6qwW
         wT46T9cFQgUffD8MVgU3y+5GlpkIVeQMj012Aw+k5Olra4wINnjhb1Q8ZaCFaGFS7I
         vyh4/PIwC+qV8GL7QXLvo35OEl415YaSQMS2Of/atjOeeZJdKYVEGXqK7rQG9IIQZt
         2jPtltzJgSexA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0C18C6D4EA;
        Fri,  4 Feb 2022 18:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] qcom_scm: Add support for MC boot address API
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164400001291.8570.999781744582860338.git-patchwork-notify@kernel.org>
Date:   Fri, 04 Feb 2022 18:40:12 +0000
References: <20211201130505.257379-1-stephan@gerhold.net>
In-Reply-To: <20211201130505.257379-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed,  1 Dec 2021 14:05:01 +0100 you wrote:
> The "firmware: qcom: scm: Add support for MC boot address API" commit
> was reverted again in 5.16 [1]. This is a new attempt to add it back
> with much less potential build problems.
> 
> For that I first simplify the existing qcom_scm_set_cold/warm_boot_addr()
> implementations. The idea is that cpu_logical_map(), MPIDR_AFFINITY_LEVEL()
> etc are not needed if we just set the entry address for all CPUs.
> Nothing in the mainline tree actually requires setting a different entry
> address for one particular CPU and I cannot really think of a use case for this.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] cpuidle: qcom-spm: Check if any CPU is managed by SPM
    (no matching commit)
  - [v3,2/4] firmware: qcom: scm: Simplify set_cold/warm_boot_addr()
    https://git.kernel.org/qcom/c/7734c4b507ce
  - [v3,3/4] firmware: qcom: scm: Drop cpumask parameter from set_boot_addr()
    https://git.kernel.org/qcom/c/52beb1fc237d
  - [v3,4/4] firmware: qcom: scm: Add support for MC boot address API
    https://git.kernel.org/qcom/c/f60a317bcbea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


