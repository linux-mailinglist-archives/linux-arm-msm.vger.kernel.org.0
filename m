Return-Path: <linux-arm-msm+bounces-44992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9801A1049A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C48F9161DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B8A22DC33;
	Tue, 14 Jan 2025 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ApaAgIoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF179235C04
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851751; cv=none; b=Fvmd4qgTA6CoMC0uSdYP9leV0hSfNBNNtt95e2H/mBRLrp31EeN+kkLC3MBQ8omevXBK6BqmCBwpGV2QTKcDrukkOVMPLOnXGe/d34yy9XXW57Yrydz3+/uKtJSnX7c9wUPO9HplJNIhrgdFPfOdASgjLD810kY43JqmGfaxv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851751; c=relaxed/simple;
	bh=C7bAehAUK0tUsIeBbNTdDsTxcfXXKkBNO6A8CCjZnCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8wjR1g1s/f12RVYFmHJyFOGhyQ9HXwFdD0GJs5s9YbV6nI+iBm/4odLpbjcK6zSOYoXDZE21+bAt0oOhMgIqX9Of5b6ekF0WmcVSGuq/U1EOCdSMv/2GL/LnZYvIrey1P7soJytFrv+Nw9RxRpHZl3JpvWl07Qx/7vPlEHU4ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ApaAgIoE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401c52000dso5413224e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736851747; x=1737456547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFwIVOKJNqUobfqnBvMKtqQOow7yPzhvv6mwSnWRcUo=;
        b=ApaAgIoElMEUlYwmT9W0/DZ4ieOhdIJHnpcXC/e8hsgoiLytYzN/TLA1RHFaMxmQjS
         fQAjUM8uuXo0Rn5sEcgqsgJx5TGY1DracchFJklyvpF1/Zvrzn2pcA2/AVLfGlP7Y/d6
         yPudwKEyeaHL4cPNMCLhrxHqu9eQUXaKqtqrpsgICCPEp0PG733sJifwRlcofAkDHE6R
         ajUjUqBuQ8RpzSPaEUnh0fogF+VOzmLzfCb48nqL6CUf2qnOlfU4RDm07eR3X7a3Lowc
         ImQDiCsbtOXWd6K+yYqhQejVnIzOB5p1Wers/gTY2CRfylNRnvWP+42CRn6x9cE7DH/Q
         A/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851747; x=1737456547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFwIVOKJNqUobfqnBvMKtqQOow7yPzhvv6mwSnWRcUo=;
        b=VZ9u3/CZsYBtDtnrCmYTsV4tdTImCGapfrOEM3CZQwynMud/5lTaa4oQjIoVRbXiBP
         gM3dSrMxpFI769XkA/881PY0y6Ytx7JwdzST6GWDMv9/k7h06CU3jJ074YSuUvNO06qd
         W3vroR8Bexm6rp3PmxQ4EzeK4RSWQjPg7+7iAHuuU6K3N8RhGJBwj5pDzyf48WnjPSs4
         qNsfAasCZ+u63JzBZf7u5U35OoGAjgzb5NwcKv24QQ5jPIE342fgjXIuh33f7tkGUNRm
         a3nWTVv4l8PEjCovCjb4younWyiFkHUkc04FNhTAKkAtHA7Ctbi7nlqcLlyH54ci6fXY
         OoxA==
X-Forwarded-Encrypted: i=1; AJvYcCVS+W1IhyYHjEi5U+EWoKs2Stue6bpAcrQq3P0OMR9D37fw5tUBF7HiGViZ+yBRWFQ5SAzTRt/W3ukGLEoh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7sZ31SDotCkCaQpAQUGmk03DUKPIBpPmmLYnHQojKh9NMABEX
	9rmxMtdFpJgbSBF0goKyKWIb9Aed6aR9BX7do7Ki48ih4vATtzAhQzDDJsyQmak=
