Return-Path: <linux-arm-msm+bounces-71277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4FB3C89B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8267318917C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53C32236F3;
	Sat, 30 Aug 2025 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVZSxZUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92C53363;
	Sat, 30 Aug 2025 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756537627; cv=none; b=nzhDhzA6sR9NzhANU9Nn2Ek62vE7IQiDx3C9XmepRPnqPSklmfrOiHe82AzeLcom0j/ClsqbQAO4Z0+0fUeZflLKmBMyY4eFwKq4ippOV+15Pey48IKLAwVv4Sn7knYEg/N8feYf6ntbxpgq1nKFEJGUv2DvP7NEkv1TWLRvON8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756537627; c=relaxed/simple;
	bh=DG833o98eMtr6vUE3fcDOpWJMfRIFP8zdwvQ8VvetBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyALRzxmEMNvb7UvpJ5NEH4/ZJi3q4HpS1Gl47h7HWbb/+oinxaFBrxoH1lJaVL0tCfgnhT1KOoeSN6XXWEM5q74XcEyj0UgfZd/z5v/5ZI9treBuVoitATTryaXW4DSlZfMsEUvLdOqCdA//R/jT++fmGD9oT1l2oM+0ehtp3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVZSxZUe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6D1C4CEEB;
	Sat, 30 Aug 2025 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756537627;
	bh=DG833o98eMtr6vUE3fcDOpWJMfRIFP8zdwvQ8VvetBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVZSxZUe3gA7RygcgrH5fC1PDz+/0ieapAxICBnJKiq7VUS+NJkOZCODWpQGtI3LJ
	 fVeH4Ha5Dlq7IiXglg8aR2focTMbx2nS2aFmArOSL0F3XBt9FcA6EmQzoflumhNmYw
	 CYXBNF12P+ZN4hMwPvIBorzlvUDE3fT+yV+HaMsBvjCTUGAv7Wg/+tPuQ5A0LBpG+N
	 k/wbGJAnYYA/rq3WQToOGLHXpbWeDRxpMRmEjE2T2ZA9ATzqmmjiQ/nN22MPF8vf3t
	 x5uddoiZNl7GrphXJTEDKKOY4+HthAm67PSkW/Pq5Rzaczczgf/dr6VZBRgme5a91Z
	 iEVmzNBfoURCA==
Date: Sat, 30 Aug 2025 12:37:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V4 2/2] phy: qcom-qmp-ufs: Add PHY and PLL regulator load
Message-ID: <vmm6y7wcrm3l5ypz5bzpehzz37vkiyz2mnsainyaonokna2xmz@63opfucrawtv>
References: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
 <20250830070353.2694-3-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250830070353.2694-3-nitin.rawat@oss.qualcomm.com>

On Sat, Aug 30, 2025 at 12:33:53PM GMT, Nitin Rawat wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add phy and pll regulator load voting support for all supported
> platforms by introducing dedicated regulator bulk data arrays
> with their load values.
> 
> This ensures stable operation and proper power management for these
> platforms where regulators are shared between the QMP UFS PHY and
> other IP blocks by setting appropriate regulator load currents during
> PHY operations.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

