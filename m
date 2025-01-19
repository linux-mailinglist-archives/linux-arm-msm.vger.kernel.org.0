Return-Path: <linux-arm-msm+bounces-45489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368FA160BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 08:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4944E7A0F92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 07:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1A1156C7B;
	Sun, 19 Jan 2025 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPgNA+8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB068F4A;
	Sun, 19 Jan 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737271865; cv=none; b=rZZrfD6jthUIWOLWIxvY1r1RjUbnZu8IZqII3MuHgzk7rF1DWapeBprsnH5MZGucwcZe25SLNqGnB+TFwrOSRYf9Dr9ZjKV6ldOq/8b+21klSbv7CaPbE9WT05FIt9OdBl+GQGTw/gg9IzBOC4ySZ+jgYJSkeC79+UEcUiCjS3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737271865; c=relaxed/simple;
	bh=v8+mD+alIFzeUPU39rV9oZJTZTIcb9Ra+TTNQos1jck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQbNfPMOHTjyr9HlpOmyRE9zBRsRY8VSrTsnQCDiqHV14gRlmUIeCJgedwMSSIsOiBK8tbVk7pjlMxx5XXriMYU6KFqa9MOW53Y5zcZD9ZJJVM+7lkjE7GwGI15+y1WxM9/niq+RKsoGQdYBDcP7qIZ9/a20qpnuYVd+SZycjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPgNA+8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205B6C4CED6;
	Sun, 19 Jan 2025 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737271864;
	bh=v8+mD+alIFzeUPU39rV9oZJTZTIcb9Ra+TTNQos1jck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPgNA+8wADUL+wjen+uSAICfUaIB1XrAonhN6NlPi5ajJ+NenWD2Q9w69hjhS3K7j
	 s2nquTzD4nIbsoVXu2ItYTwK1ITlQJ7yi1iqPOe6rt9v1VjwCOYz/WHdz+eHeC9+IF
	 Zqizlc3de2zW0bBT7fRNCnAlN8BlHRYWNb+fOPTR9iKvCvGRHMhEl5yuh3YIJm1Yu2
	 lbrd0ANu+J0LfmWgm1NllkcsCNHUcgU4CzE+2TzlJm/N0yBnZkYV/Y7Y++7p5ivNDj
	 N28p3iZq45zpXMBCJIWnM6apg0YuIeRmOb4K2f8+4apwD2fBuOnSnjwMfiajjgYqYK
	 MZ4Ol0aHBVoGg==
Date: Sun, 19 Jan 2025 13:00:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziqi Chen <quic_ziqichen@quicinc.com>
Cc: quic_cang@quicinc.com, bvanassche@acm.org, beanhuo@micron.com,
	avri.altman@wdc.com, junwoo80.lee@samsung.com,
	martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
	linux-scsi@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] scsi: ufs: qcom: Implement the freq_to_gear_speed()
 vops
Message-ID: <20250119073056.houuz5xjyeen7nw5@thinkpad>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-5-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116091150.1167739-5-quic_ziqichen@quicinc.com>

On Thu, Jan 16, 2025 at 05:11:45PM +0800, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> Implement the freq_to_gear_speed() vops to map the unipro core clock
> frequency to the corresponding maximum supported gear speed.
> 
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1e8a23eb8c13..64263fa884f5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1803,6 +1803,37 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
>  	return ret;
>  }
>  
> +static int ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq, u32 *gear)
> +{
> +	int ret = 0;

Please do not initialize ret with 0. Return the actual value directly.

> +
> +	switch (freq) {
> +	case 403000000:
> +		*gear = UFS_HS_G5;
> +		break;
> +	case 300000000:
> +		*gear = UFS_HS_G4;
> +		break;
> +	case 201500000:
> +		*gear = UFS_HS_G3;
> +		break;
> +	case 150000000:
> +	case 100000000:
> +		*gear = UFS_HS_G2;
> +		break;
> +	case 75000000:
> +	case 37500000:
> +		*gear = UFS_HS_G1;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		dev_err(hba->dev, "Unsupported clock freq\n");

Print the freq.

- Mani

> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>   *
> @@ -1833,6 +1864,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.op_runtime_config	= ufs_qcom_op_runtime_config,
>  	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
>  	.config_esi		= ufs_qcom_config_esi,
> +	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

