Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99280329274
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbhCAUpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243684AbhCAUnL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9525664E56;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=lOHnpPghpqZCQdEMQCC/qLeFl1xV8u1OnBkKfBTJE5U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pZ0+TYRVQ0Z3ZAsgDkp2Fs6z4anxYKOa9djhsE5Xm+QlWNHWQ27HEElQDfeTj4zt0
         3oa3RCmZLI789YU6d4Mqx1Zx//4bjvlER3BzsqtQgKMHggQN3K8JlrtDEwCGHnlmN/
         wf44b8VQd65fu51sUH/ZOchm3MSPybumSaTC13N/l9Xwe5e0reKFXG9Rm+cF+7/sYf
         UHs1Yn4BvieNHhwn+R8PAzoAoAV38tojaFt50GQrx3jyyi1pkLECsVAnmV/HEQk0Rg
         mrPu/2/5CRLxx5Lo54aNLzscNvw9L+ZZ5jU7qFvTkMZxXpHEFqfGkanmsMm9wwdFP9
         0nsLozvzyWS+w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8EA0560C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: qcom: geni: shield geni_icc_get() for ACPI boot
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878258.6187.4441233170588505674.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210114112928.11368-1-shawn.guo@linaro.org>
In-Reply-To: <20210114112928.11368-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 14 Jan 2021 19:29:28 +0800 you wrote:
> Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> if interconnect support is enabled.  That's because interconnect driver
> only supports DT right now.  As interconnect is not necessarily required
> for basic function of GENI devices, let's shield geni_icc_get() call,
> and then all other ICC calls become nop due to NULL icc_path, so that
> GENI devices keep working for ACPI boot.
> 
> [...]

Here is the summary with links:
  - [v2] soc: qcom: geni: shield geni_icc_get() for ACPI boot
    https://git.kernel.org/qcom/c/ee23057b4d6f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


