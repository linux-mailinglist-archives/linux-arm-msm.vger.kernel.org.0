Return-Path: <linux-arm-msm+bounces-51823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 064D3A67D51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFF7423FAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFF91DE89D;
	Tue, 18 Mar 2025 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/uwAorb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5D20322;
	Tue, 18 Mar 2025 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742327424; cv=none; b=ne944MXc8R+GJ46edrrcyjaezF1XHRQ1iF5a7NdopfZIXHJbNCcGdlH/9jKX4FgQaURrnu5IhJer3iOHo40FNK6Hq4B6y5AxL8GF4Ws62lEMAvSlCMKLC5b4JRf3I6va/amYZsgn1gmaHDOTXfmCLRDXD+t/69hrQm7aLD6gni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742327424; c=relaxed/simple;
	bh=6hdO58MKH0BNWV5qZxIKRDwcvWh3JUfmzbEUrW588jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShdG2QBNf+0bvGNrN1tV4TXkKtSCHd/B5JX49KWxSCsQx8CL19Ljq8FQ1Ufaw+ZECGynkkwh5KxfNu0isqNgPfUJmqhwSWfZZgzUTMyE3Z0y3qxJNY2AWsq+GwLJx7w/2NiQcE9AcQ6grxTZzzt7fEXfkRWuBVbqF3SWGrWC8WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/uwAorb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286C5C4CEDD;
	Tue, 18 Mar 2025 19:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742327424;
	bh=6hdO58MKH0BNWV5qZxIKRDwcvWh3JUfmzbEUrW588jQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/uwAorbadYZhvpOulGkbKMAZnuLmRS39MAamq2u0wcbPOnOFChWEhfrO7qr3g4gz
	 31ztOikGwpRqeHy2VKAJvE17FZZV4uhsndRrdO1UWWzIe5QN5L3Sf2buNAAQTjlSuk
	 TPn/0QPLSEyfMBQlUy3ittCYTqhtnH1oypNE600II4ZWmFkolrotXsuepAju3t1+ad
	 j8YO6bXrshN9yM7Et4FaZ8S/piffKOn0VX6DMF04iWyryXNei/4+HlinblDYWFRfA6
	 Gz5CrcNmYp2ez7RHwn3Edv2SE4eus0CKyhcAaoaJaRH+IAPuXtcDRQoA+3nO6rsFN/
	 zL+BWGrp0kS3w==
Date: Tue, 18 Mar 2025 14:50:21 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, konrad.dybcio@oss.qualcomm.com, 
	quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V2 6/6] scsi: ufs: host : Introduce phy_power_on/off
 wrapper function
Message-ID: <jx6t2745x3swbfiqwsii5xdumhpanc435ooucrg2nlyl22llho@epleg24suedr>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-7-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318144944.19749-7-quic_nitirawa@quicinc.com>

On Tue, Mar 18, 2025 at 08:19:44PM +0530, Nitin Rawat wrote:
> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
> functions with mutex protection to ensure safe usage of is_phy_pwr_on
> and prevent possible race conditions.
> 

Please describe the problem properly here. Are you introducing the mutex
because there is a problem, or because you want to be "safe"?

Why is it "refcounted", is the calling code paths no longer in sync? How
long has the current implementation been broken?

Regards,
Bjorn

> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 44 +++++++++++++++++++++++++++++++------
>  drivers/ufs/host/ufs-qcom.h |  4 ++++
>  2 files changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 5c7b6c75d669..8f80724e64b9 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -421,6 +421,38 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
>  	return UFS_HS_G3;
>  }
> 
> +static int ufs_qcom_phy_power_on(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int ret = 0;
> +
> +	guard(mutex)(&host->phy_mutex);
> +	if (!host->is_phy_pwr_on) {
> +		ret = phy_power_on(phy);
> +		if (!ret)
> +			host->is_phy_pwr_on = true;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ufs_qcom_phy_power_off(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct phy *phy = host->generic_phy;
> +	int ret = 0;
> +
> +	guard(mutex)(&host->phy_mutex);
> +	if (host->is_phy_pwr_on) {
> +		ret = phy_power_off(phy);
> +		if (!ret)
> +			host->is_phy_pwr_on = false;
> +	}
> +
> +	return ret;
> +}
> +
>  static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> @@ -449,7 +481,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		return ret;
> 
>  	if (phy->power_count) {
> -		phy_power_off(phy);
> +		ufs_qcom_phy_power_off(hba);
>  		phy_exit(phy);
>  	}
> 
> @@ -466,7 +498,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
> 
>  	/* power on phy - start serdes and phy's power and clocks */
> -	ret = phy_power_on(phy);
> +	ret = ufs_qcom_phy_power_on(hba);
>  	if (ret) {
>  		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
>  			__func__, ret);
> @@ -1017,7 +1049,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				 enum ufs_notify_change_status status)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
>  	int err;
> 
>  	/*
> @@ -1037,7 +1068,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  				/* disable device ref_clk */
>  				ufs_qcom_dev_ref_clk_ctrl(host, false);
>  			}
> -			err = phy_power_off(phy);
> +			err = ufs_qcom_phy_power_off(hba);
>  			if (err) {
>  				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>  					return err;
> @@ -1046,7 +1077,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  		break;
>  	case POST_CHANGE:
>  		if (on) {
> -			err = phy_power_on(phy);
> +			err = ufs_qcom_phy_power_on(hba);
>  			if (err) {
>  				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>  				return err;
> @@ -1233,10 +1264,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>  static void ufs_qcom_exit(struct ufs_hba *hba)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
> 
>  	ufs_qcom_disable_lane_clks(host);
> -	phy_power_off(phy);
> +	ufs_qcom_phy_power_off(hba);
>  	phy_exit(host->generic_phy);
>  }
> 
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index d0e6ec9128e7..3db29fbcd40b 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -252,6 +252,10 @@ struct ufs_qcom_host {
>  	u32 phy_gear;
> 
>  	bool esi_enabled;
> +	/* flag to check if phy is powered on */
> +	bool is_phy_pwr_on;
> +	/* Protect the usage of is_phy_pwr_on against racing */
> +	struct mutex phy_mutex;
>  };
> 
>  struct ufs_qcom_drvdata {
> --
> 2.48.1
> 
> 

