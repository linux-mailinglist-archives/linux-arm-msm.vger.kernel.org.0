Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7A539778A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 18:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233904AbhFAQLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 12:11:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhFAQLo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 12:11:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B570613AD;
        Tue,  1 Jun 2021 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622563803;
        bh=c+BgQgh0aZ9IZa/Fi3C6xnGjfiF2HqgZtsDbZxhEsU8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ptO2JQqbbg2OwqmAvcz0WNJPE2qMjyzeisOL1A4KQjsEHBfzCyGbwgGpUsqFyKSef
         6IKJ605xxUqLTIBKHkYU61X0OeqxrYP6L88mbiLs9g2Fwkr/L859KoXEkMGK1t44a0
         w1+jet7rPeyiT/R5103rK+bES9ISSdpoOZt9FqQW5893TY9+HaIPuqHJ3wT9VhBndi
         a41CLi4wSC9DnF/wmDvWurH1gTIU1AArVg+vpPectgbOoExE6xKqygQ9T5DdMQXzxG
         ZP6v5tlW5mwugqKcM3Amk/XcpuFauTE4ur5mHYek1lFUH07nV0Ys9slTLkiCMrZIoE
         q6N3l81IHJ7ow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6A247609EA;
        Tue,  1 Jun 2021 16:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add lable for secondary mi2s
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162256380342.7899.759254446172014124.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Jun 2021 16:10:03 +0000
References: <20210531143557.3975917-1-judyhsiao@chromium.org>
In-Reply-To: <20210531143557.3975917-1-judyhsiao@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 31 May 2021 22:35:57 +0800 you wrote:
> Adds lable for secondary mi2s to allow overriding.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sc7180: add lable for secondary mi2s
    https://git.kernel.org/qcom/c/ad7395c7482d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


