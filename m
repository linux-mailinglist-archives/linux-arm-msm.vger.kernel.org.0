Return-Path: <linux-arm-msm+bounces-6950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FC6829D1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 16:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8C61F2283C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 15:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6232F4C3A5;
	Wed, 10 Jan 2024 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T4L86ACm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF81B4C3A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704899342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UqQ5cHIfK3zqe9AfNBWQAD9qpfwZyu2TC9kd12aHrCI=;
	b=T4L86ACmLxu7SixhHJYsdup1MBC7tMZ7X/6x82zm99RxO7J4ZKu0ETXrrSXsBFNj7CtdMj
	R7L61hdB4Y3HQfS9kxpWtOu+nASDLl088sVrsWil67zmLOug5zbPL3MKsvZ5eiQvKQFPe/
	RDGTTiEGiGgqIatgsiOHAFI/O5yPYro=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-ntpy8J00OkuBPdBbqWj3aA-1; Wed, 10 Jan 2024 10:09:01 -0500
X-MC-Unique: ntpy8J00OkuBPdBbqWj3aA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-680c88d31f6so54658966d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 07:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704899341; x=1705504141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqQ5cHIfK3zqe9AfNBWQAD9qpfwZyu2TC9kd12aHrCI=;
        b=aYPI0x9wZyAokSrUvQebOzUJVo6mSZUuTczaaOjoi+yR463rbCvTtnvGawxLcvwfGf
         8Kpegiadncz//0tAjVZy1XQlUFjiaWECzrntrHWT+xYmdkYLLLXnjHhYckK4+xqtjmqV
         1mL+dv5NFH6zmK0FlJS4Gb5VbL48tGBiBCkj8+uGtAgBLnSljnmkcl8CpfAbvP0GJ1x5
         3dPXrpWqrJWbJTTKkHGs/XWn68N4q6EFhjGu/mdq/FB5L9iuKiXXDUciwPt4l0GJ9hPU
         +ERpJgoW502UKi83PHCTgjIlDhDUWujwTLPKY0zJHWs60OnP7qVvFMHOxquRsrWq6XaD
         IXhg==
X-Gm-Message-State: AOJu0YwdWMV1IwYdUp17SxAsuZY+6li+HqTDsW/0FUW2kwd2B5LWPwHS
	n0PGzBDpZupWH4787AViQVoc/cX1gA3b2XxXRKpXCiw8mAugLJze9squed0PlL28goqoiTyfGM5
	g/fdDvYIvrZjsmrg9FNv0irv6/Q/TJcqJH5XxzluqLg==
X-Received: by 2002:a05:622a:116:b0:429:8211:bad4 with SMTP id u22-20020a05622a011600b004298211bad4mr1371025qtw.137.1704899340852;
        Wed, 10 Jan 2024 07:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFb5EcTJnEh7uIVZYWnH2htHU37/behikV6JwAWPo7pWL/grdne8Qg0qv4yEIj+dGb12ZyYA==
X-Received: by 2002:a05:622a:116:b0:429:8211:bad4 with SMTP id u22-20020a05622a011600b004298211bad4mr1371002qtw.137.1704899340391;
        Wed, 10 Jan 2024 07:09:00 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id hj2-20020a05622a620200b00427f3b9e60dsm1790717qtb.60.2024.01.10.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:09:00 -0800 (PST)
Date: Wed, 10 Jan 2024 09:08:57 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 7/8] phy: qcom: sgmii-eth: use existing register
 definitions
Message-ID: <rctbma7hh4dqf7f5czmfhfske5d7dtfekvxebgisgfjsxfg63o@i5ojx6xfdo57>
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
 <20240109-phy-qmp-merge-common-v1-7-572899a14318@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109-phy-qmp-merge-common-v1-7-572899a14318@linaro.org>

On Tue, Jan 09, 2024 at 05:04:05AM +0200, Dmitry Baryshkov wrote:
> The Qualcomm SGMII SerDes PHY is a QMP PHY. As such, it uses standard
> registers for QSERDES COM/RX/TX regions. Use register defines from the
> existing headers.
> 
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Probably not necessary to test, but I took this for a spin without any
noticeable regression to networking with stmmac (which afaik is the only
user of this driver so far).

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

