Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FC62FE113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 05:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbhAUEvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 23:51:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:44340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726159AbhAUEuw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 23:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 275DF238E5;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611204609;
        bh=bpAX9hl/eSNb0Id2tjpuP7v3BdPHmdl5a+zGpdjI0Gg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vAczX66fpNYHBKLzLvzSj3+4SxCBxaLAruTAvwmPsjyGxKlqFv8STl9kiQwwwlYYa
         4c/Rj79IBPCHS5JDgC1Zk3/t/zy/fe8jdzaYAVyxUY1KP4m4lo5R+ljqBIQkKqt62x
         lX4W68ogqwzwdGRjZ0jjGKIg5jj3jEjCY5ouzlK8KNUHLm3DRJ+2KM3uyGi1RKEgd7
         9Twd0baDwUtlQvthfJMWAmH/NFwOL3f57v0gStJ/Wm5RZKHpjmGkJuipaKuLDtPKf1
         0S9oKDB8Kq1/MEP3mPqVgugbYEfh5jKGkLibQR3plaFJumY0kRrJ6F1OACh1qr4WyG
         0wCcHoSGHpgnw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 18E9860641;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856
 node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161120460909.18989.750169772514113136.git-patchwork-notify@kernel.org>
Date:   Thu, 21 Jan 2021 04:50:09 +0000
References: <20201221100955.148584-1-robert.foss@linaro.org>
In-Reply-To: <20201221100955.148584-1-robert.foss@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 21 Dec 2020 11:09:55 +0100 you wrote:
> Switch reset pin of ov8856 node from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW,
> this issue prevented the ov8856 from probing properly as it did not respon
> to I2C messages.
> 
> Fixes: d4919a44564b ("arm64: dts: qcom: sdm845-db845c: Add ov8856 & ov7251
> camera nodes")
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: sdm845-db845c: Fix reset-pin of ov8856 node
    https://git.kernel.org/qcom/c/d4863ef399a2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


