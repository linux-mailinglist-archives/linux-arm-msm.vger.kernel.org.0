Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D71732926C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238899AbhCAUpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240025AbhCAUlZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 58E9664E45;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=92UIp6u5ArHl+uWhscSgg/fYrXN6fH07JUDW5a0HrEA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tqn88YpGQmoIhqK0XqrTNcCnEOZnA1iX0QEB4N1v8jIGY8U6yiQsFDmLEXZT+q8FJ
         qFx6oc6PhjXgJTB+dyuvCnXG2VFm3Pjo7zj4FoskbnBS7VMeB7WUDqOpqm/Ihpxbsm
         IqXM5L8piiYTdUvQDSk0bUdI0UVJpTHlOBpgZg0ilKALPOoiFJkbaE/pTcxgkchNlM
         zRtY1CSIrJzoooHp0LqQ48L3mnVorpG6qFPRUGvBPrxhvh+5u18A9lLTmd0d5uV+63
         f2xO0+YYSiPKM2ZEJmrqXVGm3diOpqbpnvvGDuzg13O4jMB2QwdquCX0PbdjBtrjHQ
         cLL9j+5Rm1EHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5419060A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] misc: fastrpc: fix incorrect usage of dma_map_sgtable
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878234.6187.3794742444833892590.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210208200401.31100-1-jonathan@marek.ca>
In-Reply-To: <20210208200401.31100-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  8 Feb 2021 15:04:01 -0500 you wrote:
> dma_map_sgtable() returns 0 on success, which is the opposite of what this
> code was doing.
> 
> Fixes: 7cd7edb89437 ("misc: fastrpc: fix common struct sg_table related issues")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/misc/fastrpc.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Here is the summary with links:
  - misc: fastrpc: fix incorrect usage of dma_map_sgtable
    https://git.kernel.org/qcom/c/b212658aebda

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


