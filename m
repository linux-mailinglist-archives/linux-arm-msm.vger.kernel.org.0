Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE2E39200E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235855AbhEZTFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235735AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1062961442;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=DX1RnMBOV7hTBXm9AZ6SGeYDb7HUK++PtW/bN5PntOA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=or5lDiR18ooF2l22NR7YsjkMUvrob49MchBjexmQriHM5Xn9FySHY4I9WU3QvKjpe
         nUQR+9lMgfu/yo52HEs493fXYms1utStGnE23ZMAVZzMOFYVSUPNhXAprKMDoVFQJO
         L9rz0DvFc7+ixsd6IqizLsOKP/bYmSqOxqMbcm0zi4dhwsx7NaTFx9f4gWvxFqDi02
         b2vSkRWwQjcJTr4RUI51AcG/QCNljZvel/vcg4ZV12pDmX10c79zr8te0C39yqc4yl
         stSL3biUYqwHlugAPZQMYaIXeM1pz1rigI9++A4BOJ3fzSfkWpIBunlYcQtl0sr/z8
         uwyJ09aXGLXMg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0C348609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mhi: pci_generic: No-Op for device_wake operations
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580504.26840.1855740708336346180.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1614096781-30646-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1614096781-30646-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 23 Feb 2021 17:13:01 +0100 you wrote:
> The wake_db register presence is highly speculative and can fuze MHI
> devices. Indeed, currently the wake_db register address is defined at
> entry 127 of the 'Channel doorbell array', thus writing to this address
> is equivalent to ringing the doorbell for channel 127, causing trouble
> with some device that get an unexpected channel 127 doorbell interrupt.
> 
> This change fixes that issue by setting wake get/put as no-op for
> pci_generic devices. The wake device sideband mechanism seems really
> specific to each device, and is AFAIK no defined by the MHI spec.
> 
> [...]

Here is the summary with links:
  - [v2] mhi: pci_generic: No-Op for device_wake operations
    https://git.kernel.org/qcom/c/e3e5e6508fc1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


