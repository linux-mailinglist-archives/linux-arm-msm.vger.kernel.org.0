Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F97C2E73C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbgL2USZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgL2USY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 228DA22D3E;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=NV0yNEQ1xCYG86+ZNgzwJdEFCmTPCXBHHduaTR22Ca0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Wmy8ujFu6H8pEtnk3xQMGUpn0o19SMANIiJrYidZRFTPKg3Xws37CnTMcmLDJtDXy
         h3CAkWeBHKXkuwQ8YxmCOLZS/ftOyq0E0pGC8vV//UP6D7j8+BSA8M7KSlBrcRF1ON
         OeXy8F3hDvrgq93QYaOu1yGwDYjWgK7m/sUvg/BzOYyGcaugjS+hsinAbJvbeFy/Ae
         eKOdlYhbYmV0GXy2jfe9fmtPfSJdRyTugB5CrE8r2zBfLZKHnas8euTfFQy1g21EOb
         X/NbpFGVqNVOh+ALQKMzvar2acPCUz//0+IXqwRxPpLyfZ8RfkGIX4S9CqoT5QrCq1
         1Xn765kBaZLxQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1F24B60591;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293512.13751.16976456809248414774.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201031121115.542752-1-robert.marko@sartura.hr>
In-Reply-To: <20201031121115.542752-1-robert.marko@sartura.hr>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 31 Oct 2020 13:11:15 +0100 you wrote:
> If the watchdog hardware is enabled/running during boot, e.g.
> due to a boot loader configuring it, we must tell the
> watchdog framework about this fact so that it can ping the
> watchdog until userspace opens the device and takes over
> control.
> 
> Do so using the WDOG_HW_RUNNING flag that exists for exactly
> that use-case.
> 
> [...]

Here is the summary with links:
  - [v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when appropriate
    https://git.kernel.org/qcom/c/8650d0f9e933

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


