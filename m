Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139B5392030
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235364AbhEZTFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235798AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 667746143C;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=fm3OQ/a498oAsNrkTlpWB1ctgvVVGJG78Fjl56kymA0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KrNNhiMaEj81Sa7c/KeikDQRyjVc4zYsyYcER+4wkLbbeXaZZC3XGYxZ6PcUwRI2w
         K7c9S8nDdOJ9/JrA690RUwNWoz9bdssw1Amz9IB67XDSD6dLYUPxq+YjxZKq0F0KEQ
         NPgRfrOtsdinZW0a5ZhzkxI29oTOJfxZtrGz8DY1OPcZJHEyN7pLm4xIjc3pCQpKnk
         /CWWHNgAHH93nTODhDVd79PkjH34Ybex0b2y+AoSZsRH0OwbCb5KDWjFdDN/rnX0fT
         hb1RWVxasZkwkETcrHB1HAhbMw6sbgLL/fAsKF6tgIDCLrS1FtHSaqw9hEtmabAJ98
         uXeJy1HF4AqjA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 626AB609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: core: Fix a warning in register offsets
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580639.26840.14801542455322948444.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210407105549.348178-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210407105549.348178-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Apr 2021 13:55:49 +0300 you wrote:
> Fix the following sparse warnings:
> 
> core.c:227:41: warning: Using plain integer as NULL pointer
> core.c:228:34: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> [...]

Here is the summary with links:
  - venus: core: Fix a warning in register offsets
    https://git.kernel.org/qcom/c/b6f139947e93

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


