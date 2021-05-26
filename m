Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5456392003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhEZTFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235697AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B0A5761443;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=SjY0iyAnWdy0Hm8dGw/CKyadY3+OkA/URkJSmUyLTvk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=b02A/cPxNzirbQAcN50++THcLqmI2c/mPzZAoBfDAxlYFlszzcrMWYseU7kg1diI3
         Pl8M090xljV5X9WfAkK6fALMmeubPjQhVYhgZgcHhPFix8J/zH5sH3tMxUB5kzaGkI
         BnL1MmOkaueAJKJ3xo+lkQq0sRIyhnDENwRUHdtiebs3gFBEkTbCNg7nOFwozWUblT
         x0EmNCtb7ts2LA1zlPl2EbKlDbv2cC6/87Udx/ar7Bdf3atFUhAGuVt8IoH87tcYCQ
         rEKg0hfAyDW6V0FeHmuR1YF+WFS8Cuk8zGuTyv1/NjPBRx9I68tKDPC/5CGsoG/8aR
         ZVIwMIuHqvIZg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AC3DF609B2;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580470.26840.9917479295266595021.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210318105435.2011222-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210318105435.2011222-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Mar 2021 13:54:35 +0300 you wrote:
> SM8250 platform has a 8-Levels VIG QoS setting. This setting was missed
> due to bad interaction with b8dab65b5ac3 ("drm/msm/dpu: Move
> DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks"), which was applied in
> parallel.
> 
> Fixes: d21fc5dfc3df ("drm/msm/dpu1: add support for qseed3lite used on sm8250")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dpu: enable DPU_SSPP_QOS_8LVL for SM8250
    https://git.kernel.org/qcom/c/095eed898485

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


