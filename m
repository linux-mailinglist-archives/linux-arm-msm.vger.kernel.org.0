Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3332E73DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgL2USm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 634C1230FF;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=kSjClRHFChlS51zDGhbg89qC3NPCjvSmcNmZxgriKFc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sfgqMAlGsEpngK+TR3MeJpnPLkdmJgmADsQa9RHswtlyNck8hKX1mCNm/7q4golbG
         BAvwlcrEuQgQS/zWSM8GENtl/EuKOfjC1E0TVaipNXoBUK0fumLjeYdtdZrpI7t2LR
         pEDQxRfGa/7qW9bqgfeMNZEnQlUeaQ/zgp27RnTZ3j9R8jokcjoP6ANcgBEhMpY1zZ
         AkJMXGrV8CB3PJPgXC2HeLrEqu57k7ozmL4xSWJ0JSeAOhHJsO2ZvKRivn5QhQ70aO
         Z5n/dmtBrf2UIeuEdvDf8GdvDrS6OuvWfmuybMCInk5eAIc3YFrOgSFNUgO6/HTl7D
         wioL+Ihzaku3Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 5EFA7600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Asoc: qcom: lpass-cpu: Fix clock disable failure
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293638.13751.13389874351839097634.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 14:36:03 +0530 you wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase instead of
> shutdown time. Acheive this by invoking clk_disable API from
> cpu daiops trigger instead of cpu daiops shutdown.
> Change non-atomic API "clk_prepare_enable" to atomic API
> "clk_enable" in trigger, as trigger is being called from atomic context.
> 
> [...]

Here is the summary with links:
  - [v2] Asoc: qcom: lpass-cpu: Fix clock disable failure
    https://git.kernel.org/qcom/c/6ec6c3693a38

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


