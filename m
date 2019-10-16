Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB8FD8854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 08:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbfJPGAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 02:00:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:53696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbfJPGAT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 02:00:19 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8192920872;
        Wed, 16 Oct 2019 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571205619;
        bh=4H3tWk+zop2+KUujkuYiqlVvULRhOuGq1UuNieJ5OPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TyYCwie3IcY1X/3kBwCnD2TquAmVmA95mrSQB+Z2BbGE/Wa+gyjl8ZRxGqdw/c31J
         J0V4pMOZW69COyW5OIPDX1MNUMrYym9KG9jHgw3sUCd5D5eKPW/oh7DxDGVXhv+kZ5
         k6Zt35LoYWQgExGfgVL8LEnaEZbymZ4tWbGB8cws=
Date:   Wed, 16 Oct 2019 11:30:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUfreq HW driver
Message-ID: <20191016060015.GE2654@vkoul-mobl>
References: <20191011234402.374271-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011234402.374271-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-10-19, 16:44, Bjorn Andersson wrote:
> The Qualcomm CPUfreq HW provides CPU voltage and frequency scaling on
> many modern Qualcomm SoCs. Enable the driver for this hardware block to
> enable this functionality on the SDM845 platform.

lgtm, tested on db845c

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dea051a64257..45e55dfe1ee4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -85,6 +85,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
>  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  CONFIG_ARM_IMX_CPUFREQ_DT=m
> +CONFIG_ARM_QCOM_CPUFREQ_HW=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
> -- 
> 2.23.0

-- 
~Vinod
