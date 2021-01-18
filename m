Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA83D2F98EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 06:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbhARFFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 00:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729917AbhARFFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 00:05:42 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D460C061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:05:02 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id f132so16501344oib.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jan 2021 21:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H+/m5z1+8mbiaybwDUSSX8l5FvJLfJ4uM2P56+ccIAY=;
        b=DkczEMHduwui4juP5lY61G4FY8oe/1lmezswWYp3Yr3sWFBto+5ejl5S+oHeDJdIIP
         3yD+00cWJ7YhIIL76L1rS071tYBX1gfTzqf+6pRFfTl3SdjfStYAMh4ry0XzyxicVkYR
         u11Z5SMU53zBAU5OtLRT2Y2VntmaQvgqJ6xy8dQu7+MnvedeGJp+9OenCGJRluJhDWof
         HSGDiho2D02uHsKITZmBmqZAvRTqs8Apijv7iLXFBZSAJIfCfF7THFvzz1t2GpVx0EgE
         gYT9ftMx1V7vQrGMEjP0bJ/wXP4o8JOfemaQpLyPTRRCLz3EyqG3M4N1MWLBgpQ4oZ70
         zLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H+/m5z1+8mbiaybwDUSSX8l5FvJLfJ4uM2P56+ccIAY=;
        b=m5glvbfCyNPDiGS0LAQPFetqjIPtGeWCJRyUOVJiiO+ncKADEe5m5L0adjtfvq3myN
         dEzDHJx5Xa5SdvyGWkFsUqwQEfS0x+VBKNhJ0yL0brV54Jl5Fab++OoEq77+plNSXW/H
         4jFLHn/5lkBSkFycQExzfj+X5nAFeiBE5HXueaXT2AB/YYRMrYHlW/PWkAPAgPvyhZeq
         iFIBFjh0cJYTrtkcpvc6K4WO46Cym5gfME4xg5pHk3I6lD68TtG6XTQS09YTy2GRLowN
         H5OhMKG0gP7805MyU9THFm2mwspOG5YHc6Inbg10vuj1804BjtvD2RVegrxhWRn0NBsA
         +zyA==
X-Gm-Message-State: AOAM530ofLqZHBtBI8MkVM4Kf5XOb4XR0tgnImjPUOA7i/Ic2/Mv6ckL
        MqyJCY+oiHKycOYocgIY67S5Zw==
X-Google-Smtp-Source: ABdhPJwfP8rGF4yY2Gqeuef0IySkfnMt2hhoCeQI18mKv2k7aMistzQc8+0QbNOY9rJ+uKlN7faD+g==
X-Received: by 2002:aca:1904:: with SMTP id l4mr12069807oii.168.1610946301544;
        Sun, 17 Jan 2021 21:05:01 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k3sm3427907oof.31.2021.01.17.21.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 21:05:00 -0800 (PST)
Date:   Sun, 17 Jan 2021 23:04:59 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom-qmp: Add SM8350 USB QMP PHYs
Message-ID: <YAUW+2xUJGM7s/ZW@builder.lan>
References: <20210115174723.7424-1-jackp@codeaurora.org>
 <20210115174723.7424-3-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115174723.7424-3-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 Jan 11:47 CST 2021, Jack Pham wrote:

> Add support for the USB DP & UNI PHYs found on SM8350. These use
> version 5.0.0 of the QMP PHY IP and thus require new "V5"
> definitions of the register offset macros for the QSERDES RX
> and TX blocks. The QSERDES common and QPHY PCS blocks' register
> offsets are largely unchanged from V4 so some of the existing
> macros can be reused.
> 

