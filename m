Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B742C1C8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728664AbgKXEKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728711AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191009;
        bh=R/pduMu6cLzjRrl0xAoRWImLmImMbDJ4SXUO8Y4w9c4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=1PXGtRPvqdP62C5TLEAr45uhV5fK+3dB5AeP+v5iIZ/CigqHb+NBNRqIhFxYYF5fM
         OhFf69DlJLVMv/moCaQ9dPZHTzAyZMMxR/uSCPER77ZqlvxE9F4VV06lBbqhCwQPLY
         wzH7iiKWLk45BYdWbqtRFaniiO1Mu99teAQwR4Pg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: initialize local variable
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100896.17117.7015506807433138925.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20200819184637.15648-1-trix@redhat.com>
In-Reply-To: <20200819184637.15648-1-trix@redhat.com>
To:     Tom Rix <trix@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 19 Aug 2020 11:46:37 -0700 you wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis reports this problem
> 
> pdr_interface.c:596:6: warning: Branch condition evaluates
>   to a garbage value
>         if (!req.service_path[0])
>             ^~~~~~~~~~~~~~~~~~~~
> 
> [...]

Here is the summary with links:
  - soc: qcom: initialize local variable
    https://git.kernel.org/qcom/c/a161ffe4b877

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


