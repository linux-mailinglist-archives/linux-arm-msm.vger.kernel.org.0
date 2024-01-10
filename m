Return-Path: <linux-arm-msm+bounces-6951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB623829D1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 16:09:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12C61C2168B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D13DE4C3A5;
	Wed, 10 Jan 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GgB6eoHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DACB4C3A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704899373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mq706KDaGt2V1Uel/sJuJJ5gE5lse5yNFkzf99F2BJ0=;
	b=GgB6eoHbt6BRC8U1o38CxNKcyzQKPa7QXD+Kue16yL+zyi4VhCF0yPSVGp9VFTveP+l7Gz
	DsYApYJus/5xEfgVvN8/JojfhJjlPO0obosRXK3HS6BjJmw6Zk4ONjdazBqjxPimtZq5oE
	T+e2DeH2n5I1FilPpt3MVKGjsFU3quk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-PP7P6qr4Nv6gBso_qFUCPA-1; Wed, 10 Jan 2024 10:09:25 -0500
X-MC-Unique: PP7P6qr4Nv6gBso_qFUCPA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429abac743fso19262891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 07:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704899365; x=1705504165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mq706KDaGt2V1Uel/sJuJJ5gE5lse5yNFkzf99F2BJ0=;
        b=cUYkO4jEem2Xi+J0ZyFXU6cLBhw8jSc+coCKnUIfb7q8NfUO17mp0DjnwRT7138FCh
         vIwtptCu0E9wDiHB1wT7BkX+i38Qf8e6CihEwu36Z14tjP2ofbSBcbQ517MJoh+/TnOc
         mvmKYG1/5G41+WlP4/HNj5PNupHU/xkMIvJZnO/qcNmCMPCcWsHlQ/51RfukHW/w535/
         T4CJwZ4JzdKBm6BA0f2e7pBbkXlwHZ+odIhXeo1qTLfqY7kgNmfCrGvQ9Zx9i65BREpv
         G+ghFwDngVqNTrtQODl5M39p7zirpzWIQUNSl4CPRXhF9W0i2wYTOG5feX7YRXrz2edv
         92Qg==
X-Gm-Message-State: AOJu0Yy3YeEQE2XLEfQmrjdQhU5z3X34b7aOsLuuyzaGvPsD4HK0hIRY
	apAtNya1nx44n85ofxRG/O+DHDQhbKARwkvlXDAhpuiI1Ac8Q7CwV8Wbx/9tjoJmyqUnzhkyoOK
	tPgwb0lUF3DeYQ8+JZeLN3z9EmnMYKsrCBA==
X-Received: by 2002:a0c:e804:0:b0:681:2616:8f1b with SMTP id y4-20020a0ce804000000b0068126168f1bmr617738qvn.45.1704899365462;
        Wed, 10 Jan 2024 07:09:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETusl4LxwTwP7t75njAJ3TdSC005RHckQQ1CjWAyLn9fPH+LRXHu43ePhtofkmoN4+INrPLA==
X-Received: by 2002:a0c:e804:0:b0:681:2616:8f1b with SMTP id y4-20020a0ce804000000b0068126168f1bmr617727qvn.45.1704899365148;
        Wed, 10 Jan 2024 07:09:25 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id k11-20020a056214102b00b00680c25f5f06sm1761060qvr.86.2024.01.10.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:09:24 -0800 (PST)
Date: Wed, 10 Jan 2024 09:09:22 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 8/8] phy: qcom: sgmii-eth: move PCS registers to separate
 header
Message-ID: <6yakf2j5haeu75pborlui4z5xq7loybfyxcy3d3n4wvrhei3zt@edwdbcbqhokc>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
 <20240109-phy-qmp-merge-common-v1-8-572899a14318@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109-phy-qmp-merge-common-v1-8-572899a14318@linaro.org>

