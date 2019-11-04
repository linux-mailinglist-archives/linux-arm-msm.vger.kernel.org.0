Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A75ED84F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 05:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfKDErI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Nov 2019 23:47:08 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32773 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbfKDErH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Nov 2019 23:47:07 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay6so59196plb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2019 20:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sI8SdyDQlg9PptexVD4FINeW/bRt7Aqgu7Py4pibvoI=;
        b=eFq6chB+gXLpAY+mYAbZbDbJQb9ZE7Vlh57ve/G8w/VOOU6NqFKVMf+FzIBnv3Ry9S
         YrgkE1MLRUd572nOPSh7FD8qMc/g7/9hMP+NBUHfI4NcEJdb4gOmVIbMUJ04IiEcZ4Zc
         Hi7YWwFXJg7Uv0drDmfOonbg9+1xtbf7Sa/L9F5kHhP81/YkA9ww1k2nU6IrfD2FA+zy
         +wXraksfhSIa/SIWBSuF2oo2tUT1on4Z+LJz1Ea6Wy3XiCM32UnlC/f+oxoeqM8ku9TY
         GjUryJUyHzBVTrsTXTg1/PNUIN5p9fpE6pjUUyockXxJSjqVI5kcNVceosUokq5EUFTY
         5/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sI8SdyDQlg9PptexVD4FINeW/bRt7Aqgu7Py4pibvoI=;
        b=tD0xNAVhOylwZoqCGvmdlYBZGPG+UkuPIsMhBaQIGSKmJE9Yg5ayKNDRUtieDEjXNO
         bALJVbBG/aPB44O4cYEFAipx159pRRbFDurzPdVTGNAK/8RsrlyVCyQoeQaRm35t6NUi
         Y35+WcqXWrJ3lfKHGhXp4/Ri+tdw99liymaTsrvYatbrN+AOaNX4sWEiJ/h6GsQq3LxK
         FOYZloiyBkziJX0COqDUrH/HWcqVbGg6FtferrAdT5m5C1Z4N0rSQjb1nUgfJnzlJkRF
         /meEZgQJDy3KzC5eBXQVZ7agBcvOKlcaUbma3Io3NHx6rZ4AR3qT7p+Fm6NJvfyGuYM8
         DZcg==
X-Gm-Message-State: APjAAAW/nnwmiSRd4C3OVmblFrKkK5ULg0y5vRUM0qsuVAqYO/bjxjef
        cTksOG45BBaS+7fFn/I/dVO73Q==
X-Google-Smtp-Source: APXvYqx13e72R6oJZBfFP6N2KVZXH2P+1oWapalahijz52zzjzDPZpajzSI9ywU2qThoxeVPP3Q44Q==
X-Received: by 2002:a17:902:322:: with SMTP id 31mr24604389pld.293.1572842826478;
        Sun, 03 Nov 2019 20:47:06 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i71sm15994359pfe.103.2019.11.03.20.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 20:47:05 -0800 (PST)
Date:   Sun, 3 Nov 2019 20:47:03 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp: Add SDM845 QHP PCIe PHY
Message-ID: <20191104044703.GQ1929@tuxbook-pro>
References: <20191102001628.4090861-1-bjorn.andersson@linaro.org>
 <20191102001628.4090861-6-bjorn.andersson@linaro.org>
 <20191103082147.GO2695@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103082147.GO2695@vkoul-mobl.Dlink>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 03 Nov 01:21 PDT 2019, Vinod Koul wrote:
> On 01-11-19, 17:16, Bjorn Andersson wrote:
[..]
> > +/* PCIE GEN3 COM registers */
> > +#define PCIE_GEN3_QHP_COM_SYSCLK_EN_SEL			0xdc
> 
> No QPHY_ tag with these?

These are the actual register names from the hardware specification, do
you foresee any issues with naming them like this?

> > +#define PCIE_GEN3_QHP_COM_SSC_EN_CENTER			0x14
> 
> Can we sort these please!
> 

Yes, that sounds reasonable. I'll respin with these sorted by address.

Regards,
Bjorn

