Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB336D8859
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 08:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfJPGBG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 02:01:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfJPGBG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 02:01:06 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49D722067D;
        Wed, 16 Oct 2019 06:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571205666;
        bh=g+I0EDKeU/EL9t/PNSPY6ssOjQta6vTW/9jfk4rmiAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i0P5lOVy2VTN3hflsQGO+R+2RhTH/oMNOdiB2ujdfwGRibgwBOwjLGDdVPsTdBe7r
         pWDCKujljyw2TO2qQ8Sxd+w7lZJgMFXSkduSHJWEilH7EUFm2llu7JPz5FrIvTpK3z
         fn58kGWFNRcshhfrNqMDUogqwt5YcVmj4g5M6alI=
Date:   Wed, 16 Oct 2019 11:31:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SPI and QSPI controller
Message-ID: <20191016060101.GG2654@vkoul-mobl>
References: <20191012041855.511313-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191012041855.511313-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-10-19, 21:18, Bjorn Andersson wrote:
> Enable the drivers for GENI SPI and QSPI controllers found on the
> Qualcomm SDM845 platform, among others.

lgtm, tested on db845c

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 688c8f200034..dcada299ff4d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -391,7 +391,9 @@ CONFIG_SPI_MESON_SPIFC=m
>  CONFIG_SPI_ORION=y
>  CONFIG_SPI_PL022=y
>  CONFIG_SPI_ROCKCHIP=y
> +CONFIG_SPI_QCOM_QSPI=m
>  CONFIG_SPI_QUP=y
> +CONFIG_SPI_QCOM_GENI=m
>  CONFIG_SPI_S3C64XX=y
>  CONFIG_SPI_SPIDEV=m
>  CONFIG_SPI_SUN6I=y
> -- 
> 2.23.0

-- 
~Vinod
