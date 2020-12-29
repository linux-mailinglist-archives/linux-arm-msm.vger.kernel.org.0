Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3261A2E73CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgL2US1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8CF6122D72;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=TKBkPNJvlQ37AzX0QOXJoynisMfp2nIsgFz/umwzI30=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ek9fdIRlTVgKW1CPnCUDgVCdO2mFr6+6U6YiVCAzTm0353gJFubUdFeXssrj53wro
         IO/5FnEEuowcmfejgGFnY46H0FJF0nD5EVtZRFsT9DtubVea6knXuleuCNDR2p6wO3
         mzerX2jMXNWZcZyEgm422VgP1denXJI6VcRCOEvuHGdXrgHeQT9B/DDTGi3+HMESgR
         J4dnkM6s0Z430RPtWg4GUop6OgtbW0TLUDMrWXGfHzEYkT9L1HbdkjjZbwHflBbZyB
         9f6dkQaTJU415wxawc1sGKi1V/mUXGQGn26MNvGnxKULOixStJohYbMfStmocE98m/
         NXGyH9roEx3wQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 831F960626;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: Fix SD card vqmmc max voltage on
 sc7180-trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293553.13751.13234382970106504736.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201204104900.1.I0a4ac2c7f4d405431cf95eb7b7c36800660516ec@changeid>
In-Reply-To: <20201204104900.1.I0a4ac2c7f4d405431cf95eb7b7c36800660516ec@changeid>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 10:49:02 -0800 you wrote:
> It never makes sense to set the IO voltage of the SD card (vqmmc) to a
> voltage that's higher than the voltage of the card's main power supply
> (vmmc).  The card's main voltage is 2.952V on trogdor, so let's set
> the max for the IO voltage to the same.
> 
> NOTE: On Linux, this is pretty much a no-op currently.  Linux already
> makes an effort to match vqmmc with vmmc when running at "3.3" signal
> voltage, so both before and after this change we end up running vqmmc
> at 2.904V when talking to non-UHS cards.  It still seems cleaner to
> make it a little more correct, though.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: Fix SD card vqmmc max voltage on sc7180-trogdor
    https://git.kernel.org/qcom/c/465b13cc0ac1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


