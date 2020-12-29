Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63EAA2E7397
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgL2URt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726470AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 18E6422B30;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=3XZ3iYvevt8cNQXRagRUO+2+/PjokJFG7PHChKb/TII=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BfWr2rHuoc7ohy9uHxsQQSIvdZeuFR/dFXfy21yYST6EbayoxrewSN8377JURn0+I
         Dh6GDFpmFnhomzBj6VfUiR+5/rXgSoVlpCKc9j9U/ybhgqWmx44VPfEOkucyPE9bpm
         72G9yGMQFBrm6SZaW+SFw8Yr4lrLxqrlNQNCiekD4OxG6I3jBNICNL5RcM0nes2Q4X
         g1wFXPFFmyLNjR4OXbK620yROZkKCJ1Vhsje3wmFH7qCMEy4yD6eQoMW2n7O2F9K0O
         vzZj99XjAKUP/bcCwVoJYuE/k/4Q8Au3unEAuDlepsoOlx8CiJ4Gdc92JaZyHv8yOr
         dwCZ/DPtoP2eQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1435B60626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: patch "MAINTAINERS: Mark SPMI as maintained" added to char-misc-next
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293307.13751.8594303628756470514.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <160759075294188@kroah.com>
In-Reply-To: <160759075294188@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 10 Dec 2020 09:59:12 +0100 you wrote:
> This is a note to let you know that I've just added the patch titled
> 
>     MAINTAINERS: Mark SPMI as maintained
> 
> to my char-misc git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> in the char-misc-next branch.
> 
> [...]

Here is the summary with links:
  - patch "MAINTAINERS: Mark SPMI as maintained" added to char-misc-next
    https://git.kernel.org/qcom/c/aec273a3191e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


