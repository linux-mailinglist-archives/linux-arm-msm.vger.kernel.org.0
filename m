Return-Path: <linux-arm-msm+bounces-57187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B71AAE734
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1157522783
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B20228BA9C;
	Wed,  7 May 2025 16:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHMrd1H5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3281B0F1E;
	Wed,  7 May 2025 16:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636985; cv=none; b=nMetLeOCYJcsn7bimZBunO0vQ9NqqWT1boVQvtBfSrzxW2R8qQtuApRqQlCcJgjgMh+HcTegXovo+0voi0lSULmTv3IVBxgxeXYOGYM4imvPoqXpYcFPIDvbUVv0/xVM5NWegWE1oR5UV2CK1ME1WgCabjOB7X/dsBP3RekAUFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636985; c=relaxed/simple;
	bh=oQ6WF29+uZRNzzdfsh2Zj16NWn6C+aHAcSkHXBwTYaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kci7p2Qef7emEZdRDKoe9VR05tystVdxmRMIdfZ9tK/06Dhk+SkdH+DdoJgn3mPwjzDSwat0jiUjbIBGGS86pFMF5qgMoXhSliANPHSnAWzjDn/lGQdHJWzgixlJnavGsZg/YiU9DjPC7bbmSvQIkm5DQE5wgTxHzFgBXQIbxdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHMrd1H5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F83C4CEE2;
	Wed,  7 May 2025 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636984;
	bh=oQ6WF29+uZRNzzdfsh2Zj16NWn6C+aHAcSkHXBwTYaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rHMrd1H5Uhjvtskg8ZmSJ7heWfsXFotg/RaaElsTxnu/6+vwNCJHDG52PLrA6mEtT
	 Bz2MrH1iqRZrmbA++3wbd7SlosLxT0houbvBmidoK2LICRPWfqgRemAL8qBG60KO3y
	 tQTW9kdXFzaIsj5AsmbJmyd1z7SzWPP6qrQtGBB1DmYhUblO6NDg0f+/xoIjftL8x5
	 6M6/+h1OuYWneVr1lVlQJg47++xHPrOy/93AtfdiCnnG63BRmlYvKC4eABfn0iPDUP
	 lhmWM3I5FQnRmgY45xVeVWfaq0sd0abTY+vY3cbHQrQjXctoFYHn0lAL+Qpy/S+vBu
	 VYRpEeu6v19zQ==
Date: Wed, 7 May 2025 09:56:22 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org, 
	pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org, konradybcio@kernel.org, 
	dietmar.eggemann@arm.com, juri.lelli@redhat.com
Subject: Re: [RFC][PATCH 04/14] soc: qcom: smem: add minidump device
Message-ID: <voqxvemo6w7zmoo45yb7wlei6gz4wd4m7vdgvclptzx7y7avht@4x77c3frno32>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-5-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422113156.575971-5-eugen.hristev@linaro.org>

On Tue, Apr 22, 2025 at 02:31:46PM +0300, Eugen Hristev wrote:
> Add a minidump platform device.

Please provide a bit more context here.

> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  drivers/soc/qcom/smem.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 592819701809..985147b563f8 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -270,6 +270,7 @@ struct smem_region {
>   * @partitions: list of partitions of current processor/host
>   * @item_count: max accepted item number
>   * @socinfo:	platform device pointer
> + * @mdinfo:	minidump device pointer
>   * @num_regions: number of @regions
>   * @regions:	list of the memory regions defining the shared memory
>   */
> @@ -280,6 +281,7 @@ struct qcom_smem {
>  
>  	u32 item_count;
>  	struct platform_device *socinfo;
> +	struct platform_device *mdinfo;
>  	struct smem_ptable *ptable;
>  	struct smem_partition global_partition;
>  	struct smem_partition partitions[SMEM_HOST_COUNT];
> @@ -1236,12 +1238,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	if (IS_ERR(smem->socinfo))
>  		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>  
> +	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-md",

Let's spell out "minidump" here.

Regards,
Bjorn

> +						     PLATFORM_DEVID_AUTO, NULL,
> +						     0);
> +	if (IS_ERR(smem->mdinfo))
> +		dev_err(&pdev->dev, "failed to register platform md device\n");
> +
>  	return 0;
>  }
>  
>  static void qcom_smem_remove(struct platform_device *pdev)
>  {
>  	platform_device_unregister(__smem->socinfo);
> +	if (!IS_ERR(__smem->mdinfo))
> +		platform_device_unregister(__smem->mdinfo);
>  
>  	hwspin_lock_free(__smem->hwlock);
>  	__smem = NULL;
> -- 
> 2.43.0
> 

