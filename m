Return-Path: <linux-arm-msm+bounces-79197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C1C151BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D3DD4E776F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 14:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151C9305946;
	Tue, 28 Oct 2025 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qd7ItwOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DA2238D54;
	Tue, 28 Oct 2025 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660868; cv=none; b=MEgowt9thrapv0N0DDR7EiFkKqgna4NBsHDuaypDYpVzUI9V8IbEMIxrEea9GAXY0tB9xFE94LbpRlKSSL0Lu4PxNF3XJbYmod6TK6zOcmYzQqmF3lQydSAWC6JvYu6KnhW0VjnK125cq1qP12m7ONZPOZ4HY/24R6rNmmudaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660868; c=relaxed/simple;
	bh=3VOmtzVfP8rEqarJwOAk+ziIA6PjTjNMEu5CtoUoCFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqnSZJ5yhtVxkSOYuCWg3UKZJonIa9D7HRg553Hjxpq33/tWDGzryPUjf7lhkXX76J1Efhzj5eruE5wGyOCyuZMzvEklNGIthw7G3VJpCtR83HNgexZOFUQJs4/zCX0EjfiQe0G8LZzfxN8xOMB1S1D/i0iEIuJNCU7Cu8gdCAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qd7ItwOx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0469C4CEF7;
	Tue, 28 Oct 2025 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761660867;
	bh=3VOmtzVfP8rEqarJwOAk+ziIA6PjTjNMEu5CtoUoCFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qd7ItwOxGn5Say5y+Rz4vtUUhgSCdYFdancMc8WF8PRHPadwBheR88UHHjkpzlyRW
	 lu7GFLRQTGQU+GTw22K47FvuKoNK/v1HMMdYBMNB7qQ4+PiGL3AyVQDaYJutuuw/9w
	 GAKiFoSOv9Zuq+CldSqdKPU+1HebK4daLHuJLdq+zTT2AwdO6faPSE+aW3NGuEHAAm
	 8L/3+5nLL530uc6Elwt4llVL5abFteKGnEXVS64+jTeaXd5Kq37xiWaOjWp+cOo87y
	 NirMkaMwfDxXDwFnhq+nf4ohQI3EqQm2rYxI77BOK+Kee4XRBtQKdt+TMBywG61r4b
	 CiTO+JV1n5vPQ==
Date: Tue, 28 Oct 2025 09:17:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
Message-ID: <5b7rv52cqu55jn5ku6hy6m7u7yn37i4iviaj4eutlgudw7mpny@w3vhaulnmi2p>
References: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>

On Mon, Oct 27, 2025 at 11:54:58AM +0530, Prashanth K wrote:
> Add runtime power management operation callbacks for M31 EUSB2 PHY.
> Enable/disable the clocks based on the runtime suspend/resume calls.

Please start with describing which problem this solves.

Regards,
Bjorn

> 
> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 0a0d2d9fc846..1aeb5e3de07c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -240,6 +240,34 @@ static const struct phy_ops m31eusb2_phy_gen_ops = {
>  	.owner		= THIS_MODULE,
>  };
>  
> +static int m31eusb2_phy_runtime_suspend(struct device *dev)
> +{
> +	struct m31eusb2_phy *phy = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "Suspending M31 eUSB2 Phy\n");
> +	clk_disable_unprepare(phy->clk);
> +
> +	return 0;
> +}
> +
> +static int m31eusb2_phy_runtime_resume(struct device *dev)
> +{
> +	struct m31eusb2_phy *phy = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	dev_dbg(dev, "Resuming M31 eUSB2 Phy\n");
> +	ret = clk_prepare_enable(phy->clk);
> +	if (ret)
> +		dev_err(dev, "failed to enable ref clock, %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops m31eusb2_phy_pm_ops = {
> +	SET_RUNTIME_PM_OPS(m31eusb2_phy_runtime_suspend,
> +			   m31eusb2_phy_runtime_resume, NULL)
> +};
> +
>  static int m31eusb2_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>  				     "failed to get clk\n");
>  
> +	dev_set_drvdata(dev, phy);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	/*
> +	 * Prevent runtime pm from being ON by default. Users can enable
> +	 * it using power/control in sysfs.
> +	 */
> +	pm_runtime_forbid(dev);
> +
> +
>  	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
>  	if (IS_ERR(phy->phy))
>  		return dev_err_probe(dev, PTR_ERR(phy->phy),
> @@ -313,6 +352,7 @@ static struct platform_driver m31eusb2_phy_driver = {
>  	.probe = m31eusb2_phy_probe,
>  	.driver = {
>  		.name = "qcom-m31eusb2-phy",
> +		.pm = &m31eusb2_phy_pm_ops,
>  		.of_match_table = m31eusb2_phy_id_table,
>  	},
>  };
> -- 
> 2.34.1
> 
> 

