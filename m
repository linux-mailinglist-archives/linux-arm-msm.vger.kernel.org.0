Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CA539696D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbhEaVvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231637AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4094A6136E;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=MrEG1V/7/0jHtOW/e5KH1dgYJcxNqoLrp0UPuQjbX6E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XVtQsh9TVDaEh8kIkDCBbiLbNhhZnYnfuOJMHevgEhwu+Io7vvjD1fs0jMV56bdA6
         FYFYksFLVGOG+TB+/2sfE+MFKbXe3NZ7nnIbtRbW6BsRSCGG3r9GRCArAqUJKjlW3d
         wPKubQ1Q4hIgHkOUVJAtFNYvcfjhjpJcP5nT6szACYEt+o29dEzS1ImNLI0/eb2nv5
         sNFr16KFuQpnywIGH3WeX7EqpfFgy/CT1QdUior/J1fRZbD4nhZdprk61n/2X8+YsV
         MwgabT/u16DN9rujRJOSjtOxqwBl0HRhiOhzJFXRMzyKdwugEbkBovzTYepdDKnHCU
         T0XhHrJdJ/6yw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 39FBE60BCF;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: qcom: enable interconnect for SM8350
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780623.3521.17527810179970219962.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210510070725.3839459-1-vkoul@kernel.org>
In-Reply-To: <20210510070725.3839459-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 10 May 2021 12:37:25 +0530 you wrote:
> Enable the interconnect for SM8350 as a module
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: qcom: enable interconnect for SM8350
    https://git.kernel.org/qcom/c/e353049e12c1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


