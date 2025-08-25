Return-Path: <linux-arm-msm+bounces-70787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08513B34F71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 01:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8297B2A6B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E462E2D29D8;
	Mon, 25 Aug 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PH5t8eac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD92C1591
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162765; cv=none; b=gHIo79HNcYd5aQc4jHC8BxFey8/VZiRRTN9piP7K7j11He5W2+X48kyX6mfS5n0O6w5RjhP/z+0sTebtEEk5V53i99DPldcuAejPhkhU9Ptw4D6Zs/dOWQp2uLOHYZvSQr7SFjfRj9SeZQviceP4Gsvs4TAyRVhIXRIttZDRDRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162765; c=relaxed/simple;
	bh=hASPwLMv88e9aiYRhwvg2/3oAa7YVa1mxMF5NqFtEfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W40lr5338lG2WjUKYFqvezQJB5M8OGmKtFdXmUSu9oB2nKJ/AAE0Ps89IetW0KcK5pHjoVaLeR37LVZnQMCgTQyqtHV5Kc8G3EFOpB1lfAArGiw8+zpXgNcRRMbzcWf0L7mzgiK+rvCNnpPLVGZt47oiYN7qeHtgoSjm71R+Roc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PH5t8eac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CF7C116D0;
	Mon, 25 Aug 2025 22:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756162765;
	bh=hASPwLMv88e9aiYRhwvg2/3oAa7YVa1mxMF5NqFtEfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PH5t8eacMXncRNqc0Xx8WhsD2GFGjtRBpDJxjcdfDvFdB4mmnXRd5eZGQK3/3hQhn
	 hDejp1GX7BN5XEYio+Rfy0FUw27cVJFXqISBYoK6zTQMf09EoxXnSEHf9v7qVPYQGT
	 JR5hPZy7hsaOF/g77XVKLarxiPjqVSAKl3vHokucdu0JUjM+TYA1dTAwtb5g+kfIal
	 GrARe9k36y3IFVT7MZ3gxUtNAcdGWwhnoDtbrOJGc3mu7b4niwlTmvDfQO9WQ1SWoT
	 j7LQPS18HF9fdvgAMALeQ6LKT/57gJFF0zYB99C68WY+Sa8ZZUZITQsf8SFkn+0wN5
	 wAT5suRt7e75Q==
Date: Mon, 25 Aug 2025 17:59:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 09/12] drivers: soc: qcom: Remove is_mem_dump_mode
 variable.
Message-ID: <zdcatkxo4p5yxy6jvibkhlb6tsg4ebodd54yt4mjmfb7a64745@6qrth45c547p>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-10-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-10-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:23PM +0530, Kishore Batta wrote:
> Sahara driver now has "sahara_mode" enum defined. So, the variable
> "is_mem_dump_mode" is redundant. The mode of sahara is set to
> SAHARA_MODE_MEM_DUMP wherever required.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/sahara/sahara.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> index 84327af48569..81d9b40d0f92 100644
> --- a/drivers/soc/qcom/sahara/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -193,7 +193,6 @@ struct sahara_context {
>  	u64				dump_image_offset;
>  	void				*mem_dump_freespace;
>  	u64				dump_images_left;
> -	bool				is_mem_dump_mode;
>  	enum sahara_mode		current_mode;
>  };
>  
> @@ -302,7 +301,6 @@ static void sahara_send_reset(struct sahara_context *context)
>  	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>  	sdev = sahara_data->sdev;
>  
> -	context->is_mem_dump_mode = false;
>  	context->current_mode = SAHARA_MODE_NONE;
>  	sdev->receiving_trng_data = false;
>  
> @@ -515,7 +513,7 @@ static void sahara_memory_debug64(struct sahara_context *context)
>  	 * of the dump are that we can consume.
>  	 */
>  
> -	context->is_mem_dump_mode = true;
> +	context->current_mode = SAHARA_MODE_MEM_DUMP;
>  
>  	/*
>  	 * Assume that the table is smaller than our MTU so that we can read it
> @@ -971,7 +969,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>  
>  	if (!mhi_result->transaction_status) {
>  		context->rx_size = mhi_result->bytes_xferd;
> -		if (context->is_mem_dump_mode)
> +		if (context->current_mode == SAHARA_MODE_MEM_DUMP)

So for a moment you had two different ways to keep track of the
"mem_dump" state. If you reorder your patches to first replace
is_mem_dump_mode with the enum based mechanism and then add the
additional state this would be cleaner.

Regards,
Bjorn

>  			schedule_work(&context->dump_work);
>  		else
>  			schedule_work(&context->fw_work);
> -- 
> 2.34.1
> 

