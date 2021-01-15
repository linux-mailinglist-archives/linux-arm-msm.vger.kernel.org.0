Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4CA2F7ED0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732885AbhAOPAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:38468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732828AbhAOPAu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 47F2E2388B;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=vQMOuxDdhyLHeUi/BAtDqBW/tW5IFL3BQaGekMWCw7k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JwxT8wxblbgsVezH51OQaKEqwmlWZrtXNgRp8AtpBioq9U3ahhl5h61x9kbkyB04v
         pGW3v2sY4VI5e16LFnXct54lfN44X+2HiCEf82f+VNJJJKZx9OfJvTPvVpbT+LNJdF
         S6IrO5PRnanri4y0M4L3ZFPkPz2ILQDmDGAa/f/3zU462jNTnDWHSIUPVN37sDEN8E
         T2iJi00u4DYaKeid48i7ueTsSj+PzDWHb6OxdSnMIBiVFqYNoPYiaOaddvmPfRgLeI
         jnYXFrLphjdl5ucL0YJcixIsmGY8A67/IYu76ehajRCRcUZyDBz7e2+CKiU7ogJADG
         tjSGv4Uau29OA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 43E9E60156;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281027.19141.9003199541657681039.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20210111175358.97171-1-stephan@gerhold.net>
In-Reply-To: <20210111175358.97171-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 18:53:58 +0100 you wrote:
> When the BMC150 accelerometer/magnetometer was added to the device tree,
> the sensors were working without specifying any regulator supplies,
> likely because the regulators were on by default and then never turned off.
> 
> For some reason, this is no longer the case for pm8916_l17, which prevents
> the sensors from working in some cases.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916-samsung-a2015: Fix sensors
    https://git.kernel.org/qcom/c/3716a583fe0b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


