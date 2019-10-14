Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D2FD5A70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2019 06:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfJNExK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Oct 2019 00:53:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfJNExK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Oct 2019 00:53:10 -0400
Received: from localhost (unknown [122.167.124.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7072E20873;
        Mon, 14 Oct 2019 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571028789;
        bh=6csZWlDedKIDOceSvHeBRHzc14CiYLf0d72M+9DvRIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XjF1FVKNvUGzUK6dqxk9S5dpvrbsiZoJ0vcrXDqs9uF6pJDCSCNgzf5Us4m5gqGfK
         LO1EB+hNN3mbezyKJxBRs2XgfQgmYNjDzyyzjY2XH2xSWRn9C2dJoLsp8viHjG4W8o
         m+RZ07U9wP3Q5TV4lCeI7P9LV71lzf0XbG7J/AiI=
Date:   Mon, 14 Oct 2019 10:23:04 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp: Add SM8150 QMP UFS PHY support
Message-ID: <20191014045304.GF27950@vkoul-mobl>
References: <20190906051017.26846-1-vkoul@kernel.org>
 <20190906051017.26846-4-vkoul@kernel.org>
 <20191008074619.GA20801@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008074619.GA20801@jackp-linux.qualcomm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-10-19, 00:46, Jack Pham wrote:
> Hi Vinod,
> 
> On Fri, Sep 06, 2019 at 10:40:17AM +0530, Vinod Koul wrote:
> > SM8150 UFS PHY is v4 of QMP phy. Add support for V4 QMP phy register
> > defines and support for SM8150 QMP UFS PHY.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 125 ++++++++++++++++++++++++++++
> >  drivers/phy/qualcomm/phy-qcom-qmp.h |  96 +++++++++++++++++++++
> >  2 files changed, 221 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index 34ff6434da8f..92d3048f2b36 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -164,6 +164,11 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
> >  	[QPHY_PCS_READY_STATUS]		= 0x160,
> >  };
> >  
> > +static const unsigned int sm8150_ufsphy_regs_layout[] = {
> > +	[QPHY_START_CTRL]		= 0x00,
> > +	[QPHY_PCS_READY_STATUS]		= 0x180,
> > +};
> > +
> >  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
> >  	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
> >  	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> > @@ -878,6 +883,93 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
> >  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
> >  };
> >  
> > +static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> > +	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> > +	QMP_PHY_INIT_CFG(QSERDES_COM_V4_SYSCLK_EN_SEL, 0xd9),
> 
> QSERDES_V4_COM? See below.
> 
> <snip>
> 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> > index 335ea5d7ef40..0eefd8621669 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> > @@ -313,4 +313,100 @@
> >  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG4		0x5c
> >  #define QPHY_V3_PCS_MISC_OSC_DTCT_MODE2_CONFIG5		0x60
> >  
> > +/* Only for QMP V4 PHY - QSERDES COM registers */
> > +#define QSERDES_COM_V4_SYSCLK_EN_SEL			0x094
> 
> Should these rather be prefixed as QSERDES_V4_COM? There are already
> QSERDES_V3_COM_* in this header so the convention appears to be
> Q{SERDES,PHY}_VX_{COM,TX,RX,PCS}.

Yup, I seem to have missed that (Marc also pointed out)

> > +#define QSERDES_COM_V4_HSCLK_SEL			0x158
> > +#define QSERDES_COM_V4_HSCLK_HS_SWITCH_SEL		0x15C
> > +#define QSERDES_COM_V4_LOCK_CMP_EN			0x0A4
> > +#define QSERDES_COM_V4_VCO_TUNE_MAP			0x10C
> 
> Nit: sort in ascending offset order, and make the hex values lowercase?

Sure will do

> 
> <snip>
> 
> > +/* Only for QMP V4 PHY - PCS registers */
> > +#define QPHY_V4_PHY_START				0x000
> > +#define QPHY_V4_POWER_DOWN_CONTROL			0x004
> > +#define QPHY_V4_SW_RESET				0x008
> > +#define QPHY_V4_PCS_READY_STATUS			0x180
> > +#define QPHY_V4_LINECFG_DISABLE				0x148
> > +#define QPHY_V4_MULTI_LANE_CTRL1			0x1E0
> > +#define QPHY_V4_RX_SIGDET_CTRL2				0x158
> > +#define QPHY_V4_TX_LARGE_AMP_DRV_LVL			0x030
> > +#define QPHY_V4_TX_SMALL_AMP_DRV_LVL			0x038
> > +#define QPHY_V4_TX_MID_TERM_CTRL1			0x1D8
> > +#define QPHY_V4_DEBUG_BUS_CLKSEL			0x124
> > +#define QPHY_V4_PLL_CNTL				0x02C
> > +#define QPHY_V4_TIMER_20US_CORECLK_STEPS_MSB		0x00C
> > +#define QPHY_V4_TIMER_20US_CORECLK_STEPS_LSB		0x010
> > +#define QPHY_V4_TX_PWM_GEAR_BAND			0x160
> > +#define QPHY_V4_TX_HS_GEAR_BAND				0x168
> > +#define QPHY_V4_TX_HSGEAR_CAPABILITY			0x074
> > +#define QPHY_V4_RX_HSGEAR_CAPABILITY			0x0B4
> > +#define QPHY_V4_RX_MIN_HIBERN8_TIME			0x150
> > +#define QPHY_V4_BIST_FIXED_PAT_CTRL			0x060
> 
> Interesting. These offsets appear to be valid only for the UFS instance
> of the QMP PHY. For PCIe and USB the PCS layout is completely different.
> Wonder if we need to add _UFS_ to  the prefix to differentiate them? Or
> can this be deferred to when PCIe/USB PHY driver support for SM8150 gets
> added?

I didnt look at that yet. Are we sure that it is using V4 of the
instance?

-- 
~Vinod
