Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28952E736A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgL2UQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id ECA26222F9;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=G5SnibYuy2sNQADwCLWlafuUrN56jgqqcowtn4385bA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pwRbdn2MQuTEAw98j5hPUR3RuKLm6bSkjalfeq9AI4WZtGWn/p5H/T7COMtNrzVFf
         AxUnVPzpfgCwHhgXCbJ6uGi70PbrshDATTVmLJZsA3eghoTU8bH1WtnSmB0o0FYz+G
         3qim9ZCwJ6GE3/W4Um0zisMMfglL/LaFk/px7ej9310hrZzzjqH38UnBeXPUy+Wjq+
         x1Gl5CPg/PsvVLpII0T+KJyUy55h+9wHyzD2hxazkE9vaslIZwmR/Uts7LIyne9eCS
         r48KApXMg9oXTo8OG/9v0Ir15khWF8cqUMyR+H449XFgAWFQyxt7kCyQRjb07zWrUb
         gxvcJ75jZ415g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E8C86604D7;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add entry for Qualcomm IPQ4019 USB PHY
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293094.13751.7265089028644205591.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201016204610.2406075-1-robert.marko@sartura.hr>
In-Reply-To: <20201016204610.2406075-1-robert.marko@sartura.hr>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Oct 2020 22:46:10 +0200 you wrote:
> Add maintainers entry for the Qualcomm IPQ4019 USB PHY driver.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Here is the summary with links:
  - MAINTAINERS: Add entry for Qualcomm IPQ4019 USB PHY
    https://git.kernel.org/qcom/c/c36f74566cef

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