I didn't review the programming sequences, but the rest looks good to
me.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v2: Added missing to sm8350_usb3_uniphy entry to qcom_qmp_phy_of_match_table
> 
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 212 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h | 100 +++++++++++++
>  2 files changed, 312 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index f103b14f983e..d7f0d47f774f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -216,6 +216,15 @@ static const unsigned int qmp_v4_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x614,
>  };
>  
> +static const unsigned int sm8350_usb3_uniphy_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_SW_RESET]			= 0x00,
> +	[QPHY_START_CTRL]		= 0x44,
> +	[QPHY_PCS_STATUS]		= 0x14,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
> +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x1008,
> +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x1014,
> +};
> +
>  static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_START_CTRL]		= 0x00,
>  	[QPHY_PCS_READY_STATUS]		= 0x160,
> @@ -2025,6 +2034,144 @@ static const struct qmp_phy_init_tbl sdx55_usb3_uniphy_rx_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x35),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_5, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_usb3_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xbb),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7b),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbb),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3d, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3c, 2),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xd2),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x13),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_EN_TIMER, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VTH_CODE, 0x10),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_usb3_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x10),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0xbd),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x7b),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xe4),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +};
> +
>  /* struct qmp_phy_cfg - per-PHY initialization config */
>  struct qmp_phy_cfg {
>  	/* phy-type - PCIE/UFS/USB */
> @@ -2917,6 +3064,65 @@ static const struct qmp_phy_cfg sdx55_usb3_uniphy_cfg = {
>  	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
>  };
>  
> +static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= sm8150_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
> +	.tx_tbl			= sm8350_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_tx_tbl),
> +	.rx_tbl			= sm8350_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_rx_tbl),
> +	.pcs_tbl		= sm8350_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_pcs_tbl),
> +	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v4_usb3phy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +
> +	.has_pwrdn_delay	= true,
> +	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> +	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
> +
> +	.has_phy_dp_com_ctrl	= true,
> +	.is_dual_lane_phy	= true,
> +};
> +
> +static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
> +	.tx_tbl			= sm8350_usb3_uniphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_tx_tbl),
> +	.rx_tbl			= sm8350_usb3_uniphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_rx_tbl),
> +	.pcs_tbl		= sm8350_usb3_uniphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_uniphy_pcs_tbl),
> +	.clk_list		= qmp_v4_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= sm8350_usb3_uniphy_regs_layout,
> +
> +	.start_ctrl		= SERDES_START | PCS_START,
> +	.pwrdn_ctrl		= SW_PWRDN,
> +
> +	.has_pwrdn_delay	= true,
> +	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
> +	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
> +};
> +
>  static void qcom_qmp_phy_configure_lane(void __iomem *base,
>  					const unsigned int *regs,
>  					const struct qmp_phy_init_tbl tbl[],
> @@ -4267,6 +4473,12 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sdx55-qmp-usb3-uni-phy",
>  		.data = &sdx55_usb3_uniphy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8350-qmp-usb3-phy",
> +		.data = &sm8350_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8350-qmp-usb3-uni-phy",
> +		.data = &sm8350_usb3_uniphy_cfg,
>  	},
>  	{ },
>  };
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index db92a461dd2e..dff7be5a1cc1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -824,4 +824,104 @@
>  #define QPHY_V4_PCS_PCIE_PRESET_P10_PRE			0xbc
>  #define QPHY_V4_PCS_PCIE_PRESET_P10_POST		0xe0
>  
> +/* Only for QMP V5 PHY - TX registers */
> +#define QSERDES_V5_TX_RES_CODE_LANE_TX			0x34
> +#define QSERDES_V5_TX_RES_CODE_LANE_RX			0x38
> +#define QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
> +#define QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX 		0x40
> +#define QSERDES_V5_TX_LANE_MODE_1			0x84
> +#define QSERDES_V5_TX_LANE_MODE_2			0x88
> +#define QSERDES_V5_TX_LANE_MODE_3			0x8c
> +#define QSERDES_V5_TX_LANE_MODE_4			0x90
> +#define QSERDES_V5_TX_LANE_MODE_5			0x94
> +#define QSERDES_V5_TX_RCV_DETECT_LVL_2			0xa4
> +#define QSERDES_V5_TX_TRAN_DRVR_EMP_EN			0xc0
> +#define QSERDES_V5_TX_PI_QEC_CTRL			0xe4
> +
> +/* Only for QMP V5 PHY - RX registers */
> +#define QSERDES_V5_RX_UCDR_FO_GAIN			0x008
> +#define QSERDES_V5_RX_UCDR_SO_GAIN			0x014
> +#define QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN		0x030
> +#define QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE	0x034
> +#define QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW		0x03c
> +#define QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH		0x040
> +#define QSERDES_V5_RX_UCDR_PI_CONTROLS			0x044
> +#define QSERDES_V5_RX_UCDR_PI_CTRL2			0x048
> +#define QSERDES_V5_RX_UCDR_SB2_THRESH1			0x04c
> +#define QSERDES_V5_RX_UCDR_SB2_THRESH2			0x050
> +#define QSERDES_V5_RX_UCDR_SB2_GAIN1			0x054
> +#define QSERDES_V5_RX_UCDR_SB2_GAIN2			0x058
> +#define QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE		0x060
> +#define QSERDES_V5_RX_RCLK_AUXDATA_SEL			0x064
> +#define QSERDES_V5_RX_AC_JTAG_ENABLE			0x068
> +#define QSERDES_V5_RX_AC_JTAG_MODE			0x078
> +#define QSERDES_V5_RX_RX_TERM_BW			0x080
> +#define QSERDES_V5_RX_VGA_CAL_CNTRL1			0x0d4
> +#define QSERDES_V5_RX_VGA_CAL_CNTRL2			0x0d8
> +#define QSERDES_V5_RX_GM_CAL				0x0dc
> +#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1		0x0e8
> +#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2		0x0ec
> +#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3		0x0f0
> +#define QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4		0x0f4
> +#define QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW		0x0f8
> +#define QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH		0x0fc
> +#define QSERDES_V5_RX_RX_IDAC_MEASURE_TIME		0x100
> +#define QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1	0x110
> +#define QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x114
> +#define QSERDES_V5_RX_SIGDET_ENABLES			0x118
> +#define QSERDES_V5_RX_SIGDET_CNTRL			0x11c
> +#define QSERDES_V5_RX_SIGDET_LVL			0x120
> +#define QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL		0x124
> +#define QSERDES_V5_RX_RX_BAND				0x128
> +#define QSERDES_V5_RX_RX_MODE_00_LOW			0x15c
> +#define QSERDES_V5_RX_RX_MODE_00_HIGH			0x160
> +#define QSERDES_V5_RX_RX_MODE_00_HIGH2			0x164
> +#define QSERDES_V5_RX_RX_MODE_00_HIGH3			0x168
> +#define QSERDES_V5_RX_RX_MODE_00_HIGH4			0x16c
> +#define QSERDES_V5_RX_RX_MODE_01_LOW			0x170
> +#define QSERDES_V5_RX_RX_MODE_01_HIGH			0x174
> +#define QSERDES_V5_RX_RX_MODE_01_HIGH2			0x178
> +#define QSERDES_V5_RX_RX_MODE_01_HIGH3			0x17c
> +#define QSERDES_V5_RX_RX_MODE_01_HIGH4			0x180
> +#define QSERDES_V5_RX_RX_MODE_10_LOW			0x184
> +#define QSERDES_V5_RX_RX_MODE_10_HIGH			0x188
> +#define QSERDES_V5_RX_RX_MODE_10_HIGH2			0x18c
> +#define QSERDES_V5_RX_RX_MODE_10_HIGH3			0x190
> +#define QSERDES_V5_RX_RX_MODE_10_HIGH4			0x194
> +#define QSERDES_V5_RX_DFE_EN_TIMER			0x1a0
> +#define QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET		0x1a4
> +#define QSERDES_V5_RX_DCC_CTRL1				0x1a8
> +#define QSERDES_V5_RX_VTH_CODE				0x1b0
> +
> +/* Only for QMP V5 PHY - USB3 have different offsets than V4 */
> +#define QPHY_V5_PCS_USB3_POWER_STATE_CONFIG1		0x300
> +#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
> +#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x308
> +#define QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x30c
> +#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x310
> +#define QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x314
> +#define QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x318
> +#define QPHY_V5_PCS_USB3_LFPS_TX_ECSTART		0x31c
> +#define QPHY_V5_PCS_USB3_LFPS_PER_TIMER_VAL		0x320
> +#define QPHY_V5_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x324
> +#define QPHY_V5_PCS_USB3_LFPS_CONFIG1			0x328
> +#define QPHY_V5_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x32c
> +#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x330
> +#define QPHY_V5_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x334
> +#define QPHY_V5_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x338
> +#define QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x33c
> +#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x340
> +#define QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x344
> +#define QPHY_V5_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x348
> +#define QPHY_V5_PCS_USB3_ARCVR_DTCT_CM_DLY		0x34c
> +#define QPHY_V5_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x350
> +#define QPHY_V5_PCS_USB3_ALFPS_DEGLITCH_VAL		0x354
> +#define QPHY_V5_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x358
> +#define QPHY_V5_PCS_USB3_TEST_CONTROL			0x35c
> +#define QPHY_V5_PCS_USB3_RXTERMINATION_DLY_SEL		0x360
> +
> +/* Only for QMP V5 PHY - UNI has 0x1000 offset for PCS_USB3 regs */
> +#define QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL	0x1018
> +#define QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2	0x103c
> +
>  #endif
> -- 
> 2.24.0
> 
