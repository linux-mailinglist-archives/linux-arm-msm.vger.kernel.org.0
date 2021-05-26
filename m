Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4233239200A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235846AbhEZTFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235718AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E6E1761446;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=8hAGMNm0vksALPYunxILkpkH3TfRm27ln3GSbhGtHbA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GAYuNZC9Dfh15MY0VimxXJi2ZoKhhS3LojfGGPdso6sudFf+YpsyJuC7BUP1fVPLJ
         orjbH+bcwST2Y9tKWznTMVbVLbw9vcwp2AsUhs+tGc39tzwXICvGOdwh0HX5ki3lf0
         5v5P4vF7al0B/sltlMatdm7A9HHQeHbLSZDq22d5ZCsTNp9DXuWAGih/yR3FEjTVGc
         IKy/helh1V9Ivg/k9dRTb3Uc0wny+umvC+QVJs/qGE48sIbDLIAbdyTS1Yq7cRznMt
         kVWMXWnukLsrXVJv7Q9OYcv20t9Vg+5AjuOIkfHRYDnt7ky2shTOkl2qAm/DWqZS1E
         iZ5+tCeoZ9t0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E2C58609ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state
 workqueue
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580492.26840.4142575963031920525.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1614161930-8513-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Feb 2021 11:18:50 +0100 you wrote:
> A recent change created a dedicated workqueue for the state-change work
> with WQ_HIGHPRI (no strong reason for that) and WQ_MEM_RECLAIM flags,
> but the state-change work (mhi_pm_st_worker) does not guarantee forward
> progress under memory pressure, and will even wait on various memory
> allocations when e.g. creating devices, loading firmware, etc... The
> work is then not part of a memory reclaim path...
> 
> [...]

Here is the summary with links:
  - mhi: pci_generic: Remove WQ_MEM_RECLAIM flag from state workqueue
    https://git.kernel.org/qcom/c/0fccbf0a3b69

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


