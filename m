Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1C939204B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbhEZTFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235664AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 65C59613F1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=10GBDu3koPEaXlzcs9i19rnH4bEKd2l73byUHVlyd6w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RfeNkpawEIorEC0dboZT35gArQrVDiJ3QyRJZ95V8ME/Tvmfesu2d2ToVQu/ojRMe
         CpMlk9ZLZqjN/Jdd3ZTS+eBid8AP4woENCabDV8PFaQ8AJeXACMZj00VgByVvv6k35
         sXXKQ5b0BQmAnHN2STpkM0y1lsqR69SPYd0A3IazCa2WA2bIJTyBde3VOaChAEFDIf
         BlGyihlZslxyLAzOPNg0lSWsiSYH7U0dJmu4Q29YQ8JS6PImONb915r5GbTZdjwTev
         fuOp+EcyFfPSClIccU1CJ6Lqc094Rp8Ojc3SZ4TFrFxE5o4Z9Bb1Hl13suHTOiDdX1
         tkOMtBZUUVv+A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 61EE0609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active
 decimators
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580739.26840.14689410564414225448.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210304215646.17956-1-jonathan@marek.ca>
In-Reply-To: <20210304215646.17956-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Mar 2021 16:56:46 -0500 you wrote:
> An interface can have multiple decimators enabled, so loop over all active
> decimators. Otherwise only one channel will be unmuted, and other channels
> will be zero. This fixes recording from dual DMIC as a single two channel
> stream.
> 
> Also remove the now unused "active_decimator" field.
> 
> [...]

Here is the summary with links:
  - ASoC: codecs: lpass-va-macro: mute/unmute all active decimators
    https://git.kernel.org/qcom/c/5346f0e80b71

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


