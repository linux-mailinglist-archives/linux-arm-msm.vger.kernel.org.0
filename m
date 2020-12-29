Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838BA2E7388
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgL2URf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726337AbgL2URd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DF66122525;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=ZiFjih8Z81F188f/1pjn7rIoOr/CHAASZdyEJE8hawc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=acxTVBtP20vbyIeE2y7dmOrO5vCfSb7XWLBwkstwA1HqwC8dYeUZqOtyasZznYr6w
         xSZqWqWPDApornF4ms/cL4Zxgmyl3VrbaeGfv2/p4PztiF4PbQ99MV+O8PRJ+HRGVb
         aIPSko2Jxa5KXunOWffx6mjr2mg8MKdSfNLrQqDJvxjt4UEB/pBwguVpjNz+T2dmf/
         xu8WkY/Kz9shESrGP1p710wHA+h9umZMC6WeFgm1vIkXRFiVSngnttnjWkNVuTkm7t
         GT85E2fS5/E2fvUPt6dyigeNTjeICrHZ94VfPr4DRW7sMS3/OpQyOQmTCOl4woiHXW
         5PrSxVvKIK3Nw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id DA0AD60626;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55 support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293188.13751.15790889948494740130.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201126092151.1082697-1-vkoul@kernel.org>
In-Reply-To: <20201126092151.1082697-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 14:51:50 +0530 you wrote:
> Add support for the PMX55 GPIO support to the Qualcomm PMIC GPIO
> binding.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55 support
    https://git.kernel.org/qcom/c/4247e3f56261
  - [2/2] pinctrl: qcom-pmic-gpio: Add support for pmx55
    https://git.kernel.org/qcom/c/ceb58de4365f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