> > +#define PCIE_GEN3_QHP_COM_SSC_PER1			0x20
> > +#define PCIE_GEN3_QHP_COM_SSC_PER2			0x24
> > +#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1		0x28
> > +#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2		0x2c
> > +#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE1_MODE1		0x34
> > +#define PCIE_GEN3_QHP_COM_SSC_STEP_SIZE2_MODE1		0x38
> > +#define PCIE_GEN3_QHP_COM_BIAS_EN_CKBUFLR_EN		0x54
> > +#define PCIE_GEN3_QHP_COM_CLK_ENABLE1			0x58
> > +#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE0		0x6c
> > +#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE0		0x70
> > +#define PCIE_GEN3_QHP_COM_LOCK_CMP1_MODE1		0x78
> > +#define PCIE_GEN3_QHP_COM_LOCK_CMP2_MODE1		0x7c
> > +#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE0			0xb4
> > +#define PCIE_GEN3_QHP_COM_CP_CTRL_MODE1			0xb8
> > +#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE0		0xc0
> > +#define PCIE_GEN3_QHP_COM_PLL_RCTRL_MODE1		0xc4
> > +#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE0		0xcc
> > +#define PCIE_GEN3_QHP_COM_PLL_CCTRL_MODE1		0xd0
> > +#define PCIE_GEN3_QHP_COM_RESTRIM_CTRL2			0xf0
> > +#define PCIE_GEN3_QHP_COM_LOCK_CMP_EN			0xf8
> > +#define PCIE_GEN3_QHP_COM_DEC_START_MODE0		0x100
> > +#define PCIE_GEN3_QHP_COM_DEC_START_MODE1		0x108
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE0		0x11c
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE0		0x120
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE0		0x124
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START1_MODE1		0x128
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START2_MODE1		0x12c
> > +#define PCIE_GEN3_QHP_COM_DIV_FRAC_START3_MODE1		0x130
> > +#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE0		0x150
> > +#define PCIE_GEN3_QHP_COM_INTEGLOOP_GAIN0_MODE1		0x158
> > +#define PCIE_GEN3_QHP_COM_VCO_TUNE_MAP			0x178
> > +#define PCIE_GEN3_QHP_COM_CLK_SELECT			0x1cc
> > +#define PCIE_GEN3_QHP_COM_HSCLK_SEL1			0x1d0
> > +#define PCIE_GEN3_QHP_COM_CORECLK_DIV			0x1e0
> > +#define PCIE_GEN3_QHP_COM_CORE_CLK_EN			0x1e8
> > +#define PCIE_GEN3_QHP_COM_CMN_CONFIG			0x1f0
> > +#define PCIE_GEN3_QHP_COM_SVS_MODE_CLK_SEL		0x1fc
> > +#define PCIE_GEN3_QHP_COM_CORECLK_DIV_MODE1		0x21c
> > +#define PCIE_GEN3_QHP_COM_CMN_MODE			0x224
> > +#define PCIE_GEN3_QHP_COM_VREGCLK_DIV1			0x228
> > +#define PCIE_GEN3_QHP_COM_VREGCLK_DIV2			0x22c
> > +#define PCIE_GEN3_QHP_COM_BGV_TRIM			0x98
> > +#define PCIE_GEN3_QHP_COM_BG_CTRL			0x1c8
> > +
> > +/* PCIE GEN3 QHP Lane registers */
> > +#define PCIE_GEN3_QHP_L0_DRVR_CTRL0			0xc
> > +#define PCIE_GEN3_QHP_L0_DRVR_TAP_EN			0x18
> > +#define PCIE_GEN3_QHP_L0_TX_BAND_MODE			0x60
> > +#define PCIE_GEN3_QHP_L0_LANE_MODE			0x64
> > +#define PCIE_GEN3_QHP_L0_PARALLEL_RATE			0x7c
> > +#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE0			0xc0
> > +#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE1			0xc4
> > +#define PCIE_GEN3_QHP_L0_CML_CTRL_MODE2			0xc8
> > +#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE1		0xd0
> > +#define PCIE_GEN3_QHP_L0_PREAMP_CTRL_MODE2		0xd4
> > +#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE0		0xd8
> > +#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE1		0xdc
> > +#define PCIE_GEN3_QHP_L0_MIXER_CTRL_MODE2		0xe0
> > +#define PCIE_GEN3_QHP_L0_CTLE_THRESH_DFE		0xfc
> > +#define PCIE_GEN3_QHP_L0_CGA_THRESH_DFE			0x100
> > +#define PCIE_GEN3_QHP_L0_RXENGINE_EN0			0x108
> > +#define PCIE_GEN3_QHP_L0_CTLE_TRAIN_TIME		0x114
> > +#define PCIE_GEN3_QHP_L0_CTLE_DFE_OVRLP_TIME		0x118
> > +#define PCIE_GEN3_QHP_L0_DFE_REFRESH_TIME		0x11c
> > +#define PCIE_GEN3_QHP_L0_DFE_ENABLE_TIME		0x120
> > +#define PCIE_GEN3_QHP_L0_VGA_GAIN			0x124
> > +#define PCIE_GEN3_QHP_L0_DFE_GAIN			0x128
> > +#define PCIE_GEN3_QHP_L0_EQ_GAIN			0x130
> > +#define PCIE_GEN3_QHP_L0_OFFSET_GAIN			0x134
> > +#define PCIE_GEN3_QHP_L0_PRE_GAIN			0x138
> > +#define PCIE_GEN3_QHP_L0_EQ_INTVAL			0x154
> > +#define PCIE_GEN3_QHP_L0_EDAC_INITVAL			0x160
> > +#define PCIE_GEN3_QHP_L0_RXEQ_INITB0			0x168
> > +#define PCIE_GEN3_QHP_L0_RXEQ_INITB1			0x16c
> > +#define PCIE_GEN3_QHP_L0_RCVRDONE_THRESH1		0x178
> > +#define PCIE_GEN3_QHP_L0_RXEQ_CTRL			0x180
> > +#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE0		0x184
> > +#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE1		0x188
> > +#define PCIE_GEN3_QHP_L0_UCDR_FO_GAIN_MODE2		0x18c
> > +#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE0		0x190
> > +#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE1		0x194
> > +#define PCIE_GEN3_QHP_L0_UCDR_SO_GAIN_MODE2		0x198
> > +#define PCIE_GEN3_QHP_L0_UCDR_SO_CONFIG			0x19c
> > +#define PCIE_GEN3_QHP_L0_RX_BAND			0x1a4
> > +#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE0		0x1c0
> > +#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE1		0x1c4
> > +#define PCIE_GEN3_QHP_L0_RX_RCVR_PATH1_MODE2		0x1c8
> > +#define PCIE_GEN3_QHP_L0_SIGDET_ENABLES			0x230
> > +#define PCIE_GEN3_QHP_L0_SIGDET_CNTRL			0x234
> > +#define PCIE_GEN3_QHP_L0_SIGDET_DEGLITCH_CNTRL		0x238
> > +#define PCIE_GEN3_QHP_L0_DCC_GAIN			0x2a4
> > +#define PCIE_GEN3_QHP_L0_RX_EN_SIGNAL			0x2ac
> > +#define PCIE_GEN3_QHP_L0_PSM_RX_EN_CAL			0x2b0
> > +#define PCIE_GEN3_QHP_L0_RX_MISC_CNTRL0			0x2b8
> > +#define PCIE_GEN3_QHP_L0_TS0_TIMER			0x2c0
> > +#define PCIE_GEN3_QHP_L0_DLL_HIGHDATARATE		0x2c4
> > +#define PCIE_GEN3_QHP_L0_DRVR_CTRL1			0x10
> > +#define PCIE_GEN3_QHP_L0_DRVR_CTRL2			0x14
> > +#define PCIE_GEN3_QHP_L0_RX_RESETCODE_OFFSET		0x2cc
> > +#define PCIE_GEN3_QHP_L0_VGA_INITVAL			0x13c
> > +#define PCIE_GEN3_QHP_L0_RSM_START			0x2a8
> > +
> > +/* PCIE GEN3 PCS registers */
> > +#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG		0x15c
> > +#define PCIE_GEN3_QHP_PHY_PCS_TX_RX_CONFIG		0x174
> > +#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M3P5DB		0x2c
> > +#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M3P5DB		0x40
> > +#define PCIE_GEN3_QHP_PHY_TXMGN_MAIN_V0_M6DB		0x54
> > +#define PCIE_GEN3_QHP_PHY_TXMGN_POST_V0_M6DB		0x68
> > +#define PCIE_GEN3_QHP_PHY_POWER_STATE_CONFIG5		0x16c
> > +
> >  #endif
> > -- 
> > 2.23.0
> 
> -- 
> ~Vinod
