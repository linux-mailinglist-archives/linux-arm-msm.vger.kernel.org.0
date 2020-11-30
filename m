Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED15B2C8D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgK3TAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728670AbgK3TAr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:00:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=e5ZmGmwkduDdS7dFFXxCjacRtIiMadWBq2+tAFC8k2c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RY/0gvZRjiBgYlK7WwiZlxUsht9W4muIQLZmGvIfAFi8Kro7EIk1B7f1QtfgpSgi9
         kbjlAQ+qZerTwV9Req01GQ4snGtsYaudVkh4AsZFmPC6O31PdQ3whXa8jInJ84DJc7
         QB7Z7KGoU/BB/29WsxZbKign9xZbMs/4jaJs8Zfo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: c630: Fix pinctrl pins properties
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280693.32741.12803918889085469742.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:06 +0000
References: <20201130170028.319798-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201130170028.319798-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 11:00:28 -0600 you wrote:
> The "pins" property takes an array of pin _names_, not pin numbers. Fix
> this.
> 
> Fixes: 44acee207844 ("arm64: dts: qcom: Add Lenovo Yoga C630")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: c630: Fix pinctrl pins properties
    https://git.kernel.org/qcom/c/f55d373f7953

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


