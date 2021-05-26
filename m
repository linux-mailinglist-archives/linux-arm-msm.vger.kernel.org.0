Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9395C391FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235625AbhEZTE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235276AbhEZTEz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B7E46613DA;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=aaz8Uh6VaGKJn3a0FH9vIn1PstnElEj8Vl9wnSbwzdY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CjQP3d+kzShWNB84fLynwh9IM0c7P9Nva6Z+SbgUUp1u9manUQyR+AgNrtUBN5xw5
         7JJDJih+ywDbzPc+dJDjwVBtBGxbmn/2JC635WnzDmdIXmCYaLG2vvbXycjpdfU13H
         fbFj1VOtZNfowQb+2Q0i3V44EVzmGNod+AmQY9DNexR9BgKEsXG3W0fgY9EzJ4EgE8
         Bptq0KnjO3mdHqOPQUQc57pKcf6RWZdcTJ3HrpOpjmoho0Xla5eV/S0TKMT71+V9lO
         MBqieY8WbGUAsud+HtMMA+wY9nTLPfpSBdxqUXUi8MF8u9938TfsT8J63Df3iQuU+d
         7mugZMRzSiigw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B01CD60CE1;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] drm/msm/dp: Fix indentation kbot warnings in DP driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580371.26840.13646709071500682649.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
In-Reply-To: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Mar 2021 11:17:17 -0800 you wrote:
> Fix a couple of indentation warnings reported by
> kbot across MSM DP driver:
> 
> New smatch warnings:
> drivers/gpu/drm/msm/dp/dp_debug.c:229 dp_test_data_show()
> warn: inconsistent indenting
> 
> [...]

Here is the summary with links:
  - [1/3] drm/msm/dp: Fix indentation kbot warnings in DP driver
    https://git.kernel.org/qcom/c/86bf254549ba
  - [2/3] drm/msm/dp: Fix incorrect NULL check kbot warnings in DP driver
    https://git.kernel.org/qcom/c/7d649cfe0314
  - [3/3] drm/msm/dp: delete unnecessary debugfs error handling
    https://git.kernel.org/qcom/c/cb3fd74a03e8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


