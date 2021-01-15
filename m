Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20F32F7ECE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732910AbhAOPAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732816AbhAOPAu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2959423772;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=KhCG5cvUgzR5xtSf81gaVDTjdIsvJ6dHlNFWjUUdMCk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=otJoCcrWPv7cT0XhQkoZYB+PjKGaaRAhFBIgb/3rM0ixQoRZo82JAKOCd0oPnvEqw
         VXmVqxaVQOabu6ygsaNJmwmGY8unafEeQ34nYU2rfrkgOE/W6QqkUyGoO6Xoc6ToGt
         n8gZWNlKVSNLzuq69+NlMx30hmzP8VmMaWxpnM9J5jCCYgkLega5VbZTkX4fHKgZsx
         XVU7Hij8CDOgHKD8K2kG8lyVHt1moe/YTaG378Bc7RoKI51P2f83FMG6+AhJ2cRR7k
         4bvBKWgAdm+6WUWVL+iaaeG6E3+au65T7hAW7Ft7lYt5G9DhqvgO5FuXhD6dUeqjAL
         Gu96UBtJEpLdQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1C84660156;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Add SoC IDs for 630 family
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281011.19141.17165762336538048228.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20210109163123.147185-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210109163123.147185-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 17:31:22 +0100 you wrote:
> From: Konrad Dybcio <konradybcio@gmail.com>
> 
> Add missing SoC IDs for Snapdragon 630-family platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> [...]

Here is the summary with links:
  - [1/2] soc: qcom: socinfo: Add SoC IDs for 630 family
    https://git.kernel.org/qcom/c/0da78ae2e04c
  - [2/2] soc: qcom: socinfo: Add SoC IDs for APQ/MSM8998
    https://git.kernel.org/qcom/c/407bdcf9beb3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


