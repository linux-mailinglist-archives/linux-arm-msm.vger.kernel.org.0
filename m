Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE43A329261
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241878AbhCAUoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:53300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243294AbhCAUlN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 36EFB64E3F;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=fwpEttIRBmIFlyc1Z95lKP31uJyU6JzYtsnUHV1Ys2E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J+71PtdSXcxwr/OKNGuWRBMfzKIqk4BK+rTIs6Rew11ths/vCmc/mNKSeKm1b4caq
         iLnOfDCVYFQRJno/YoqoG85mB3/S2Intb0rSStGJIIH8JVVcE6w2D5dyI00BUmuxhs
         5QoS+yhcbLED3munyzHdR9MIdrGdEGB5W3ULyiED+C4219RCXDmRkfeXR8Xh591X+S
         iThqtWqYA4xSYP1KceVQSL7Syoc8mYVuo710mAqPWaGhyU6warm2kIDBZXv9OKJRrk
         1nZj8WPM7PO8R64a6tSVDRFr6u/cfiqyhnZkLHujeykqRQlLD1LceaZEc56fcZwoGc
         /zPKp/VPN/Fpw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3365460997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drm/msm: Call msm_init_vram before binding the gpu
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878220.6187.2782278560020089147.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20201230152944.3635488-1-iskren.chernev@gmail.com>
In-Reply-To: <20201230152944.3635488-1-iskren.chernev@gmail.com>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 30 Dec 2020 17:29:42 +0200 you wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> vram.size is needed when binding a gpu without an iommu and is defined
> in msm_init_vram(), so run that before binding it.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm: Call msm_init_vram before binding the gpu
    https://git.kernel.org/qcom/c/d863f0c7b536
  - [2/2] drm/msm: Add modparam to allow vram carveout
    https://git.kernel.org/qcom/c/3f7759e7b758

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


