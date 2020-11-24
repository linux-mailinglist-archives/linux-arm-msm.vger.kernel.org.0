Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA8D2C2B98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389689AbgKXPkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:40:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:42996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389629AbgKXPkG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:40:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232405;
        bh=MTfYuo+5Q/untfEPLi9xI02dFA8wtXB3Ww18Mp5cvUA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KVYhbE4bqbt6Q0A+ORRetnkGfuqtkML3vyp55tVKe9Z5QaAV0suq1NqBXUM1MGERM
         rVGENoffdm5Eqdj/7dGQ/GfIngQz9c9v9P1riScbVByCKXQjjdMiQmug1JJKhzkoJp
         0Uxn9cqfh1OZwM52EuGUSQE7GolPVF67GpN/zUgg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-mtp: Specify remoteproc firmware
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160623240562.17796.1873463190935104626.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 15:40:05 +0000
References: <20201121055603.582281-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201121055603.582281-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 20 Nov 2020 21:56:03 -0800 you wrote:
> Point the various remoteprocs of SM8150 MTP to a place with the platform
> specific firmware.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: sm8150-mtp: Specify remoteproc firmware
    https://git.kernel.org/qcom/c/036e11092599

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


