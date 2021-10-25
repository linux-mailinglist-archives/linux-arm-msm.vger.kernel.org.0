Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C736E43A45B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbhJYUWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:22:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235340AbhJYUW3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:22:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2DED460E52;
        Mon, 25 Oct 2021 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635193207;
        bh=topLwNk/AWNAwIzEFPVcLqp0ACJiqwnkJAZOb6EvUzo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PT2yvytf+UFnxCQcx+ly+amnaaNtpoDNLeIJ015Rf7reCVUklN5MdNtQEKxeVXSij
         Deb7SfsZ5pqau/aVMFfwPUKQxC2fW4Ybm1z525FuJ19MnBYvdHgQvHolyt53/VMEph
         klep3JJep40k6lITBClOzcoYEhYkWjPU2eeQgzgPk1yHjXFkr1pp90Efw/NAByxfF8
         SXw0JlmiQ1m+4mmaQb8oDHFdJ+OK3p7OgwXv33XPgkvwVXaa5sQHZolVNUTOHjIros
         4c2NB7hd6H3O9rvDkEztHhROOXmg96qkj+1xHjDmhOiw+F3GB4hEBKEyNSaiGxjsa1
         jt17bqZfzZqng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C63660A6B;
        Mon, 25 Oct 2021 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: qcom: scm: Don't break compile test on non-ARM
 platforms
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163519320711.11471.7622795345317616198.git-patchwork-notify@kernel.org>
Date:   Mon, 25 Oct 2021 20:20:07 +0000
References: <20211025025816.2937465-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211025025816.2937465-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Sun, 24 Oct 2021 19:58:16 -0700 you wrote:
> The introduction of __qcom_scm_set_boot_addr_mc() relies on
> cpu_logical_map() and MPIDR_AFFINITY_LEVEL() from smp_plat.h, but only
> ARM and ARM64 has this include file, so the introduction of this
> dependency broke compile testing on e.g. x86_64.
> 
> Make the inclusion of smp_plat.h and the affected function depend on
> ARM || ARM64 to allow the code to still be compiled.
> 
> [...]

Here is the summary with links:
  - firmware: qcom: scm: Don't break compile test on non-ARM platforms
    https://git.kernel.org/qcom/c/c50031f03dfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


