Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76D4F391FFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhEZTFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235591AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6159B6143C;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=q97q1McKm6OOdzPocHozo4mIrZxAxfZA9/2Sx+fZcxc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d0RuIUxCDuw7EoRGmGddm397MWtVNn0BcYLxX5AnS6lOd8dr0JJ8amLqgLBTxTSLK
         5/vP25DpH5768HEIljMZdcQEU0qcVy60jiX9hfBgWz3QA7AFOU6NxsfUN6B+N3urSt
         xtg2Q1BCre9DBFy3XGW81BHD228fDXbR2dHLGinyUXVh+fRXPtu/UjQW4i4LaPvlp/
         8UVCnKj+Sg2xO8fPYSwAgl5hy4rEuenP1ZNnx8tsb3JfeLbGcOiekd0HFVXr1om94n
         fHrbdhkE8rD8Ko7Cd/Wp7e/61mcGGBeOHvUpYnR5COI/BSxib/p6Y8RhPEz/TEOWi/
         zyEC/scayZ8Pg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5D28460CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580437.26840.11398023618152370305.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210414025138.480085-1-julianbraha@gmail.com>
In-Reply-To: <20210414025138.480085-1-julianbraha@gmail.com>
To:     Julian Braha <julianbraha@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 13 Apr 2021 22:51:38 -0400 you wrote:
> When PINCTRL_MSM is enabled, and GPIOLIB is disabled,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_MSM [=y] && PINCTRL [=y] && (ARCH_QCOM || COMPILE_TEST [=y])
> 
> [...]

Here is the summary with links:
  - [v2] drivers: pinctrl: qcom: fix Kconfig dependency on GPIOLIB
    https://git.kernel.org/qcom/c/376f9e34c10f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


