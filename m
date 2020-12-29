Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E962E7380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgL2URd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4B8752246B;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=jmdCjSJC+U2+juhRaZNfDZngfElYfX/2uEtpvpu+zuc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q4wvMUQwnJiLhneA6qq7U2pClEr16B7/n+5kl68GqrQT65hg4bxlYxNXYXHg3Csh3
         qwN/MuTocTEe3nTEgRktF+LFPqN2JN606SvGyppF6AY+4efApfKZLgGN82psAsJm+0
         OC+UuZV0SxxY8d/weIFg1DL8UmSdY6dHqOC19AOZB2mbrosUANhfM6Y57k/lBKaOu4
         EryyBP3Ko2fZlOB+C1uOEwOUbu7H03EmDl8JT7Y0UMsGpWm8eLegR7FCVKfuGwjwm6
         x3YdeVD8R85FmaF5Tyk7XXYalmYOCb0wue5ziBrI/Lx5Gjlr74yuOfo3cIcvR58jm9
         VdEMLUDg/vwHw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 45AB9600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] spmi: fix some coding style issues at the spmi core
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293128.13751.12519884509641409284.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <2736eaf03a5b8bf3aa4566198a98f3d2073d0070.1597236805.git.mchehab+huawei@kernel.org>
In-Reply-To: <2736eaf03a5b8bf3aa4566198a98f3d2073d0070.1597236805.git.mchehab+huawei@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 12 Aug 2020 14:53:27 +0200 you wrote:
> While preparing to port the HiSilicon 6421v600 SPMI driver,
> I noticed some coding style issues at the SPMI core.
> 
> Address them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> [...]

Here is the summary with links:
  - spmi: fix some coding style issues at the spmi core
    https://git.kernel.org/qcom/c/0be0a733c9cd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


