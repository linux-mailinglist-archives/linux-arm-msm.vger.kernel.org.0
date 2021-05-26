Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0CC5392051
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235661AbhEZTFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235327AbhEZTFP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8691861582;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=CP65hpXsdoMYdO+ALCPnuh3FnFCZCSTUuj2JjJVgf7w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LXzx1JkBPHSmOMQRJdvB3knZB4HFFujiDWJ5PYoMacl49Wz6ZycRSXL5mQ92j9yle
         6AIiz/dqYcEoSYf6sFUJbggz1B7CJzU8hE/SbbdCEuUnvQJBse3h0OxWJp0srkyqc1
         sxeSuvuKbCXgxYruYhjp0lh/S9UQLoaCmgtnAikibOjIRnNMFzHI7m79V1jTDqXbX1
         fbtv6x/mxU4jP66mIJyAq7A97T6kCM5ZE6dvBx7l99xE3BmZ6wuTsXTlX+dnSDL9K9
         GMFQjv+vZGWF7dWwmI62hduWo6bjmsbeFS+kvNWMxAYQnvkssu/We5pJvlEBvaB3zx
         HAejtLona3iVA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8269860C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] use RT_PROPERTIES table to implement efi=novamap
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580752.26840.15201584339136836889.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210305093958.187358-1-ardb@kernel.org>
In-Reply-To: <20210305093958.187358-1-ardb@kernel.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Mar 2021 10:39:57 +0100 you wrote:
> This patch addresses an oversight on my part when I implemented Linux
> side support for the EFI RT properties table: SetVirtualAddressMap() is
> itself a runtime service which is only callable at runtime to begin with,
> and so the EFI stub should only call it if it is not marked as unsupported.
> 
> This may be useful for the Snapdragon EFI based laptops, which already rely
> on a special EFI driver to expose the correct DT based on metadata exposed
> by EFI. These systems ship with a broken implementation of SetVirtualAddressMap,
> which is currently being worked around by passing efi=novamap on the kernel.
> command line.
> 
> [...]

Here is the summary with links:
  - [1/1] efi: stub: omit SetVirtualAddressMap() if marked unsupported in RT_PROP table
    https://git.kernel.org/qcom/c/9e9888a0fe97

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


