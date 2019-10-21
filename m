Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A321DF496
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 19:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfJUR6j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 13:58:39 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:30941 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJUR6j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 13:58:39 -0400
X-Greylist: delayed 4673 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 13:58:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571680715;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7Tt2/ZNQjHF0N5Lrq1Ad+3gwdMvPJoAGmvLCcfodlfQ=;
        b=kgdXI8kM7dnsvZYxUWeoKUBSw48Myqbhjd1dHyhGcEL97UES3Ezs+tRrxXB6ibULiO
        AAJaEMS9xVDOD8kSt+Gok35o58SBtuR7aXjxe/ItTB/sq6BhHu9lNspcMobqKC6TIR5B
        P+AOXzESQZoF09QMXDoaokrNn69wVk1UhazzM47KN2OB6tVoMwVuJ3Cg7nJWxm+y5T6/
        EQWsjE5iDJocE9cBD36RFDsm0MxgfZB5K7DPyluBz4AOI5nnC/xNqoJzTqCIwy3Bzchh
        yu4+oDHBZ3MRQO9JbSJ/+CurI/YYqq+CJVX4MgQhKob4kKbNabKHmijrML8mgp1i1qkZ
        1MtQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdfTYstM="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.1 AUTH)
        with ESMTPSA id 409989v9LHwVR2m
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Oct 2019 19:58:31 +0200 (CEST)
Date:   Mon, 21 Oct 2019 19:58:18 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Sean Paul <sean@poorly.run>
Cc:     Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Hai Li <hali@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Implement qcom,dsi-phy-regulator-ldo-mode
 for 28nm PHY
Message-ID: <20191021175727.GA86689@gerhold.net>
References: <20191021163425.83697-1-stephan@gerhold.net>
 <20191021174719.GC85762@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021174719.GC85762@art_vandelay>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 01:47:19PM -0400, Sean Paul wrote:
> On Mon, Oct 21, 2019 at 06:34:25PM +0200, Stephan Gerhold wrote:
> > The DSI PHY regulator supports two regulator modes: LDO and DCDC.
> > This mode can be selected using the "qcom,dsi-phy-regulator-ldo-mode"
> > device tree property.
> > 
> > However, at the moment only the 20nm PHY driver actually implements
> > that option. Add a check in the 28nm PHY driver to program the
> > registers correctly for LDO mode.
> > 
> > Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # l8150
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> > This is needed to make the display work on Longcheer L8150,
> > which has recently gained mainline support in:
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?id=16e8e8072108426029f0c16dff7fbe77fae3df8f
> > 
> > This patch is based on code from the downstream kernel:
> > https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/drivers/video/msm/mdss/msm_mdss_io_8974.c?h=LA.BR.1.2.9.1-02310-8x16.0#n152
> > 
> > The LDO regulator configuration is taken from msm8916-qrd.dtsi:
> > https://source.codeaurora.org/quic/la/kernel/msm-3.10/tree/arch/arm/boot/dts/qcom/msm8916-qrd.dtsi?h=LA.BR.1.2.9.1-02310-8x16.0#n56
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > index b3f678f6c2aa..4579e6de4532 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> > @@ -48,6 +48,25 @@ static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
> >  		return;
> >  	}
> >  
> > +	if (phy->regulator_ldo_mode) {
> > +		u32 ldo_ctrl;
> > +
> > +		if (phy->cfg->type == MSM_DSI_PHY_28NM_LP)
> > +			ldo_ctrl = 0x05;
> > +		else
> > +			ldo_ctrl = 0x0d;
> > +
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_0, 0x0);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_5, 0x7);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_3, 0);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_2, 0x1);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_1, 0x1);
> > +		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CTRL_4, 0x20);
> > +		dsi_phy_write(phy->base + REG_DSI_28nm_PHY_LDO_CNTRL, ldo_ctrl);
> > +		return;
> > +	}
> 
> nit: Since this has minimal overlap with DCDC mode, I think it would read better
> if you split this into 2 functions:
> dsi_28nm_phy_regulator_enable_dcdc() and dsi_28nm_phy_regulator_enable_ldo()
> 
> So regulator_ctrl would look like:
> 
> static void dsi_28nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
> {
> 	void __iomem *base = phy->reg_base;
> 
> 	if (!enable) {
> 		dsi_phy_write(base + REG_DSI_28nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
> 		return;
> 	}
> 
> 	if (phy->regulator_ldo_mode)
>                 dsi_28nm_phy_regulator_enable_ldo()
>         else
>                 dsi_28nm_phy_regulator_enable_dcdc()
> }
> 

I implemented it similar to dsi_phy_20nm.c [1], which looks like:

static void dsi_20nm_phy_regulator_ctrl(struct msm_dsi_phy *phy, bool enable)
{
	void __iomem *base = phy->reg_base;

	if (!enable) {
		dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG, 0);
		return;
	}

	if (phy->regulator_ldo_mode) {
		dsi_phy_write(phy->base + REG_DSI_20nm_PHY_LDO_CNTRL, 0x1d);
		return;
	}

	/* non LDO mode */
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_1, 0x03);
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_2, 0x03);
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_3, 0x00);
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_4, 0x20);
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CAL_PWR_CFG, 0x01);
	dsi_phy_write(phy->base + REG_DSI_20nm_PHY_LDO_CNTRL, 0x00);
	dsi_phy_write(base + REG_DSI_20nm_PHY_REGULATOR_CTRL_0, 0x03);
}

I guess it looks better for the 20nm PHY driver since it writes only a
single register in LDO mode rather than the full regulator
configuration.

I'll update my patch and send a v2. Thanks for the suggestion!

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c#n42
