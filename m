Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C05329243
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243434AbhCAUmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:52938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243685AbhCAUjB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:39:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BDAD764DF2;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=aiLgvzP7M3LkdhRweetb++HYbNvbis95ZLqNYMz3lfk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kDOaasij6IYXQD67z6BV156+2mVuLfzBQgxVkKqk9t3VByACT2GrOIi37sEgEztXu
         IFxnWXoHQXtqjMkuxmyCJht6jDZ74lIHiQwzdry5Z3+xJwTCvhOytkwIviAj+yLUgu
         BfzNerY0s2qNdmu4uz+d/fZpclFGsOQgPqKYA6h4/cYzo9DclqEx/mPqHbfmu9zm77
         vZLFZvnsrt0hbX8rZi7PK+uAw8eUzpvQ/Lj6lym8rRf3nMZJRq6uNZ5qoXa1EddKVi
         IhyYDqd+RKLh8P8QkCLp53CkBR7xb99y+2N0c939ureh1WEtJpCFM67Vif3xilU53Z
         h5aflNki9pirA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B924B60C25;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: ipa: support COMPILE_TEST
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878175.6187.14656795560650270384.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20210107233404.17030-1-elder@linaro.org>
In-Reply-To: <20210107233404.17030-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  7 Jan 2021 17:34:00 -0600 you wrote:
> This series adds the IPA driver as a possible target when
> the COMPILE_TEST configuration is enabled.  Two small changes to
> dependent subsystems needed to be made for this to work.
> 
> Version 2 of this series adds one more patch, which adds the
> declation of struct page to "gsi_trans.h".  The Intel kernel test
> robot reported that this was a problem for the alpha build.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] remoteproc: qcom: expose types for COMPILE_TEST
    https://git.kernel.org/qcom/c/994122211665
  - [net-next,2/4] soc: qcom: mdt_loader: define stubs for COMPILE_TEST
    https://git.kernel.org/qcom/c/ce2ceb9b1cff
  - [net-next,3/4] net: ipa: declare the page pointer type in "gsi_trans.h"
    https://git.kernel.org/qcom/c/a2d7764b3731
  - [net-next,4/4] net: ipa: support COMPILE_TEST
    https://git.kernel.org/qcom/c/38a4066f593c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