X-Gm-Gg: ASbGncuQ8JjbYahSKnnzYE/5X7ePWQABsJX/AAGwuA1jyz2agDNzcoEaEebv7yyQUfv
	gvmkyWnW0bc1vtByayFvXh8MCBbef9nvde2WNepmv9UtJJx4PRLKUVvHWjdA/+aGnNQpTP9BppL
	7mlFTjXHuedWAN8lfKDGIIUmT7NbkT57rI78P2xUv0XYl8TjgBqd7J+x9MhgVrc8ORD7O5LKnfM
	961DkIXZ4HdYk0nDbbsDxBsbRJp3V/ZTUCSVUolc9zEzLi8RagpsQs4uvqGkF6vlzzeize31kTE
	JLBrLvSZmp0ef9CMhwhUCP59HE5QTqaGpbD3
X-Google-Smtp-Source: AGHT+IG9p4K/3wM+rS6kcla1MDtsF/jV9SeBt+LwgknXH5OEOFw1PoHVBhvhNWqNWUQUc5KFBo5qoQ==
X-Received: by 2002:a05:6512:3c9c:b0:540:1d37:e6c with SMTP id 2adb3069b0e04-542845c4795mr7792572e87.30.1736851746857;
        Tue, 14 Jan 2025 02:49:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6686sm1686142e87.168.2025.01.14.02.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:49:06 -0800 (PST)
Date: Tue, 14 Jan 2025 12:49:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH 2/5] phy: qcom-qmp-ufs: Add PHY Configuration support for
 SM8750
Message-ID: <vry7yib4jtvyc5baruetqb2msy4j4ityv2s6z5smrz6rqjfb5l@xoharscfhz5n>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-2-b3774120eb8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_ufs_master-v1-2-b3774120eb8c@quicinc.com>

On Mon, Jan 13, 2025 at 01:46:25PM -0800, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add SM8750 specific register layout and table configs. The serdes
> TX RX register offset has changed for SM8750 and hence keep UFS
> specific serdes offsets in a dedicated header file.
> 
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |  12 ++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h    |  68 ++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 174 ++++++++++++++++++++-
>  3 files changed, 253 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> index 328c6c0b0b09ae4ff5bf14e846772e6d0f31ce5a..aa2278f9377408b3c602f6fa0de5021804f21f52 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h
> @@ -86,4 +86,16 @@
>  #define QSERDES_V6_COM_CMN_STATUS				0x1d0
>  #define QSERDES_V6_COM_C_READY_STATUS				0x1f8
>  
> +#define QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG			0x268
> +#define QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0			0x26c
> +#define QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0		0x270
> +#define QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0			0x274
> +#define QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0		0x58
> +
> +#define QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0		0x5c
> +#define QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1			0x278
> +#define QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1		0x27c
> +#define QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1			0x280
> +#define QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1		0x50
> +#define QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1		0x54
>  #endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..73b3857e0277ce6cdbe658066772172a94f25d6e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_UFS_V7_H_
> +#define QCOM_PHY_QMP_QSERDES_TXRX_UFS_V7_H_
> +
> +#define QSERDES_UFS_V7_TX_RES_CODE_LANE_TX				0x28
> +#define QSERDES_UFS_V7_TX_RES_CODE_LANE_RX				0x2c
> +#define QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_TX			0x30
> +#define QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_RX			0x34
> +#define QSERDES_UFS_V7_TX_LANE_MODE_1					0x7c
> +#define QSERDES_UFS_V7_TX_FR_DCC_CTRL					0x108
> +
> +#define QSERDES_UFS_V7_RX_UCDR_SO_SATURATION				0x28
> +#define QSERDES_UFS_V7_RX_UCDR_PI_CTRL1					0x58
> +#define QSERDES_UFS_V7_RX_TERM_BW_CTRL0					0xC4
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0				0x218
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1				0x21C
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2				0x220
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3				0x224
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4				0x228
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6				0x230
> +#define QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7				0x234
> +#define QSERDES_UFS_V7_RX_MODE_RATE2_B3					0x248
> +#define QSERDES_UFS_V7_RX_MODE_RATE2_B6					0x254
> +#define QSERDES_UFS_V7_RX_MODE_RATE2_B7					0x258
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B0					0x260
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B1					0x264
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B2					0x268
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B3					0x26C
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B4					0x270
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B5					0x274
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B7					0x27C
> +#define QSERDES_UFS_V7_RX_MODE_RATE3_B8					0x280
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0				0x284
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1				0x288
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2				0x28C
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3				0x290
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4				0x294
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5				0x298
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6				0x29C
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7				0x2A0
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0				0x2A8
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1				0x2AC
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2				0x2B0
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3				0x2B4
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4				0x2B8
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5				0x2BC
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6				0x2C0
> +#define QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7				0x2C4
> +#define QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL				0x348
> +#define QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM				0x380
> +#define QSERDES_UFS_V7_RX_INTERFACE_MODE				0x1F0
> +#define QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2				0xD4
> +#define QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4				0xDC
> +#define QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4				0xF0
> +#define QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS				0xF4
> +#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4		0x54
> +#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4			0x10
> +#define QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4			0x24
> +#define QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1			0x1CC
> +#define QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3				0x1D4
> +#define QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4				0x1B4
> +#define QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL				0x178

