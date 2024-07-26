Return-Path: <linux-arm-msm+bounces-27094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59893D535
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A065281878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2A81CD16;
	Fri, 26 Jul 2024 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8/+n+5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE01CD00;
	Fri, 26 Jul 2024 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004728; cv=none; b=N2muw5BKjpVkCejQPj6smvJ56lIexwkpIqwzFqfgFLvtH+RFhoG7/wIlS9zckS+1XP/GRYZwYt4lBR4fIIybo4hCrPa1iqqvL9ZK8Jy6N0w+oPBfibigXxf+VVvFBXFXSykQaYCiOYA54QpkrIR4OvHt7cN3GuR/sH93CcgZicg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004728; c=relaxed/simple;
	bh=dcbxhpAsjmvB2T/aiYNawl3wYu/ZKvggNrrBJFqTcRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpoUhqR+nb0DrTvT67u3aTsDX7G8SjmEyBfPnrXYmdqjDpYFEk2QNMALehZgJ82wwopr7TQYJv/T1pR4t00lpa2koM7zGq8h0pAYj+kqWuk0fsoZgAWCClvNsQJ9EsY6k2+GTdGmGn3S/mmZBmAnVXAKnnlBqXnGHMe2sWfKJ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8/+n+5l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFEAC32782;
	Fri, 26 Jul 2024 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722004727;
	bh=dcbxhpAsjmvB2T/aiYNawl3wYu/ZKvggNrrBJFqTcRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8/+n+5ldkmpeZRfp9Je6DgvqWmDQzO33ZCoi3FVVzYDTH0Y1NVEgTQCW8vIfOhX0
	 ajPhKKyLYllk9iY5p0K33TcUlHyJhHSFXlgBvESJlcHYqP5L17sf1CqDgVQX3fIokI
	 Gpok6SxrlTdTNiLST52qLrxigSgh9i+nYFcNnCMe0G7YFXCTOY9cGdGgPEt8HzsJYl
	 VDEH5PuW9TKv3aNoIuJw30OhSIBSYMS8PrQ2J++9WesRFtsOIp2dP42R1/GA4QyjDr
	 ie+ABPoXAzj0SnnZv5MpkKHYFd0Y1g7zB3xj3t18ROH9xJXj+eQg0V79wUJjuKcSvy
	 jYayeml7lRe8A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sXM5s-000000007Tn-19Er;
	Fri, 26 Jul 2024 16:38:53 +0200
Date: Fri, 26 Jul 2024 16:38:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
Subject: Re: [PATCH] phy: qcom: qmp-pcie: Configure all tables on port B PHY
Message-ID: <ZqO0_HyMl77yIGK-@hovoldconsulting.com>
References: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-phy-qcom-qmp-pcie-write-all-tbls-second-port-v1-1-751b9ee01184@linaro.org>

On Fri, Jul 26, 2024 at 11:09:14AM +0300, Abel Vesa wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Currently, only the RX and TX tables are written to the second PHY
> (port B) when the 4-lanes mode is configured, but according to Qualcomm
> internal documentation, the pcs, pcs_misc, serdes and ln_shrd tables need
> to be written as well.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 5b36cc7ac78b..fd59ebd32f5f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3660,18 +3660,30 @@ static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	const struct qmp_pcie_offsets *offs = cfg->offsets;
> -	void __iomem *tx3, *rx3, *tx4, *rx4;
> +	void __iomem *tx3, *rx3, *tx4, *rx4, *pcs, *pcs_misc, *ln_shrd, *serdes;

Please order these as serdes, tx/rx, pcs, pcs_misc, ln_shrd so that it
matches the order port_a is programmed (even if the hardware doesn't
care about this).

>  
>  	tx3 = qmp->port_b + offs->tx;
>  	rx3 = qmp->port_b + offs->rx;
>  	tx4 = qmp->port_b + offs->tx2;
>  	rx4 = qmp->port_b + offs->rx2;
> +	serdes = qmp->port_b + offs->serdes;

And use the same order here (move serdes above tx3).

> +	pcs = qmp->port_b + offs->pcs;
> +	pcs_misc = qmp->port_b + offs->pcs_misc;
> +	ln_shrd = qmp->port_b + offs->ln_shrd;

>  	qmp_configure_lane(tx3, tbls->tx, tbls->tx_num, 1);
>  	qmp_configure_lane(rx3, tbls->rx, tbls->rx_num, 1);
>  
>  	qmp_configure_lane(tx4, tbls->tx, tbls->tx_num, 2);
>  	qmp_configure_lane(rx4, tbls->rx, tbls->rx_num, 2);
> +
> +	qmp_configure(serdes, tbls->serdes, tbls->serdes_num);
> +	qmp_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);

And here (e.g. move serdes above tx3).

> +
> +	qmp_configure(pcs, tbls->pcs, tbls->pcs_num);
> +	qmp_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
> +
> +	qmp_configure(ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
>  }

Johan

