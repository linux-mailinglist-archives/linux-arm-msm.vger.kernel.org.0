Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A102303457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbhAZFXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbhAYRLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:11:52 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B95C06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:11:09 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id i25so4095856oie.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jan 2021 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a0Iqg19k3JMRXQlA8s8jCCfzTrbVd+zw1E8fGhfYxAY=;
        b=LrRDlaf2+TSX3mP5qfWdjxpLL+wSSYHc7gfcsGgve8bCOge7xQ2qSez8D8gV5fyAto
         yoYPO6qVqoFvjnLdMDm3PUsSnqZ5RqWPz74AZRpcfrgPlpFdpUvsLMsw3wA6AyLCwgIj
         6SIl7T5srv/eElFgUtnih+3+eBqlHOg5DsfVQoW7wmeBJ/5Me6+iowJ8SX4W3OCfT2Wf
         DoRSQK6/DjT2bmoSz2TIFQmbLINqbsjFQG1ig6Tu6qJ04k7gDw4j/R7CthFFQHrbGhrM
         sAIVLslkPKokraAiOd9QdOwNSJzyqHwOQ5wBN0cdIhVJh3SVmZWd2Drp7v3DmSkavLdU
         ekkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a0Iqg19k3JMRXQlA8s8jCCfzTrbVd+zw1E8fGhfYxAY=;
        b=na60j+My1YSPQidRj9dB88SzyUJusNTKyU/shTWsIxQwF4CDlw1Rj02bJWrmjvBYme
         DQN9mwI/mv0CY7drZoHm13BMzPX6I7ftQ5AGy8KzhkpHiXt1Z8QXg3bFPr8k+ywf5BlT
         CIPIepBDFoKNbABzugDsF3UNEyh8qzi5aUCwPokQB+UtXeMzawYvGZgJsxGiNPcSc2oe
         LzzsrdNGKCaDD/a/Za7MvCVSzQ+gZodqh8dItPei/BvEQx7CSyBi1Tm3eacV35fhjZBK
         geT/n0ZXwtsJNfPQmTAcdj8q1+4+fnYAs6av+nHsv/ykco1gis9JbRUBCDeRJM0ddUXw
         AsqQ==
X-Gm-Message-State: AOAM5329miUi2r4sfYQ4K/gGHX4+zOZqM/iLzgJoUdxG3oNpYOujSjHo
        mL9BmKYi3/HWvoZ+LjHusOwx+Q==
X-Google-Smtp-Source: ABdhPJwl27mCw1DWsN9nRAvIc6uolsENPpbyKyfTHDnrSNSA76hNllSU127S8ADVw67sf4CMGm/PtQ==
X-Received: by 2002:aca:ec43:: with SMTP id k64mr752340oih.13.1611594669250;
        Mon, 25 Jan 2021 09:11:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 93sm1571168ots.36.2021.01.25.09.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:11:08 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:11:07 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add UFS v4 registers found in SM8350
Message-ID: <YA77q/CZnjdW5pOM@builder.lan>
References: <20210125100906.4004908-1-vkoul@kernel.org>
 <20210125100906.4004908-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125100906.4004908-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 Jan 04:09 CST 2021, Vinod Koul wrote:

> Add the registers for few new registers found in SM8350. Also the UFS
> phy used in SM8350 seems to have different offsets than V4 phy, although
> it claims it is v4 phy, so add the new offsets with SM8350 tag instead
> of V4 tag.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index dff7be5a1cc1..bba1d5e3eb73 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -451,6 +451,7 @@
>  #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
>  #define QSERDES_V4_TX_LANE_MODE_1			0x84
>  #define QSERDES_V4_TX_LANE_MODE_2			0x88
> +#define QSERDES_V4_TX_LANE_MODE_3			0x8C
>  #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
>  #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
>  #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
> @@ -459,6 +460,13 @@
>  #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
>  #define QSERDES_V4_TX_PI_QEC_CTRL		0x104
>  
> +/* Only for SM8350 QMP V4 Phy TX offsets different from V4 */
> +#define QSERDES_SM8350_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x178
> +#define QSERDES_SM8350_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x17c
> +#define QSERDES_SM8350_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x180
> +#define QSERDES_SM8350_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x184
> +#define QSERDES_SM8350_TX_TRAN_DRVR_EMP_EN		0xc0
> +
>  /* Only for QMP V4 PHY - RX registers */
>  #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
>  #define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
> @@ -514,6 +522,24 @@
>  #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
>  #define QSERDES_V4_RX_VTH_CODE				0x1c4
>  
> +/* Only for SM8350 QMP V4 Phy RX offsets different from V4 */
> +#define QSERDES_SM8350_RX_RX_MODE_00_LOW		0x15c
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH		0x160
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH2		0x164
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH3		0x168
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH4		0x16c
> +#define QSERDES_SM8350_RX_RX_MODE_01_LOW		0x170
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH		0x174
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH2		0x178
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH3		0x17c
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH4		0x180
> +#define QSERDES_SM8350_RX_RX_MODE_10_LOW		0x184
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH		0x188
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH2		0x18c
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH3		0x190
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH4		0x194
> +#define QSERDES_SM8350_RX_DCC_CTRL1			0x1a8
> +
>  /* Only for QMP V4 PHY - UFS PCS registers */
>  #define QPHY_V4_PCS_UFS_PHY_START				0x000
>  #define QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL			0x004
> @@ -529,6 +555,7 @@
>  #define QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL			0x124
>  #define QPHY_V4_PCS_UFS_LINECFG_DISABLE				0x148
>  #define QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME			0x150
> +#define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL1				0x154
>  #define QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2				0x158
>  #define QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND			0x160
>  #define QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND				0x168
> -- 
> 2.26.2
> 
