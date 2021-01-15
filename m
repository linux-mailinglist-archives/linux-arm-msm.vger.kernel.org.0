Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0012F7ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731334AbhAOPAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732822AbhAOPAu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4001F23370;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=Jxl46Yal36WnDuZkJil5+HR4NA2K0hP1S87/YtQSZUs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lhPKyOjf5+Z37PsnqPgLp1fb8vLLAu1GMjhmQg0qfIh91a5j5WTfdZieZ/i1BEp69
         G5i2+t9H6KlB7cMBl4oyK5s9TkrOOG7w6XrzdsiQmNja9LT7TwvBSOCzCAkjghqJL2
         Nzdy4eyaihLzxgkz2jc5a7TfkakwHaPEz2GwaFWDMExcD21/jcGAuYHOLNcwJvEYwB
         MEW+Y7JRFSaipyIsrSvkVe6nw1eE5TiwNParyDNit/Hm3zqMoEQXj1NmDMOQyj80fq
         I/8MRd3gwqlfwbWWQpc/PnGnyHGpplD8Vz2QjtDpDQ2HR+++g8m3jni83jJ9uft44w
         1Kq4jJCEVaRWg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 3883E605AB;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add labels for cpuN-thermal nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281022.19141.7192448608889184355.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20210108141648.1.Ia8019b8b303ca31a06752ed6ceb5c3ac50bd1d48@changeid>
In-Reply-To: <20210108141648.1.Ia8019b8b303ca31a06752ed6ceb5c3ac50bd1d48@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  8 Jan 2021 14:16:50 -0800 you wrote:
> Add labels to the cpuN-thermal nodes to allow board files to use
> a phandle instead replicating the node hierarchy when adjusting
> certain properties.
> 
> Due to the 'sustainable-power' property CPU thermal zones are
> more likely to need property updates than other SC7180 zones,
> hence only labels for CPU zones are added for now.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Add labels for cpuN-thermal nodes
    https://git.kernel.org/qcom/c/bc19af98ba39

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


