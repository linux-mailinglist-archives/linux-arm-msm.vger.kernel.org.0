Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E780F2C8D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgK3TBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:01:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:42536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729431AbgK3TBa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:01:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=/RlyQHJ3fAbyKuACNY7YHIZQHEvZ1M/7Vv1ftMmRva4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tn9VttVanBaj2qK4mSuCOzi3HvG0k4HvPUZR0B4q1Gg8NRBngUEhxFzLvp6r7z7Ww
         4xOjJKrZxi44GeqZiHUMgt71ctSkJ85pXwD5o/yNEQEtQRHpFJqPXLknDJagINvv7R
         rlTKaybJPocPvIn1cY0FclcjJoOpSxVZsTiHGMzo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: c630: Define eDP bridge and panel
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280715.32741.15641999018026636579.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:07 +0000
References: <20201128034231.89750-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201128034231.89750-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 27 Nov 2020 21:42:31 -0600 you wrote:
> The Lenovo Yoga C630 drives the Boe NV133FHM-N61 eDP display from DSI
> using a TI SN65DSI86 bridge chip on I2C 10. Define the bridge and eDP
> panel and enable the display blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: c630: Define eDP bridge and panel
    https://git.kernel.org/qcom/c/956e9c85f47b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


