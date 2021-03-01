Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22A9329290
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242711AbhCAUrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243529AbhCAUp3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A96264ED0;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=/f4/NIoyilZd/r7181UmHMAYpXYmzRlt1Y5n9gfmSSY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e7Y/1CDXB2bNXyOYqOwGssGJ5l2ux5wGDNMPxYA94oeqOTSyCaIMwUGGGBEAnXcn6
         /AUYPrlMInUSCBdc7UHwfgPoTIylz3XEGVozt0xxSHeLGN+/BUIQV/XPETR6bDx5/h
         u3moIk/47KprZ8KYWJ7dNGHU048rD2CJNNvHLpIc3MuLZ2PE6rMjVQwxuUPhKg9M9A
         xuLYthjsTFkjeIWvkGt+O8+CmxWZjIQJWL9mPUxjg44y8DMFoPEC6pBQXwwABBF4cE
         SUdgg3Mv0NtB3Z/s6pVAgFlabOYMqsy896ztTb/gLmjBPd9k2LJSyAylkNDgNjZJfc
         8Vx+qOwidzLTQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4722860C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 net-next 0/4] net: ipa: remove a build dependency
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878328.6187.6428319112140973986.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210120212606.12556-1-elder@linaro.org>
In-Reply-To: <20210120212606.12556-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 15:26:02 -0600 you wrote:
> (David/Jakub, please take these all through net-next if they are
> acceptable to you, once Rob has acked the binding.  Rob, please ack
> if the binding looks OK to you.)
> 
> Version 3 removes the "Fixes" tag from the first patch, and updates
> the addressee list to include some people I apparently missed.
> 
> [...]

Here is the summary with links:
  - [v3,net-next,1/4] net: ipa: remove a remoteproc dependency
    https://git.kernel.org/qcom/c/86fdf1fc60e9
  - [v3,net-next,2/4] dt-bindings: net: remove modem-remoteproc property
    https://git.kernel.org/qcom/c/27bb36ed7775
  - [v3,net-next,3/4] arm64: dts: qcom: sc7180: kill IPA modem-remoteproc property
    https://git.kernel.org/qcom/c/8535c8e30010
  - [v3,net-next,4/4] arm64: dts: qcom: sdm845: kill IPA modem-remoteproc property
    https://git.kernel.org/qcom/c/5da1fca9eb73

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


