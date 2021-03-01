Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2D33292A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240325AbhCAUtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:55270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239566AbhCAUqS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7213C64EDD;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=zniNEpTUVmxtuc4dMRSwSry7N1uNzot9xGGQlcO6l4E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lQdGiP0Guyz8XSDb3IKAxPub07z2g7+EGdkMEvzswcthc8LIwXpkE4iu0jlbVXQgi
         2M4LGGAMHm7/Gn5y0+OgWfmZiOjwgNpXvJr7EtJhoAIWd2PR559OvUgEZeX7TNMTxU
         Ck4qbfOgplte7lIAcqUY109LPBxbNlmUA49o0qppzVbRV76jlFpZz9bvygQvJgOStp
         orLG/WHqRPyQtZpfBHvlPsWa1K2IZxxXOe6Ulxs5hPxdVjbPd6j87X3sXP9uxgk00J
         QV+rwhgoXJCpsICLRV5b64hhFmAAb82lXJMkJ/RG6Frw3THQcvgLSjT97BdEjnZIlI
         Y7+lSgnMBsl3A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6E88660C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/2] mmc: sdhci-msm: Warn about overclocking SD/MMC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878344.6187.5741046007778947678.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
In-Reply-To: <20201214092048.v5.1.Iec3430c7d3c2a29262695edef7b82a14aaa567e5@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 14 Dec 2020 09:21:14 -0800 you wrote:
> As talked about in commit 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use
> floor ops for sdcc clks"), most clocks handled by the Qualcomm clock
> drivers are rounded _up_ by default instead of down.  We should make
> sure SD/MMC clocks are always rounded down in the clock drivers.
> Let's add a warning in the Qualcomm SDHCI driver to help catch the
> problem.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] mmc: sdhci-msm: Warn about overclocking SD/MMC
    https://git.kernel.org/qcom/c/a8cd989e1a57
  - [v5,2/2] mmc: sdhci-msm: Actually set the actual clock
    https://git.kernel.org/qcom/c/f16c8fd4449e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


