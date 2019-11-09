Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60EF8F5C7A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 01:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbfKIAo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 19:44:29 -0500
Received: from onstation.org ([52.200.56.107]:35628 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726394AbfKIAnM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 19:43:12 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 27F203E89E;
        Sat,  9 Nov 2019 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573260191;
        bh=HP0JoQqY6fFFwnhroRKWW+tbc4y6o7uevtlIKKk2lck=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Spfis8EPQrT1jmuBWxRN1bYPqN7qI+dZCD2uI6o13I6ZCqKhwoEAAqyIjjXfWx5nd
         WTjfSug/z6k8vEUEb2DynRbA7PSIj3pO2Hhm8GSq9rh9D/LZq2bifJ0+1a6M5ZL3um
         7jlr3PXT16W6oEzlgUptYVjkEjpVYEQF9Bjmenwc=
Date:   Fri, 8 Nov 2019 19:43:10 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     georgi.djakov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] ARM: qcom_defconfig: add msm8974 interconnect
 support
Message-ID: <20191109004310.GA4494@onstation.org>
References: <20191024103140.10077-1-masneyb@onstation.org>
 <20191024103140.10077-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191024103140.10077-2-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 24, 2019 at 06:31:37AM -0400, Brian Masney wrote:
> Add interconnect support for msm8974-based SoCs in order to support the
> GPU on this platform.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v1:
> - Set CONFIG_INTERCONNECT=y since its now a bool instead of a tristate
> 
>  arch/arm/configs/qcom_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 9792dd0aae0c..cbe4e1d86f9a 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -252,6 +252,9 @@ CONFIG_PHY_QCOM_IPQ806X_SATA=y
>  CONFIG_PHY_QCOM_USB_HS=y
>  CONFIG_PHY_QCOM_USB_HSIC=y
>  CONFIG_QCOM_QFPROM=y
> +CONFIG_INTERCONNECT=y
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_MSM8974=m
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT3_FS=y

Georgi: Since Greg wants to allow compiling the interconnect support as
a module [1], should I change CONFIG_INTERCONNECT to be a module? Or
leave this as is? The GPU works fine with interconnect as a module on my
phone. I know it's more for the cpufreq case.

[1] https://lore.kernel.org/lkml/20191107142111.GB109902@kroah.com/

Andy/Bjorn: This series didn't get picked up for this upcoming merge
window. If it's too late for this window (which is fine), then I'll
hold off on resubmitting this until rc4 since I'll most likely have
more device tree changes by then.

Brian
