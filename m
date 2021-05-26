Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C03392076
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235704AbhEZTGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235719AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D24506162F;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=Z5oeKlqwoFInHY/UT025jxrZECvpbHECCuep38xJDpg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CX9sqRt3DZNga1uD5pbLvNVUMGhrxkNuuJsUYlD9j8KX5hk+smlswtG3jRXIIILN/
         wUu2+lpVrrYTf/Zy1qhW44irTCm2s2FhiVZyCgJrFndLa2U9k3xREqmah9xHcwgJN7
         pCycKkdyzuHBgLyjrHspI1FGkp1UoTQnv8zKHcEdzsKCOoIA4e+e4K16eVuD6r3bMQ
         ui/NScocphob+orOdO1cpnz8SbFVFRZd64v8m2gjAM8fq2y5nPK87t5R9bgk202Za8
         f7rjcTRjNSXbMi20Z+GDB7nLQpDQHk941P+rb0o1DRmumhLv5DJEOqREDj5JJfZPKl
         Nx9QMJYx/aGOA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CE45560CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] Polling for MHI ready
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580884.26840.14189557443157670276.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 11:34:23 -0700 you wrote:
> v6:
> -Fix return error code for mhi_poll_reg_field()
> -Do not recode when returning from mhi_ready_state_transition() if polling fails
> 
> v5:
> -Use fsleep in place of udelay or usleep_range to accommodate better delay use
> -Drop patch for polling during RDDM panic path as new API cannot be used there
> 
> [...]

Here is the summary with links:
  - [v6,1/2] bus: mhi: core: Introduce internal register poll helper function
    https://git.kernel.org/qcom/c/1a42aef25880
  - [v6,2/2] bus: mhi: core: Move to polling method to wait for MHI ready
    https://git.kernel.org/qcom/c/79d056976485

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


