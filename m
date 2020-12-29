Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B582E7393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgL2URl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B1FE22AEC;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=bbdD+0ZLfDvBowmWJy1yYylcce9ynCiuLViwzdrdbAM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LrRMw169hOh/fYv8lb/bwOX2Urxzf474s5ynUoAptJXj9h6CQqq3aIP25P3DnvB2m
         GgsFwRuGA4CQ6z0UjyOeMMJ57cKWxN3h2U9BbbkZdAbpFGGjHZHg5b10fozvgGB0lV
         Kqgzrn3ayV1twdhFHWmSdA73iImOK51wXJ6hqEyWf90JDGkMw/AZpdx124VRylwchC
         ap92173Qc0DSlsqyfzSKj3LmRzCE5NgOvbpE9eHr7aJZdY1KXAO1kZ5pMYXEDDWw06
         x4Y8JO6bdckB2JC5PwhCU3XgvFrQU593mbu9c3iRFoHNAW1p99l3lPOr4CP66HKrmx
         BbLWjRES/xtGQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 86B6E604D7;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: sdx55: update kconfig dependency
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293254.13751.12535080914482625509.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201111043610.177168-1-vkoul@kernel.org>
In-Reply-To: <20201111043610.177168-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 11 Nov 2020 10:06:10 +0530 you wrote:
> Commit be117ca32261 ("pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a
> dependency rather then a selected config") moved the qcom pinctrl drivers
> to have PINCTRL_MSM as dependency rather then a selected config, so do
> this change for SDX55 pinctrl driver as well.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: sdx55: update kconfig dependency
    https://git.kernel.org/qcom/c/80f1803dbc05

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


