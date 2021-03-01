Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9023292E8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237515AbhCAUzN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:56492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243735AbhCAUuw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BA7D764F17;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=VP0jTa8TgWjupbwm3lBks1oliHgR79NtW7yVfbZX5VI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tDQEY9ZAQTFQ99qeE9cYKrNiNtVad7guvHVPlfePwDGBNWkz1auJ00HJYlTLdnmQq
         By/fzOkhZ8cMD5k14oTTdyIueamHZyU0q2Cl7UfC0LKa53p/LFpypF4DI9CFECS4RQ
         0p9ZYOlM3a1UdMCEtSNeXR7d42bIjSEKvmb6RULUD9RJDu4uIoosuCtjYxkEIrjPZq
         j0S31TlD4eewRP2E3J/QG2I1ItJ87Z/hWH+y/GkSJ4HRN9mkwBmPV+GIqh4rnwpozi
         nKkDCYZdyUMPtqVSKiXFgvo0FgAAWm1d9aNDNmri/XOqwTqKknAuVbNa33DDsNdZqf
         9pFk2q3FjJ8yg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B37A960997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: hci_qca:Fixed issue during suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878473.6187.12509611824145461237.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1612539436-8498-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Feb 2021 21:07:16 +0530 you wrote:
> If BT SoC is running with ROM FW then just return in
> qca_suspend function as ROM FW does not support
> in-band sleep.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: hci_qca:Fixed issue during suspend
    https://git.kernel.org/qcom/c/55c0bd77479b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


