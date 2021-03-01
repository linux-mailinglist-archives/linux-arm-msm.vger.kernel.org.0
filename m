Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB153292B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241224AbhCAUuI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243145AbhCAUrC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C83D764EEC;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=2ewq1JaIlerv+ocnWaBsqBF12qYyiMdTt2B0p2r8n+Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y7/qWJFrBcdougru9iNc0ZWgYUnTy5AWtrjINxFkXFDhUCka5w6Yk4ijhTpM1qCBE
         mQh7PPETq29uGiFbtErcriLiOdNYHpN5YCt2GXeSEg1sRSCMjXM2lQN/8ND0n2Mt52
         b5CeP3gVtCkalVevAfpolwd3wqYmkZmEW8lRBFiD6y1S62jOwqfEJLF4rCPTIHRyo9
         7IfZGTnk/WyuMcdXy3SoCWzhGO5NFM7+bqhTNXh5TSCCkCMRE5sRU22s1YMXnUC9bn
         JwaC9NJF2tp2ws1Cbx+LLMinsKW6oh7fvtup/72id4ffcvtFPzpIk8kYgek4SFxOi6
         GgOzGmkd0rZPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C4F3860997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: qcom: Always inline gpi_update_reg
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878380.6187.7974031409607934277.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210112191214.1264793-1-natechancellor@gmail.com>
In-Reply-To: <20210112191214.1264793-1-natechancellor@gmail.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 12 Jan 2021 12:12:14 -0700 you wrote:
> When building with CONFIG_UBSAN_UNSIGNED_OVERFLOW, clang decides not to
> inline gpi_update_reg, which causes a linkage failure around __bad_mask:
> 
> ld.lld: error: undefined symbol: __bad_mask
> >>> referenced by bitfield.h:119 (include/linux/bitfield.h:119)
> >>>               dma/qcom/gpi.o:(gpi_update_reg) in archive drivers/built-in.a
> >>> referenced by bitfield.h:119 (include/linux/bitfield.h:119)
> >>>               dma/qcom/gpi.o:(gpi_update_reg) in archive drivers/built-in.a
> 
> [...]

Here is the summary with links:
  - dmaengine: qcom: Always inline gpi_update_reg
    https://git.kernel.org/qcom/c/0a6d3038d914

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


