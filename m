Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4584B311518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 23:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhBEWXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 17:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbhBEO1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 09:27:44 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EB8C061221
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 08:05:50 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id x19so1729463ooj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 08:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i+s2FZx53SQqxDw+1zONomhnnt1uwtiTU8GemVlvAO0=;
        b=fot037dobwcRId/9HL/KeJ7m7AtvNPnIuli3LuaUHiSIuMoDWtJEP0R7+qmv1XaKXN
         9lT/yZg+DvR5DJxSVbT/lHnMC7MzqKCFAYUMjntE8M++BVlJfTMLSTs6nX81Y74gwWW3
         IU2Y/KNJdxJJ1X+KJbw6atVuEPR9a/mgLAf1/6qVEwEGW8Q0YpT1EeZNzMOJOpK6uhvg
         87FLh4N4l5LnQh/5hkxoLbtXKVwKXvg7W26hhgTKgJ+mQJ53e+OHdZjKGXV/NkWXzR+m
         psZGPWWMLEkohzZdJg9ud7dYimzBnw6Kc04he1gOqmGGXv7hU6S7Lp5srqyjXz6n31AR
         gFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i+s2FZx53SQqxDw+1zONomhnnt1uwtiTU8GemVlvAO0=;
        b=bi0LjrXwA3kty+yys/rIUCpzRIYx8Pw4wpwH/vD/tr8VatB9dRIgznuQXPx5c5MPjZ
         WRfPjbVNStfzq+v4zTRZZgRJiVv7yV3RVquO6UazwUs473uvnilPpLeii8w1Z5P54xgK
         Dxe2RvMAG1EpD4TeQOkhQidMhfzMMs8XbLR6PCK7K5oOTcrmMlewa2w7oMblNHMvONPO
         WZLFWejY0/WPXGxttBFupAUWVwycLEebDSKuutdELl2sgx/oW1EDuj6MncqkNculoTmY
         2HoSBz1WMZPgMWY2DNmhtdAc2/gUAGiBRNHVLL2WU/1FKWbjfmuOvc1OCAVchOMoL4Pr
         e8wQ==
X-Gm-Message-State: AOAM533DbNDe73Fb9rqT9Gr4jrBjA7h4HRsLu+iNjIOwhN37Z7WHZDBU
        t3809jKLisQMPpck35CRodeTqQ==
X-Google-Smtp-Source: ABdhPJwCsMQUz4jaikEzFIzuv4+PIPPBltgRkatECk/BpkPrrPOkmq7zHAw9E2z6WlXuG+pdO5L5cg==
X-Received: by 2002:a4a:e99b:: with SMTP id s27mr242342ood.87.1612541149476;
        Fri, 05 Feb 2021 08:05:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y66sm990059oig.46.2021.02.05.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 08:05:48 -0800 (PST)
Date:   Fri, 5 Feb 2021 10:05:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom-qmp: Add UFS V5 registers found in
 SM8350
Message-ID: <YB1s2/lo0ud82anm@builder.lan>
References: <20210204165805.62235-1-vkoul@kernel.org>
 <20210204165805.62235-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204165805.62235-3-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Feb 10:58 CST 2021, Vinod Koul wrote:

> Add the registers for UFS found in SM8350. The UFS phy used in SM8350
> seems to have same offsets as V5 phy, although Documentation for that is
> lacking.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.h | 47 +++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index dff7be5a1cc1..71ce3aa174ae 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -824,6 +824,32 @@
>  #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
>  #define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
>  
> +/* Only for QMP V5 PHY - QSERDES COM registers */
> +#define QSERDES_V5_COM_PLL_IVCO				0x058
> +#define QSERDES_V5_COM_CP_CTRL_MODE0			0x074
> +#define QSERDES_V5_COM_CP_CTRL_MODE1			0x078
> +#define QSERDES_V5_COM_PLL_RCTRL_MODE0			0x07c
> +#define QSERDES_V5_COM_PLL_RCTRL_MODE1			0x080
> +#define QSERDES_V5_COM_PLL_CCTRL_MODE0			0x084
> +#define QSERDES_V5_COM_PLL_CCTRL_MODE1			0x088
> +#define QSERDES_V5_COM_SYSCLK_EN_SEL			0x094
> +#define QSERDES_V5_COM_LOCK_CMP_EN			0x0a4
> +#define QSERDES_V5_COM_LOCK_CMP1_MODE0			0x0ac
> +#define QSERDES_V5_COM_LOCK_CMP2_MODE0			0x0b0
> +#define QSERDES_V5_COM_LOCK_CMP1_MODE1			0x0b4
> +#define QSERDES_V5_COM_DEC_START_MODE0			0x0bc
> +#define QSERDES_V5_COM_LOCK_CMP2_MODE1			0x0b8
> +#define QSERDES_V5_COM_DEC_START_MODE1			0x0c4
> +#define QSERDES_V5_COM_VCO_TUNE_MAP			0x10c
> +#define QSERDES_V5_COM_VCO_TUNE_INITVAL2		0x124
> +#define QSERDES_V5_COM_HSCLK_SEL			0x158
> +#define QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL		0x15c
> +#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
> +#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
> +#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
> +#define QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
> +#define QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8
> +
>  /* Only for QMP V5 PHY - TX registers */
>  #define QSERDES_V5_TX_RES_CODE_LANE_TX			0x34
>  #define QSERDES_V5_TX_RES_CODE_LANE_RX			0x38
> @@ -837,6 +863,10 @@
>  #define QSERDES_V5_TX_RCV_DETECT_LVL_2			0xa4
>  #define QSERDES_V5_TX_TRAN_DRVR_EMP_EN			0xc0
>  #define QSERDES_V5_TX_PI_QEC_CTRL			0xe4
> +#define QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x178
> +#define QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x17c
> +#define QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x180
> +#define QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x184
>  
>  /* Only for QMP V5 PHY - RX registers */
>  #define QSERDES_V5_RX_UCDR_FO_GAIN			0x008
> @@ -893,6 +923,23 @@
>  #define QSERDES_V5_RX_DCC_CTRL1				0x1a8
>  #define QSERDES_V5_RX_VTH_CODE				0x1b0
>  
> +/* Only for QMP V5 PHY - UFS PCS registers */
> +#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB	0x00c
> +#define QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB	0x010
> +#define QPHY_V5_PCS_UFS_PLL_CNTL			0x02c
> +#define QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL		0x030
> +#define QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL		0x038
> +#define QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY		0x074
> +#define QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY		0x0b4
> +#define QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL		0x124
> +#define QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME		0x150
> +#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1			0x154
> +#define QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2			0x158
> +#define QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND		0x160
> +#define QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND			0x168
> +#define QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1		0x1d8
> +#define QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1		0x1e0
> +
>  /* Only for QMP V5 PHY - USB3 have different offsets than V4 */
>  #define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x300
>  #define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
> -- 
> 2.26.2
> 
