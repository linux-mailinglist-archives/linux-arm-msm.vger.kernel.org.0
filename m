Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1014F304D0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 00:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731522AbhAZXCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 18:02:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389842AbhAZRut (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 12:50:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A4BB322210;
        Tue, 26 Jan 2021 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611683409;
        bh=H9sCBwizI5wSJzIkoWdqgG2vb3l/xBXplMg9qXnb4SI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lUWLWO/UJmzaJQZ1EJnOgmNCpBo5aEP3Wp1lBhDpZdo6gDqOrbbiiOIGjDWFo4Z73
         tGOQg3bDnTh4UfpVzwaKA8g2KbViZgIIUz4IfAmmz/wQIJJ00qkjMLWP7SsezpF/Kz
         hpMsOzdLeC8TPt7u8tZ64ptPAGuBjhsZNhG/WlX2QGUlbD6u7lL17ajTLYpyCcRTou
         dFe78iZcdYNXC0XEHFmbh+64qgPSGrceigjalT9dgJ8TyaQ1qaiHLpXCK4+pKVxAqr
         NjrQx6ybXMGYwO+AW7aSmIYLUYP2txKzLhtzBZpQDo4YI2k2HphxBSh5oD8bUr0EOx
         WViDyuEMw74wQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9D50265209;
        Tue, 26 Jan 2021 17:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] arm64: dts: qcom: Add watchdog bark irq for  SC7180,
 SDM845, SM8150, SM8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161168340963.30629.17777181476493160264.git-patchwork-notify@kernel.org>
Date:   Tue, 26 Jan 2021 17:50:09 +0000
References: <cover.1611466260.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1611466260.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 26 Jan 2021 21:17:28 +0530 you wrote:
> This series adds pre-timeout notification support via bark
> interrupt for SC7180, SDM845, SM8150, SM8250 SoCs.
> 
> Note: This has a functional dependency on [1] without which
> the watchdog functionality would be broken.
> 
> [1] https://lore.kernel.org/patchwork/patch/1371266/
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: dts: qcom: sc7180: Add watchdog bark interrupt
    https://git.kernel.org/qcom/c/28cc13e4060c
  - [2/4] arm64: dts: qcom: sdm845: Add watchdog bark interrupt
    https://git.kernel.org/qcom/c/36c436b03c58
  - [3/4] arm64: dts: qcom: sm8150: Add watchdog bark interrupt
    https://git.kernel.org/qcom/c/b094c8f8dd2a
  - [4/4] arm64: dts: qcom: sm8250: Add watchdog bark interrupt
    https://git.kernel.org/qcom/c/46a4359f9156

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


