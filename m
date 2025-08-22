Return-Path: <linux-arm-msm+bounces-70281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B7B3124A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9176AA27DA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224532EACE0;
	Fri, 22 Aug 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOMj2Z4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE36216E26;
	Fri, 22 Aug 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852681; cv=none; b=lcdHurVvQo2DoTHDarImLFu4DAgDbKXPlbtmhyBIGLFjDJasIUWxW11bEifev/W253QV3bLauaDVtwFKPXfD28630w14Y++dfrEutnnnE2re2NFERpJSDXLAkPOe2WRfIGvoI8bq/f30vmHVoVA4zyJMtfs8/pysZQXgrsnoiIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852681; c=relaxed/simple;
	bh=ktLkO6U8pVwA0whh88+uwMn9bVUHZCee68IJdrMKmKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSakBb9ykaJZcz28AZGAvG/5l7t4+zCM/yXvP74mLsan9EQSdkp5lI/ZmylWFLolDAoaGj9+nDBi7U7zFuDTNFjIlgg/JvtaihfwBRK+DLZsl5ybqansKHCjfWCfJ5QlW0CZa6Ltx9Wk46KrG3LPUvwenbnULk8FytVJHK5kU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOMj2Z4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2FFC4CEF1;
	Fri, 22 Aug 2025 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755852680;
	bh=ktLkO6U8pVwA0whh88+uwMn9bVUHZCee68IJdrMKmKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iOMj2Z4xW7EBH5KWpRROUfGXFAG9Yr3obWkcsrbRbTC8Xy7zzzvsMI+e8FJLZ3jvq
	 B8MpSqz3aAtFGBaN1hDljsyceJG/Odg4TeHdDivPWVYZHbls6FExqUFkPaS1tW6OpI
	 pxR2c1ocXQvC4G9D2wboD6P59w2t/3s4P6qIelS3O6vGBSgrbnvV8XmJkyLdhwlBFW
	 pnOIFsFoPGcs3312gI2IRw/WxB/cQrg4Mm4IvNpP/q4Utd/izWs0pVGK4gQqNtV5lW
	 N7DEn10J5xzPZgBgv9yTilKyA+HPp2AipaFusmGVZkshwuP/aQ/CPVyvYaYVTvU1EC
	 vGxA+curQoRlA==
Date: Fri, 22 Aug 2025 14:21:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
Message-ID: <gvfcg5wuzti6ns337onsg6si6sp3walpy3rniouxlxuf5huthm@uay2wzbyq3wt>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819222832.8471-3-quic_nitirawa@quicinc.com>

On Wed, Aug 20, 2025 at 03:58:26AM GMT, Nitin Rawat wrote:
> Add regulator load voting support for SM8650 and SM8750 platforms by
> introducing dedicated regulator bulk data arrays with their load
> values.
> 
> The load requirements are:
> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
> 
> This ensures stable operation and proper power management for these
> platforms where regulators are shared between the QMP USB PHY and
> other IP blocks by setting appropriate regulator load currents during PHY
> operations.
> 

So it is fixing stability issues on these platforms. Hence, 'Fixes' tag pointing
to the commits that added these platform support should be added.

> Configurations without specific load requirements will continue to work
> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
> is not provided.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index aaa88ca0ef07..1c3ce0fa6adf 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1170,6 +1170,17 @@ static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
>  	{ .supply = "vdda-pll" },
>  };
> 
> +/* Regulator bulk data with load values for specific configurations */
> +static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 205000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 17500 },
> +};
> +
> +static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 213000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>  	.serdes		= 0,
>  	.pcs		= 0xc00,
> @@ -1638,8 +1649,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
>  		.max_gear	= UFS_HS_G5,
>  	},
> 
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8650_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8650_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
>  };
> 
> @@ -1676,8 +1687,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
>  		.max_gear	= UFS_HS_G5,
>  	},
> 
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8750_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8750_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
> 
>  };
> --
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