> ---
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 367 ++++++++++++------------------
>  1 file changed, 149 insertions(+), 218 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 03dc753f0de1..233f9b70c673 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -11,83 +11,14 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> -#define QSERDES_QMP_PLL					0x0
> -#define QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0		(QSERDES_QMP_PLL + 0x1ac)
> -#define QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0		(QSERDES_QMP_PLL + 0x1b0)
> -#define QSERDES_COM_BIN_VCOCAL_HSCLK_SEL		(QSERDES_QMP_PLL + 0x1bc)
> -#define QSERDES_COM_CORE_CLK_EN				(QSERDES_QMP_PLL + 0x174)
> -#define QSERDES_COM_CORECLK_DIV_MODE0			(QSERDES_QMP_PLL + 0x168)
> -#define QSERDES_COM_CP_CTRL_MODE0			(QSERDES_QMP_PLL + 0x74)
> -#define QSERDES_COM_DEC_START_MODE0			(QSERDES_QMP_PLL + 0xbc)
> -#define QSERDES_COM_DIV_FRAC_START1_MODE0		(QSERDES_QMP_PLL + 0xcc)
> -#define QSERDES_COM_DIV_FRAC_START2_MODE0		(QSERDES_QMP_PLL + 0xd0)
> -#define QSERDES_COM_DIV_FRAC_START3_MODE0		(QSERDES_QMP_PLL + 0xd4)
> -#define QSERDES_COM_HSCLK_HS_SWITCH_SEL			(QSERDES_QMP_PLL + 0x15c)
> -#define QSERDES_COM_HSCLK_SEL				(QSERDES_QMP_PLL + 0x158)
> -#define QSERDES_COM_LOCK_CMP1_MODE0			(QSERDES_QMP_PLL + 0xac)
> -#define QSERDES_COM_LOCK_CMP2_MODE0			(QSERDES_QMP_PLL + 0xb0)
> -#define QSERDES_COM_PLL_CCTRL_MODE0			(QSERDES_QMP_PLL + 0x84)
> -#define QSERDES_COM_PLL_IVCO				(QSERDES_QMP_PLL + 0x58)
> -#define QSERDES_COM_PLL_RCTRL_MODE0			(QSERDES_QMP_PLL + 0x7c)
> -#define QSERDES_COM_SYSCLK_EN_SEL			(QSERDES_QMP_PLL + 0x94)
> -#define QSERDES_COM_VCO_TUNE1_MODE0			(QSERDES_QMP_PLL + 0x110)
> -#define QSERDES_COM_VCO_TUNE2_MODE0			(QSERDES_QMP_PLL + 0x114)
> -#define QSERDES_COM_VCO_TUNE_INITVAL2			(QSERDES_QMP_PLL + 0x124)
> -#define QSERDES_COM_C_READY_STATUS			(QSERDES_QMP_PLL + 0x178)
> -#define QSERDES_COM_CMN_STATUS				(QSERDES_QMP_PLL + 0x140)
> +#include "phy-qcom-qmp-qserdes-com-v5.h"
> +#include "phy-qcom-qmp-qserdes-txrx-v5.h"
>  
> +#define QSERDES_QMP_PLL					0x0
>  #define QSERDES_RX					0x600
> -#define QSERDES_RX_UCDR_FO_GAIN				(QSERDES_RX + 0x8)
> -#define QSERDES_RX_UCDR_SO_GAIN				(QSERDES_RX + 0x14)
> -#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		(QSERDES_RX + 0x30)
> -#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	(QSERDES_RX + 0x34)
> -#define QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW		(QSERDES_RX + 0x3c)
> -#define QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH		(QSERDES_RX + 0x40)
> -#define QSERDES_RX_UCDR_PI_CONTROLS			(QSERDES_RX + 0x44)
> -#define QSERDES_RX_UCDR_PI_CTRL2			(QSERDES_RX + 0x48)
> -#define QSERDES_RX_RX_TERM_BW				(QSERDES_RX + 0x80)
> -#define QSERDES_RX_VGA_CAL_CNTRL2			(QSERDES_RX + 0xd8)
> -#define QSERDES_RX_GM_CAL				(QSERDES_RX + 0xdc)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1		(QSERDES_RX + 0xe8)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		(QSERDES_RX + 0xec)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		(QSERDES_RX + 0xf0)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		(QSERDES_RX + 0xf4)
> -#define QSERDES_RX_RX_IDAC_TSETTLE_LOW			(QSERDES_RX + 0xf8)
> -#define QSERDES_RX_RX_IDAC_TSETTLE_HIGH			(QSERDES_RX + 0xfc)
> -#define QSERDES_RX_RX_IDAC_MEASURE_TIME			(QSERDES_RX + 0x100)
> -#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(QSERDES_RX + 0x110)
> -#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		(QSERDES_RX + 0x114)
> -#define QSERDES_RX_SIGDET_CNTRL				(QSERDES_RX + 0x11c)
> -#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		(QSERDES_RX + 0x124)
> -#define QSERDES_RX_RX_BAND				(QSERDES_RX + 0x128)
> -#define QSERDES_RX_RX_MODE_00_LOW			(QSERDES_RX + 0x15c)
> -#define QSERDES_RX_RX_MODE_00_HIGH			(QSERDES_RX + 0x160)
> -#define QSERDES_RX_RX_MODE_00_HIGH2			(QSERDES_RX + 0x164)
> -#define QSERDES_RX_RX_MODE_00_HIGH3			(QSERDES_RX + 0x168)
> -#define QSERDES_RX_RX_MODE_00_HIGH4			(QSERDES_RX + 0x16c)
> -#define QSERDES_RX_RX_MODE_01_LOW			(QSERDES_RX + 0x170)
> -#define QSERDES_RX_RX_MODE_01_HIGH			(QSERDES_RX + 0x174)
> -#define QSERDES_RX_RX_MODE_01_HIGH2			(QSERDES_RX + 0x178)
> -#define QSERDES_RX_RX_MODE_01_HIGH3			(QSERDES_RX + 0x17c)
> -#define QSERDES_RX_RX_MODE_01_HIGH4			(QSERDES_RX + 0x180)
> -#define QSERDES_RX_RX_MODE_10_LOW			(QSERDES_RX + 0x184)
> -#define QSERDES_RX_RX_MODE_10_HIGH			(QSERDES_RX + 0x188)
> -#define QSERDES_RX_RX_MODE_10_HIGH2			(QSERDES_RX + 0x18c)
> -#define QSERDES_RX_RX_MODE_10_HIGH3			(QSERDES_RX + 0x190)
> -#define QSERDES_RX_RX_MODE_10_HIGH4			(QSERDES_RX + 0x194)
> -#define QSERDES_RX_DCC_CTRL1				(QSERDES_RX + 0x1a8)
> -
>  #define QSERDES_TX					0x400
> -#define QSERDES_TX_TX_BAND				(QSERDES_TX + 0x24)
> -#define QSERDES_TX_SLEW_CNTL				(QSERDES_TX + 0x28)
> -#define QSERDES_TX_RES_CODE_LANE_OFFSET_TX		(QSERDES_TX + 0x3c)
> -#define QSERDES_TX_RES_CODE_LANE_OFFSET_RX		(QSERDES_TX + 0x40)
> -#define QSERDES_TX_LANE_MODE_1				(QSERDES_TX + 0x84)
> -#define QSERDES_TX_LANE_MODE_3				(QSERDES_TX + 0x8c)
> -#define QSERDES_TX_RCV_DETECT_LVL_2			(QSERDES_TX + 0xa4)
> -#define QSERDES_TX_TRAN_DRVR_EMP_EN			(QSERDES_TX + 0xc0)
> -
> -#define QSERDES_PCS					0xC00
> +#define QSERDES_PCS					0xc00
> +
>  #define QSERDES_PCS_PHY_START				(QSERDES_PCS + 0x0)
>  #define QSERDES_PCS_POWER_DOWN_CONTROL			(QSERDES_PCS + 0x4)
>  #define QSERDES_PCS_SW_RESET				(QSERDES_PCS + 0x8)
> @@ -115,77 +46,77 @@ static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
>  	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
>  	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
>  
> -	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
> -	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
> -	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
> -	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
> -	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
> -	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x0A);
> -	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x1A);
> -	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x82);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03);
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0x24);
> -
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
> -	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x04);
> -	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
> -	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x0A);
> -	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xB9);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
> -
> -	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x05);
> -	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
> -	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
> -	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
> -	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
> -	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
> -	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
> -	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
> -
> -	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
> -	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
> -	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
> -	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x04);
> -	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
> -	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
> -	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
> -	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
> -	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
> -	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
> -	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x05);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0xE0);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x09);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB1);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
> -	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x16);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_SYSCLK_EN_SEL, 0x1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP1_MODE0, 0x0A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DEC_START_MODE0, 0x82);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START1_MODE0, 0x55);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START2_MODE0, 0x55);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START3_MODE0, 0x03);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE1_MODE0, 0x24);
> +
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE2_MODE0, 0x02);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_SEL, 0x04);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORECLK_DIV_MODE0, 0x0A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORE_CLK_EN, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xB9);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
> +
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TX_BAND, 0x05);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_SLEW_CNTL, 0x0A);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_1, 0x05);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_3, 0x00);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0C);
> +
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FO_GAIN, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_GAIN, 0x06);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_TERM_BW, 0x04);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_GM_CAL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0x80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x20);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_CNTRL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_BAND, 0x05);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x09);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xB1);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x09);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xB1);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3B);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
>  
>  	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
>  	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> @@ -203,77 +134,77 @@ static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
>  	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
>  	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
>  
> -	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
> -	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
> -	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
> -	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
> -	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
> -	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x1A);
> -	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x41);
> -	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x7A);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x20);
> -	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x01);
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0xA1);
> -
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
> -	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
> -	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x03);
> -	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
> -	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x05);
> -	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xCD);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1C);
> -	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
> -
> -	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x04);
> -	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
> -	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
> -	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x02);
> -	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
> -	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
> -	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
> -	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
> -
> -	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
> -	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
> -	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
> -	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
> -	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x00);
> -	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
> -	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
> -	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
> -	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
> -	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
> -	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
> -	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
> -	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
> -	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x18);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0x18);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x0C);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
> -	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
> -	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_IVCO, 0x0F);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CP_CTRL_MODE0, 0x06);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x16);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x36);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_SYSCLK_EN_SEL, 0x1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP1_MODE0, 0x1A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x41);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DEC_START_MODE0, 0x7A);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START1_MODE0, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START2_MODE0, 0x20);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_DIV_FRAC_START3_MODE0, 0x01);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE1_MODE0, 0xA1);
> +
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE2_MODE0, 0x02);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_SEL, 0x03);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORECLK_DIV_MODE0, 0x05);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_CORE_CLK_EN, 0x00);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xCD);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1C);
> +	regmap_write(regmap, QSERDES_QMP_PLL + QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
> +
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TX_BAND, 0x04);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_SLEW_CNTL, 0x0A);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x02);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_1, 0x05);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_LANE_MODE_3, 0x00);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12);
> +	regmap_write(regmap, QSERDES_TX + QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0C);
> +
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FO_GAIN, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_GAIN, 0x06);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x81);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_TERM_BW, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x08);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_GM_CAL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0x80);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x20);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_CNTRL, 0x0F);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_BAND, 0x18);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_LOW, 0x18);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x0C);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xB8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x09);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xB1);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_LOW, 0xE0);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xC8);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3B);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xB7);
> +	regmap_write(regmap, QSERDES_RX + QSERDES_V5_RX_DCC_CTRL1, 0x0C);
>  
>  	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
>  	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
> @@ -313,7 +244,7 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  	}
>  
>  	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> -					     QSERDES_COM_C_READY_STATUS,
> +					     QSERDES_QMP_PLL + QSERDES_V5_COM_C_READY_STATUS,
>  					     QSERDES_COM_C_READY)) {
>  		dev_err(dev, "QSERDES_COM_C_READY_STATUS timed-out");
>  		return -ETIMEDOUT;
> @@ -334,7 +265,7 @@ static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
>  	}
>  
>  	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
> -					     QSERDES_COM_CMN_STATUS,
> +					     QSERDES_QMP_PLL + QSERDES_V5_COM_CMN_STATUS,
>  					     QSERDES_COM_C_PLL_LOCKED)) {
>  		dev_err(dev, "PLL Lock Status timed-out");
>  		return -ETIMEDOUT;
> 
> -- 
> 2.39.2
> 
> 


