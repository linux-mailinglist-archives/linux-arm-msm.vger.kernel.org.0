Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B474DDEA1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2019 15:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfJTNfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 09:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:42804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfJTNfC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 09:35:02 -0400
Received: from localhost (unknown [106.51.108.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8FDA20640;
        Sun, 20 Oct 2019 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571578501;
        bh=+4amG+FG7GWnyfpjXdXwK7H4DrC9sreLmaUdP6OQ5p4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m2v3U+a94DsWB/fUiKtmWVvQO1na+tb2s51uhNt9vUwsFoaUjVD40cy9r4ikHUP20
         kZ382FXkuWNWfPOdp8VU7YJLTJi0f9zZ/w4pnKSE7Z4qiwzXI+v2c32kh9P7otTm52
         mRZRWQ4e9Mc9Y34dUFGjIscmYk6bObBd5ZIo/XHw=
Date:   Sun, 20 Oct 2019 19:04:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable Qualcomm pseudo rng
Message-ID: <20191020133456.GS2654@vkoul-mobl>
References: <20191019195812.3834545-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191019195812.3834545-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-10-19, 12:58, Bjorn Andersson wrote:
> Most Qualcomm platforms contain a pseudo random number generator
> hardware block. Enable the driver for this block and also enable the
> interface for exposing this to userspace.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6baf90875263..4591bf1303da 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -860,6 +860,8 @@ CONFIG_NLS_ISO8859_1=y
>  CONFIG_SECURITY=y
>  CONFIG_CRYPTO_ECHAINIV=y
>  CONFIG_CRYPTO_ANSI_CPRNG=y
> +CONFIG_CRYPTO_USER_API_RNG=m
> +CONFIG_CRYPTO_DEV_QCOM_RNG=m
>  CONFIG_DMA_CMA=y
>  CONFIG_CMA_SIZE_MBYTES=32
>  CONFIG_PRINTK_TIME=y
> -- 
> 2.23.0

-- 
~Vinod
