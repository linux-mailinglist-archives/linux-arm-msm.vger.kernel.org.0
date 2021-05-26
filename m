Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA58392058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhEZTFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235828AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BAE8F61613;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=DnfK2A7UJmV5kivcCGzXTiGkri6ip8G5jCAUOVeXVgw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sn9aSyGHucWBA0WK7k9yXqTlaRxLga/UMGWYN5ijtly8h9EDyfgwmRHY/xG3r72Hq
         YAz1YNWL30GL6wCMTo9NIfE20sA3RTezRWvnXJHvAz4PMEqimuEbY3yJbA8luXK1s6
         s8MFuxPRnRldnS3gwzYULi+SZHZEAO38RCEWY3tj73FQRuqysWZ6kRokdoJhxUywiu
         YpIkh8HjFW+MjEqCmDTaChJoAVbVkpr1NdtllyyS6V3L86iXEO/FtfQJ7K5/f1y8Hr
         NRvamkftpktfVj8T3Rwg0fO4rtkJJPWMJhNHvpjGj+wBP4SNe07Dd/vedHY01Dj/Jc
         sPTQ3Q9X1bYQg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B71F460CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mhi_bus: core: Return EAGAIN if MHI ring is full
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580774.26840.17368843325015663414.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1613509415-23191-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1613509415-23191-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Feb 2021 14:03:35 -0700 you wrote:
> From: Fan Wu <wufan@codeaurora.org>
> 
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EAGAIN instead.
> 
> Signed-off-by: Fan Wu <wufan@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] mhi_bus: core: Return EAGAIN if MHI ring is full
    https://git.kernel.org/qcom/c/68731852f6e5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


