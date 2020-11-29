Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639402C7757
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Nov 2020 04:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgK2DAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 22:00:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:39166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgK2DAq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 22:00:46 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606618805;
        bh=rUUXaCCK21pWaf6mKIBMW75la+wvCMoFFahsqHSr+Kg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iXxwAeOvpx3Wd3ejUCb/lETZZl61b6CzRtE6kCMsBVNOR7xgO5dqd9ayIotkr97YN
         5SqqV+8LcdqJipNSIF7VlTjASl4Px0l/mV5pku1Nq78ZS26uh7rJFlR7XuI9bMdPQz
         UylUjylAZ61sdLCiYDxcBhKpTzQFnZg4NOCuIJJ4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160661880558.4620.2495161034644072012.git-patchwork-notify@kernel.org>
Date:   Sun, 29 Nov 2020 03:00:05 +0000
References: <20201127173044.55144-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201127173044.55144-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 27 Nov 2020 23:00:44 +0530 you wrote:
> Add support for onboard MCP2518FD SPI CAN transceiver attached to SPI0
> of RB5.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: qrb5165-rb5: Add support for MCP2518FD
    https://git.kernel.org/qcom/c/5c44c564e449

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


