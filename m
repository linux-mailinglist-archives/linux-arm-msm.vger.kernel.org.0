Return-Path: <linux-arm-msm+bounces-75769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C342BB26B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 05:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0033E4E0208
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 03:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083CD1C28E;
	Thu,  2 Oct 2025 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1HNF40a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF7834BA50;
	Thu,  2 Oct 2025 03:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374930; cv=none; b=JCm5IW4p2hbuCRG7kr/aDqBw0UG8zOj4zyjw0jEuwSxqUQmG6zqf0wWLQ5g3aDrhyyuU6Bb/S65iddo40GtgErf+bK6FLjDbMjVcWNGgEyhcwt65W0kcgOJFs2m8YPKFBK6xD0ikLOj8KbRiNMwtBT0CiV4ZUJ0uWIqULDAGNQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374930; c=relaxed/simple;
	bh=VpV2pOWto+o9HQrJ9eHkXRSE1ZMpRyuoqKKjw5pJooA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChlW9ea/s8OdXD3mPkphZ3WJx6BfiB4dnFi2DGkCW/CD4ouQsPqVGsMmPufyAwzWmWBQL9KTj5kd3OUG31fyKcmMi8ZT7nDwtmbBluvhZyr1JIbT5dP1/KJDK4a5zWCHTncJ/0p6Rz6xSWu6UPX0GbFX/9MUqFHdinGRbzN08e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1HNF40a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DA3C4CEF9;
	Thu,  2 Oct 2025 03:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759374930;
	bh=VpV2pOWto+o9HQrJ9eHkXRSE1ZMpRyuoqKKjw5pJooA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1HNF40aFe+pAlW+FG7RemDTNOBmaEB1ILzUDbkqQ1ADr2GvSAW3HI0UrI7wMyuwd
	 MrDcEdJ/uPk0eL86yKllUWiJTNUdjHT7Av15TcFB0wHCfKK1jbZamJBwajFiYqtEFM
	 l2w3QA743OHgreUJrvNmZ5dYhwfZIDTxIsA75Du9/+Aj/z6oFouXH82IwwYfAqRcQC
	 yX+nEcHR8LcOAkKd0BJxt++mFtrDbm4vetZkdqQHcp9wol0B9AEBM+CP5LFnKCB9xV
	 FPLFScWT6DtIJ4ZwNAvyfvVsAMvxmj+ksnVZnc/xr8Yt8ccvyHJcTm0FWT2RUt7qZW
	 sUuPSl9YDhjSw==
Date: Wed, 1 Oct 2025 22:15:27 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <w66a6wfln25o7h7gublrnit5ky33s4vkhbf6jvwylsl4f2n2ou@kgqr7g45a5an>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:08:20PM +0530, Abhinaba Rakshit wrote:
> Scale ICE clock from ufs controller.
> 

This isn't a good commit message.

Regards,
Bjorn

> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed9399cc02d37b5229a 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
>  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
>  }
>  
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> +{
> +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> +		return qcom_ice_scale_clk(host->ice, scale_up);
> +	return 0;
> +}
> +
>  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
>  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
>  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>  {
>  }
>  
> +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> +{
> +	return 0;
> +}
> +
>  #endif
>  
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -1636,6 +1648,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>  		else
>  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
>  
> +		if (!err)
> +			err = ufs_qcom_ice_scale_clk(host, scale_up);
>  
>  		if (err) {
>  			ufshcd_uic_hibern8_exit(hba);
> 
> -- 
> 2.34.1
> 

