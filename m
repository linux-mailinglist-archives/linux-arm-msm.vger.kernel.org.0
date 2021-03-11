Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A022E33819D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhCKXkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:40:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:39784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231250AbhCKXkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:40:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D47A64F90;
        Thu, 11 Mar 2021 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615506008;
        bh=aw+FZ9quT6tvpRGW0xscCWTqZ8jw0dSKbFB4KkhdQdw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=u8diZlzo3nTUSUs9Ge7bhXG9P/0WEgmTcuxVE6dd2w0yKyGFulWPrB/snkFqlKCvN
         MFxpkPIYGqwhg4Ydey0x2Xwcw3L05lig5rF81XB4oe+b77CEsK2hBvax4pAki0PhJi
         ozfVJKgzUejRmDDJnuXWzChUbZH0YCRFj2gYgClC3ZOrWkB19ATdZIDzXEgJ97oFkH
         6bMdqpGvPq6VrW0Y+wmOUTntUxtNuOlebQ2wn5Ki7lQ0PU/XBh9YHYo0FoUReo5B4e
         RanVMdJPcL2C/9K+msDS/pNWgBwvN+hLxCJ3tyAGuTFs4LEoT3lZSnurOQuJGQsQbl
         FfMLnrtf4V+1Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6C67D609EC;
        Thu, 11 Mar 2021 23:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Drop duplicate dp_hot_plug_det node
 in trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161550600844.29522.2935470258776639555.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 23:40:08 +0000
References: <20210311131008.1.I85fc8146c0ee47e261faa0c54dd621467b81952d@changeid>
In-Reply-To: <20210311131008.1.I85fc8146c0ee47e261faa0c54dd621467b81952d@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 13:12:41 -0800 you wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> This moved from being trogdor specific to being part of the general
> sc7180.dtsi SoC file in commit 681a607ad21a ("arm64: dts: qcom:
> sc7180: Add DisplayPort HPD pin dt node"). Then we dropped the pinconf
> from the general sc7180.dtsi file in commit 8d079bf20410 ("arm64: dts:
> qcom: sc7180: Drop pinconf on dp_hot_plug_det") and added it back to
> the trogdor dts file in commit f772081f4883 ("arm64: dts: qcom:
> sc7180: Add "dp_hot_plug_det" pinconf for trogdor").
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Drop duplicate dp_hot_plug_det node in trogdor
    https://git.kernel.org/qcom/c/ed645f87a9d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


