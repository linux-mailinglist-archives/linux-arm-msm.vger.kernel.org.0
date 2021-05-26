Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA0C392041
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbhEZTFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235813AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF88C61474;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=tDTYSv7vMn+YeB03++VqrSy3bihqB2he6UbxZ2FHvXY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=s7+Epfl8QANc3temaXvb6ro7krdjUl5Q5akWDbEFJo0w6tzHO0oMQVD7UKxPgvUl6
         FKnKzELYGXtMKmyUpfGScWc3BOzK75aXON0FBGUtzUR40urVYFiwl9mZ02ONUyEn4x
         0TGBjhQ4AC2Rzy899PIFQ7351b8cT4Obn67dhQBDYJyw0IPUFpqMwLC1egRkqrEKSs
         d8elDxw+LtCG7HM6uRloS+sjK27tjErAKL2ztijtxBio3OYXUgf1UcTFg+0RkvcWMs
         ZKcRk/f+dGDCka/3bppJLUyqJ1pTa1sM1evlmuJ+b82toOG9Fiy2Ph4zcAQwfbD2rO
         byPFGcmFlVozg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DB7DB60C29;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580689.26840.2027841481980957367.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210224224751.1215018-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Feb 2021 01:47:51 +0300 you wrote:
> Fix setting min/max DSI PLL rate for the V4.1 7nm DSI PLL (used on
> sm8250). Current code checks for pll->type before it is set (as it is
> set in the msm_dsi_pll_init() after calling device-specific functions.
> 
> Cc: Jonathan Marek <jonathan@marek.ca>
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
    https://git.kernel.org/qcom/c/3b24cdfc721a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


