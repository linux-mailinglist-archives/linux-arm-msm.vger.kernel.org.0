Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD4C430D10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 02:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242921AbhJRAWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 20:22:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242859AbhJRAWT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 20:22:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3532660FF2;
        Mon, 18 Oct 2021 00:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634516409;
        bh=RiSTPjEN7415SIfc75ppR4Q1IanL4HFXKH+jkk04i0I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nwupJ5u2Ft/+Lafrkj7ElYyK8+pb6wuzfEhd6mKJq5yGxzw+PVxNBK2khgIU5mf69
         vI8rL0L6BidLT9EIek50ASpaEGdsJvfdAvk52ssn4VOBWIyxzPZL74WFHssvVZVXbe
         2QjmJkUKhr4mk6Nvi8/Q+kgriQkAE+pYxrVJxyYnEgQTxPgqQCkLfyntvjru89fk8e
         BhY9gmiZuZEI1lKR/tdUJJyjGtNTn0YFGhfn1drr5xaHKk5YBCWrCLqgE7Vq1CzOEt
         f714Ppec2z3iznUWoE+fiPbjk7TpjuF8436v7KOfHiexpTG/MXqGnmY0X7kLY/JnNX
         gRK6CdOFTXeOw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2336B60A39;
        Mon, 18 Oct 2021 00:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: add feature negotiation and ssr ack
 feature support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163451640913.26086.15945413034340290246.git-patchwork-notify@kernel.org>
Date:   Mon, 18 Oct 2021 00:20:09 +0000
References: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
In-Reply-To: <1633450403-21281-1-git-send-email-deesin@codeaurora.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue,  5 Oct 2021 21:43:23 +0530 you wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> This patch adds feature negotiation and ssr ack feature between
> local host and remote processor. Local host can negotiate on common
> features supported with remote processor.
> 
> When ssr ack feature bit is set, the remote processor will tell local
> host when it is reinitialized. All clients registered for falling edge
> interrupts will be notified when the smp2p entries are cleared for ssr.
> 
> [...]

Here is the summary with links:
  - [V2,1/1] soc: qcom: smp2p: add feature negotiation and ssr ack feature support
    https://git.kernel.org/qcom/c/85f755083b23

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


