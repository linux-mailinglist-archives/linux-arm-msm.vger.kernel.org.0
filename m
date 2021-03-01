Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E5932927F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240755AbhCAUqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:53304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237515AbhCAUnn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E249464E90;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=Lc8tQhBvbK3KnY51WD7K1KAXOId7ZyrB4FToVBgGTBY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JPqa/y43jjknLLfyBOkv/6Xn7vVNZ+Z1JQNdDZlwo1bsDDmn3sTqzAHOg4cy8NlKe
         HHYCfJqBL9p+Oabct0zK9iBe0T2e51hIDKdSY7+AwkfEY92hWU1oEwFH2hijGRzgH9
         Y0hqQy+APprSbJ5oWAYXlrPZTqIZlG0qBwVXOYt9eCSf16kWa7+yMX8mNg5tutFzM2
         b2Yl8yxt19NbqDbi6ODTpwXv+PJhqMCTIjT1fUjZXisfjrZ+VbmxOcJti1SjkwQJiQ
         AOitGwS903WEaHJQaVGCAjdoaf90oWVCL+xMEFOhIPyE32IRiptiTk0B6a26jHncy5
         HuZ8OerQFnCtA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DE9F660C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/a5xx: Allow all patchid for A540 chip
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878290.6187.13847163788331389875.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210109134044.144458-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109134044.144458-1-angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 14:40:44 +0100 you wrote:
> On at least MSM8998 it's possible to find Adreno 540.0 and 540.1
> but I have never found any 540.2. In any case, the patchids 0-1
> for A540 are completely supported by this driver and there is no
> reason to disallow probing them (as they also share the same
> firmware names).
> 
> Besides that, the patchid number is also used in the a5xx_power.c
> function a540_lm_setup to disable the battery current limiter,
> which makes faking the Adreno patchid to .2 (which would anyway
> be sad) useless and even producing breakages.
> 
> [...]

Here is the summary with links:
  - drm/msm/a5xx: Allow all patchid for A540 chip
    https://git.kernel.org/qcom/c/4f2cf99d542c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