- Lowercase hex
- Sort RX by the register offset


> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index d964bdfe870029226482f264c78a27d0ec43bf2b..a1695b368fe7622bf8663343d0241b4d0d40ab59 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -31,6 +31,7 @@
>  #include "phy-qcom-qmp-pcs-ufs-v6.h"
>  
>  #include "phy-qcom-qmp-qserdes-txrx-ufs-v6.h"
> +#include "phy-qcom-qmp-qserdes-txrx-ufs-v7.h"
>  
>  /* QPHY_PCS_READY_STATUS bit */
>  #define PCS_READY				BIT(0)
> @@ -949,6 +950,132 @@ static const struct qmp_phy_init_tbl sm8650_ufsphy_g5_pcs[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSG5_SYNC_WAIT_TIME, 0x9e),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_serdes[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0xD9),

Lowercase hex

> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_HS_SWITCH_SEL_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_CFG, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x1F),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO_MODE1, 0x1F),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IETRIM, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_IPTRIM, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_ADAPTIVE_ANALOG_CONFIG, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x41),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE0, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE0, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x7F),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x92),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE1, 0x4C),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_ADAPTIVE_MODE1, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCCTRL_ADAPTIVE_MODE1, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_ADAPTIVE_MODE1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE1, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE1, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xBE),
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_tx[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_LANE_MODE_1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_TX, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_TX_RES_CODE_LANE_OFFSET_RX, 0x17),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_rx[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE2, 0x0C),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FO_GAIN_RATE4, 0x0C),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_GAIN_RATE4, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x14),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CONTROLS, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_OFFSET_ADAPTOR_CNTRL3, 0x0E),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_COUNT_HIGH_RATE4, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_FO_GAIN_RATE4, 0x1C),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_FASTLOCK_SO_GAIN_RATE4, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_VGA_CAL_MAN_VAL, 0x8E),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_EQU_ADAPTOR_CNTRL4, 0x0F),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B0, 0xCE),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B1, 0xCE),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B2, 0x18),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B3, 0x1A),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B4, 0x0F),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B6, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE_0_1_B7, 0x62),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B3, 0x9A),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B6, 0xE2),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE2_B7, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B0, 0x1B),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B1, 0x1B),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B2, 0x98),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B3, 0x9B),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B4, 0x2A),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B5, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B7, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE3_B8, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B0, 0x93),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B1, 0x93),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B2, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B3, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B4, 0x5F),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B5, 0x92),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B6, 0xE3),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SA_B7, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B0, 0x9B),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B1, 0x9B),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B2, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B3, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B4, 0x5F),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B5, 0x92),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B6, 0xFB),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_MODE_RATE4_SB_B7, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_SO_SATURATION, 0x1F),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_UCDR_PI_CTRL1, 0x94),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_TERM_BW_CTRL0, 0xFA),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_DLL0_FTUNE_CTRL, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_UFS_V7_RX_SIGDET_CAL_TRIM, 0x77),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_pcs[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0x40),