On Tue, Jan 09, 2024 at 05:04:06AM +0200, Dmitry Baryshkov wrote:
> Follow the example of the rest of the QMP PHY drivers and move SGMII PCS
> registers to a separate header file.
> 
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Probably not necessary to test, but I took this for a spin without any
noticeable regression to networking with stmmac (which afaik is the only
user of this driver so far).

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h | 20 +++++++++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 64 +++++++++++----------------
>  2 files changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> new file mode 100644
> index 000000000000..4d8c962f5e0f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +#ifndef QCOM_PHY_QMP_PCS_SGMII_H_
> +#define QCOM_PHY_QMP_PCS_SGMII_H_
> +
> +#define QPHY_PCS_PHY_START				0x000
> +#define QPHY_PCS_POWER_DOWN_CONTROL			0x004
> +#define QPHY_PCS_SW_RESET				0x008
> +#define QPHY_PCS_LINE_RESET_TIME			0x00c
> +#define QPHY_PCS_TX_LARGE_AMP_DRV_LVL			0x020
> +#define QPHY_PCS_TX_SMALL_AMP_DRV_LVL			0x028
> +#define QPHY_PCS_PCS_READY_STATUS			0x094
> +#define QPHY_PCS_TX_MID_TERM_CTRL1			0x0d8
> +#define QPHY_PCS_TX_MID_TERM_CTRL2			0x0dc
> +#define QPHY_PCS_SGMII_MISC_CTRL8			0x118
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 233f9b70c673..5b1c82459c12 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -11,6 +11,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> +#include "phy-qcom-qmp-pcs-sgmii.h"
>  #include "phy-qcom-qmp-qserdes-com-v5.h"
>  #include "phy-qcom-qmp-qserdes-txrx-v5.h"
>  
> @@ -19,17 +20,6 @@
>  #define QSERDES_TX					0x400
>  #define QSERDES_PCS					0xc00
>  
> -#define QSERDES_PCS_PHY_START				(QSERDES_PCS + 0x0)
> -#define QSERDES_PCS_POWER_DOWN_CONTROL			(QSERDES_PCS + 0x4)
> -#define QSERDES_PCS_SW_RESET				(QSERDES_PCS + 0x8)
> -#define QSERDES_PCS_LINE_RESET_TIME			(QSERDES_PCS + 0xc)
> -#define QSERDES_PCS_TX_LARGE_AMP_DRV_LVL		(QSERDES_PCS + 0x20)
> -#define QSERDES_PCS_TX_SMALL_AMP_DRV_LVL		(QSERDES_PCS + 0x28)
> -#define QSERDES_PCS_TX_MID_TERM_CTRL1			(QSERDES_PCS + 0xd8)
> -#define QSERDES_PCS_TX_MID_TERM_CTRL2			(QSERDES_PCS + 0xdc)
> -#define QSERDES_PCS_SGMII_MISC_CTRL8			(QSERDES_PCS + 0x118)
> -#define QSERDES_PCS_PCS_READY_STATUS			(QSERDES_PCS + 0x94)
> -
>  #define QSERDES_COM_C_READY				BIT(0)
>  #define QSERDES_PCS_READY				BIT(0)
>  #define QSERDES_PCS_SGMIIPHY_READY			BIT(7)
> @@ -43,8 +33,8 @@ struct qcom_dwmac_sgmii_phy_data {
>  
>  static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
>  {
> -	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
> -	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
>  
>  	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
>  	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
> @@ -118,21 +108,21 @@ static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
>  	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
>  	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
>  
> -	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
> -	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> -	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> -	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
> -	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
> -	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x0C);
> -	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x0C);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x0C);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
>  
> -	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
>  }
>  
>  static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
>  {
> -	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
> -	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_POWER_DOWN_CONTROL, 0x01);
>  
>  	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
>  	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
> @@ -206,15 +196,15 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
>  	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
>  	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
>  
> -	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
> -	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> -	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> -	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
> -	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
> -	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x8C);
> -	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_LINE_RESET_TIME, 0x0C);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL1, 0x83);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SGMII_MISC_CTRL8, 0x8C);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
>  
> -	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
> +	regmap_write(regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
>  }
>  
>  static inline int
> @@ -251,14 +241,14 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  	}
>  
>  	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> -					     QSERDES_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
>  					     QSERDES_PCS_READY)) {
>  		dev_err(dev, "PCS_READY timed-out");
>  		return -ETIMEDOUT;
>  	}
>  
>  	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> -					     QSERDES_PCS_PCS_READY_STATUS,
> +					     QSERDES_PCS + QPHY_PCS_PCS_READY_STATUS,
>  					     QSERDES_PCS_SGMIIPHY_READY)) {
>  		dev_err(dev, "SGMIIPHY_READY timed-out");
>  		return -ETIMEDOUT;
> @@ -285,11 +275,11 @@ static int qcom_dwmac_sgmii_phy_power_off(struct phy *phy)
>  {
>  	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
>  
> -	regmap_write(data->regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
> -	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x01);
> +	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_TX_MID_TERM_CTRL2, 0x08);
> +	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x01);
>  	udelay(100);
> -	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x00);
> -	regmap_write(data->regmap, QSERDES_PCS_PHY_START, 0x01);
> +	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_SW_RESET, 0x00);
> +	regmap_write(data->regmap, QSERDES_PCS + QPHY_PCS_PHY_START, 0x01);
>  
>  	clk_disable_unprepare(data->refclk);
>  
> 
> -- 
> 2.39.2
> 
> 


