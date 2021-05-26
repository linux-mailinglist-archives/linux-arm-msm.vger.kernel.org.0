Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D4A391FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbhEZTFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235664AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 806FE610A5;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=DpA+w90IQKsqxPQILPNw/f+hVoWSsaOPfzXEJL0ogvY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X/ABPSuM/Ya9u0IzPMlZAWQyP5PjhGbtlu30gIG4G74diVVqMy24tN6fklU6Sd1G+
         ywxP2c9o6UyWx/4sv+kf8O5pY9L0lnYEAJocDg+JUgGDlTV7p7nMOdgho4AfF/9W7f
         T8ARcN3f6hIBqlaiD1mZiHcWTc3ZGxu0MXHXJTO3UCbFRq7MLCMJmDBdG8dc9xTu51
         gPDfI4XYKWML2VoJqZNHHTlNIH3jrR8S0pC0x+z/t+1XzLGIbD6sQpwfaKxnwOhkx+
         0c6seJbhNyGV80e8Gd5LfD8o30AJjZbfWXhWw6Strlvrlcg7BLjUl3s93QpntxPkva
         dkctAMjA1oOVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C21B60CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] rpmsg: enable the use of the rpmsg_char device for the
 Virtio backend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580450.26840.3762629489850728170.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 15:04:07 +0100 you wrote:
> This series is the first step in the division of the series:
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend.
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> [...]

Here is the summary with links:
  - [1/6] rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
    https://git.kernel.org/qcom/c/60d7b22d2593
  - [2/6] rpmsg: Move RPMSG_ADDR_ANY in user API
    https://git.kernel.org/qcom/c/3093c3c7c136
  - [3/6] rpmsg: Add short description of the IOCTL defined in UAPI.
    https://git.kernel.org/qcom/c/809328b40cfb
  - [4/6] rpmsg: char: Use rpmsg_sendto to specify the message destination address
    https://git.kernel.org/qcom/c/b4ce7e2ebcc5
  - [5/6] rpmsg: virtio: Register the rpmsg_char device
    https://git.kernel.org/qcom/c/c486682ae1e2
  - [6/6] rpmsg: char: Return an error if device already open
    https://git.kernel.org/qcom/c/964e8bedd5a1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


