Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615F7392004
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbhEZTFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235712AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DE08B613E5;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=iXzcSsBshQ9ephSEfDagH5NDd7SU4eZxlM8LES6s+Cw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oTxSFvNKNOyVkxVbekjTO6Vlj7wT2oOvLdmp5u70XGI1hID8lDtG4PEMDbMrvF75L
         bevycc982aqvw1kum+1D8a82FdatL144vpKAkLklnIsG0kD99REYjHo5AJeVwmPEv8
         h+02UJ/BgkH6/0XB7WnNofZ4+Mzv4gRZSMQh/jEtHUEo7HU7Qc2Pdg9BauDql4g0OY
         22zTVjNy17/F+5K9DNWpUADntDYwxtMzoU8Ys5oI/kuIZJh2ZRLRcgxhwiRDDaS51/
         jhmWvMweaqqY6jDtsrOXPA1eYaV7ej5IMGd9ZwHR2uABe3NRBGfHw3Pvnuw7nWBfHU
         nReJ60iBiibVQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D9C6A609B2;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/msm: Drop mm_lock in scan loop
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580488.26840.14752456360202967764.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210402211226.875726-1-robdclark@gmail.com>
In-Reply-To: <20210402211226.875726-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  2 Apr 2021 14:12:26 -0700 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> lock_stat + mmm_donut[1] say that this reduces contention on mm_lock
> significantly (~350x lower waittime-max, and ~100x lower waittime-avg)
> 
> [1] https://chromium.googlesource.com/chromiumos/platform/microbenchmarks/+/refs/heads/main/mmm_donut.py
> 
> [...]

Here is the summary with links:
  - [v2] drm/msm: Drop mm_lock in scan loop
    https://git.kernel.org/qcom/c/25ed38b3ed26

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


