Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB6A3306F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 05:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhCHEnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Mar 2021 23:43:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:50826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232439AbhCHEnR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Mar 2021 23:43:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D61A65163;
        Mon,  8 Mar 2021 04:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615178597;
        bh=XBUiFp7g9o1Of72ZnLgdc3VJOEOJXG4PG4dD0Zmjlag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dniH3X+eOkbP/qie/Vk22/WvNhGgqB9jALcXYJDYG6hFvLu4eQgFm8Z7MCf9P9Z2x
         6HA4PSG/JkVlDq42BjIYchnnRb8m2O7Xh4/8IK08UZWbucW2SnxONRiS8cw8vEXhUM
         Xzn40HVK7ACmTrejQlFxHL+1XFG6X0/LiMLY3pOrCIJrYQUvdaMpoWSdmNjxYCrRy6
         WbNx1BjVZ1f5hIs1lY0edGdPfSp6uK/P3pu8HtLtSzpSnOw+fbFD+OoqHbBHa0qGs8
         +rnKTSN1Y8gLfezJpQYRriyDMiMuddg8VzFq9OYGIhhDVsy+961G1Fs/NLNW5QgbFa
         TL98pSbol8yLg==
Date:   Mon, 8 Mar 2021 10:13:13 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC
Message-ID: <YEWrYWE6YNU6LdcN@vkoul-mobl>
References: <20210306021021.1173860-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210306021021.1173860-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-03-21, 18:10, Bjorn Andersson wrote:
> Enable the Qualcomm SM8350 TLMM pinctrl and GCC clock drivers. They need
> to be builtin to ensure that the UART is allowed to probe before user
> space needs a console.

Thanks for the patch, looks like I missed to send this one out :)

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d612f633b771..029edddb50df 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -510,6 +510,7 @@ CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SDM845=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
> +CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_LPASS_LPI=m
>  CONFIG_GPIO_ALTERA=m
>  CONFIG_GPIO_DAVINCI=y
> @@ -957,6 +958,7 @@ CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_GCC_8150=y
>  CONFIG_SM_GCC_8250=y
> +CONFIG_SM_GCC_8350=y
>  CONFIG_SM_GPUCC_8150=y
>  CONFIG_SM_GPUCC_8250=y
>  CONFIG_SM_DISPCC_8250=y
> -- 
> 2.29.2

-- 
~Vinod
