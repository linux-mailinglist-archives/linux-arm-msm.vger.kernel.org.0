Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934A1391FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235775AbhEZTFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235332AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0B1E4613F1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=j0HmWaWf/gKXbIvS+5Fos1/ShIinYPpPmXCe0edehgs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mPK7e3lQCM205T4QVcla401d3lOHBppBE6hWEvy6fQbrq0kBsThxBiPmTf6aMZtvY
         bhzP7pEuZAuAvJpxG/A0tdZdbbafU0bEGA5vwt5t8CM/gUjNQoBPUePLJ2sMMWHFnc
         mwSyNcOmrDUL8AJFUEypT7RDe+f4VzRCc+2Zp3aYlHMtvfwNGY3gU8kv/EpUfYmhH5
         6WuxL15AExThUsvkeap8NIzH/Wf6+k28whUrhwAePHuDz10Q6MQNVtb4zET4EQFNcO
         GC4gpi3g+UPnZNgatqCqx+8i5dtT23me6EhpY5J/K9adwnEpEulqV1AxIGZ6zreq2z
         nAho8t63MYd1A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 06DD060C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to
 other GPUs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580402.26840.8036308169612271730.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210228123652.134511-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210228123652.134511-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 28 Feb 2021 13:36:51 +0100 you wrote:
> While passing the A530-specific lm_setup func to A530 and A540
> to !A530 was fine back when only these two were supported, it
> certainly is not a good idea to send A540 specifics to smaller
> GPUs like A508 and friends.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs
    https://git.kernel.org/qcom/c/4a9d36b0610a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


