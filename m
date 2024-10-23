Return-Path: <linux-arm-msm+bounces-35519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236A9ABCEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F6251F22993
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1269025761;
	Wed, 23 Oct 2024 04:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uV6982Ka"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558ED2FA;
	Wed, 23 Oct 2024 04:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729657844; cv=none; b=Q9jn7YESdEIaRwoBtefbv36ixEfexJuKFRsCRpBQxdEBsxkmGwKVvHmeMNoH3fg0wYe4mRQFucwcl0VLoJ+VtbovGzm76gwtLu8ehLfXWS51YFRKvGz6GyhnKFLcEB801HrmT3r6sswWd5SSLmJHnAue+ZtCl7IyhrsW+AGI6tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729657844; c=relaxed/simple;
	bh=IAs+B5gnkWxJ6/qxlcLEROEmCc0Z3KLB6bpK0pN3vN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJmA0yhLnqW505ejT5eDbx2MQ+t9IFG5EOVHgifUma+uGsTURvOWtLfa+1x7/2kpE/Ws/8NbToel3HY/x4neq49UBUW+VBB2xPLnkbkOEGsVJsoT5Uq2SZhmOs1SlWn8plP+XDHlSlH+VhnqIDuD4VO45S6356dYHaLmGR7S3Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uV6982Ka; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BC5C4CEC6;
	Wed, 23 Oct 2024 04:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729657843;
	bh=IAs+B5gnkWxJ6/qxlcLEROEmCc0Z3KLB6bpK0pN3vN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uV6982Ka1TXgX5zC4dMVqP2uQx2yocVpapHMts4ruBrUODpL5HO/aeQBoss5GenhE
	 pilTnwWNsvuTJftN6L1OA6ScM0TmRic00BJWQ3NRIcwAHiQUSMr/xvUHoa9M6XhFjO
	 bNu3alKfQ30RNTjySmv29xIbD4tJA6XWjJX1CN1GXN77v84XOVALUJ+qbJr5yL2b9e
	 31AAa4oDtI7r3AS1S43TWVdR8J2ElWd/nnAFCBomg7cA1+AsE77eGoXEEp80jL9kxZ
	 4Au8cxXp0jkgoYCF1UXkaqcvMhutw1bbN5T2wxfcrWMshU+pnYANk9Z+EJW3iTySZ1
	 DMb9mbnhMruXw==
Date: Tue, 22 Oct 2024 23:30:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] soc: qcom: llcc: Add per slice counter and common llcc
 slice descriptor
Message-ID: <lewsbn6t5ysemyk2gt632hdgl2wuhr2qxpblmkiuu3aiivsu5g@phgwetzycwyx>
References: <20241008194636.3075093-1-quic_uchalich@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008194636.3075093-1-quic_uchalich@quicinc.com>

On Tue, Oct 08, 2024 at 12:46:36PM GMT, Unnathi Chalicheemala wrote:
> Introduce atomic per-slice counter to keep track of the

