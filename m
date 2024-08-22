Return-Path: <linux-arm-msm+bounces-29246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA295AE15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB5D1F23260
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F089C16EBE8;
	Thu, 22 Aug 2024 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWkts7xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5016DEAA;
	Thu, 22 Aug 2024 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309555; cv=none; b=YgrjApLrcw7abIQdMJibI+j1jzwHdkv1OJ4cEpnAbvhTiwFRMaMPU6HNbOuua7lmpAMAnzVYWFhK1sai7tC1ymWpabMGtWzOy0PC01/dSAt/w70yP3iseSpwVamGWQSQ5kbj/5YYvwu1RCqGpcH3vGWji3ZylkhvvreffI9kuAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309555; c=relaxed/simple;
	bh=jPUvdvkGKFGooNnKnoXnqLj1ZDfeQBnfC0I5fLQ9kBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbLiw6tGdkAnDxxf5i4I2W0OCqvv6kJAUTtjFOi4JDfElSTVI1ShfTaCGSDyk7OjrrO0BPkBe0DmMp3pbmWyzaG/NMuThgAiJaK7AKWu/+u5EYdx6/f4yvKwkfkz+m+7ZqmrBp32x5M51/53e5KQfNLsdyZ1ggzP7ogshr/ISX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWkts7xk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A838C4AF0B;
	Thu, 22 Aug 2024 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724309555;
	bh=jPUvdvkGKFGooNnKnoXnqLj1ZDfeQBnfC0I5fLQ9kBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWkts7xkPfhmOH6jQABhroZB1EQKq8un0Um8qz+BBiMVKwUZmuhxgHJXMyDed+3ju
	 1Sk6K/7w+WcDWaOUQ8oXlcyVERkQnRjWM/dfQyGDQysQxg51MP+LxUvJYg4XxBsOTJ
	 kdKNgRDYF+LepLTVOIF8LS2IdWs8B0xrCJPfTvVmnQL+llQJEWXj081ej3HpHrFTVq
	 Ojq1FzVJt5zNuqtiwcSc4y9qG1YkcKytPKkqGcr73v2cHcPj8kwf5vYRdwGDdw9uxg
	 8PS8pjQ8UULSerHqOodH8lV5TE187lXBlCAlZuXT9loOFvHp3y8VBHQggsNSsFLpr/
	 /2HPfqKP7f/YA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sh1gU-000000004sN-3zO1;
	Thu, 22 Aug 2024 08:52:39 +0200
Date: Thu, 22 Aug 2024 08:52:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for
 X1E80100
Message-ID: <ZsbgNmHYj3jE9CpO@hovoldconsulting.com>
References: <20240821-x1e80100-phy-add-gen4x4-v2-0-c34db42230e9@linaro.org>
 <20240821-x1e80100-phy-add-gen4x4-v2-2-c34db42230e9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821-x1e80100-phy-add-gen4x4-v2-2-c34db42230e9@linaro.org>

On Wed, Aug 21, 2024 at 11:39:01AM +0300, Abel Vesa wrote:
> The sixth PCIe controller on X1E80100 can be used in either
> 4-lanes mode or 2-lanes mode. Add the configuration and compatible
> for the 4-lane mode.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 42 ++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index a7e2ce0c500d..df1ebc19c117 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -1266,6 +1266,10 @@ static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x2_pcie_ln_shrd_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V6_LN_SHRD_RX_SUMMER_CAL_SPD_MODE, 0x5b),
>  };
>  
> +static const struct qmp_phy_init_tbl x1e80100_qmp_gen4x4_pcie_serdes_4ln_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x1c),
> +};

Nit: This is a serdes subtable (override) so should go under the serdes
table above (not ln_shrd).

Looks good otherwise:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

