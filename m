Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10521392002
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235814AbhEZTFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235716AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D58D3613DD;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=dm28mEwLygzYZqSvEcE48zKbtETlqic3pSX2LBBjT1s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BPYkR3N4gQSrMHHKp8OVTUV+MCZhHh6fBVTsdqz8P7r2ko3wmbuvBzt2vgCMT4cHi
         uhhalBHg76S0S2e/aoEGGYTIO1+bCC/WAdRxnc3Ya9TP/NZrJ2z8qdpyNGHr2AkNHg
         nB0ZeObAqU6vq4luI5BNtgmDNIEH5zDGuJsIGtGT7CLiSSDvDa2gHpHS1NyheFygaI
         lPOTCyzTVlbplrJJXtB3/kuH26T3fR5TMWXbK7gZ2ZSbXJN8mJQhCp7UHm2t9Ml3Xm
         +q5+kFVypyaKri/mNsZ62ifq/aWzu7Ys8uNa1JyxHEMeN5UAcIJIizlcNXfS//i6Zz
         szwdEkac4YMMQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D0E7060CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] media: venus: core,pm: fix potential infinite loop
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580485.26840.9249897800201459700.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210407134831.494351-1-colin.king@canonical.com>
In-Reply-To: <20210407134831.494351-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Apr 2021 14:48:31 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The for-loop iterates with a u8 loop counter i and compares this
> with the loop upper limit of res->resets_num which is an unsigned
> int type.  There is a potential infinite loop if res->resets_num
> is larger than the u8 loop counter i. Fix this by making the loop
> counter the same type as res->resets_num.
> 
> [...]

Here is the summary with links:
  - [next] media: venus: core,pm: fix potential infinite loop
    https://git.kernel.org/qcom/c/999267d07240

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


