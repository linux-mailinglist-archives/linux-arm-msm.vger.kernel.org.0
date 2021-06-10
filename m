Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392383A2E97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFJOwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231153AbhFJOwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 731F76128A;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=dfL0ss4MorwF0xCo+aM7L2ayK93I7kLMFEtFA7kbigU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X858zOrFnjyn8TLCoN7whk9VR252S+dcV4ByGcAQsxa0WafaVcolkXSFw2pu+ln+n
         Sku1vfVlBd4MU52FG7pBkGo5s27wLBheyVVl2sHyEX/5hjBUfRphy8ceZZaLfviOVx
         W4cKS92lYW9yxZabuCmtgaM9zUr0jPNVfrXb7pFoxN+0zv0HVN8sK+ropZinj79X4c
         NuH/za76NV01roRaAwGqEczUBHTxBMOup43UgZOiq253tYFUSv0nE83RoBhPSViESt
         VY4Axk7LBAMAgtEVz5/zoVOvB4wCFPT0gMNW19IH+l2v02LT7K35VFfy5PbfNYgUnQ
         n+LVjkgNXJSiQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 693D360D02;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: Disable PON on Trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660542.29297.13756230208146511861.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210601184417.3020834-1-swboyd@chromium.org>
In-Reply-To: <20210601184417.3020834-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  1 Jun 2021 11:44:17 -0700 you wrote:
> We don't use the PON module on Trogdor devices. Instead the reboot
> reason is sort of stored in the 'eventlog' and the bootloader figures
> out if the boot is abnormal and records that there. Disable the PON node
> and then drop the power key disabling because that's a child node that
> will no longer be enabled if the PON node is disabled.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: Disable PON on Trogdor
    https://git.kernel.org/qcom/c/d141e0524e8e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


