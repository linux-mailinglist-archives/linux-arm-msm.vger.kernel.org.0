Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AAD2E73E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgL2USx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726608AbgL2USx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AA96D23106;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=FcT7iBrESl5XOSryajrUelx9ePoqIOwFvBGYPLBHUjs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EFsOC3WxFu8pWyp5ikoW8/oMyPviox/jRYxDbEP5yoxdYBHhNhn0dnNg+IpeMlmB/
         0AvXBf3v9r/gc7Ml3eU9zbNHZpztqbeWeR2FhwY47A70f63nEPmFRD7lK7FziidGZy
         5zQMlN/9y2R2egeP0XWr2GAtaI85K+Ida2Cx0cFVJG5wHpodDbEhZt9wAQvP73ajBk
         9psCVb583LxkmdZpTAw0jgnmidU4oDhnuR7bs+pD+WK8A61keQVF/YXdRi5Fdy7VNk
         QD08qoFtxPdra2GAW/0DJq2Wed4TcMfUDYzExce9MLy8qEupPFR+f2kbMNGQ1z//Ob
         TI4mRfoLj1HhQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A634C600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v1] drm/msm/dpu: consider vertical front porch in the prefill bw
 calculation
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293667.13751.1027399400719267941.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1606298560-3003-1-git-send-email-kalyan_t@codeaurora.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 25 Nov 2020 02:02:40 -0800 you wrote:
> In case of panels with low vertical back porch, the prefill bw
> requirement will be high as we will have less time(vbp+pw) to
> fetch and fill the hw latency buffers before start of first line
> in active period.
> 
> For ex:
> Say hw_latency_line_buffers = 24, and if blanking vbp+pw = 10
> Here we need to fetch 24 lines of data in 10 line times.
> This will increase the bw to the ratio of linebuffers to blanking.
> 
> [...]

Here is the summary with links:
  - [v1] drm/msm/dpu: consider vertical front porch in the prefill bw calculation
    https://git.kernel.org/qcom/c/0c3d3cc93811

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


