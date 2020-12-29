Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC862E73E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgL2USx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgL2USx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FCEC23105;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=jfHyZVoW3YlFycFES5nZcSLYm5ENg9f5D4KMfa30+sY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dAoxnbPV6D3q0yT9Ml4c7yURM8H922Fi1idJF6RJnMs7m4S8S7LXnPvpiTRYzbYoH
         YHj82szsflnyzdqFT30Cefy+VWtzhmK0PUzqsSEb0ovjjDB05pi+2rRQaLtwmGVhlt
         3XZb4VmBLTsDWroBl6YolKBKjb9IxnaDaSfDKcU8kazXy0P4Ju4qvvnTl4DTRUEN/l
         VXj7LK/4E7WqwaR7AcaTDmUevsHsyCQwJzDYfkQJ8dqfF+4Otp+z8iQAFWOKFuCYEI
         UDV6Zru4QUNmWPkx+VixDkBm0f5dXvD7Hljo2e8t8cvN+u0di2q3A+hd0C2xbsON3Z
         SO27yhYU1mFMA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9B98060626;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] bus: mhi: core: Fix device hierarchy
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293663.13751.1595473237609725100.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 25 Nov 2020 14:24:49 +0100 you wrote:
> This patch fixes the hierarchical structure of MHI devices. Indeed,
> MHI client devices are directly 'enumerated' from the mhi controller
> and therefore must be direct descendants/children of their mhi
> controller device, in accordance with the Linux Device Model.
> 
> Today both MHI clients and controller devices are at the same level,
> this patch ensures that MHI controller is parent of its client devices.
> 
> [...]

Here is the summary with links:
  - [v5] bus: mhi: core: Fix device hierarchy
    https://git.kernel.org/qcom/c/10ea8bcda5ae

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