I haven't cross checked the load values with downstream, but trusting that
you've done your job. So,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 138 ++++++++++++++++++------
>  1 file changed, 104 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index aaa88ca0ef07..8a280433a42b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1164,10 +1164,80 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
> 
> -/* Default regulator bulk data (no load used) */
> -static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
> -	{ .supply = "vdda-phy" },
> -	{ .supply = "vdda-pll" },
> +/* Regulator bulk data with load values for specific configurations */
> +static const struct regulator_bulk_data msm8996_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 51400 },
> +	{ .supply = "vdda-pll", .init_load_uA = 14600 },
> +};
> +
> +static const struct regulator_bulk_data sa8775p_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 137000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
> +static const struct regulator_bulk_data sc7280_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 97500 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18400 },
> +};
> +
> +static const struct regulator_bulk_data sc8280xp_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 85700 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
> +static const struct regulator_bulk_data sdm845_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 51400 },
> +	{ .supply = "vdda-pll", .init_load_uA = 14600 },
> +};
> +
> +static const struct regulator_bulk_data sm6115_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 51400 },
> +	{ .supply = "vdda-pll", .init_load_uA = 14200 },
> +};
> +
> +static const struct regulator_bulk_data sm7150_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 62900 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
> +static const struct regulator_bulk_data sm8150_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 90200 },
> +	{ .supply = "vdda-pll", .init_load_uA = 19000 },
> +};
> +
> +static const struct regulator_bulk_data sm8250_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 89900 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18800 },
> +};
> +
> +static const struct regulator_bulk_data sm8350_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 91600 },
> +	{ .supply = "vdda-pll", .init_load_uA = 19000 },
> +};
> +
> +static const struct regulator_bulk_data sm8450_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 173000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 24900 },
> +};
> +
> +static const struct regulator_bulk_data sm8475_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 213030 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18340 },
> +};
> +
> +static const struct regulator_bulk_data sm8550_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 188000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
> +};
> +
> +static const struct regulator_bulk_data sm8650_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 205000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 17500 },
> +};
> +
> +static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 213000 },
> +	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>  };
> 
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
> @@ -1203,8 +1273,8 @@ static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
>  		.rx_num		= ARRAY_SIZE(msm8996_ufsphy_rx),
>  	},
> 
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= msm8996_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(msm8996_ufsphy_vreg_l),
> 
>  	.regs			= ufsphy_v2_regs_layout,
> 
> @@ -1240,8 +1310,8 @@ static const struct qmp_phy_cfg sa8775p_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sa8775p_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sa8775p_ufsphy_vreg_l),
>  	.regs			= ufsphy_v5_regs_layout,
>  };
> 
> @@ -1274,8 +1344,8 @@ static const struct qmp_phy_cfg sc7280_ufsphy_cfg = {
>  		.pcs_num        = ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list              = qmp_phy_vreg_l,
> -	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list              = sc7280_ufsphy_vreg_l,
> +	.num_vregs              = ARRAY_SIZE(sc7280_ufsphy_vreg_l),
>  	.regs                   = ufsphy_v4_regs_layout,
>  };
> 
> @@ -1308,8 +1378,8 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sc8280xp_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sc8280xp_ufsphy_vreg_l),
>  	.regs			= ufsphy_v5_regs_layout,
>  };
> 
> @@ -1333,8 +1403,8 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
>  		.serdes		= sdm845_ufsphy_hs_b_serdes,
>  		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_hs_b_serdes),
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sdm845_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sdm845_ufsphy_vreg_l),
>  	.regs			= ufsphy_v3_regs_layout,
> 
>  	.no_pcs_sw_reset	= true,
> @@ -1360,8 +1430,8 @@ static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
>  		.serdes		= sm6115_ufsphy_hs_b_serdes,
>  		.serdes_num	= ARRAY_SIZE(sm6115_ufsphy_hs_b_serdes),
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm6115_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm6115_ufsphy_vreg_l),
>  	.regs			= ufsphy_v2_regs_layout,
> 
>  	.no_pcs_sw_reset	= true,
> @@ -1387,8 +1457,8 @@ static const struct qmp_phy_cfg sm7150_ufsphy_cfg = {
>  		.serdes		= sdm845_ufsphy_hs_b_serdes,
>  		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_hs_b_serdes),
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm7150_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm7150_ufsphy_vreg_l),
>  	.regs			= ufsphy_v3_regs_layout,
> 
>  	.no_pcs_sw_reset	= true,
> @@ -1423,8 +1493,8 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8150_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8150_ufsphy_vreg_l),
>  	.regs			= ufsphy_v4_regs_layout,
>  };
> 
> @@ -1457,8 +1527,8 @@ static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8150_ufsphy_hs_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8250_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8250_ufsphy_vreg_l),
>  	.regs			= ufsphy_v4_regs_layout,
>  };
> 
> @@ -1491,8 +1561,8 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8350_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8350_ufsphy_vreg_l),
>  	.regs			= ufsphy_v5_regs_layout,
>  };
> 
> @@ -1525,8 +1595,8 @@ static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8350_ufsphy_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8450_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8450_ufsphy_vreg_l),
>  	.regs			= ufsphy_v5_regs_layout,
>  };
> 
> @@ -1561,8 +1631,8 @@ static const struct qmp_phy_cfg sm8475_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8475_ufsphy_g4_pcs),
>  		.max_gear	= UFS_HS_G4,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8475_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8475_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
>  };
> 
> @@ -1606,8 +1676,8 @@ static const struct qmp_phy_cfg sm8550_ufsphy_cfg = {
>  		.pcs_num	= ARRAY_SIZE(sm8550_ufsphy_g5_pcs),
>  		.max_gear	= UFS_HS_G5,
>  	},
> -	.vreg_list		= qmp_phy_vreg_l,
> -	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.vreg_list		= sm8550_ufsphy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(sm8550_ufsphy_vreg_l),
>  	.regs			= ufsphy_v6_regs_layout,
>  };
> 
> @@ -1638,8 +1708,8 @@ static const struct qmp_phy_cfg sm8650_ufsphy_cfg = {
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
> @@ -1676,8 +1746,8 @@ static const struct qmp_phy_cfg sm8750_ufsphy_cfg = {
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
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