Why an atomic? If it's always managed under a lock, an integer should do
just fine (and if not...it's probably broken ;))

> activate/deactivate count per slice and a common llcc slice
> descriptor to maintain accurate count.
> 
> In case a client driver calls llcc_slice_getd more than once,
> it will get the same descriptor for given use case. And if two
> client drivers are voting for same slice, this count variable
> will help track enable/disable of slice accurately.
> 

Please flip the commit message around, to match the style described in 
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Also, please add some () to your function names in the description.

> Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
> ---
>  drivers/soc/qcom/llcc-qcom.c       | 50 +++++++++++++++++++++---------
>  include/linux/soc/qcom/llcc-qcom.h |  4 +++
>  2 files changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 8fa4ffd3a9b5..0cb4fd18fd2c 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -813,7 +813,6 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>  struct llcc_slice_desc *llcc_slice_getd(u32 uid)
>  {
>  	const struct llcc_slice_config *cfg;
> -	struct llcc_slice_desc *desc;
>  	u32 sz, count;
>  
>  	if (IS_ERR(drv_data))
> @@ -826,17 +825,10 @@ struct llcc_slice_desc *llcc_slice_getd(u32 uid)
>  		if (cfg->usecase_id == uid)
>  			break;
>  
> -	if (count == sz || !cfg)

cfg starts out as a pointer the first element in an array of
struct llcc_slice_config, for each iteration in the loop it moves
forward once sizeof(struct llcc_slice_config)... how can it become NULL?

Perhaps I'm reading the code wrong?

> +	if (count == sz || !cfg || IS_ERR_OR_NULL(drv_data->desc))
>  		return ERR_PTR(-ENODEV);
>  
> -	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
> -	if (!desc)
> -		return ERR_PTR(-ENOMEM);
> -
> -	desc->slice_id = cfg->slice_id;
> -	desc->slice_size = cfg->max_cap;
> -
> -	return desc;
> +	return &drv_data->desc[count];
>  }
>  EXPORT_SYMBOL_GPL(llcc_slice_getd);
>  
> @@ -847,7 +839,8 @@ EXPORT_SYMBOL_GPL(llcc_slice_getd);
>  void llcc_slice_putd(struct llcc_slice_desc *desc)
>  {
>  	if (!IS_ERR_OR_NULL(desc))
> -		kfree(desc);
> +		WARN(atomic_read(&desc->refcount), " Slice %d is still active\n",
> +					desc->slice_id);
>  }
>  EXPORT_SYMBOL_GPL(llcc_slice_putd);
>  
> @@ -923,6 +916,12 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
>  		return -EINVAL;
>  
>  	mutex_lock(&drv_data->lock);
> +	if ((atomic_read(&desc->refcount)) >= 1) {
> +		atomic_inc_return(&desc->refcount);

Two separate atomic operations are no longer atomic... But as I stated
above, it doesn't matter if mutual exclusion is provided by the mutex.

> +		mutex_unlock(&drv_data->lock);
> +		return 0;
> +	}
> +
>  	if (test_bit(desc->slice_id, drv_data->bitmap)) {
>  		mutex_unlock(&drv_data->lock);
>  		return 0;
> @@ -937,6 +936,7 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
>  		return ret;
>  	}
>  
> +	atomic_inc_return(&desc->refcount);

The difference between atomic_inc() and atomic_inc_return() is the
return type... which you ignore... 

>  	__set_bit(desc->slice_id, drv_data->bitmap);

Do you need both the bitmap and the refcount?

>  	mutex_unlock(&drv_data->lock);
>  
> @@ -963,6 +963,12 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
>  		return -EINVAL;
>  
>  	mutex_lock(&drv_data->lock);
> +	if ((atomic_read(&desc->refcount)) > 1) {
> +		atomic_dec_return(&desc->refcount);
> +		mutex_unlock(&drv_data->lock);
> +		return 0;
> +	}
> +
>  	if (!test_bit(desc->slice_id, drv_data->bitmap)) {
>  		mutex_unlock(&drv_data->lock);
>  		return 0;
> @@ -976,6 +982,7 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
>  		return ret;
>  	}
>  
> +	atomic_dec_return(&desc->refcount);
>  	__clear_bit(desc->slice_id, drv_data->bitmap);
>  	mutex_unlock(&drv_data->lock);
>  
> @@ -1020,7 +1027,7 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
>  	u32 attr1_val;
>  	u32 attr0_val;
>  	u32 max_cap_cacheline;
> -	struct llcc_slice_desc desc;
> +	struct llcc_slice_desc *desc;
>  
>  	attr1_val = config->cache_mode;
>  	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
> @@ -1165,8 +1172,11 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
>  	}
>  
>  	if (config->activate_on_init) {
> -		desc.slice_id = config->slice_id;
> -		ret = llcc_slice_activate(&desc);
> +		desc = llcc_slice_getd(config->usecase_id);
> +		if (PTR_ERR_OR_ZERO(desc))
> +			return -EINVAL;
> +
> +		ret = llcc_slice_activate(desc);
>  	}
>  
>  	return ret;
> @@ -1183,6 +1193,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
>  	sz = drv_data->cfg_size;
>  	llcc_table = drv_data->cfg;
>  
> +	for (i = 0; i < sz; i++) {
> +		drv_data->desc[i].slice_id = llcc_table[i].slice_id;
> +		drv_data->desc[i].slice_size = llcc_table[i].max_cap;
> +		atomic_set(&drv_data->desc[i].refcount, 0);
> +	}
> +
>  	for (i = 0; i < sz; i++) {
>  		ret = _qcom_llcc_cfg_program(&llcc_table[i], cfg);
>  		if (ret)
> @@ -1331,6 +1347,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>  	llcc_cfg = cfg->sct_data;
>  	sz = cfg->size;
>  
> +	drv_data->desc = devm_kzalloc(dev, sizeof(struct llcc_slice_desc) * sz, GFP_KERNEL);

That's a devm_kcalloc()

Regards,
Bjorn

> +	if (IS_ERR_OR_NULL(drv_data->desc)) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
>  	for (i = 0; i < sz; i++)
>  		if (llcc_cfg[i].slice_id > drv_data->max_slices)
>  			drv_data->max_slices = llcc_cfg[i].slice_id;
> diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
> index 9e9f528b1370..5eca861e2837 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -60,10 +60,12 @@
>   * struct llcc_slice_desc - Cache slice descriptor
>   * @slice_id: llcc slice id
>   * @slice_size: Size allocated for the llcc slice
> + * @refcount: Counter to track activate/deactivate slice count
>   */
>  struct llcc_slice_desc {
>  	u32 slice_id;
>  	size_t slice_size;
> +	atomic_t refcount;
>  };
>  
>  /**
> @@ -126,6 +128,7 @@ struct llcc_edac_reg_offset {
>   * @bitmap: Bit map to track the active slice ids
>   * @ecc_irq: interrupt for llcc cache error detection and reporting
>   * @version: Indicates the LLCC version
> + * @desc: Array pointer of llcc_slice_desc
>   */
>  struct llcc_drv_data {
>  	struct regmap **regmaps;
> @@ -140,6 +143,7 @@ struct llcc_drv_data {
>  	unsigned long *bitmap;
>  	int ecc_irq;
>  	u32 version;
> +	struct llcc_slice_desc *desc;
>  };
>  
>  #if IS_ENABLED(CONFIG_QCOM_LLCC)
> -- 
> 2.34.1
> 

