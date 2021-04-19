Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA0236466C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 16:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240557AbhDSOum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 10:50:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:39088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240559AbhDSOul (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 10:50:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B6F276127C;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618843811;
        bh=/sjZPVxc0CEqkT3FQHplmwzm7UxBcJ79Tq1W5TYpLDI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uFQJpR6q8kPpzsXjZMxOnwUYCt0BYBcM1HWw00LXixv/0sFtrrjwXznLAnRDc0rTw
         c1Ot3e06tHi3DEmd+XQ8vKe4+ggcgI9ANpG0xIKQxRo27o1VnLj/Slk9MA2g9sEjoE
         gYoE3mmiip0Rgc0pGlhMywROc8Pe4ckXkN/1XfkwKMYpuNjtDLdQJX6BLc27faJivt
         EX4jCWaQDeq5qjLXL62KtcR/XuTkG1QwIjAmX6OtngT8Rhiau0iCXXVTkmFzLB6Z/O
         M9nCCJ/GRoOyudWZ6w3p5GhGt2gYv/lKBw0+Qqe4UcdkQjBecI01sPq88Frn9B3E2z
         igfZ00jJFkjdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ADAD160A13;
        Mon, 19 Apr 2021 14:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: qcom: sdx55: add IPA information
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161884381170.13392.7576375178713114582.git-patchwork-notify@kernel.org>
Date:   Mon, 19 Apr 2021 14:50:11 +0000
References: <20210409155251.955632-1-elder@linaro.org>
In-Reply-To: <20210409155251.955632-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 10:52:51 -0500 you wrote:
> Add IPA-related nodes and definitions to "sdx55.dtsi".  The SMP2P
> nodes (ipa_smp2p_out and ipa_smp2p_in) are already present.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
> Note: This depends on this series posted by Mani Sadhasivam:
>   https://lore.kernel.org/linux-arm-msm/20210408170457.91409-1-manivannan.sadhasivam@linaro.org
> 
> [...]

Here is the summary with links:
  - ARM: dts: qcom: sdx55: add IPA information
    https://git.kernel.org/qcom/c/06ad53efeb49

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


