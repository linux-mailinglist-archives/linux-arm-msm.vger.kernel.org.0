Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2283DC2E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 12:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439048AbfJRKik (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 06:38:40 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43556 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408284AbfJRKiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 06:38:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4393A612F6; Fri, 18 Oct 2019 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571395102;
        bh=DDzea6D+szQ9vq8iio9ZbHXTx9y94I7ALFnpAw8tZ/Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Yms85Xbu2q9tQbXVKsZUqDHJR6CzSTqesztydnB1bfmQEXszanTjxHPOSm+BwmBT8
         JR9mtoSLxc4VwK+upe5/KWrt3tH0qhfEdev/iJQLnqnRffjlU4D2ql72FkI/av+iRt
         CTP5btPKVKVCBhN107zfobsvCYpOSzjvk2V3J12k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 01224612E2;
        Fri, 18 Oct 2019 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571395099;
        bh=DDzea6D+szQ9vq8iio9ZbHXTx9y94I7ALFnpAw8tZ/Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cF+N8Uwkb5NwlB/zkGAHv6ZvarrVhig1upqcadwyDtotmcpP9jl2eYWdHJ50+zChi
         AhsA7dqi8S9Km3a0tAeZNjst7Qszf4i6CW3H0q13fiURPAkK267mG89KFAtRNpvhiH
         WLjH3BvVBn4OQzVaDVPhv3VzJdq2XBioXEdEs7O4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 16:08:18 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
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
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm remoteproc dependencies
In-Reply-To: <20191009001442.15719-1-bjorn.andersson@linaro.org>
References: <20191009001442.15719-1-bjorn.andersson@linaro.org>
Message-ID: <95a80ff0e89a568d223fab6eb1f9362a@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-09 05:44, Bjorn Andersson wrote:
> Enable the the power domains, reset controllers and remote block device
> memory access drivers necessary to boot the Audio, Compute and Modem
> DSPs on Qualcomm SDM845.
> 
> None of the power domains are system critical, but needs to be builtin
> as the driver core prohibits probe deferal past late initcall.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig 
> b/arch/arm64/configs/defconfig
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

I should probably fix this ^^

> +CONFIG_RESET_QCOM_PDC=m
>  CONFIG_RESET_TI_SCI=y
>  CONFIG_PHY_XGENE=y
>  CONFIG_PHY_SUN4I_USB=y

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
