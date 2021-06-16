Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28ADC3A8DD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhFPAwI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:52:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230507AbhFPAwI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:52:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F26C60698;
        Wed, 16 Jun 2021 00:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623804603;
        bh=I4t0HMwk3eOCURigwsdVba2fixyCT9UGWWbGIvT2750=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BYix2cTTiuAJ0kdPtupVHdWK0zNGjQNbHA85so2eEkOPW4EFXQkoTkGCnSfSv5D+s
         odPzp/nYPe85pUAhcTit1BWSUOWVB5g9BtLi9Fqv3eX4LsPlgviKbQZqUwp2UZ9In5
         0eVUHMHeNQ8f1pvCMGLTHOOgquzxkbrfi9HUvEWQ4ulMGClHhgEo27lSeKPGkSyC/P
         Aq15IwDYwIF9vF2Tf3HhFIn/NOeydV4CDTM9i02pQqUR0UyhQsIMRZQpPFN6+lwfXG
         r1CL1z7SJOgirZPG+JdV1ikAyQgTUwYsQNTEhAd0hO0M41BSmrRo2j8pb4A1tnzPJL
         m2+0apT7YcMXQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4D86E609E4;
        Wed, 16 Jun 2021 00:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable renesas usb xhci pci host controller
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162380460331.26213.15542860869528057241.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 00:50:03 +0000
References: <20210615081749.3210344-1-vkoul@kernel.org>
In-Reply-To: <20210615081749.3210344-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 15 Jun 2021 13:47:49 +0530 you wrote:
> 96Boards RB3 has a USB XHCI PCI Renesas host controller. This controller
> requires firmware to be loaded on its ROM/RAM, so enable the module
> CONFIG_USB_XHCI_PCI_RENESAS. This depends on CONFIG_USB_XHCI_PCI so
> enable that as well.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Enable renesas usb xhci pci host controller
    https://git.kernel.org/qcom/c/8ae030c34dce

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


