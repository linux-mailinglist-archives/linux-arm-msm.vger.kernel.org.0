Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2478F2E73A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726507AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726499AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 92AE122C7B;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=IsxV+b3ah92jHvSOx5dM9JMGl1fnmctqDrEN6bah1Xg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RecLbWmyF/hfNGsvGe4iQwhhP2ZoPB7bYyg3wTRSTC8SvaVBAQOSUiclq6DV/dCoq
         1efrTN1oeijHYWBnlcFhNB0pr8jPGsAFxd1eMb8+jsELscMwWANYb7zrWeZ+4kHNR0
         nj7oAfK+vqXFmp1rWV+ZTZmLaDYfLVLIpl+9hRRLajSp46BI7RS1BpxbJf5iH/r9VZ
         UEsSqjqVpmjA4ACfR7NdeIbYXLM34pDBL9DdXXaQWo4KDmuxv6g+IaoGzRiFNuJUYU
         5Ntmb7m2G0JJByGZEY90f1wOKRimM2mOrHOn+6pIU+fYBaA52kJhcSzEpHRE/xFH8W
         y8AH+fGU76bXw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8EEE1600D9;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: qcom: Fix ADM driver kerneldoc markup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293358.13751.12571363987977209630.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201126184602.GA1008@earth.li>
In-Reply-To: <20201126184602.GA1008@earth.li>
To:     Jonathan McDowell <noodles@earth.li>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 18:46:02 +0000 you wrote:
> Update the kerneldoc function headers to fix build warnings:
> 
> drivers/dma/qcom/qcom_adm.c:180: warning: Function parameter or member 'chan' not described in 'adm_free_chan'
> drivers/dma/qcom/qcom_adm.c:190: warning: Function parameter or member 'burst' not described in 'adm_get_blksize'
> drivers/dma/qcom/qcom_adm.c:466: warning: Function parameter or member 'chan' not described in 'adm_terminate_all'
> drivers/dma/qcom/qcom_adm.c:466: warning: Excess function parameter 'achan' description in 'adm_terminate_all'
> drivers/dma/qcom/qcom_adm.c:503: warning: Function parameter or member 'achan' not described in 'adm_start_dma'
> 
> [...]

Here is the summary with links:
  - dmaengine: qcom: Fix ADM driver kerneldoc markup
    https://git.kernel.org/qcom/c/4facce4c1263

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


