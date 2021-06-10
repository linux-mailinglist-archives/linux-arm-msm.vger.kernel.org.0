Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E997E3A2E99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbhFJOwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231208AbhFJOwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D386613FE;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=Ju7zeSZ3JaiZ1jlEwB7AZFwT8cdxHh9NLLzKV+kARQY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Z6FnegiblNp8JIVr5J5snD+HNFIzPcqxCZPa0MAXvpVkPBRFIYky1kZfkA4VCOQ56
         R17U+2qAg6hRLScyFAM2NMpUEInSS7LML0jI2Xyi1aRgnhlA6vWDMY2K/XlXyQ9HSN
         QH+buuownV5TfkGSmy4DwGuGUNkWVoycTv7Op8fIKJ4EFleZmN5MO4/ct2AsO9Sx6c
         Y/eMKfMdldqf0mlyUvlWy0lEQ9uw76XEsY8UYnPXpaLT/tL/u7yMkx9Hxyfe1H6K4L
         w6hNi9OUukHdMWN29TbwbpKlu7NbG/zcErTQSYRi++sMwBRpj+HYvE4x67CiVtWp7Q
         us5vraiGnbeTQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 80ED760A22;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Update flash freq to match
 reality
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660552.29297.9686108195699601122.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210519054030.3217704-1-swboyd@chromium.org>
In-Reply-To: <20210519054030.3217704-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 18 May 2021 22:40:30 -0700 you wrote:
> This spi flash part is actually being clocked at 37.5MHz, not 25MHz,
> because of the way the clk driver is rounding up the rate that is
> requested to the nearest supported frequency. Let's update the frequency
> here, and remove the TODO because this is the fastest frequency we're
> going to be able to use here.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180-trogdor: Update flash freq to match reality
    https://git.kernel.org/qcom/c/729046d4f1ab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


