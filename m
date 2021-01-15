Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C182F7E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727335AbhAOOVa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:21:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:55576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbhAOOVa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:21:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5949C238A1;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=G0x7lvDQae11v7Kmm74qaqRoHAc+FXEwh/4reAoTMFI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XzyZd3Dwc5jwPSekRALEsOckYy2EWH472G0pQQtHe0gLmCkYEwbKV8Po0p82qxADr
         ONNykFkEELJT9WkVLNPVlxp0TyrdDrz6n5yd5K30Pg9hp8HIkmMZ5CrtlAW8lNCgKQ
         F4DmaBFj5o8RO9U8o5nR2rimxlQd46Ymzn3NgE+7J0QoLRv4RhhRx2M8IuSDRv8zyd
         7Ps/Fmt18hvGDNs32try8WFQFh2Ry5uXxLnPaojH6/xLNZ8uFzp/IBoHfdgN34CjzS
         FFjfaggL20pkHZmCRoFFWRrQwrZ1pDc9GUYQGkVn70kldbLh08Ye9J9wuMbTZ/ZMLZ
         3HJ/1K6i1r/aQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 55E6F60649;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: enable cdsp device
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040934.1237.4062402545950524010.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20210115024156.92265-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210115024156.92265-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 05:41:56 +0300 you wrote:
> Enable Compute DSP (cdsp) on QRB5165-RB5 platform and provide firmware
> filename used to boot the cdsp.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 5 +++++
>  1 file changed, 5 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: qrb5165-rb5: enable cdsp device
    https://git.kernel.org/qcom/c/8f03014019f4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


