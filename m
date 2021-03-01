Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11A13292B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242912AbhCAUu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:55056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242827AbhCAUro (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D851E64EEE;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=hr+5sZCnsErnOnpY5LBXkzgEJlWY/c+yeeWl5ldwZjo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hPhpIhsrUJNrbZL+O3SFuLVbN9wuj6oE51DsEUkDUnT1npEnWPZbpwEUkcg+fnrDl
         +5VuRouwmdyvPFQUjEzM68ytdMBGJuzTQQXutNIuXmqQrwXn6cXSjuQcLTRVQNtAoI
         0oGaDzUj2CbodvgvWy6GWxtDbKSsu/OIcMQauHcgnzZ5AL1UcgxyHfJBYJJBmPDMAE
         X7Dp5R1aY+secf6YiEnSdG7311mvO7p/qCZYh1QQSzkLQpqALJrphhKo47uaU5nPUR
         YskRgwQ5SgII4kITsTA0XcQIEK+I/1J9OwFEAEvD8h5oh8nyvna3KER3HaS8A6zAxm
         JOK6uwmCt7M4Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D452760C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: remove unneeded semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878386.6187.12559417934027688802.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1608983080-53515-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1608983080-53515-1-git-send-email-tiantao6@hisilicon.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 26 Dec 2020 19:44:40 +0800 you wrote:
> Fix the following warning:
> drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/dp: remove unneeded semicolon
    https://git.kernel.org/qcom/c/a014abfec541

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


