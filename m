Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E91E8ED7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 18:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfJ2R7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 13:59:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37055 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbfJ2R7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 13:59:46 -0400
Received: by mail-pf1-f194.google.com with SMTP id u9so5383898pfn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 10:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AsoiGZKW+OqSEUM2BahaMp4C8ROBZZo7pbBqc7c5IoY=;
        b=gwt98Ew45lXCW2YV2/I3bWQ4zvrHu0m+IZ7O0JEwsd9HVb1kAdSGa+x5T7K1JYImBj
         QsMUpABd4v2TcLRFRF2K7J+DLPvjigzE+Kd1r8BgkwR9X9lFlQasXgm1UFjd4+UtbYev
         nClhV0y6tVY3X3ye12q/ST2pm5gTtrn3c3zCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AsoiGZKW+OqSEUM2BahaMp4C8ROBZZo7pbBqc7c5IoY=;
        b=E4rZsZG9J71/eydS3PhKSjBbnvkwt17vumltkT7JanTUZSkMHWHohIJZ5uP1g3j9uT
         TOEGAOs0/IPZII+LyltosLxtR3NjrWram7/4AK1dsz/zthEbMj2lxJCbWRR0QpVcUufp
         e99brGi5Ri+/SQj6Yan/mX/oVsbu/Hd14948vaSDpMsp5NcRfcV7yGPRn1wZQZqLplVE
         DGuNfa0eWrkjIu8ZIrz+iIS8rPfWMDB9vTz9ZH+7jlDy8ZGQTRrayUhtBm8ssjVzZk/u
         rDsvgM4vBvpOXgChdulXy7NuQ6a/NcbBhM80Ep3g2gwoFleSKjzjWwuAugkFewUyvtGn
         rzBg==
X-Gm-Message-State: APjAAAX1NGIIbeUTybbBAhB22ZqpbRXm0QkXEYyFHrhXZ5P10s6RrXgA
        WWLzDXpCi6PwVj+tCEJTt+05KQ==
X-Google-Smtp-Source: APXvYqyhd6lfJcwRB3IVS+q7cVKEl2P/kuaUowk2m+KybBeCZJsxB5Kxqnys7De0gpcM+C0S4Qy8Qg==
X-Received: by 2002:a63:1f09:: with SMTP id f9mr17384729pgf.89.1572371984790;
        Tue, 29 Oct 2019 10:59:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h25sm2097696pfn.47.2019.10.29.10.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2019 10:59:43 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:59:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?utf-8?B?wqA=?= <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Message-ID: <20191029175941.GA27773@google.com>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-6-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014102308.27441-6-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> Add support for the global clock controller found on SC7180
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sc7180.c | 2450 +++++++++++++++++++++++++++++++++
>  3 files changed, 2460 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sc7180.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 32dbb4f09492..91706d88eeeb 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -227,6 +227,15 @@ config QCS_GCC_404
>  	  Say Y if you want to use multimedia devices or peripheral
>  	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> 
> +config SC_GCC_7180
> +	tristate "SC7180 Global Clock Controller"
> +	select QCOM_GDSC
> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the global clock controller on SC7180 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  I2C, USB, UFS, SDCC, etc.
> +
>  config SDM_CAMCC_845
>  	tristate "SDM845 Camera Clock Controller"
>  	select SDM_GCC_845
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 4a813b4055d0..6fb356a0bbf5 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>  obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
> +obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
>  obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
>  obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
>  obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> new file mode 100644
> index 000000000000..38424e63bcae
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sc7180.c
>
> +static struct clk_hw *gcc_sc7180_hws[] = {
> +	[GCC_GPLL0_MAIN_DIV_CDIV] = &gcc_pll0_main_div_cdiv.hw,
> +};
> +
> +static struct clk_regmap *gcc_sc7180_clocks[] = {
> +	[GCC_AGGRE_UFS_PHY_AXI_CLK] = &gcc_aggre_ufs_phy_axi_clk.clkr,
> +	[GCC_AGGRE_USB3_PRIM_AXI_CLK] = &gcc_aggre_usb3_prim_axi_clk.clkr,
> +	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
> +	[GCC_CAMERA_AHB_CLK] = &gcc_camera_ahb_clk.clkr,
> +	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
> +	[GCC_CAMERA_THROTTLE_HF_AXI_CLK] = &gcc_camera_throttle_hf_axi_clk.clkr,
> +	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
> +	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
> +	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
> +	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
> +	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
> +	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
> +	[GCC_CPUSS_AHB_CLK_SRC] = &gcc_cpuss_ahb_clk_src.clkr,
> +	[GCC_CPUSS_RBCPR_CLK] = &gcc_cpuss_rbcpr_clk.clkr,
> +	[GCC_DDRSS_GPU_AXI_CLK] = &gcc_ddrss_gpu_axi_clk.clkr,

v3 also had

+	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,

Removing it makes the dpu_mdss driver unhappy:

[    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'iface' is not available

because:

        mdss: mdss@ae00000 {
    	        ...

 =>             clocks = <&gcc GCC_DISP_AHB_CLK>,
                         <&gcc GCC_DISP_HF_AXI_CLK>,
                         <&dispcc DISP_CC_MDSS_MDP_CLK>;
                clock-names = "iface", "gcc_bus", "core";
	};

More clocks were removed in v4:

-       [GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
-       [GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
-       [GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,

I guess this part of "remove registering the CRITICAL clocks to clock provider
and leave them always ON from the GCC probe." (change log entry), but are you
sure nobody is going to reference these clocks?

> +static int gcc_sc7180_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/*
> +	 * Disable the GPLL0 active input to MM blocks, NPU
> +	 * and GPU via MISC registers.
> +	 */
> +	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);

In v3 this was:

	regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
	regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
	regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);

IMO register names seem preferable, why switch to literal addresses
instead?

> +
> +	/*
> +	 * Keep the clocks always-ON
> +	 * GCC_CPUSS_GNOC_CLK, GCC_VIDEO_AHB_CLK, GCC_DISP_AHB_CLK
> +	 * GCC_GPU_CFG_AHB_CLK
> +	 */
> +	regmap_update_bits(regmap, 0x48004, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
> +	regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));

ditto, register names seem preferable.
