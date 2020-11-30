Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8C12C8D8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgK3TAv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:00:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:42406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727345AbgK3TAr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:00:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762806;
        bh=oq7NWF4Cvg4sTfWkNX/fF8z28yvG5mvviNsdc8ShetA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q9yHHzeR+kv4ztCv+TFocfB+1kpUWeu0OBBEqg4j7peq37k9j8KUxLDVx0AUw2Qs9
         rjzz/ybyXwwDNwFfpoHsifpipAyaomDChUDE0dHi0r5dLlZrokzWJjXWNfgJRbkYxa
         EF+xBmO+M2Sry0mWzOC20ILoVvp0zvJF/VeuyO/w=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: c630: Expose LID events
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280688.32741.9175877142920264431.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:06 +0000
References: <20201125060838.165576-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201125060838.165576-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 25 Nov 2020 00:08:38 -0600 you wrote:
> The LID state can be read from GPIO 124 and the "tablet mode" from GPIO
> 95, expose these to the system using gpio-keys and mark the falling edge
> of the LID state as a wakeup-source - to wake the system from suspend.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: c630: Expose LID events
    https://git.kernel.org/qcom/c/71b83b74cca3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


