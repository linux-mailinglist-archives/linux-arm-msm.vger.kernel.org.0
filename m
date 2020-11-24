Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9B52C290E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 15:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgKXOKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 09:10:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:49024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726899AbgKXOKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 09:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606227004;
        bh=ZNOGYMMeQwqf+qUOCW8STpDMRaOihcU610ak4tRJWDo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kFxgjXl5z4ezJZNQd95lqzNvRljwVMeyJ7RkHHnJgF652bjtbZLGGroBe39KiS5ez
         SDzY5S5lxz6njZIVExnWvX6IrHcJuAR5e9xUaniKiG1GP7Gf//2I6ToP51tkF/sXNP
         nKuiG5PQ6f/uAoa50AsAG9kVSzKR4SD3S1+RuGM4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: sdm845: Add iommus property to qup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160622700446.3240.2882755252784641909.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 14:10:04 +0000
References: <20201122034149.626045-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201122034149.626045-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 21 Nov 2020 19:41:49 -0800 you wrote:
> From: Stephen Boyd <swboyd@chromium.org>
> 
> The SMMU that sits in front of the QUP needs to be programmed properly
> so that the i2c geni driver can allocate DMA descriptors. Failure to do
> this leads to faults when using devices such as an i2c touchscreen where
> the transaction is larger than 32 bytes and we use a DMA buffer.
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: sdm845: Add iommus property to qup
    https://git.kernel.org/qcom/c/4785cff7cb9c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


