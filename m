Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C579823A307
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 13:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgHCLAV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 07:00:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbgHCLAV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 07:00:21 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55DB520578;
        Mon,  3 Aug 2020 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596452419;
        bh=LYS0GWdRpiOi06IUzhl5C/4AAkTdXCxhTjn+IAoTmwI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aknNQkg/fkfqlAJkanuP86F0U0ybdq+0nVqKK3c/cmMK5Mb6txJZRRA1KeHacl4Ag
         dK3x2SQOz0k+OrDtiLPy69xBdcaBIjnIudeR7vBhfUGph9ozVgDa17Ee5EG9vZ/U25
         yJmSjh9Iz+yOg9ZX2laUFq6EgqSS3LUUiCNeGX3U=
Date:   Mon, 3 Aug 2020 16:30:16 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     martin.botka1@gmail.com, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
Message-ID: <20200803110016.GL12965@vkoul-mobl>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-5-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726111215.22361-5-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26-07-20, 13:12, Konrad Dybcio wrote:
> These SoCs make use of the 14nm phy, but at different
> addresses than other 14nm units.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++

Is there a reason why dsi phy needs to be here and not in phy subsystem
drivers/phy/ ?

>  4 files changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586c898f..7884fd7a85c1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -87,6 +87,7 @@ Required properties:
>    * "qcom,dsi-phy-20nm"
>    * "qcom,dsi-phy-28nm-8960"
>    * "qcom,dsi-phy-14nm"
> +  * "qcom,dsi-phy-14nm-660"
>    * "qcom,dsi-phy-10nm"
>    * "qcom,dsi-phy-10nm-8998"
>  - reg: Physical base address and length of the registers of PLL, PHY. Some
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f509ebd77500..009f5b843dd1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -499,6 +499,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
>  	{ .compatible = "qcom,dsi-phy-14nm",
>  	  .data = &dsi_phy_14nm_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-660",
> +	  .data = &dsi_phy_14nm_660_cfgs },
>  #endif
>  #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
>  	{ .compatible = "qcom,dsi-phy-10nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 24b294ed3059..ef8672d7b123 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -45,6 +45,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 1594f1422372..519400501bcd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -161,3 +161,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
>  	.io_start = { 0x994400, 0x996400 },
>  	.num_dsi_phy = 2,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
> +	.type = MSM_DSI_PHY_14NM,
> +	.src_pll_truthtable = { {false, false}, {true, false} },
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vcca", 17000, 32},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.init = dsi_14nm_phy_init,
> +	},
> +	.io_start = { 0xc994400, 0xc996000 },
> +	.num_dsi_phy = 2,
> +};
> -- 
> 2.27.0

-- 
~Vinod