Why does SM8650 have 0xc1 here?

> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0F),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S4, 0x0E),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S5, 0x12),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S6, 0x15),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S7, 0x19),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_g4_pcs[] = {

Missing QPHY_V6_PCS_UFS_PLL_CNTL, then it becomes sm8650_ufsphy_g4_pcs

> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_g5_pcs[] = {

sm8650_ufsphy_g5_pcs?

> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x33),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x05),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x05),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HS_G5_SYNC_LENGTH_CAPABILITY, 0x4d),
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_HSG5_SYNC_WAIT_TIME, 0x9e),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8750_ufsphy_hs_b_pcs[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0x41),
> +};
> +
>  struct qmp_ufs_offsets {
>  	u16 serdes;
>  	u16 pcs;
> @@ -1523,6 +1650,45 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
>  	.regs			= ufsphy_v6_regs_layout,
>  };
>  
> +static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
> +	.lanes			= 2,
> +
> +	.offsets		= &qmp_ufs_offsets_v6,
> +	.max_supported_gear	= UFS_HS_G5,
> +
> +	.tbls = {
> +		.serdes		= sm8750_ufsphy_serdes,
> +		.serdes_num	= ARRAY_SIZE(sm8750_ufsphy_serdes),
> +		.tx		= sm8750_ufsphy_tx,
> +		.tx_num		= ARRAY_SIZE(sm8750_ufsphy_tx),
> +		.rx		= sm8750_ufsphy_rx,
> +		.rx_num		= ARRAY_SIZE(sm8750_ufsphy_rx),
> +		.pcs		= sm8750_ufsphy_pcs,
> +		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_pcs),
> +	},
> +
> +	.tbls_hs_b = {
> +		.pcs		= sm8750_ufsphy_hs_b_pcs,
> +		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_hs_b_pcs),
> +	},
> +
> +	.tbls_hs_overlay[0] = {
> +		.pcs		= sm8750_ufsphy_g4_pcs,
> +		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_g4_pcs),
> +		.max_gear	= UFS_HS_G4,
> +	},
> +	.tbls_hs_overlay[1] = {
> +		.pcs		= sm8750_ufsphy_g5_pcs,
> +		.pcs_num	= ARRAY_SIZE(sm8750_ufsphy_g5_pcs),
> +		.max_gear	= UFS_HS_G5,
> +	},
> +
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= ufsphy_v6_regs_layout,
> +
> +};
> +
>  static void qmp_ufs_serdes_init(struct qmp_ufs *qmp, const struct qmp_phy_cfg_tbls *tbls)
>  {
>  	void __iomem *serdes = qmp->serdes;
> @@ -1593,8 +1759,10 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>  		qmp_ufs_pcs_init(qmp, &cfg->tbls_hs_overlay[i]);
>  	}
>  
> -	if (qmp->mode == PHY_MODE_UFS_HS_B)
> +	if (qmp->mode == PHY_MODE_UFS_HS_B) {
>  		qmp_ufs_serdes_init(qmp, &cfg->tbls_hs_b);
> +		qmp_ufs_pcs_init(qmp, &cfg->tbls_hs_b);

Extract the serdes+lanes+pcs helper, use it in this function.

> +	}
>  }
>  
>  static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> @@ -2061,7 +2229,11 @@ static const struct of_device_id qmp_ufs_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8650-qmp-ufs-phy",
>  		.data = &sm8650_ufsphy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8750-qmp-ufs-phy",
> +		.data = &sm8750_ufsphy_cfg,
>  	},
> +
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, qmp_ufs_of_match_table);
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

