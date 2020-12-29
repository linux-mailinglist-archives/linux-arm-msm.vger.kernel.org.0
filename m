Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD822E73DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgL2USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbgL2USk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 30581230FA;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=uHIFFsdm/hWLnPUdeA2XUjwn6X2GW13WbNaZ0jXjWmM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZgpL1bpwflJvWITDgyR1fHXMmaf+wkmaLPxeCIzelCuRpw7/JOBjtP7Oe6BLVJ6H8
         vWN1FvlcBAqNjwVM6eIfJRm6AK8pY0Ho/ObvD0cLnOCyrUsbMk4ALIpR9qonNqjDUd
         bNFlqx2nYou0wOJczBOr8/TAERxs/gxJ+RcnRPpHA57Rq8MXsaeLD63lcBy1QhzQcc
         f0WSUR3zaQmfpedsHMizNv+mZNGOIL2Xm05FOh3Wfk6Ary/GSS+bOLwt4Inko5P9rY
         p+av7fUEYbtg6Tlv//7nK1ExnWBMs5BY5N8j3UhtXbkYbnpbjVH4CtvXL9AGF9/uM9
         Qr5+HakThsSzQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2BFB460591;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drivers: qcom: rpmh-rsc: Do not read back the register
 write on trigger
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293617.13751.12865617579431568752.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1609230801-31721-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1609230801-31721-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 29 Dec 2020 14:03:21 +0530 you wrote:
> From: Lina Iyer <ilina@codeaurora.org>
> 
> When triggering a TCS to send its contents, reading back the trigger
> value may return an incorrect value. That is because, writing the
> trigger may raise an interrupt which could be handled immediately and
> the trigger value could be reset in the interrupt handler.
> 
> [...]

Here is the summary with links:
  - [v2] drivers: qcom: rpmh-rsc: Do not read back the register write on trigger
    https://git.kernel.org/qcom/c/e1d8008179fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


