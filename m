Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA2A39204F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhEZTFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235821AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5E61D613E5;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=UCgkj8IP+WaVb3CNTgQKgk89ruex9wEzFt6Gkkqb73I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UEAgKve3jMzZDAzrJ+aOhybiD4xqJVa5DJQZ46jBfpOMmZ+nHGuet1KcEgwsIyZyI
         +WDZauNXooSR3+yBcPkHoPYUWDpADjRznn5g5vHbERcBLwx+rPa1sfpAgnzCaTenJa
         P3Be7eHFf3BHQjbyQFZpdlDiLdAJV8hApK//IuTNqohxCyCcdg02PljjtApvvB1uTR
         XpaUhneY3nUWW3AGYgiZ/UvTZzpmlgfK9CWq1dNf1Fx/P5I+uym1K+L2tgeZaoIlaF
         pWmx7Wq4T2QRVAqD4Jjl/csw6ctG18JE8uZJi4sXZ3dS6Gk2vUyszJvNSYnRW2Ff5v
         lI8PATFVZQ2Vg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 59A9F60C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] bus: mhi: core: Sanity check values from remote device
 before use
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580736.26840.10114724449133441202.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1615411855-15053-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1615411855-15053-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Mar 2021 14:30:55 -0700 you wrote:
> When parsing the structures in the shared memory, there are values which
> come from the remote device.  For example, a transfer completion event
> will have a pointer to the tre in the relevant channel's transfer ring.
> As another example, event ring elements may specify a channel in which
> the event occurred, however the specified channel value may not be valid
> as no channel is defined at that index even though the index may be less
> than the maximum allowed index.  Such values should be considered to be
> untrusted, and validated before use.  If we blindly use such values, we
> may access invalid data or crash if the values are corrupted.
> 
> [...]

Here is the summary with links:
  - [v3] bus: mhi: core: Sanity check values from remote device before use
    https://git.kernel.org/qcom/c/ec32332df764

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


