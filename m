Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12856392037
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbhEZTFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235800AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A19661440;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=hwLNBrNAARuDa3EcPkiQk4wJY4sEBEFb0AckhN/7JU8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fVg6/4BKSLBBv0Uhv62O91EKc7SMERKhwSW3JwicFWuHH1KZ2Qz1H90eVx2UaWHdM
         DQ73qyyYYuf9gf25D58t3vX6V1p2hPTEQV6lrssHCv5FyFb0uMpYMoPV0H5qTHTSfT
         Zq/V8sExWdphziEd6/LlO9PRKToENxlcS3y7jUnX6R5Z4f+O5RRudzni5DAymUE5u2
         TUbIjg3v1mAKLe10UkV/xBT+msW9xg3GIHZBSHNj2sub7OidJPllLT+Qk+lAuE/6ex
         J+6IKHmG8CJlD3HoquWLR4gn3NXxIG5KUSxgBiUEjtGh43DLgNX3WZ7EPX4NDhqItw
         Hfi4f4zMvbIRQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8519060C29;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 -next 0/3] Add missing MODULE_DEVICE_TABLE
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580654.26840.4786787881541775131.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210409082352.233810-1-clare.chenhui@huawei.com>
In-Reply-To: <20210409082352.233810-1-clare.chenhui@huawei.com>
To:     Chen Hui <clare.chenhui@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 9 Apr 2021 16:23:49 +0800 you wrote:
> v2:
> - separate from one patch into three patches
> - add fixes tags
> 
> Chen Hui (3):
>   clk: qcom: a7-pll: Add missing MODULE_DEVICE_TABLE
>   clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
>   clk: qcom: apss-ipq-pll: Add missing MODULE_DEVICE_TABLE
> 
> [...]

Here is the summary with links:
  - [v2,-next,1/3] clk: qcom: a7-pll: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/qcom/c/77a618b1481f
  - [v2,-next,2/3] clk: qcom: a53-pll: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/qcom/c/790b516ada10
  - [v2,-next,3/3] clk: qcom: apss-ipq-pll: Add missing MODULE_DEVICE_TABLE
    https://git.kernel.org/qcom/c/d0a859edda46

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


