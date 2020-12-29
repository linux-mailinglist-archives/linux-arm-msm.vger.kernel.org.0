Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C162E7385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgL2URe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C84FB2251E;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=+11gfqhO87PQAckFChIejitAsezqrZ4VZR5Wr04j2Hs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fllDqfbL58xOAScyD4b+p6nbmmWjMyegDz4nX5ME95u4uMzZWGA48X3RHfTJrFWl9
         ASEgwD9TVqJehJAeRy1o03FGuuATuLhvNZoQzr6O+5i0VxDWR0ynL3OwzxlHFNvKNE
         fiIxWEcwCuTRk9QnqaHwIAyiyh8sf+6I7mF20/RvzSYnGhmDFh2TP37kBA4IzSsLF/
         dQVXWQU5zgDu/pwIwkzEdOfBsS7fcANRzRw78YqNXopZTweu6ZmzuWePZhbAXp+fWr
         wxavrXXXYIDCd8bPPOfLhfKIt5fmCXzaxMJYQdo/b7MzAuvT64a27z13890hf035HZ
         QkCvbW291u8xg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C44B3604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: Use NVM files based on SoC ID for WCN3991
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293179.13751.16189020989688198039.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <1605790449-7250-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1605790449-7250-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 19 Nov 2020 18:24:09 +0530 you wrote:
> This change will allow to use different NVM file based
> on WCN3991 BT SoC ID.Need to use different NVM file based on
> fab location for WCN3991 BT SoC.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c   | 36 ++++++++++++++++++++----------------
>  drivers/bluetooth/btqca.h   | 22 ++++++++++++++++++----
>  drivers/bluetooth/hci_qca.c |  9 ++++-----
>  3 files changed, 42 insertions(+), 25 deletions(-)

Here is the summary with links:
  - [v2] Bluetooth: Use NVM files based on SoC ID for WCN3991
    https://git.kernel.org/qcom/c/059924fdf6c1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


