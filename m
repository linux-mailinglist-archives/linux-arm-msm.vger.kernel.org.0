Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA33CD8855
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 08:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388048AbfJPGAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 02:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387929AbfJPGAl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 02:00:41 -0400
Received: from localhost (unknown [171.76.123.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C446C20872;
        Wed, 16 Oct 2019 06:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571205640;
        bh=8eaAxPL2KayDUCaf1S4jMsM2BVtAzQbFkkpPFytTUFY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p0oW49M8iTuaGttBcVoEKOWVs23gzFxq5ABXZPBb+81Jc/W1q9vsSS7JEaIKFhweD
         6RvihGSk/RZHyGSIMalD3BYzyGW8+oUt2A6axpbrJPlzv+koyRmbES8V5eXzB6gUIi
         jZRCKUX2Xt+fNWGe2gkC3Hia/45pfMwRm/1vwlSc=
Date:   Wed, 16 Oct 2019 11:30:35 +0530
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
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm socinfo driver
Message-ID: <20191016060035.GF2654@vkoul-mobl>
References: <20191011234828.374419-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011234828.374419-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-10-19, 16:48, Bjorn Andersson wrote:
> The Qualcomm socinfo driver provides SoC information to userspace using
> the standard soc interface as well as a number of debugfs entries.
> 
> Enable this to allow certain user space tools to acquire this
> information, as well as getting developers access to the information in
> debugfs that is useful when reporting bugs.

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
> index 45e55dfe1ee4..a5953b0b382d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -744,6 +744,7 @@ CONFIG_QCOM_SMEM=y
>  CONFIG_QCOM_SMD_RPM=y
>  CONFIG_QCOM_SMP2P=y
>  CONFIG_QCOM_SMSM=y
> +CONFIG_QCOM_SOCINFO=m
>  CONFIG_ARCH_R8A774A1=y
>  CONFIG_ARCH_R8A774C0=y
>  CONFIG_ARCH_R8A7795=y
> -- 
> 2.23.0

-- 
~Vinod
