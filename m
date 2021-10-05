Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C490421EAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 08:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhJEGHo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 02:07:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:44456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230403AbhJEGHn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 02:07:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2378060E98;
        Tue,  5 Oct 2021 06:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633413953;
        bh=e8eV9pNPPAaLpz96uGNTENTl1XTJ2OyWWLwbVcRoRmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I8WYPcop+GTSBWUEqhERB9KufHhshqgiL2a1z2cxcNrLyOliPv1A5EW4DAeOTs7YO
         JzRBejvKwRW/Edk9xCOjIRTw6oXULMraxKSLerA5E88ByVK9XksOB67VobuhM1/Ysj
         le0PTNTLqhIG0JgXCEGugyBexQtspVLcMsJz5nrH1N/N8G38U2ejAfwRcjiop4wQj/
         TjfAPO5JD3himtLSiP5NePtl3oIubRK9D2CV2uwf5r9gkDcVEcc0YRY+1YhqLZacwe
         Bu2Ecfc5HD8gr+x4NWhH7ORyycPrJgSfHXs8cBoUoLhNFOG9c4VAjRIBILQd5q//NA
         +7mj1aVffcy1A==
Date:   Tue, 5 Oct 2021 14:05:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Robin Gong <yibin.gong@nxp.com>
Subject: Re: [PATCH] arm64: defconfig: Disable firmware sysfs fallback
Message-ID: <20211005060547.GS20743@dragon>
References: <20210930215300.60290-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930215300.60290-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 02:53:00PM -0700, Bjorn Andersson wrote:
> Part of the enablement of SDMA on the IMX platforms, '7f4e4afa140c
> ("arm64: defconfig: Enable SDMA on i.mx8mq/8mm")' also enabled
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK, to allow "firmware loaded by
> udev".
> 
> Unfortunately having the fallback enabled does, due to the 60 second
> timeout, essentially requiring userspace to provide a firmware loader.
> But systemd dropped the support for this interface back in 2014 and
> because arm64 is the only architecture that has this enabled, there
> doesn't seem to be any standard solution available.
> 
> Examples of this problem can be found in e.g. the ath10k driver, which
> with a standard distro can take about 10 minutes before wlan0 appears.
> 
> The alternative to this patch would be to change these drivers to use
> firmware_request_direct(), to avoid the sysfs fallback. But that would
> prevent other systems, such as Android, to rely on a userspace firmware
> loader to pick the firmware from a non-standard place, with just a
> custom defconfig.
> 
> This patch therefor attempts to align the arm64 defconfig will all other
> architectures in the upstream kernel.
> 
> Cc: Robin Gong <yibin.gong@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index da988a54bfb9..f9e0b3fdaf0b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -243,7 +243,6 @@ CONFIG_PCI_EPF_TEST=m
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER_USER_HELPER=y
> -CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_FSL_MC_BUS=y
> -- 
> 2.29.2
> 
