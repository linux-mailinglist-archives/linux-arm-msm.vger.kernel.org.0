Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C772E73B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgL2USK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3543322CB9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=DIAW0CXc+5gHh5sIXJvmeuWcb8depYliR8Hoyx7Dc2E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TNf2umKMuj4OEz0Jxx/vlHczg0QyNQJJrvdTWyrEyZilCxpO+22ul3Ay7wwjNn7Ap
         ZBrh5yVshxnD88+pfJXc93zusd6gVeoapUVJQglxeuIy08uoCyBIVJwCGoKY8A4HS6
         SP8x/cTvUxIxBcUMZU/hvN9NC8VNekdLa30zUf3e4el4TBwXoIMR2DosJDjnebg4nv
         kEy8g7AGfEmF2QAroBeCyKWxktAbfre8rs1NwXW5eoRIGyWsSPqEeQ9aT+Ab99ppoL
         a4Fr7eAQKgZYivA20TTyLx2xX93YoAovmXX/YwsW0qtJcJBkpJ9vqWLzObKQBPXd/g
         mn1E238mSNiGA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 31CFE60591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] drm/msm/dsi_pll_7nm: restore VCO rate during
 restore_state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293419.13751.14491162646373892786.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201015190332.1182588-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 15 Oct 2020 22:03:29 +0300 you wrote:
> PHY disable/enable resets PLL registers to default values. Thus in
> addition to restoring several registers we also need to restore VCO rate
> settings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> 
> [...]

Here is the summary with links:
  - [1/4] drm/msm/dsi_pll_7nm: restore VCO rate during restore_state
    https://git.kernel.org/qcom/c/5047ab95bb7d
  - [2/4] drm/msm/dsi_pll_10nm: restore VCO rate during restore_state
    https://git.kernel.org/qcom/c/a4ccc37693a2
  - [3/4] drm/msm/dsi_phy_7nm: implement PHY disabling
    https://git.kernel.org/qcom/c/b66ccc571319
  - [4/4] drm/msm/dsi_phy_10nm: implement PHY disabling
    https://git.kernel.org/qcom/c/e92ce317fbeb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


