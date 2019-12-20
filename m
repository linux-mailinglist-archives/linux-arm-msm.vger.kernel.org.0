Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE311282A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 20:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfLTTO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 14:14:56 -0500
Received: from onstation.org ([52.200.56.107]:53618 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727394AbfLTTO4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 14:14:56 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id A0BC93E8F9;
        Fri, 20 Dec 2019 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1576869295;
        bh=LluZtUkUbAmOdVnGAE/kzWOQmltL3S4yn/9qvQHJL00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uOxTe+Lcc2uGCoTRc6a4LloepZ9d9IIksXtI9wSFYwrlYe6xKNpKLkk9F5Bc1QQp9
         /1GNdv1P3wpMtKD3dW9i/L7sOEDSivv11N/TasIYPUaFMSCpYSe37g5Geko8QuYvIf
         mLdL32qYWdJbC44zy8XVbHcumMV2HturhkAafoQE=
Date:   Fri, 20 Dec 2019 14:14:55 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add qcom Kconfig fragment
Message-ID: <20191220191455.GA6954@onstation.org>
References: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 20, 2019 at 02:56:00PM +0100, Loic Poulain wrote:
> Add qcom Kconfig fragment which enables the appropriate symbols for
> support of Qualcomm based boards, like the 'popular' dragonboards.
> This permits to fully support the boards upstream without having to
> rely on downstream deconfig changes.
> 
> This patch has been tested with Dragonboard-410c and Dragonboard-820c.
> 
> qcom.config fragment has been generated with ./script/diffconfig
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/configs/qcom.config | 57 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 arch/arm64/configs/qcom.config
> 
> diff --git a/arch/arm64/configs/qcom.config b/arch/arm64/configs/qcom.config
> new file mode 100644
> index 0000000..9358df8
> --- /dev/null
> +++ b/arch/arm64/configs/qcom.config
> @@ -0,0 +1,57 @@
> +CONFIG_ARM_QCOM_CPUFREQ_HW=y
> +CONFIG_BT_HCIUART_3WIRE=y
> +CONFIG_BT_HCIUART_QCA=y
> +CONFIG_BT_HCIUART_RTL=y
> +CONFIG_CRYPTO_DEV_QCOM_RNG=y
> +CONFIG_EXTCON_QCOM_SPMI_MISC=y
> +CONFIG_INTERCONNECT=y
> +CONFIG_MFD_QCOM_RPM=y
> +CONFIG_PHY_QCOM_PCIE2=y
> +CONFIG_PHY_QCOM_QMP=y
> +CONFIG_PHY_QCOM_QUSB2=y
> +CONFIG_PHY_QCOM_UFS=y
> +CONFIG_PM8916_WATCHDOG=y
> +CONFIG_POWER_RESET_QCOM_PON=y
> +CONFIG_QCOM_APR=m
> +CONFIG_QCOM_FASTRPC=y
> +CONFIG_QCOM_RMTFS_MEM=m
> +CONFIG_QCOM_RPMHPD=y
> +CONFIG_QCOM_RPMPD=y
> +CONFIG_QCOM_SOCINFO=m
> +CONFIG_QCOM_WCNSS_CTRL=m
> +CONFIG_QCOM_WCNSS_PIL=m
> +CONFIG_SCSI_UFS_QCOM=y
> +CONFIG_SND_SOC_CROS_EC_CODEC=m
> +CONFIG_SND_SOC_MAX98927=m
> +CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
> +CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
> +CONFIG_VIDEO_QCOM_CAMSS=m
> +CONFIG_VIDEO_QCOM_VENUS=m
> +CONFIG_WCN36XX=m
> +CONFIG_BT_QCA=m
> +CONFIG_BT_QCOMSMD=m
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_MSM8974=y

msm8974 is arm32 and should be dropped.

Brian
