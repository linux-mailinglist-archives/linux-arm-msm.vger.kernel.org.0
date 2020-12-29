Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3FA2E7384
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgL2URe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BFDE224DF;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=Sx/lUVn3sxknMJjgg7OqxATAs7KO4rvukuRnNHvXIyw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L+Qsw5hyjwHY7Tf/rzAJnYP7X4TOUA3j0nEoTJujqe11wGCiAsTBAx93VVo7UpSN7
         Tsr/uDsB6VAVGCVR4/PFP6206zvkT8gPFkeld8/pjt03nkeIP7NqL1FeGGMvzejBVP
         fU9TIiJyIt0Pzaqcqbf8Xm6MGcw6OPxZ73g8xY9WwsVhmoa3RSLw26z7NX8metvFze
         pUU5qI7j7V9X+6lxTCrg9uDgA6AaiMmJFZG/496MtHjzdqYpxZOS9k/xETl7Zs3qcD
         5OoRFbE4de99LUmeHcMIDQjpSYy/wfghCbPloYwaEiBQZztmHkWhK8BvB1iJL7qg5I
         592UbtNzpJdMQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 97FC060591;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: Kconfig: Fix spelling mistake "dyanmic" ->
 "dynamic"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293161.13751.13894298268282645479.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201126232400.15011-1-colin.king@canonical.com>
In-Reply-To: <20201126232400.15011-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 23:24:00 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - clk: qcom: Kconfig: Fix spelling mistake "dyanmic" -> "dynamic"
    https://git.kernel.org/qcom/c/02d8e879e410

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


