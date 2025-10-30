Return-Path: <linux-arm-msm+bounces-79722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E29B0C21493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981DE189863D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DEF42E0B44;
	Thu, 30 Oct 2025 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRs1iSXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9B32DF3D1;
	Thu, 30 Oct 2025 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761842921; cv=none; b=qp1V53ncNKqgvTOyVrOdBJ8KbnxyFML/Tia/DUnOMPTaqK6Z4TwQM/FXXMPne1B9c2fMwSB0BEppe/xXA/JxBjy1IdQ5PcDmV2/3w9Lz6jVLUy6cy2EFuZXUpFofFs3EJ8xUAKlUumI1cTzXlZIKai7Xb+Bt9PnusJ4QHte6fow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761842921; c=relaxed/simple;
	bh=mE2i8vtjXVe5g8p46lMpJSXGqVaorQH13q7kfthvNcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4tSuV/+EWgS2zQ8g23hJ/ChI99s9UeTaq/68g+uHrIY9k/GGK2Hw04+eL5FM8QCS9a+cx9xBdponXWV2pqGcpsxHAEVb5poTj+WZWZ/Z+e6tNjBGhO5bDBeqCByMERfQ9yCFgtcC+6xa8hx99H0sna5S4C7QqqGj+J/uN0t0q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRs1iSXd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF49C4CEF1;
	Thu, 30 Oct 2025 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761842921;
	bh=mE2i8vtjXVe5g8p46lMpJSXGqVaorQH13q7kfthvNcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRs1iSXdibrabdaOHDV5i+aEg/PdYXQoDpj8QWXzXgr6tmpy0mtzO2pwEOSMSNoSJ
	 og3kRwZV7LuMU9bXp6JJiJR6ogLKxEr62qYO7VmiqTn34LLAoJLJRynPUo2ItGrmiT
	 mdZbdE+wnT82+ipVsSvwH59Y5DTkMWCu57NtxI0oq8ytEXWmFgqtkPfUBlIk09qfDG
	 URGw+VDAonFY5SkyjXvVkwKylMyaHmskTlrcSpyPgj/vpkiRa+6H43P+Qcrh/GsNb+
	 mJ5ucwdWgC4Nr06FWclX9r+Sqmqoevf+b8+C9EsmGmUKvVYO2fXi9EZn2G8pGn8H1B
	 D9d5RDyFZgg3Q==
Date: Thu, 30 Oct 2025 11:51:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Chris Lew <chris.lew@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: smem: introduce qcom_smem_validate_item
 API
Message-ID: <b46wt76zmlms5h6zkner2rr22hwmsz422jy44qziqe6a2c4qrt@i5x7j6vgrzqo>
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
 <20251030-image-crm-part2-v1-1-676305a652c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-image-crm-part2-v1-1-676305a652c6@oss.qualcomm.com>

On Thu, Oct 30, 2025 at 03:07:48PM +0530, Kathiravan Thirumoorthy wrote:
> When a SMEM item is allocated or retrieved, sanity check on the SMEM item
> is performed and backtrace is printed if the SMEM item is invalid.
> 

That sounds overly defensive...

> Image version table in SMEM contains version details for the first 32
> images. Beyond that, another SMEM item 667 is being used, which may not
> be defined in all the platforms. So directly retrieving the SMEM item 667,
> throws the warning as invalid item number.
> 
> To handle such cases, introduce a new API to validate the SMEM item before
> processing it. While at it, make use of this API in the SMEM driver where
> possible.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/smem.c       | 16 ++++++++++++++--
>  include/linux/soc/qcom/smem.h |  1 +
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index c4c45f15dca4fb14f97df4ad494c1189e4f098bd..8a0a832f1e9915b2177a0fe08298ffe8a779e516 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -396,6 +396,18 @@ bool qcom_smem_is_available(void)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_is_available);
>  
> +/**
> + * qcom_smem_validate_item() - Check if SMEM item is within the limit

If nothing else, this contradicts the comment by SMEM_ITEM_COUNT.

> + * @item:	SMEM item to validate
> + *
> + * Return: true if SMEM item is valid, false otherwise.
> + */
> +bool qcom_smem_validate_item(unsigned item)
> +{
> +	return item < __smem->item_count;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_validate_item);
> +
>  static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   struct smem_partition *part,
>  				   unsigned item,
> @@ -517,7 +529,7 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>  		return -EINVAL;
>  	}
>  
> -	if (WARN_ON(item >= __smem->item_count))
> +	if (WARN_ON(!qcom_smem_validate_item(item)))

When we're using a version 11 (global heap, with toc indexed by the item
number) the SMEM_ITEM_COUNT actually matters, but when we use version 12
the items are stored in linked lists, so the only limit I can see is
that the item needs to be max 16 bit.

I think we should push this check down to qcom_smem_alloc_global().

And have a sanity check for item in qcom_smem_alloc_private() and
qcom_smem_get_private() to avoid truncation errors.

>  		return -EINVAL;
>  
>  	ret = hwspin_lock_timeout_irqsave(__smem->hwlock,
> @@ -690,7 +702,7 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
>  	if (!__smem)
>  		return ptr;
>  
> -	if (WARN_ON(item >= __smem->item_count))
> +	if (WARN_ON(!qcom_smem_validate_item(item)))

I think we should push this check down to qcom_smem_get_global()

I guess we'd still hit your problem on version 11 platforms if we keep
the WARN_ON(), but I don't know why that's reason for throwing a splat
in the log. Let's drop the WARN_ON() as well.

>  		return ERR_PTR(-EINVAL);
>  
>  	if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base) {
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index f946e3beca215548ac56dbf779138d05479712f5..05891532d530a25747afb8dc96ad4ba668598197 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -5,6 +5,7 @@
>  #define QCOM_SMEM_HOST_ANY -1
>  
>  bool qcom_smem_is_available(void);
> +bool qcom_smem_validate_item(unsigned item);

This makes the API clunky for no real reason, let's avoid that.


Adding Chris, in case I'm overlooking something here.

Regards,
Bjorn

>  int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
>  
> 
> -- 
> 2.34.1
> 

