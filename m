Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C853F392039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235773AbhEZTFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235386AbhEZTFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9ABCB61459;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=X4nxVt3AVAXPrSRVPKoCEYUAR4X9YcteH3PTAHXsRBA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MXuwQSGv7O/5fw5n+9T4InULKO3MCzCWFS2iKO1V8JMZ2dbaYU+4TG4GqYmzP3vR7
         viwA/DIiuOIeYlY0dSOdbPjj+hO4EH0+yUddhizrIqXZlvNnICcLefCoWyWXl4EIaW
         d51ONzuQ/sRg382RjlAXO7EXM8LRjUaJzawcsMlg9CrNVWllsTcBgbC57oFki94R3c
         ZN5vy53fj7DuAvCGohyyOEQBlCn99SqLnM4LQ6zwce8ZAFW6SthilxU6BGKhH2bGPz
         mNhLeiaAPfVOjms+aRUYhFKb6mE65dbn33075vWYK1SkSjEXxKdE3Y5momIz6Df61r
         ryqqaahcs298w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 96ACE60CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: remove camera_mem region
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580661.26840.6415343031235341229.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210525133242.188603-1-senozhatsky@chromium.org>
In-Reply-To: <20210525133242.188603-1-senozhatsky@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 25 May 2021 22:32:42 +0900 you wrote:
> qcom camera driver allocates the ICP firmware memory
> dynamically, so the carveout region is unnecessary.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 5 -----
>  1 file changed, 5 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: remove camera_mem region
    https://git.kernel.org/qcom/c/59312ab13981

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


