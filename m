Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC7DD8849
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 07:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387959AbfJPF6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 01:58:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:53036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387906AbfJPF6O (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 01:58:14 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C6CF20872;
        Wed, 16 Oct 2019 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571205493;
        bh=ptLr0TOYMFKLBYe15U23+xjSz09tfCCDviZntLEmAUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJU+JUtVqjvjeez2HGwwKzRhpDVTvYem3TbV8OWVdCZpr+T+nt9ueYhnid90yQQku
         FEqL0qhpY0pkZbWLnwEc9kFOEOJTLC+MbRAwINHnt6kOjq1gqzIzNPOJiQdevOcXCM
         dYVas/tRwUcmsvDi+M2MkYZPfUrfpzjffWEN1sUM=
Date:   Wed, 16 Oct 2019 11:28:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
Message-ID: <20191016055808.GD2654@vkoul-mobl>
References: <20191009001442.15719-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009001442.15719-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-10-19, 17:14, Bjorn Andersson wrote:
> Enable the the power domains, reset controllers and remote block device
> memory access drivers necessary to boot the Audio, Compute and Modem
> DSPs on Qualcomm SDM845.
> 
> None of the power domains are system critical, but needs to be builtin
> as the driver core prohibits probe deferal past late initcall.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c9a867ac32d4..42f042ba1039 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -732,10 +732,13 @@ CONFIG_RPMSG_QCOM_GLINK_SMEM=m
>  CONFIG_RPMSG_QCOM_SMD=y
>  CONFIG_RASPBERRYPI_POWER=y
>  CONFIG_IMX_SCU_SOC=y
> +CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
>  CONFIG_QCOM_GENI_SE=y
>  CONFIG_QCOM_GLINK_SSR=m
> +CONFIG_QCOM_RMTFS_MEM=m
>  CONFIG_QCOM_RPMH=y
> +CONFIG_QCOM_RPMHPD=y
>  CONFIG_QCOM_SMEM=y
>  CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
> @@ -780,6 +783,8 @@ CONFIG_PWM_ROCKCHIP=y
>  CONFIG_PWM_SAMSUNG=y
>  CONFIG_PWM_SUN4I=m
>  CONFIG_PWM_TEGRA=m
> +CONFIG_RESET_QCOM_AOSS=y
> +CONFIG_RESET_QCOM_PDC=m
>  CONFIG_RESET_TI_SCI=y
>  CONFIG_PHY_XGENE=y
>  CONFIG_PHY_SUN4I_USB=y
> -- 
> 2.18.0

-- 
~Vinod
