Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51F1C391FFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235591AbhEZTFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235623AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6FD86613CD;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=twgLnOES3Mzz2rdIEZWw4U+O55lzhyDrraFkJIX+XPA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DVJGxrbakyrpoBONcKsjm2XxGgRtozpU1erMoiXMsrXrgYbYnD86OujxDqANNmgPW
         SdQINK3gTjVNRwdU1NuVFUH7/R2NVUJoaLAlNGLh/cj3u0XAZ09QnTPzbQ0/Rakw+e
         KvaNK923GIJw2hLADJGeIOmbtQKdB9HJa1B0XruRoXe5xftHKjZK/vWvhIwFENG4aS
         vCXA6BMWNChb5J3m2PXe31Ho78O7hw1Twy6IPEVS7KDI4p1dEG/ZnUf+1U1kPOv5dG
         IwsFhRpdIOYeoxbEZkUxqBqVFzzeaO27mXTMatxYMiqp/omeVwEMDIASVOTL+JBNmx
         VWaeVlsS0jjmA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6BF13609ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] media: qcom: camss: V4L2_CID_PIXEL_RATE/LINK_FREQ
 fixes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580443.26840.6078755259949544437.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210303174250.11405-1-andrey.konovalov@linaro.org>
In-Reply-To: <20210303174250.11405-1-andrey.konovalov@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Mar 2021 20:42:47 +0300 you wrote:
> The first patch adds printing a warning in v4l2_get_link_freq() if
> V4L2_CID_LINK_FREQ isn't implemented (this is a mandatory control for
> CSI-2 transmitter drivers [1], but many sensor drivers don't have it
> currently).
> 
> The second patch is the start of the work discussed in the "[RFC] Repurpose
> V4L2_CID_PIXEL_RATE for the sampling rate in the pixel array" thread [2].
> I'll send the similar patches for the rest of CSI receiver drivers which
> use V4L2_CID_PIXEL_RATE to calculate the link frequency as a separate
> patchset following this one: I don't have the hardware to test the changes
> to these drivers, so the second patchset will be build tested only.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] v4l: common: v4l2_get_link_freq: add printing a warning
    https://git.kernel.org/qcom/c/67012d97df93
  - [v3,2/3] media: camss: use v4l2_get_link_freq() to calculate the relevant clocks
    https://git.kernel.org/qcom/c/78c2cc28df4a
  - [v3,3/3] media: qcom: camss: Fix overflows in clock rate calculations
    https://git.kernel.org/qcom/c/2f90857781bb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


