Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A4E55790D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 13:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiFWLuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 07:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbiFWLuV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 07:50:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54504D242
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 04:50:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id w20so32857354lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 04:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ir/DilAOPoYnMwqX0RWgy8L38tqV+tCh1dw/wevTBm0=;
        b=OejTdaKldG7w60iXTil2LTWtIYmZ6cXgsc1JH0iyWTjgT4hmoTEyjeJX8TQdj2N2Ws
         E8HUd8TxD1crsF8kCXsNoZRivQwtQUdaW+ez27VUF8JBhiPIC/q56Kouou/kZbsu2erH
         Qy95S0j3SswM2ZzEPHlmSjWgvXw2sW+MIkOeHE0bTcPEnmuTjT8UCi7+tApmG+pVnjRe
         Lm7+W7vTcw2/JU4cxOQOHnEgyPybhSUrz9azDVqPU/nkt3995VdLUCSIpqGCjcZghbOz
         XgwB9+aKf2giQJ3lP6UI9GkgLMuOhLRWO//rXUr/lPRdr14XgECA9y5kvPnyKSJD3AgH
         dDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ir/DilAOPoYnMwqX0RWgy8L38tqV+tCh1dw/wevTBm0=;
        b=mER3PtWcoa5wFpCYvQSvSUC1YW3YVJfwbEUtcChgWvsk8TC40G7v1d7kgq8fbSjXuT
         io/KDxR1WpDFE20oNXCE6gF02QlFzKvbk/MPBIGyfCg/4/cGlfWaItWehSe9sOfi3tk5
         8ZZ/JPGpq3aalTbiFwjr/UuHa9ZktB7QPosl0cWnxmvioOnKoPr1kbPkJaoTN+TtZ8UR
         jBlPF79F/53UP53neB35fY1y2KukRwAl9neZ+dC0KFAWpAQau4NJ6/PaSaDP9vBKrHks
         FHAXYraiyrQBlfl4QYCKwFUG5YeBaqDIq1UphPGf40rRF5CWnFJIIlh0f5mOLR0JkmZc
         4UtA==
X-Gm-Message-State: AJIora+yJmuNr/ZyjVcfWjJ9eUSXFgpG9/dtAku0+j8crN8Gpln/LSlP
        kSdhMKOpFSoiNO/RKSE3FB2RGSGcMVIPZ7M9
X-Google-Smtp-Source: AGRyM1tkOVrfM4sz3EsqFiZKvIHswAgXa27vIRjdVNDRiwQ7ylmF73Un1GaG9iJ6lcvP+oVLUfac6g==
X-Received: by 2002:ac2:52b7:0:b0:47f:616d:e54c with SMTP id r23-20020ac252b7000000b0047f616de54cmr4974909lfm.218.1655985016310;
        Thu, 23 Jun 2022 04:50:16 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05651220c200b0047f6e03d10fsm1727926lfr.226.2022.06.23.04.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 04:50:15 -0700 (PDT)
Message-ID: <a6c53db8-8639-55b5-c86a-449dbc07e7d7@linaro.org>
Date:   Thu, 23 Jun 2022 14:50:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] phy: qcom-qmp: clean up hex defines
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220609120338.4080-1-johan+linaro@kernel.org>
 <20220609120338.4080-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220609120338.4080-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2022 15:03, Johan Hovold wrote:
> Use lower case hex consistently for define values.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index 6d410826ae90..3a4f150dd499 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -30,7 +30,7 @@
>   #define QSERDES_PLL_CP_CTRL_MODE0			0x080
>   #define QSERDES_PLL_CP_CTRL_MODE1			0x084
>   #define QSERDES_PLL_PLL_RCTRL_MODE0			0x088
> -#define QSERDES_PLL_PLL_RCTRL_MODE1			0x08C
> +#define QSERDES_PLL_PLL_RCTRL_MODE1			0x08c
>   #define QSERDES_PLL_PLL_CCTRL_MODE0			0x090
>   #define QSERDES_PLL_PLL_CCTRL_MODE1			0x094
>   #define QSERDES_PLL_BIAS_EN_CTRL_BY_PSM			0x0a4
> @@ -44,7 +44,7 @@
>   #define QSERDES_PLL_DIV_FRAC_START3_MODE0		0x0e0
>   #define QSERDES_PLL_DIV_FRAC_START1_MODE1		0x0e4
>   #define QSERDES_PLL_DIV_FRAC_START2_MODE1		0x0e8
> -#define QSERDES_PLL_DIV_FRAC_START3_MODE1		0x0eC
> +#define QSERDES_PLL_DIV_FRAC_START3_MODE1		0x0ec
>   #define QSERDES_PLL_INTEGLOOP_GAIN0_MODE0		0x100
>   #define QSERDES_PLL_INTEGLOOP_GAIN1_MODE0		0x104
>   #define QSERDES_PLL_INTEGLOOP_GAIN0_MODE1		0x108
> @@ -270,11 +270,11 @@
>   #define QPHY_RX_MIN_HIBERN8_TIME			0x140
>   #define QPHY_RX_SIGDET_CTRL2				0x148
>   #define QPHY_RX_PWM_GEAR_BAND				0x154
> -#define QPHY_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB		0x1A8
> -#define QPHY_OSC_DTCT_ACTIONS				0x1AC
> -#define QPHY_RX_SIGDET_LVL				0x1D8
> -#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1DC
> -#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1E0
> +#define QPHY_PLL_LOCK_CHK_DLY_TIME_AUXCLK_LSB		0x1a8
> +#define QPHY_OSC_DTCT_ACTIONS				0x1ac
> +#define QPHY_RX_SIGDET_LVL				0x1d8
> +#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_LSB		0x1dc
> +#define QPHY_L1SS_WAKEUP_DLY_TIME_AUXCLK_MSB		0x1e0
>   
>   /* Only for QMP V3 & V4 PHY - DP COM registers */
>   #define QPHY_V3_DP_COM_PHY_MODE_CTRL			0x00
> @@ -639,7 +639,7 @@
>   #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
>   #define QSERDES_V4_TX_TX_INTERFACE_MODE			0xbc
>   #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
> -#define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
> +#define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdc
>   #define QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0xe0
>   #define QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0xe4
>   #define QSERDES_V4_TX_VMODE_CTRL1			0xe8


-- 
With best wishes
Dmitry
