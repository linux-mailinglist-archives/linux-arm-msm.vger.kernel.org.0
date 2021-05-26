Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10B4392046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbhEZTFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235816AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1A5C8613DA;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=b17xViyF5d57Dmve45zYdRnAtuzCj+d816wrBn0k3ZQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qH6OiP65jwLkYMJXnt0bITeI2cKUxPjV1MixATxwKmHFixdwJ5B+u9rx+DNaT3UHU
         OI/QPkOJGFq0SVg32MJK+oSj0gl7WTA+G2yXNEKlsjEQiM3Y9vnjfMvh8dPlDdj7I7
         Q/J1NDAdVa2zVIHSpuqr/kX7he3fDbFy+LYIy57fKc0SUWoUEokC/VKj09PRBSyeCs
         3zBU5Z4rl1k8RVIAh0DB5cIo5M9yQxMF3sbWmTbr1b3XndKOc86GqyMUP/ySccGMkF
         iKHqTqhNYcy0QUq9Q8pOnd5V2zLJDNeoPan4oS59leQtK4uBSul3X+UdGZXy4eiyYO
         K9exywklXDhNw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 15D0A60C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pil_info: avoid 64-bit division
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580708.26840.17358409105062506242.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210103135628.3702427-1-arnd@kernel.org>
In-Reply-To: <20210103135628.3702427-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  3 Jan 2021 14:56:12 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On 32-bit machines with 64-bit resource_size_t, the driver causes
> a link failure because of the 64-bit division:
> 
> arm-linux-gnueabi-ld: drivers/remoteproc/qcom_pil_info.o: in function `qcom_pil_info_store':
> qcom_pil_info.c:(.text+0x1ec): undefined reference to `__aeabi_uldivmod'
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: pil_info: avoid 64-bit division
    https://git.kernel.org/qcom/c/7029e7830277

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


