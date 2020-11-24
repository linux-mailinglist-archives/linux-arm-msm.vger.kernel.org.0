Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFD82C1C88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728682AbgKXEKK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:46904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728695AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=pBhtqy+20ZoDAy4KwAesNRBIrYtfBV6bY5ylSzfiS0Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HZ43yKF+QYKd/I7BumJoeJVXzZ9VxBMRsYA9IR+HGDgNQjbsuuRxfReGZQ5vd3yej
         3MK31PSBbE17jggac7mm8Cdiuk3DdN9N6Msfpd5HENVPIaVJqVtC22s2oVnpO2GHb9
         l8Tb6W9YnpqGF8SJdSl8eScCxCK/u9jkQccxx1JQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: qcom: dts: sm8250: add iommu nodes to qup devices
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100868.17117.8841555543616516578.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20200917161056.3156142-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200917161056.3156142-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 17 Sep 2020 19:10:56 +0300 you wrote:
> Add IOMMU nodes to QUP devices on SM8250. Without this the board will
> reboot on when I2C DMA transfers are used.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - arm64: qcom: dts: sm8250: add iommu nodes to qup devices
    https://git.kernel.org/qcom/c/8530939383f5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


