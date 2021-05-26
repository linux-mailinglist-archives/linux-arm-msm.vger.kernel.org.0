Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89305392028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235360AbhEZTF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233646AbhEZTFF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 054436142D;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=WO0DeZiPMt61eje07poGuzK92TPWEHvLoRZlRZqQ0v0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X4+lnhX1DHCc3nkhdBguXJAnIoRDfAdpuoxbz2XpYaQcLlYSwkPel/iAObeEuEO+o
         sEQ7IEHGzdlaUr9B790nALNay512xhlGZfuBzEjABmmLbZsyXZ0ZmVU1GVnC61iuo0
         d8ylk0ZFp3NFsfJfVWLNw97X4jYVIhbiBeAyLZEqa1H6CYOQPdkIvjafpnRH69FXbG
         KVLcCxQJvn3Uo4Y2p6s4nDMSaPnvAQEYXeCHGyzefgnrtWmkxudjsFYRoPux4Yg/wx
         TibR3GZx3Ez9ylKvVj+LXFcAyYWExF4nCc70VRou5VdzEndmhfsrnjC7KXYuyy+Jlv
         CO9z3jWLTS2cQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 00C26609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] thermal: qcom: tsens_v1: Enable sensor 3 on MSM8976
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580599.26840.2227102985227640460.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210225213119.116550-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210225213119.116550-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Feb 2021 22:31:19 +0100 you wrote:
> The sensor *is* in fact used and does report temperature.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/thermal/qcom/tsens-v1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - thermal: qcom: tsens_v1: Enable sensor 3 on MSM8976
    https://git.kernel.org/qcom/c/007d81a4519f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


