Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 366EB125A3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 05:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfLSEU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 23:20:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726794AbfLSEUz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 23:20:55 -0500
Received: from localhost (unknown [122.178.234.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 135D520684;
        Thu, 19 Dec 2019 04:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576729254;
        bh=Xx0LcvMOXCvm/NWfojxqoHG7PpQmyGKWYnLhTafSfE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hCqfadj2DM8wvQDN0OdihoJBqsrKkPAC+oF8ZYvMuKaUrueCjL89rf6FsC+48yTsI
         EW1FA0jKZ3qAelAyyp6Qsep5DhIrj2wrSeIfdQz0yOSFV3cBk7cXgRTzSg88v7CLV9
         3bhqBESzwxLp7IAcdRhuQDR45yjj/lvN+swC8kXw=
Date:   Thu, 19 Dec 2019 09:50:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp: Add MSM8996 UFS QMP support
Message-ID: <20191219042047.GT2536@vkoul-mobl>
References: <20191207202147.2314248-1-bjorn.andersson@linaro.org>
 <20191207202147.2314248-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207202147.2314248-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-12-19, 12:21, Bjorn Andersson wrote:
> The support for the 14nm MSM8996 UFS PHY is currently handled by the
> UFS-specific 14nm QMP driver, due to the earlier need for additional
> operations beyond the standard PHY API.
> 
> Add support for this PHY to the common QMP driver, to allow us to remove
> the old driver.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  |   5 +
>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 106 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index eac9ad3cbbc8..5b99cf081817 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -8,6 +8,7 @@ Required properties:
>   - compatible: compatible list, contains:
>  	       "qcom,ipq8074-qmp-pcie-phy" for PCIe phy on IPQ8074
>  	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
> +	       "qcom,msm8996-qmp-ufs-phy" for 14nm UFS phy on msm8996,
>  	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996,
>  	       "qcom,msm8998-qmp-usb3-phy" for USB3 QMP V3 phy on msm8998,
>  	       "qcom,msm8998-qmp-ufs-phy" for UFS QMP phy on msm8998,
> @@ -44,6 +45,8 @@ Required properties:
>  		For "qcom,ipq8074-qmp-pcie-phy": no clocks are listed.
>  		For "qcom,msm8996-qmp-pcie-phy" must contain:
>  			"aux", "cfg_ahb", "ref".
> +		For "qcom,msm8996-qmp-ufs-phy" must contain:
> +			"ref".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain:
>  			"aux", "cfg_ahb", "ref".
>  		For "qcom,msm8998-qmp-usb3-phy" must contain:
> @@ -72,6 +75,8 @@ Required properties:
>  			"phy", "common".
>  		For "qcom,msm8996-qmp-pcie-phy" must contain:
>  			"phy", "common", "cfg".
> +		For "qcom,msm8996-qmp-ufs-phy": must contain:
> +			"ufsphy".
>  		For "qcom,msm8996-qmp-usb3-phy" must contain
>  			"phy", "common".
>  		For "qcom,msm8998-qmp-usb3-phy" must contain
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index a6b8fc5798e2..d81516c4d747 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -121,6 +121,11 @@ enum qphy_reg_layout {
>  	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
>  };
>  
> +static const unsigned int msm8996_ufsphy_regs_layout[] = {
> +	[QPHY_START_CTRL]		= 0x00,
> +	[QPHY_PCS_READY_STATUS]		= 0x168,
> +};
> +
>  static const unsigned int pciephy_regs_layout[] = {
>  	[QPHY_COM_SW_RESET]		= 0x400,
>  	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
> @@ -330,6 +335,75 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
>  };
>  
> +static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),

Can you check this after adding the reset for ufs, I suspect you might
run into same issue as I am seeing on 8150, power down here does not
seem correct.

-- 
~Vinod
