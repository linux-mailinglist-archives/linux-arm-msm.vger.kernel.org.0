Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF2E2E7396
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgL2URt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0DDAE22B49;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=Vbk2IrChWrhcysEKWF+MAtcdZHEVH1akZmwbrSSGZ0g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mx0VsIa+zG7CSn2gw3uUYGia+/OUcissaR5nUHOKYEhyAW15G0ngXfIyz1VP/jNQz
         sFB8+6ekNKIKoCNKACpD5xmS4xmfnKlfj+UjFW4ZvsD5epWmgtB7b9UO9ilLha1Piu
         QPl2trW9QlBUwrnSajbxLnjNPCSWVijLhIYiGLFUBMNtVcYI8002x/2fBPtgoQ8Qnw
         tdcp6rWkdMDTiBEYL5t1Hy5rn+DKZRtdhxYm15zsyzQDYRQ6/zQT96Iz8LtmyxONL2
         u9M4taOra+2/vUhKMSEUD1t0CAyUQ48P9i5f8Px2CwT1gVo8nAsWeu/f+nf+SL3n+b
         sZWHUvfXZcqkQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 098F660591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: patch "MAINTAINERS: Mark SPMI as maintained" added to
 char-misc-testing
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293303.13751.16625608605212076693.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <160753959880121@kroah.com>
In-Reply-To: <160753959880121@kroah.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 09 Dec 2020 19:46:38 +0100 you wrote:
> This is a note to let you know that I've just added the patch titled
> 
>     MAINTAINERS: Mark SPMI as maintained
> 
> to my char-misc git tree which can be found at
>     git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> in the char-misc-testing branch.
> 
> [...]

Here is the summary with links:
  - patch "MAINTAINERS: Mark SPMI as maintained" added to char-misc-testing
    https://git.kernel.org/qcom/c/aec273a3191e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


