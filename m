Return-Path: <linux-arm-msm+bounces-27527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F27942D37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 13:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E133282612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 11:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20561AD3F5;
	Wed, 31 Jul 2024 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6KivKpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA570189522;
	Wed, 31 Jul 2024 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722425192; cv=none; b=PLZeM05Rr0nLPXQGFJ+ljCLGAwmyxlIWbbPW54Yniqys5YQvhIWOCr1TL8lWccQKj35CrgjzlAY2da1jiyWacwUQm4Sej5McCxdtARV+UqYCEfArsHk8ydpID8HCL48hS85Q1R+sX7NgoTh8tQeR0QEsslXq/uMZNjda3nSFc9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722425192; c=relaxed/simple;
	bh=muOwvDjLZQ6jQCCyNA06/OumuJh2BZIgrN5mnstcahw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOV332cCK95fqWp3UPcZTkHuzKA3Tl1bSBZnCin4Dc9rbl19N0prgshLEKsERyriVBGAtqysTBBDVty7uDnu6jotWhRyHobMgDAS5XjCAbUtNy+0Bm3r/Joy1AugKWz7U932X4TKQLcuwomlFu49hsqQIjKk4T2O6w0vOYug3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6KivKpy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C45C116B1;
	Wed, 31 Jul 2024 11:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722425192;
	bh=muOwvDjLZQ6jQCCyNA06/OumuJh2BZIgrN5mnstcahw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6KivKpyu57v6fsSEr9zYcvDW2nzoYZ1sT1hBEIFn3+J9vd1WzhdFmsXKHbKEjIrX
	 RPxmttPgHglaQgdE8RHlQRgSAvwmxWVJjLFLTDJ9N30Zza6BInQ29h+EpZvbc/fgkT
	 qv5qQo+iZw2wu8Wm1mkhlDmhJ3lELQjZQbs1crz1dHtvtPOgg1dXg0R7MRQ6JZjdzr
	 6nBTJOAOR/4HouOjXXiUY25NQFpb4fSGsdrHpw7CKGhMyxNXo2qkLwX2iuzVeEf8SF
	 VwqPkQh4fcRz/Rk3zPvg5cwAKU+8JEJoFsBL+3Jfmtw5a8f/L6x0PU2dE3n/LqCGyF
	 i2J0aVDZ8q9OQ==
Date: Wed, 31 Jul 2024 16:56:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-pcie: Fix X1E80100 PCIe Gen4 PHY
 initialisation
Message-ID: <ZqofZNF71zA8kTxN@matsya>
References: <20240726-x1e80100-phy-qmp-pcie-fix-config-v1-1-b569f03c0c48@linaro.org>
 <ZqOysDk0LqwxG4OF@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqOysDk0LqwxG4OF@hovoldconsulting.com>

On 26-07-24, 16:29, Johan Hovold wrote:
> On Fri, Jul 26, 2024 at 10:16:56AM +0300, Abel Vesa wrote:
> > Update the PCIe Gen4 PHY init sequence with the latest based on internal
> > Qualcomm documentation.
> 
> Any hints about what these updates imply?

I am not sure if we have insights

> 
> > Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > index 5b36cc7ac78b..8b624afbf014 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> 
> >  static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_tx_tbl[] = {
> > @@ -1286,12 +1287,15 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_rx_tbl[] = {
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_1, 0x01),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_2, 0x01),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_3, 0x45),
> > -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0b),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0A, 1),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0B, 2),
> 
> Please use lower-case hex consistently.

Yes pretty please, that is consistent and the norm

> 
> > +	QMP_PHY_INIT_CFG(QSERDES_V6_20_VGA_CAL_CNTRL1, 0x00),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_GM_CAL, 0x0d),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_SIGDET_ENABLES, 0x1c),
> >  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_PHPRE_CTRL, 0x20),
> > -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x3A, 1),
> > +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38, 2),
> 
> Ditto.
> 
> Johan

-- 
~Vinod

