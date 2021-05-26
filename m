Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DC5392062
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbhEZTFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235837AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 235646161F;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=pbT35LK+KaXXeYtlw1+udxc76hj3SiL1TVVgNXmUXdg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hAJkEuA1/id9t3EG/90GXdVQBsdUg2lH320MUx0dUEBDzsJMdzAZtY7sZ2sygvQnv
         9icEIA7GdeP/c7hi8apiWnnwnRqnhnF10jts33b1C6jU/oCJa5ckE9YW7O7/gNrgX8
         kd/E+c6mFwTFIIQBIwwjeAfRIO3tEzZRMjwdxmFbIRQGOcic66pk2R62xswxGXAzYo
         5SviVm3FseAYmUgDXdkAom6Jd8eBadxZr61PjA7Fq0X4/UkbGaOXRSNd4KOoUpB3w6
         VgI/L3vcBr/z8ZeOklmRqC4LbV8JqU7p3eTqyGOYKv+dUhysSP4N3O4OEap03dn0V7
         UZeos1WWFF39w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1F29D60CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: sm8350: Add missing link between nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580812.26840.15082765669201349759.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210401094435.28937-1-georgi.djakov@linaro.org>
In-Reply-To: <20210401094435.28937-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 12:44:35 +0300 you wrote:
> There is a link between the GEM NoC and C NoC nodes, which is currently
> missing from the topology. Let's add it to allow consumers request paths
> that use this link.
> 
> Reported-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: sm8350: Add missing link between nodes
    https://git.kernel.org/qcom/c/91b940526b84

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


