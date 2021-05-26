Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E08BA39203D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbhEZTFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235807AbhEZTFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE23F61490;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=0mSidKWV2DmPoY6kbwIUL2DZ6fxjzW/K4e9CGdD5NTE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tLwsl0hrTneOqfUxXQVaCiUUDRXUKjsRtoNYMSp+6RUEnnao64moVUKOP4KtvY44r
         lT3WZ1kN79NqQ24paXyKEDPMrRtmAASy13gSHV7R6WXuiv6YiDCoESaX/+ySLneVIX
         EeTrHEga5/YrfBowob23YgTWQ+Qf/LixAWA67FzIJE6c17Xm4Zj8vmQjXTkiNfdEDS
         VDdCe19GzpZEaCyWQ+01ii2WGOMzgA0cquwpmGiryMPSSeK7FfPDWkD2JqMY5iDFcz
         WES4dtPgLAraXgA9s9X7Jxyj/FL58sr1kx6RTBso2OtPrsUhVsf41yyH27fe3TnfBb
         ZPsW5wONr6QOg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B8548609ED;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Remove need for reiterating the compatibles
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580675.26840.2472486128075693633.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210317025634.3987908-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210317025634.3987908-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Mar 2021 19:56:34 -0700 you wrote:
> After spending a non-negligible time trying to figure out why
> dpu_kms_init() would dereference a NULL dpu_kms->pdev, it turns out that
> in addition to adding the new compatible to the msm_drv of_match_table
> one also need to teach add_display_components() to register the child
> nodes - which includes the DPU platform_device.
> 
> Replace the open coded test for compatibles with a check against the
> match data of the mdss device to save others this trouble in the future.
> 
> [...]

Here is the summary with links:
  - drm/msm: Remove need for reiterating the compatibles
    https://git.kernel.org/qcom/c/8424084fbac0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


