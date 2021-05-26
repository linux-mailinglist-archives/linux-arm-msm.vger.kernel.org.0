Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4AD39202E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhEZTFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235797AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A27461457;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=DccsNGBHt2fDvJud21ziB5h5AxD+7wkbv9NKp396/6Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vCr9qY1XPH9mRJngY03clI6qGxR92i1STsGCi7CbPeD0guAQd/rTDxEtiQzMp3bNY
         WKZ1nmJALHtYHQzcYmg/qw284VXud/P7Y5Z2OdLAMlYJrAEoDTq+AhCaOD1bFdhn+A
         TqGRWHRbltY8U4Fyuo/pAozgDBOfiz1rXeuznuoXET7ZVEy+CMn74yHv/h5/5CJ+7x
         FUJpZvqLuYHPxXW3BFe2pojygE5wZUbIA5eDiQWtMZnuqqyfcBJ45I2wLtHOIwvIQ3
         cYHThjL7GyegIPWKukWciEjx265mHZMuZm4959HR6kelzi+509hlTyt97BcLG7mYX8
         xqE1RbtO3BtXw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 452A6609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: pci_generic: Implement PCI shutdown callback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580627.26840.12165138159797938160.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 19 Mar 2021 16:50:37 +0100 you wrote:
> Deinit the device on shutdown to halt MHI/PCI operation on device
> side. This change fixes floating device state with some hosts that
> do not fully shutdown PCIe device when rebooting.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - bus: mhi: pci_generic: Implement PCI shutdown callback
    https://git.kernel.org/qcom/c/757072abe1c0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


