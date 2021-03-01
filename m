Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 595EB3292C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243773AbhCAUwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:54740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243803AbhCAUsX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F61864EED;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=I29aZ8NXVLxojy7oCPsB6A3wRWKo4eKB/dfktvJZDCA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bWMOgJjWzVVczfUBSvEwHUVU771lSAOb8bELjELBHtV+q3N6v9jfDwUt/KZSXnSAI
         QUGvw4qfUEhDGEIWAfJFOBFObWIdkjYNUzI6dVQRz9zZUFv9G4i22V+CiS7STNO/G7
         dCOwFPy9HlmKsiT+0gbOmvgT2MDUrspVuKemtreda6YsK2m/dXd2Lz46slbWGZU84x
         P9xObi3ovLgKNoZ77jZHA9me3cRipd/A39a19Zmpbv5NBGCP7Q44mQqGy3FUS48oUK
         osT+hxfcQcrlKg2JljTB6YzYfCU/pFtPRh4TcMaTmnwbHVF/JPMQTe9/HazrM8P/eU
         Hce8uh05OqdEA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2966F60A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v3] venus: venc: set inband mode property to FW.
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878416.6187.6549457637369270677.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1610090618-30070-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1610090618-30070-1-git-send-email-dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  8 Jan 2021 12:53:37 +0530 you wrote:
> set HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER to FW
> to support inband sequence header mode.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Changes since v2:
> - fixed Null pointer dereference (Stanimir, Fritz)
> - added set property call at correct place.
> 
> [...]

Here is the summary with links:
  - [RESEND,v3] venus: venc: set inband mode property to FW.
    https://git.kernel.org/qcom/c/002c22bd360e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


