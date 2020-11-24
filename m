Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6342E2C1C89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728695AbgKXEKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728696AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=KTxBNVg358H7S7oflmYB3o2QEhhJj0LlHNEyEUPsh+U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oWGPgNBAsnxUjzBz7eJAzJmQIhie+v/fPN2ypFeXK674eEfMdMInbCGoxnrm7aUFw
         tu3NYvIEgWNt6n00bUhejz1E/VoX9F8lfEfhwWhmSSZMxloHY1Y+Lj54IubmSkucwI
         fGWKZ1x60siiUu7lIOQ06gH/Yt3s+lEsASf9LkWg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: sm8250: add iommus entry to QUP nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100872.17117.6785195991555131344.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201010132125.416064-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201010132125.416064-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 10 Oct 2020 16:21:25 +0300 you wrote:
> Enable IOMMUs configuration for QUP nodes to stop SM8250 boards from
> rebooting when using I2C DMA transfers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - arm64: dts: sm8250: add iommus entry to QUP nodes
    https://git.kernel.org/qcom/c/8530939383f5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


