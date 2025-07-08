Return-Path: <linux-arm-msm+bounces-63980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A7AFC4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C7B8481B47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F7D29A9FE;
	Tue,  8 Jul 2025 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSe+psrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B9220F38;
	Tue,  8 Jul 2025 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961799; cv=none; b=f2TPcOIkKfZRgY9aQKjT7oqLq7dAxeCewqQMFdLS7rwJHaLHKKa38Mk4TPR8qIOicem3MY70qcxSGBlXrJ06Dz7fa5jeS/9T9Dc1/1xGO5ZPCCsl2oSe9L23Hc0WeC6K/6JO5rlrDIRe9MzIHRMQvDaRbsZK+dJj4F23JfO+W9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961799; c=relaxed/simple;
	bh=YoPu+gg4v+uqZEJ8IS0/lxaC2n6vSBw+7yUDN79lgmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUqHifQ+Z0x6lRMj4LYvhooe3Id+rlg3m5iN6yx7uVryCnR04nzWQoTYzy6XJHGaJuRSsScotMuOKEKGwON/v/fJ1lR4CA4ZecoK/0TPM2HA8K22rQDNmo3u5mU9h6OzeHQgbuGWMBCu+0Wmt/szvGP5VGy7mP/7Rbaq5BHXwsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSe+psrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2038EC4CEF0;
	Tue,  8 Jul 2025 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961796;
	bh=YoPu+gg4v+uqZEJ8IS0/lxaC2n6vSBw+7yUDN79lgmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSe+psrKjVQz6ejJkwLQx0dDHIhy39Ayt+Yr/ljnkLEw3rrqQPV27Too9IvU12Ebd
	 rHCEnYPE9jGYJoME8X6FsFHEjU/7dk6FzH7YuVOR2u3EcnVZrL8qVowByVn4fWVZ2f
	 WogPKEwOslWpOEehxlmlBH7oxoKSW6Y5jWidsTYPJ9PxIWn5VseddHANQQmywBlcAk
	 zFwyXB8cCe/i6S+bx8WcPdzVcNdnmwHwKFhdONGM3KUP4YVHjykRl3DEyVVyi7xcfh
	 feNWJ93s/jpqJ7QdURdo+tHId7GUqJWHCJ6G4VgWfiJlI1DCmnmxpoLfXr2p3CIjg7
	 1hxXrwwgnVvKA==
Date: Tue, 8 Jul 2025 13:33:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, avri.altman@wdc.com, ebiggers@google.com, 
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V2 3/3] scsi: ufs: qcom: Enable QUnipro Internal Clock
 Gating
Message-ID: <4dpwzfoh3lkhffe3jtihjyqvqe3nyncl4uvjhw2ctpeid7poa3@igim7botbr3f>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-4-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707210300.561-4-quic_nitirawa@quicinc.com>

On Tue, Jul 08, 2025 at 02:33:00AM GMT, Nitin Rawat wrote:
> Enable internal clock gating for QUnipro by setting the following
> attributes to 1 during host controller initialization:
> - DL_VS_CLK_CFG
> - PA_VS_CLK_CFG_REG
> - DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN
> 
> This change is necessary to support the internal clock gating mechanism
> in Qualcomm UFS host controller.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  9 +++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index dfdc52333a96..25b5f83b049c 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -558,11 +558,32 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>   */
>  static void ufs_qcom_enable_hw_clk_gating(struct ufs_hba *hba)
>  {
> +	int err = 0;
> +

No need to init err.

> +	/* Enable UTP internal clock gating */
>  	ufshcd_rmwl(hba, REG_UFS_CFG2_CGC_EN_ALL, REG_UFS_CFG2_CGC_EN_ALL,
>  		    REG_UFS_CFG2);
> 
>  	/* Ensure that HW clock gating is enabled before next operations */
>  	ufshcd_readl(hba, REG_UFS_CFG2);
> +
> +	/* Enable Unipro internal clock gating */
> +	err = ufshcd_dme_rmw(hba, DL_VS_CLK_CFG_MASK,
> +			     DL_VS_CLK_CFG_MASK, DL_VS_CLK_CFG);
> +	if (err)
> +		goto out;
> +
> +	err = ufshcd_dme_rmw(hba, PA_VS_CLK_CFG_REG_MASK,
> +			     PA_VS_CLK_CFG_REG_MASK, PA_VS_CLK_CFG_REG);
> +	if (err)
> +		goto out;
> +
> +	err = ufshcd_dme_rmw(hba, DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
> +			     DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
> +			     DME_VS_CORE_CLK_CTRL);
> +out:
> +	if (err)
> +		dev_err(hba->dev, "hw clk gating enabled failed\n");

So the error is not a hard fault and you want the driver to continue? If so, it
should be justified in commit message.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

