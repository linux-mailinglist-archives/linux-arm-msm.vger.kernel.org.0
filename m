Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F092E7368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgL2UQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 03AA7223C8;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=YCYNeLG1UDNeDwMEZ0xgPCnIT9zDACxsiW75K8H7ttI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qKCYZZixOLRHfE+5uEnMLiiDh7Ra6z9jt/GM3nA+FMWCk5U9rC4V1Gk3+PMGzoMG6
         z/rk2nktL6kVjSFoIIpJfqhWR/dz8XQ0igYuRLDepofhNqGjVO98LuwpK5nDsvA2PP
         KLEUWVb0gTAMx6+5Pz7Airi5oKaqguFxw12YOCPpK6fibrt5v8fgfz2a85NOAa/p1y
         ClJ9PyV1iPSeW9tyNG1RQXI6sZCl/cVFG3bNdFR0IquH+j4iNL8kBpSHlVXrbAYEt3
         2IQswrROwZU3DSu4yWWPKiiotWoSfWu34GqgwP+P9WvRsmPxz3GyCwHupxyCWp+etU
         YoqUiPAqe8XAg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 001B9600D9;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] pinctrl: qcom: sm8250: Specify PDC map
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293099.13751.13775039488798315802.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201028152040.1142473-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201028152040.1142473-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 28 Oct 2020 08:20:40 -0700 you wrote:
> Specify the PDC mapping for SM8250, so that gpio interrupts are
> propertly mapped to the wakeup IRQs of the PDC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Resending this as it didn't seem to have hit the list.
> 
> [...]

Here is the summary with links:
  - [RESEND] pinctrl: qcom: sm8250: Specify PDC map
    https://git.kernel.org/qcom/c/b41efeed507a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


