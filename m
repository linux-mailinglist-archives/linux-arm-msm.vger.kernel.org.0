Return-Path: <linux-arm-msm+bounces-70276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD77B311F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B6991CC6B15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27602EC54B;
	Fri, 22 Aug 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EH02UZgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A78A221577;
	Fri, 22 Aug 2025 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852042; cv=none; b=qchW+Lv8VBNgAgiP86mYmt3+x5+XUWWNzn4TfGM5Sxjxc15sNeDvU3detKZ2sEPlma9h5rVFIod2bKMDH/aS119v6jUgpPfWOI2sNwYqJMDUppwgrWAA+HeGw+/6a661ZvngvbNBmXo4+7yVxAMaiyclPKdBOjShZ+PbDY1XYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852042; c=relaxed/simple;
	bh=q0HwPcYz0N5VXro/Xjw2FhQcs7bgEeOCHWFFgXWZjEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh0NTUYrZf8J75WusX8BDnnGoMZcSLQiXj/7WN8IJzS/+L0BlL+OsDuVT4hImKOKnDiRkQZxMdCq65R2w3GICqKjjt9+rPtvmQIjstt9UFkPdwkyFlqGxRy5XHtoqiHQNma+ROcKec/+6ZsMeZhbX+c5rkiILuK1N4DNZYfYegk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EH02UZgS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37485C4CEF4;
	Fri, 22 Aug 2025 08:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755852042;
	bh=q0HwPcYz0N5VXro/Xjw2FhQcs7bgEeOCHWFFgXWZjEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EH02UZgSv8pnnFNEM1rCFJ+OP7CWQOgAKWoF+5/nny4/lsut+PlxQlFX6cLPGHb7u
	 s7KqAZTh5DNNPz5bao0gA8ZEX0m7Tn5pbxDs4I75X9fZYPK7NRz60DIZmT0V2Tmwos
	 GtJlP5Fx5Fwg07xkJNkFgR7xtR36ir9Wzy2R9XDgGXtwdXo4GX+vpiffD66vz4MQtu
	 uXmOaNF3DJYwHyWmS1AWPLiTB1olosvIeqtKv96xc911GJcJrm8q2DOIyGR6Aw4UO1
	 DGlLE7sUYFUXnY0nZzNsa+rolmHX1lrajnS3qRV9gyneEuL3yHXRTHWz6PhphpSLNs
	 TKa1pOCQ96M6w==
Date: Fri, 22 Aug 2025 14:10:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] phy: qcom-qmp-ufs: Add regulator load voting for
 UFS QMP PHY
Message-ID: <iak5s5ligdmq3ru4fkvh5a3si6nxadwouboltxxyce4x7t3l6o@eyhh7khzij7v>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819222832.8471-2-quic_nitirawa@quicinc.com>

On Wed, Aug 20, 2025 at 03:58:25AM GMT, Nitin Rawat wrote:
> On certain SoCs, power regulators are shared between the QMP UFS PHY
> and other IP blocks. To ensure proper operation, the regulator
> framework must be informed of the UFS PHY's load requirements.
> This is essential because the regulator's operating mode—whether Low
> Power or High Power—depends on the maximum expected load at any given
> time, which the regulator driver needs to manage accordingly.
> 
> To support this, replace devm_regulator_bulk_get() with
> devm_regulator_bulk_get_const() and inline the qmp_ufs_vreg_init()
> function.

Use of 'inline' is confusing. Please reword it to sound like you are just
getting rid of this function in favor of devm_regulator_bulk_get_const().

> additionally replace the array of regulator names with a
> bulk regulator data structure, and utilize the init_load_uA field
> provided by the regulator framework. This ensures that
> regulator_set_load() is automatically invoked before the
> first enable operation.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 29 +++++++------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 9c69c77d10c8..aaa88ca0ef07 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1107,7 +1107,7 @@ struct qmp_phy_cfg {
>  	const struct qmp_phy_cfg_tbls tbls_hs_overlay[NUM_OVERLAY];
> 
>  	/* regulators to be requested */
> -	const char * const *vreg_list;
> +	const struct regulator_bulk_data *vreg_list;
>  	int num_vregs;
> 
>  	/* array of registers with different offsets */
> @@ -1164,9 +1164,10 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
> 
> -/* list of regulators */
> -static const char * const qmp_phy_vreg_l[] = {
> -	"vdda-phy", "vdda-pll",
> +/* Default regulator bulk data (no load used) */
> +static const struct regulator_bulk_data qmp_phy_vreg_l[] = {
> +	{ .supply = "vdda-phy" },
> +	{ .supply = "vdda-pll" },
>  };
> 
>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
> @@ -1890,22 +1891,6 @@ static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
> 
> -static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	struct device *dev = qmp->dev;
> -	int num = cfg->num_vregs;
> -	int i;
> -
> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
> -	if (!qmp->vregs)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i];
> -
> -	return devm_regulator_bulk_get(dev, num, qmp->vregs);
> -}
> 

Stray new line.

With above changes,

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

