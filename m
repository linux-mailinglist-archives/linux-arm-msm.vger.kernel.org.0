Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6EB23292F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbhCAU4M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:55962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242557AbhCAUvg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2EE3564F27;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=SIhqAlPHpgqvCp0w1+trvbMoq6pCue+cNc8RQLnikKI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=f1mlasnX2W0nsbY4SaV36f2EEOcMMHxHD2fZKeFC4Ulf/o7v9cqit6GUbAsxwNKnU
         Z44UXpP5f9SzczYcxErx6aKz3/Tu66yOhc9f+TwVd8ettfByMBYF7n+P21lXMFTRxf
         19Xpzx+Yclci/0luqD7LGZ+PlcMxp7n8Qzicwc07MRh5YnKNrqJ16GkzR961rpImUJ
         TAuoMm100FQrtJTFFel6O+V/xJFkzePpsRtYIqvYzB8TEoNsjFLkw+66sNa/giMAay
         8VmAUwEF38Nrp09ONhQ574UcaotqWLNxK+79lywXsl8bUxK0EXrEmrV0fGegqbGW5v
         n1p6RwNkUqGSA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2936E60A1B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Revert "i2c: i2c-qcom-geni: Add shutdown callback for i2c"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878516.6187.16793013419832352282.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210224092313.2238-1-wsa@kernel.org>
In-Reply-To: <20210224092313.2238-1-wsa@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Feb 2021 10:23:13 +0100 you wrote:
> This reverts commit e0371298ddc51761be257698554ea507ac8bf831. It was
> accidently applied despite discussion still going on.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 34 ------------------------------
>  1 file changed, 34 deletions(-)

Here is the summary with links:
  - Revert "i2c: i2c-qcom-geni: Add shutdown callback for i2c"
    https://git.kernel.org/qcom/c/e87cc183cbff

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


