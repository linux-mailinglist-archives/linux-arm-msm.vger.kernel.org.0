Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B25E20AD71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 09:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgFZHna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 03:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgFZHn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 03:43:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93B3C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:43:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so1152354pje.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 00:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=y1yY4MQRIlexaM+ULNHIj5vWqC76TO5WRW3/WnGS5Uc=;
        b=T41xv3G7wjt+BYZQqniKrrGjjI4z283z/Cqo2BsWAsKkYYvjN3JSH7KMBWiot8+oJ8
         tJG3gGDyghxjs3dMmjtB8fxan/E7V+M27zaP0YTvKerMbNFTpyXCEDmfG4rj7gcoALcE
         6QjPaaYkuxdMO1dkW/nRopJxPQE+D8BEEgYso89SLnaehwpzgnlKQUozb76r8Nm1LblK
         X0ZjeuHU0suxnA7s4f7+VbXm01jTm/8uqqwylfxKjnVdKZ1eFNPcIDXtzX/+D695WRZn
         igKkF6BOxnXzG58u4hkMUI5y2fDhW5V7Taz1c2u9KcbXLWOmwoawV5WFr+P4LhM1TRyx
         7QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y1yY4MQRIlexaM+ULNHIj5vWqC76TO5WRW3/WnGS5Uc=;
        b=OwjLSZQLix2oNh5aoCRUMcPvF6iXdBNYT2YaQbDc5PWoVGULI6qZKtUymXLRZm51Ts
         5hxdq2NOjvshd0KJePIUMX1KaFFgAw7JtbnFZccneLumOYTGCc+e5g1IdQaTqpXmA6fa
         8q6ZeU0SDZxO2CU5C7DilAPCy0YJI2c1sMHw8FYIdop506YhsdijhFtf0YCBPzKgt9ZF
         7YTG7ZWfj4+q947KW/PEUZ1j1h6EsZiActKvfIEkulmNHs+paJnH4cyggkvmhwmKe83C
         F2HOhHSB/kGRBkQoaQkVwgDZDoWvafUoAX9puIdEQJFOUc9wNbPspOer6lvdCswtWhCm
         xpDQ==
X-Gm-Message-State: AOAM531HM6XB3y+Fl95GvZaSsuOYf7m5bS1sjPK2C78cojaXaoy0oeXW
        vq+Q6ZSrXeyA7kEsK9DUbUxusw==
X-Google-Smtp-Source: ABdhPJwDwdHvPFQpV6S6b8Iz6FkDbQEXqWBP4tT7F4jaRBexr1hqFVDLrrOqpeSHKrtUq7raShQrJw==
X-Received: by 2002:a17:902:7788:: with SMTP id o8mr1636408pll.166.1593157409089;
        Fri, 26 Jun 2020 00:43:29 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id gp4sm10243764pjb.26.2020.06.26.00.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:43:28 -0700 (PDT)
Date:   Fri, 26 Jun 2020 00:40:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:GENERIC PHY FRAMEWORK" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] phy: qcom-qmp: Add QMP V4 USB3 PHY support for sm8250
Message-ID: <20200626074050.GG388985@builder.lan>
References: <20200524021416.17049-1-jonathan@marek.ca>
 <20200524021416.17049-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524021416.17049-4-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 May 19:14 PDT 2020, Jonathan Marek wrote:

> Add both the DP and UNI PHY for primary/secondary usb controllers.
> 
> The tables are very similar to sm8150 (serdes_tbl is identical), but there
> are some differences.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 206 ++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h |   2 +
>  2 files changed, 208 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9367f8f793b5..8a597cedfebe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1532,6 +1532,142 @@ static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
>  };
>  
> +static const struct qmp_phy_init_tbl sm8250_usb3_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x60),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x02),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x40, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x54, 2),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8250_usb3_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f, 2),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff, 2),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x97),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8250_usb3_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xa9),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_2, 0x82),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x02),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_rx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0xb8),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
> +	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
> +};
> +
> +static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_pcs_tbl[] = {
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xa9),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2, 0x07),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
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
> @@ -1700,6 +1836,11 @@ static const char * const qmp_v4_phy_clk_l[] = {
>  	"aux", "ref_clk_src", "ref", "com_aux",
>  };
>  
> +/* the primary usb3 phy on sm8250 doesn't have a ref clock */
> +static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
> +	"aux", "ref_clk_src", "com_aux"
> +};
> +
>  static const char * const sdm845_ufs_phy_clk_l[] = {
>  	"ref", "ref_aux",
>  };
> @@ -2147,6 +2288,65 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
>  	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
>  };
>  
> +static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= sm8150_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
> +	.tx_tbl			= sm8250_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8250_usb3_tx_tbl),
> +	.rx_tbl			= sm8250_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8250_usb3_rx_tbl),
> +	.pcs_tbl		= sm8250_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_pcs_tbl),
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
> +static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= sm8150_usb3_uniphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_uniphy_serdes_tbl),
> +	.tx_tbl			= sm8250_usb3_uniphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_tx_tbl),
> +	.rx_tbl			= sm8250_usb3_uniphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_rx_tbl),
> +	.pcs_tbl		= sm8250_usb3_uniphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_uniphy_pcs_tbl),
> +	.clk_list		= qmp_v4_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_phy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v4_usb3_uniphy_regs_layout,
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
> @@ -2924,6 +3124,12 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8150-qmp-usb3-uni-phy",
>  		.data = &sm8150_usb3_uniphy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8250-qmp-usb3-phy",
> +		.data = &sm8250_usb3phy_cfg,
> +	}, {
> +		.compatible = "qcom,sm8250-qmp-usb3-uni-phy",
> +		.data = &sm8250_usb3_uniphy_cfg,
>  	},
>  	{ },
>  };
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index f39f7a968228..4277f592684b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -364,7 +364,9 @@
>  #define QSERDES_V4_TX_RES_CODE_LANE_TX			0x34
>  #define QSERDES_V4_TX_RES_CODE_LANE_RX			0x38
>  #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX 		0x3c
> +#define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
>  #define QSERDES_V4_TX_LANE_MODE_1			0x84
> +#define QSERDES_V4_TX_LANE_MODE_2			0x88
>  #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
>  #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
>  #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
> -- 
> 2.26.1
> 
