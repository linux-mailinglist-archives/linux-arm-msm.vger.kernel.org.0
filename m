Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F15D392006
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbhEZTFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235705AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C276D61445;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=gi8gxfV0K15m1S7vraZO/snxbP8km5BThuB9nfLe7d4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Om2mldZqGxxLPrYI5YBM+HjomSeogAL1mN80vBbLJS8+2EID8125IVGt1C3FkjzRJ
         SBadXMYwBNw0WUJ83BIx0Lt17E/WHw5dG+2hZKZn/Sv+bPIDLEi6r5mW157QLfQrZ1
         9IZq9JMeSD0yvGRqgGMh4QR1ttrK9EW6g4rmdDQ9OUQuLE2U8oLVkgHZL2UwMx8MNX
         xGXx/0cHO9QhpAGd51sJ+lPezm1Sfha1aOF/FtPbbRRqK0LJmg0DTd/5Atk3NL0jMv
         AGiTLV9WNqTPobXfOzPjOd4sJFrxcBfSuGIfSI0KcXpyUaqjyoC7zRXe94zaPuEH2E
         0LCIK9IVoGQAw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BE11260C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi: Uncomment core_mmss clock for MSM8996
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580477.26840.3124626384628192112.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210228124328.136397-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210228124328.136397-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 28 Feb 2021 13:43:26 +0100 you wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The MSM8996 core_mmss clock was commented out due to some
> strange issues that others were experiencing.
> 
> At least SONY Tone family is working perfectly fine with this clock
> declared and gets it up and running without any error.
> 
> [...]

Here is the summary with links:
  - drm/msm/dsi: Uncomment core_mmss clock for MSM8996
    https://git.kernel.org/qcom/c/0340e8123faf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


