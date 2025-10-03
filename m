Return-Path: <linux-arm-msm+bounces-75929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4B0BB796E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 18:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 833E6343E52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 16:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E65D2C17B4;
	Fri,  3 Oct 2025 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MS0VAtm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB6DBA3D;
	Fri,  3 Oct 2025 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759509901; cv=none; b=mMeA3PSVvdQaEso7McCogL5jerutnXLGTjOWpTEw/57IMd5kZNkOdjD+VDEsWdSZjGDk3HXT4d5360b9b7dARM+y15Z0ewuLSyPF4oSGL2P9eW3Wjkn0wVIOOhpbpWQCFICVrpCYT8CcfCACCFqL8M/psvLh3cIG9mQQDieWc+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759509901; c=relaxed/simple;
	bh=qHEKLtrXUa9Wpq/h1IRvLNtgBOEQjJx9HeozieH03p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1HKmoDsw831aJpG8+nILbh4vOw2sFoclQhnPn+vdADgbYRtxyfFFzfZ4P0pLdIN3KpdGuVw4l8+DE4AxLJJKretlfP/9Fu00KoqCFOL79dQLdGE8mmEE+3qLtjpPnCTfQriVj5zNJf9nvAyT+DvnUVd3M15/Mqk7MN4u5wq7vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MS0VAtm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5441C4CEF5;
	Fri,  3 Oct 2025 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759509900;
	bh=qHEKLtrXUa9Wpq/h1IRvLNtgBOEQjJx9HeozieH03p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MS0VAtm8AT1446MGnRKabuPpvaFFwxjjcqCfzD9vVMUebGyrV1XrMc6v11fg+qVsm
	 9QGsVHfZVdQCOXeCgOztAvHY+QGJxfIWQv0g69YOysbr/9K/SVpVxskd+C1440MXic
	 zKUR7JQHrfbzpT9RpV0t7fPYIIkeYvfVeuY2MMtJnOA6l7ybkCj7qckPUzqMUNPDeV
	 yhDbbPafyOE+xyKDnLIaYITFqc8OLccG8oBZZnlQe+nuJoYqs2FpDpUDR2LyR0NUYH
	 ZWOxo6mVj2ujK3kzv2LGhH6AArvid89axlarXkLXiM7WnVsmGmR/EixH/w41DK9CYO
	 BKs9MttV3kc7Q==
Date: Fri, 3 Oct 2025 22:14:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <rge3ozfojjpurnxi5otwuobzcw5v6fstlvpodw4icmhimauckx@wpdb4orkjd5t>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 05:08:20PM +0530, Abhinaba Rakshit wrote:
> Scale ICE clock from ufs controller.
> 

Explain the purpose.

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

newline

> +	return 0;
> +}
> +
>  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
>  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
>  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>  {

> +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)

Drop the 'inline' keyword.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

