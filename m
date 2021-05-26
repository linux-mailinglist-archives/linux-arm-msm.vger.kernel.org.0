Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A98C392053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234588AbhEZTFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235809AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A1288615A0;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=3hMxEGoyW7OclA5SKNvwVOLY/wDAVs1jeFoFU2KyO4M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CuAXZkd/taWL0Aav28obGCbAtadwvU5iu0R9xv66cehAEQ4UnVtmGmoV7/2SU+g8R
         mQ9Lr9ttlEWfKtxMMKdNYc+a/L82tBg1ZN9omNWi4XDL5BndY/cfvAjAgOoyoQ9N3h
         3foxPBrhKm9XLrBu5Z8n/LqoNFC932hKt615u8S5t4PYFG5Co+XsLs0gjWreoaMZAW
         ZVDQhKX47HxeGrb7G30yCoHinAgfQcquSYmvIWuAwe6isVAKbZ4uRL77SHcPcqRl/k
         e3mjqWqs2CSrhfeq4sMpd0LmlpV6E8xBU6ZmqiHTOnEwOV31J8GoXGYpULe7Bde0FK
         A4DnZQZ0Atn2Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9D7A3609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH]  thermal: qcom: add missing put_device() call in
 init_common()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580764.26840.187510569697242519.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1616465387-2973-1-git-send-email-dj0227@163.com>
In-Reply-To: <1616465387-2973-1-git-send-email-dj0227@163.com>
To:     Jian Dong <dj0227@163.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 23 Mar 2021 10:09:47 +0800 you wrote:
> From: Jian Dong <dongjian@yulong.com>
> 
>  Fixes coccicheck ERROR:
> 
>  drivers/thermal/qcom/tsens.c:759:4-10: ERROR: missing put_device;
>  call of_find_device_by_node on line 715, but without a corresponding
>  object release within this function.
> 
> [...]

Here is the summary with links:
  - thermal: qcom: add missing put_device() call in init_common()
    https://git.kernel.org/qcom/c/f4136863e889

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


