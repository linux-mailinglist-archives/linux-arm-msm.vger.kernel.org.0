Return-Path: <linux-arm-msm+bounces-51822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2CA67D44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAE753BECC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EFB17A30B;
	Tue, 18 Mar 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKxEFzI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E51A9B52;
	Tue, 18 Mar 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742327177; cv=none; b=phWtkYOsCG4hha7syOk3d8yIj0Dtjj/EsVNTkE0W5zSx2OoiM2qfwJ3+wdPiPATTeB3xcIPZllZ5Kv5kpTI+E+GVJXlVycRpf0bSIyCXElBBcQI4pOF8wyumrmPkxYkEeqP7/fZhSvcZvtY9Fh8+oDf/JnQ2iNiA3F/ww8sJU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742327177; c=relaxed/simple;
	bh=lEKbj7qrSRjeNGVY4SRKByN692s3IiIjiIa6ElYv0SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzVXHHMuyr6x9KN6p0348KnpujCo5pNd7DPBq+GZCt5SYpyD6pbIqDu6TkXETs9gWW4D8AVs/RtvlXqkOQ1y5Y0IrFWtkKm6Gd7C3ahQikZqBKHrSee0/Kbi9WtzBe1hIppMq5t6J9QdxUI8t54adk0gUsR0EHwwmEwA9axTrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKxEFzI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1886FC4CEDD;
	Tue, 18 Mar 2025 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742327175;
	bh=lEKbj7qrSRjeNGVY4SRKByN692s3IiIjiIa6ElYv0SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKxEFzI4269RyrslzX6RBJfahrwMkeMcZ7IDGJNxY7R5O0/6KFt1KQV34UYHBjClv
	 jSmDwB7YaoiFvGtw18ohBXalAdhlQKjVVKn0qSqNfKdivO5ovMOsN7nOyywND/fFzz
	 88lidbIYxHbh0QzqHeE5sJyioZL8HyVbtxrUwnE2sQAiD8ADjU0LgGr0chArRczLFt
	 Mhi/ryxgy6HqlzOypB0deT4Nj+RFJlIqkctF9tuoNgXTj4AhAFjrDe9viQI1PbGqnU
	 PqGcyHXgZN1PCRUnurKFA7i7NOsgTWH7Stlk4AIeJ5OYwTB21/LdSkDy6TI3+hlkT6
	 Jc1dg37l11GxQ==
Date: Tue, 18 Mar 2025 14:46:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, konrad.dybcio@oss.qualcomm.com, 
	quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 3/6] phy: qcom-qmp-ufs: Refactor UFS PHY reset
Message-ID: <w3si5lpps5nzpyxjulxynl3fxwobtbnfsqwau6et5s2pkgehub@vcmkdaevbf5w>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-4-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318144944.19749-4-quic_nitirawa@quicinc.com>

On Tue, Mar 18, 2025 at 08:19:41PM +0530, Nitin Rawat wrote:
> Refactor the UFS PHY reset handling to parse the reset logic only once
> during probe, instead of every resume.
> 

This looks very reasonable! But it would be preferred to see the commit
messages following the what format outlines in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
with a clear problem description followed by a description of the
technical solution.

> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
> qmp_ufs_probe to avoid unnecessary parsing during resume.

Please add ()-suffix to function names in your commit messages.

Also, this series moves things around a lot, can you confirm that UFS is
working inbetween each one of this patches, so that the branch is
bisectable when this is being picked up?

> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 104 ++++++++++++------------
>  1 file changed, 50 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 0089ee80f852..3a80c2c110d2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1757,32 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>  	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>  }
> 
> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	void __iomem *pcs = qmp->pcs;
> -	int ret;
> -
> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> -	if (ret)
> -		goto err_disable_regulators;
> -
> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> -
> -	return 0;
> -
> -err_disable_regulators:
> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> -
> -	return ret;
> -}
> -
>  static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -1800,41 +1774,27 @@ static int qmp_ufs_power_on(struct phy *phy)
>  {
>  	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qmp->pcs;

This is only used once, perhaps not worth a local variable to save 5
characters on that line?

>  	int ret;
> -	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
> -
> -	if (cfg->no_pcs_sw_reset) {
> -		/*
> -		 * Get UFS reset, which is delayed until now to avoid a
> -		 * circular dependency where UFS needs its PHY, but the PHY
> -		 * needs this UFS reset.
> -		 */
> -		if (!qmp->ufs_reset) {
> -			qmp->ufs_reset =
> -				devm_reset_control_get_exclusive(qmp->dev,
> -								 "ufsphy");
> -
> -			if (IS_ERR(qmp->ufs_reset)) {
> -				ret = PTR_ERR(qmp->ufs_reset);
> -				dev_err(qmp->dev,
> -					"failed to get UFS reset: %d\n",
> -					ret);
> -
> -				qmp->ufs_reset = NULL;
> -				return ret;
> -			}
> -		}
> 
> -		ret = reset_control_assert(qmp->ufs_reset);
> -		if (ret)
> -			return ret;
> +	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> +	if (ret) {
> +		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);

regulator_bulk_enable() will already have printed a more useful error
message, letting you know which of the vregs[] it was that failed to
enable.

> +		return ret;
>  	}
> 
> -	ret = qmp_ufs_com_init(qmp);
> +	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>  	if (ret)
> -		return ret;
> +		goto err_disable_regulators;
> +
> +	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> 
>  	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> +
> +	return ret;
>  }
> 
>  static int qmp_ufs_phy_calibrate(struct phy *phy)
> @@ -1846,6 +1806,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>  	unsigned int val;
>  	int ret;
> 
> +	ret = reset_control_assert(qmp->ufs_reset);
> +	if (ret)
> +		return ret;
> +
>  	qmp_ufs_init_registers(qmp, cfg);
> 
>  	ret = reset_control_deassert(qmp->ufs_reset);
> @@ -2088,6 +2052,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>  	return 0;
>  }
> 
> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	int ret;
> +
> +	if (!cfg->no_pcs_sw_reset)
> +		return 0;
> +
> +	/*
> +	 * Get UFS reset, which is delayed until now to avoid a
> +	 * circular dependency where UFS needs its PHY, but the PHY
> +	 * needs this UFS reset.

This is invoked only once, from qcom_ufs_probe(), so it doesn't seem
accurate anymore. How come this is no longer needed? Please describe
what changed int he commit message.

> +	 */
> +	if (!qmp->ufs_reset) {
> +		qmp->ufs_reset =
> +		devm_reset_control_get_exclusive(qmp->dev, "ufsphy");

The line break here is really weird, are you sure checkpatch --strict
didn't complain about this one?

> +
> +		if (IS_ERR(qmp->ufs_reset)) {
> +			ret = PTR_ERR(qmp->ufs_reset);
> +			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);

return dev_err_probe(qmp->dev, PTR_ERR(qmp->ufs_reset), "failed to...: %pe\n", qmp->ufs_reset);

While being more succinct, it also stores the reason for failing the
probe so that you can find it in /sys/kernel/debug/devices_deferred

> +			qmp->ufs_reset = NULL;

Use a local variable if you're worried about someone accessing the stale
error code after returning here.

Regards,
Bjorn

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int qmp_ufs_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -2114,6 +2106,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> +	ret = qmp_ufs_get_phy_reset(qmp);
> +	if (ret)
> +		return ret;
> +
>  	/* Check for legacy binding with child node. */
>  	np = of_get_next_available_child(dev->of_node, NULL);
>  	if (np) {
> --
> 2.48.1
> 
> 

