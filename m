Return-Path: <linux-arm-msm+bounces-70282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C049AB31252
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B1371CE511D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41022E7176;
	Fri, 22 Aug 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F240bS+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6A1EA65;
	Fri, 22 Aug 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852848; cv=none; b=gzIUGG8wkVloYXsIjaahsn75OOR3ccl8F2AR3KWutK/9qZTQ6PDi/FC7F4kjbs1jg12ch+Qucd/IDv809DhjHTIvn/RZORKITNEbdLag3/JxbYfXOz/FVmwqd22iRhljsyaTr/oBVk+r09EYjfq8i66QitT+rcQVEyjB3632UPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852848; c=relaxed/simple;
	bh=1Kedd5nrOXuqAb/MAHK84Atl2vdOv9kO06NAwi1B5WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqY37UItPZC3NuKfL8tM1VX2yRoK4kUhW/8EiwvXsw1fbu3dQT6EKSb6VyZ9ffsByYvO87Zp2kpz+npwtpArVjzp+jpvBsjqzjkqch2o4xkfr0qsV/FjePEvUqpujFUmzw3Pm0oeZugQn5lSwBfZV0K8J19K5E6W0itJ39aGPSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F240bS+X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F7BC4CEF1;
	Fri, 22 Aug 2025 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755852848;
	bh=1Kedd5nrOXuqAb/MAHK84Atl2vdOv9kO06NAwi1B5WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F240bS+X1iIQcVx+R2bCIVfkVa0pseohmnJkOicqQVt8EvB8jijjBLohl33+Ke0A9
	 9lg7HeMnud+kWU8NoZPSu0ZExjDq5D9SHMQkP4GZrTEVWQw9iwLSEG/7XrR2cQHR9a
	 P/b7mWA9rti9ZbUJ/PxxEZ3ZZFpNpbyDH6cU9K79qj4PopluUFQ5F72RerZMh7Sck0
	 9GdPif3rw5fpLR9J46CuyVom+rcs4ULm/Zu8qQhYBvSPs6w8/ZrMcrnBNkW3wa0h5m
	 gtVh2lrD7JpO+RbveFr07IadQo8eC+JAvL0qTCIrQ8RIg4vQmVttURCVWFAHYUbxj1
	 g7v+/KWLZkurg==
Date: Fri, 22 Aug 2025 14:23:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org, 
	kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
Message-ID: <xir3u3hlmcvfu6uasijz6g2oialoasmuu4bno6ctxpscqcebz6@6kw6xpm5bxbd>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>

On Wed, Aug 20, 2025 at 03:49:31AM GMT, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
> > Add regulator load voting support for SM8650 and SM8750 platforms by
> > introducing dedicated regulator bulk data arrays with their load
> > values.
> > 
> > The load requirements are:
> > - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
> > - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
> > 
> > This ensures stable operation and proper power management for these
> > platforms where regulators are shared between the QMP USB PHY and
> > other IP blocks by setting appropriate regulator load currents during PHY
> > operations.
> > 
> > Configurations without specific load requirements will continue to work
> > unchanged, as init_load_uA remains zero-initialized when .init_load_uA
> > is not provided.
> 
> Can we please get configuration for the rest of the platforms?
> 

Only if the rest of the platforms require setting the load... It is not very
clear if the older platforms share the regulators with other IPs or not.

- Mani

> > 
> > Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > index aaa88ca0ef07..1c3ce0fa6adf 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> > @@ -1170,6 +1170,17 @@ static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
> >  	{ .supply = "vdda-pll" },
> >  };
> > 
> > +/* Regulator bulk data with load values for specific configurations */
> > +static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
> > +	{ .supply = "vdda-phy", .init_load_uA = 205000 },
> > +	{ .supply = "vdda-pll", .init_load_uA = 17500 },
> > +};
> > +
> > +static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
> > +	{ .supply = "vdda-phy", .init_load_uA = 213000 },
> > +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> > +};
> > +
> >  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
> >  	.serdes		= 0,
> >  	.pcs		= 0xc00,
> > @@ -1638,8 +1649,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
> >  		.max_gear	= UFS_HS_G5,
> >  	},
> > 
> > -	.vreg_list		= qmp_phy_vreg_l,
> > -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.vreg_list		= sm8650_ufsphy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(sm8650_ufsphy_vreg_l),
> >  	.regs			= ufsphy_v6_regs_layout,
> >  };
> > 
> > @@ -1676,8 +1687,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
> >  		.max_gear	= UFS_HS_G5,
> >  	},
> > 
> > -	.vreg_list		= qmp_phy_vreg_l,
> > -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.vreg_list		= sm8750_ufsphy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(sm8750_ufsphy_vreg_l),
> >  	.regs			= ufsphy_v6_regs_layout,
> > 
> >  };
> > --
> > 2.48.1
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
மணிவண்ணன் சதாசிவம்

