Return-Path: <linux-arm-msm+bounces-27092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EB93D51A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 16:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030E0284945
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 14:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774FA15E81;
	Fri, 26 Jul 2024 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQwYnetr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E9EEB2;
	Fri, 26 Jul 2024 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722004140; cv=none; b=h7yYnjVgMAwNXWWar/dWgGYkoBly97KUZl/+npW20sn8pDGUrblZjTpTzD1rFjS/6XNDl8QnJr/VaQrisllHyminbLPfu2JX4Nh7tZEqrAtI44+3k2Axi1uQyoXV3WqkwXPksOom/pwZ1BaCMswY9tzuF5rTnSnQCJsztn6MXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722004140; c=relaxed/simple;
	bh=WGyBAplORceeO8W0akWmItJGTTaSx6AWpNMIRWFZy24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKi4Z0c16D3uZ/iJOXTYkM0mvxqxyOF7Ft0Jx0eEoTy1nmk7QUCJ2V2IJR978rIqhpYZL2Z7vaxAmkkwNulqHbj5bjH0YxNSnXKBIKOJPIMiSZXIvQNe/b1kqBnkilbzdqfoQjot2dC/+4sAXf0MNNMVc7hvlYkBcUKk7ttFKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQwYnetr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7DAC4AF07;
	Fri, 26 Jul 2024 14:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722004139;
	bh=WGyBAplORceeO8W0akWmItJGTTaSx6AWpNMIRWFZy24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQwYnetrKHH9zTr9XxA9Gwqnxm+fiBQInsbv+d3oM+AIk2pZ4+2EkBY691W7ioC98
	 TSFyrtSHJokSLUSg1WdYYsl2jBGtWp1U7e1uEkMSOYh7bAeTqQoEV6RhCUnn5ZrB6/
	 0MsGDao2txUAh2LRiLHXe95EXOLG4Qn9ELM4vEgEesG/0fCxsLDoSnF8JLrlIwT+wm
	 ZonYz7+bQIq+mf+vVQkqNSr0AD9Jl1dHuVk6IzdOp4KfvpERYcZTGrfp60BPw93Fwn
	 rrfCM3sr2o0sdfFTV7/QOzfcKT4Y8t5vHfxeMiDq5rUhArXfjKcRkbkYNlOgM+4pky
	 g/J6g7IF02flQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sXLwO-000000006vU-3pTW;
	Fri, 26 Jul 2024 16:29:04 +0200
Date: Fri, 26 Jul 2024 16:29:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-pcie: Fix X1E80100 PCIe Gen4 PHY
 initialisation
Message-ID: <ZqOysDk0LqwxG4OF@hovoldconsulting.com>
References: <20240726-x1e80100-phy-qmp-pcie-fix-config-v1-1-b569f03c0c48@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-x1e80100-phy-qmp-pcie-fix-config-v1-1-b569f03c0c48@linaro.org>

On Fri, Jul 26, 2024 at 10:16:56AM +0300, Abel Vesa wrote:
> Update the PCIe Gen4 PHY init sequence with the latest based on internal
> Qualcomm documentation.

Any hints about what these updates imply?

> Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 5b36cc7ac78b..8b624afbf014 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c

>  static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_tx_tbl[] = {
> @@ -1286,12 +1287,15 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_rx_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_1, 0x01),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_2, 0x01),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_3, 0x45),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0b),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0A, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_VGA_CAL_MAN_VAL, 0x0B, 2),

Please use lower-case hex consistently.

> +	QMP_PHY_INIT_CFG(QSERDES_V6_20_VGA_CAL_CNTRL1, 0x00),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_GM_CAL, 0x0d),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_SIGDET_ENABLES, 0x1c),
>  	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_PHPRE_CTRL, 0x20),
> -	QMP_PHY_INIT_CFG(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x3A, 1),
> +	QMP_PHY_INIT_CFG_LANE(QSERDES_V6_20_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38, 2),

Ditto.

Johan

