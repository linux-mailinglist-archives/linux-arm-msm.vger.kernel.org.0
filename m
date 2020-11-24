Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111EE2C3460
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 00:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732188AbgKXXKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 18:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:33516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732189AbgKXXKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 18:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606259405;
        bh=Gz6s3iS7yf5h+tsiCwQtMOyRq7ef1jky2PWdzNtyi4A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DC9wajiOq14G1Zoqa8K0JE7bFMLw14p3yOeJRBc9vZuA8YxK2/A2K9HDeeF8h7gRM
         WROs0pYG1bby0seBWx/Gu/gbVEAkelRYJSr9bEherLOqTKXtyld3CQWDQe8luRp0Oh
         qdoWfMu4uMqJcZcG1/FtN2l89BdfZJsl/psWsFDY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling on
 SC7180-lite
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160625940546.12963.10816044899072687313.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 23:10:05 +0000
References: <1606198876-3515-1-git-send-email-sibis@codeaurora.org>
In-Reply-To: <1606198876-3515-1-git-send-email-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 11:51:15 +0530 you wrote:
> Tweak the DDR/L3 bandwidth votes on the lite variant of the SC7180 SoC
> since the gold cores only support frequencies upto 2.1 GHz.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> V2:
>  * Updated the lite ddr/l3 cpufreq map to have better power numbers with
>    similar perf.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] arm64: dts: qcom: sc7180-lite: Tweak DDR/L3 scaling on SC7180-lite
    https://git.kernel.org/qcom/c/8fd01e01fd6f
  - [v2,2/2] arm64: dts: qcom: sc7180: Add DDR/L3 votes for the pro variant
    https://git.kernel.org/qcom/c/3c9c31c2523e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


