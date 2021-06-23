Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D223B1F60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 19:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhFWR2E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 13:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWR2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 13:28:04 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACCC6C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 10:25:46 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w127so4118470oig.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iAcZLvLu7TpK6AOfx0i5fSi2wYs6cUBdnS5hLmiwJ7A=;
        b=M8Tcx8EHO08j3/woATiBT9gwOGGHgi+LbRzA6eaBwhKBwIO9fqkAhwas6cuNmKG3v6
         yEXFYaIEwU08izbgpLqjpZMsgYMgicu04wJL4hF2Gxwvi43EfO1JdSBWIMG6nZUTs7hc
         KKbAZzvEOaQMZwBa+DwH7abiUlHt0r1/kj1PRdUbqzIQhfcuEn4Cz7h8jDjEArexUW2u
         Z2ONUxmjv5INGJKC9A+2bHmOjl2ek9qNmBxIfyVxlZ9ueVKek1bl0wFE5kZreUEjE4dQ
         cMbeJvBDg1h2eLzzPhPSIe2F5J4nB7gzJ6M1F9SuWdyatYScS1OG1oggPDBD90Cz07yL
         hKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iAcZLvLu7TpK6AOfx0i5fSi2wYs6cUBdnS5hLmiwJ7A=;
        b=tuco1NBNYunKx4dXjpt2YvFkBrWrkc2PR7Ie+wfkrz6kQlAxOY4kHHY25J74errv6t
         Vxq5jQrxOLlPEO1+O1KY7QAX+tENfFZdbIMrUr8oHK5qL+03Rhd9rhGs2vIj7vhLKWA4
         ys37DSZz3kd8kvy+L2yWY0g7yGxxgd1f3ezN5sQWjXsFdUjdv+8FFC6a7V/U/UXJ8tUU
         tiFkd5/ITCMHBPrTJxiO7oJeCeHwCpe9uYAiAsNE7HBEVDkrXkUW4Y5DHbnGLnrYCq4B
         T5VGWgLPPDVFkV1hbEGRQS+ixKhA/UupzHh25lpwIQDAY373G3N/rostst98tJnIaKLz
         10hw==
X-Gm-Message-State: AOAM530x9bHdv0AQQvo1j/Zhf155TFqOk2mpYwvwiiM+e1ylBFEjCdNw
        wiLr7fiLmzJYro8g+9zt6CzLRw==
X-Google-Smtp-Source: ABdhPJxqwn9vITUzWCT0d39VZxJlYy0iEr8YB/2QlF5gy2uGXlJ1lrzBSF5sK3Hp6NEa/kTt2Delhw==
X-Received: by 2002:aca:3385:: with SMTP id z127mr757571oiz.142.1624469145956;
        Wed, 23 Jun 2021 10:25:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 3sm76572oob.1.2021.06.23.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 10:25:45 -0700 (PDT)
Date:   Wed, 23 Jun 2021 12:25:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, aneela@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V1 1/2] soc: qcom: smem: validate fields of shared
 structures
Message-ID: <YNNulzbZB/FkIF8O@builder.lan>
References: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
 <1591702804-26223-2-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591702804-26223-2-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Jun 06:40 CDT 2020, Deepak Kumar Singh wrote:

> Structures in shared memory that can be modified by remote
> processors may have untrusted values, they should be validated
> before use.
> 
> Adding proper validation before using fields of shared
> structures.
> 
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smem.c | 194 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 133 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 28c19bc..c1bd310 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -249,11 +249,9 @@ struct smem_region {
>   * struct qcom_smem - device data for the smem device
>   * @dev:	device pointer
>   * @hwlock:	reference to a hwspinlock
> - * @global_partition:	pointer to global partition when in use
> - * @global_cacheline:	cacheline size for global partition
> - * @partitions:	list of pointers to partitions affecting the current
> + * @global_partition_entry: pointer to global partition entry when in use
> + * @ptable_entries: list of pointers to partitions table entry of current
>   *		processor/host
> - * @cacheline:	list of cacheline sizes for each host
>   * @item_count: max accepted item number
>   * @num_regions: number of @regions
>   * @regions:	list of the memory regions defining the shared memory
> @@ -263,10 +261,8 @@ struct qcom_smem {
>  
>  	struct hwspinlock *hwlock;
>  
> -	struct smem_partition_header *global_partition;
> -	size_t global_cacheline;
> -	struct smem_partition_header *partitions[SMEM_HOST_COUNT];
> -	size_t cacheline[SMEM_HOST_COUNT];
> +	struct smem_ptable_entry *global_partition_entry;
> +	struct smem_ptable_entry *ptable_entries[SMEM_HOST_COUNT];

Could you please split this patch in one that transitions these to
smem_ptable_entry and then a separate one that adds the new range
checks.

>  	u32 item_count;
>  	struct platform_device *socinfo;
>  
> @@ -274,7 +270,19 @@ struct qcom_smem {
>  	struct smem_region regions[];
>  };
>  
> -static void *
> +/* Pointer to the one and only smem handle */
> +static struct qcom_smem *__smem;
> +
> +/* Timeout (ms) for the trylock of remote spinlocks */
> +#define HWSPINLOCK_TIMEOUT     1000
> +
> +static struct smem_partition_header *
> +ptable_entry_to_phdr(struct smem_ptable_entry *entry)
> +{
> +	return __smem->regions[0].virt_base + le32_to_cpu(entry->offset);

Overall __smem was only used to acquire the struct qcom_smem handle, but
after that we pass that pointer around - rather than operating on the
global variable.

So how about passing the struct qcom_smem as a first argument to this
function, to stick to this kind of design?

> +}
> +
> +static struct smem_private_entry *
>  phdr_to_last_uncached_entry(struct smem_partition_header *phdr)
>  {
>  	void *p = phdr;
> @@ -339,25 +347,27 @@ static void *cached_entry_to_item(struct smem_private_entry *e)
>  	return p - le32_to_cpu(e->size);
>  }
>  
> -/* Pointer to the one and only smem handle */
> -static struct qcom_smem *__smem;
> -
> -/* Timeout (ms) for the trylock of remote spinlocks */
> -#define HWSPINLOCK_TIMEOUT	1000

This should have the side effect of you being able to leave there where
they were.

> -
>  static int qcom_smem_alloc_private(struct qcom_smem *smem,
> -				   struct smem_partition_header *phdr,
> +				   struct smem_ptable_entry *entry,
>  				   unsigned item,
>  				   size_t size)
>  {
>  	struct smem_private_entry *hdr, *end;
> +	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> +	void *p_end;
> +
> +	phdr = ptable_entry_to_phdr(entry);
> +	p_end = (void *)phdr + le32_to_cpu(entry->size);
>  
>  	hdr = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> +	if (WARN_ON((void *)end > p_end || (void *)cached > p_end))
> +		return -EINVAL;
> +
>  	while (hdr < end) {
>  		if (hdr->canary != SMEM_PRIVATE_CANARY)
>  			goto bad_canary;
> @@ -366,6 +376,8 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  
>  		hdr = uncached_entry_next(hdr);
>  	}
> +	if (WARN_ON((void *)hdr > p_end))
> +		return -EINVAL;
>  
>  	/* Check that we don't grow into the cached region */
>  	alloc_size = sizeof(*hdr) + ALIGN(size, 8);
> @@ -440,7 +452,7 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
>   */
>  int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>  {
> -	struct smem_partition_header *phdr;
> +	struct smem_ptable_entry *entry;
>  	unsigned long flags;
>  	int ret;
>  
> @@ -462,12 +474,12 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>  	if (ret)
>  		return ret;
>  
> -	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
> -		phdr = __smem->partitions[host];
> -		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
> -	} else if (__smem->global_partition) {
> -		phdr = __smem->global_partition;
> -		ret = qcom_smem_alloc_private(__smem, phdr, item, size);
> +	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> +		entry = __smem->ptable_entries[host];
> +		ret = qcom_smem_alloc_private(__smem, entry, item, size);
> +	} else if (__smem->global_partition_entry) {
> +		entry = __smem->global_partition_entry;
> +		ret = qcom_smem_alloc_private(__smem, entry, item, size);
>  	} else {
>  		ret = qcom_smem_alloc_global(__smem, item, size);
>  	}
> @@ -482,9 +494,11 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  				  unsigned item,
>  				  size_t *size)
>  {
> -	struct smem_header *header;
> -	struct smem_region *region;
>  	struct smem_global_entry *entry;
> +	struct smem_header *header;
> +	struct smem_region *area;

Perhaps leave this as "region" and keep "header" the first, to limit
this function to only the logical changes?

> +	u64 entry_offset;
> +	u32 e_size;
>  	u32 aux_base;
>  	unsigned i;
>  
> @@ -496,12 +510,19 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  	aux_base = le32_to_cpu(entry->aux_base) & AUX_BASE_MASK;
>  
>  	for (i = 0; i < smem->num_regions; i++) {
> -		region = &smem->regions[i];
> +		area = &smem->regions[i];
> +
> +		if (area->aux_base == aux_base || !aux_base) {
> +			e_size = le32_to_cpu(entry->size);
> +			entry_offset = le32_to_cpu(entry->offset);
> +
> +			if (WARN_ON(e_size + entry_offset > area->size))
> +				return ERR_PTR(-EINVAL);
>  
> -		if (region->aux_base == aux_base || !aux_base) {
>  			if (size != NULL)
> -				*size = le32_to_cpu(entry->size);
> -			return region->virt_base + le32_to_cpu(entry->offset);
> +				*size = e_size;
> +
> +			return area->virt_base + entry_offset;
>  		}
>  	}
>  
> @@ -509,50 +530,92 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  }
>  
>  static void *qcom_smem_get_private(struct qcom_smem *smem,
> -				   struct smem_partition_header *phdr,
> -				   size_t cacheline,
> +				   struct smem_ptable_entry *entry,
>  				   unsigned item,
>  				   size_t *size)
>  {
>  	struct smem_private_entry *e, *end;
> +	struct smem_partition_header *phdr;
> +	void *item_ptr, *p_end;
> +	u32 partition_size;
> +	size_t cacheline;
> +	u32 padding_data;
> +	u32 e_size;
> +
> +	phdr = ptable_entry_to_phdr(entry);
> +	partition_size = le32_to_cpu(entry->size);
> +	p_end = (void *)phdr + partition_size;
> +	cacheline = le32_to_cpu(entry->cacheline);
>  
>  	e = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
>  
> +	if (WARN_ON((void *)end > p_end))
> +		return ERR_PTR(-EINVAL);
> +
>  	while (e < end) {
>  		if (e->canary != SMEM_PRIVATE_CANARY)
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL)
> -				*size = le32_to_cpu(e->size) -
> -					le16_to_cpu(e->padding_data);
> -
> -			return uncached_entry_to_item(e);
> +			if (size != NULL) {
> +				e_size = le32_to_cpu(e->size);
> +				padding_data = le16_to_cpu(e->padding_data);
> +
> +				if (e_size < partition_size
> +				    && padding_data < e_size)

It's fine to unwrap this line and go over 80 chars when it makes the
code easier to read.

> +					*size = e_size - padding_data;
> +				else
> +					return ERR_PTR(-EINVAL);

Flip this around and keep doing:

				if (WARN_ON(invalid))
					return - EINVAL;

				continue with the good stuff;

> +			}
> +
> +			item_ptr =  uncached_entry_to_item(e);

There's two spaces after the '='

> +			if (WARN_ON(item_ptr > p_end))
> +				return ERR_PTR(-EINVAL);
> +
> +			return item_ptr;
>  		}
>  
>  		e = uncached_entry_next(e);
>  	}
> +	if (WARN_ON((void *)e > p_end))
> +		return ERR_PTR(-EINVAL);
>  
>  	/* Item was not found in the uncached list, search the cached list */
>  
>  	e = phdr_to_first_cached_entry(phdr, cacheline);
>  	end = phdr_to_last_cached_entry(phdr);
>  
> +	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
> +		return ERR_PTR(-EINVAL);
> +
>  	while (e > end) {
>  		if (e->canary != SMEM_PRIVATE_CANARY)
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL)
> -				*size = le32_to_cpu(e->size) -
> -					le16_to_cpu(e->padding_data);
> -
> -			return cached_entry_to_item(e);
> +			if (size != NULL) {
> +				e_size = le32_to_cpu(e->size);
> +				padding_data = le16_to_cpu(e->padding_data);
> +
> +				if (e_size < partition_size
> +				    && padding_data < e_size)
> +					*size = e_size - padding_data;
> +				else
> +					return ERR_PTR(-EINVAL);

Same as above.

Regards,
Bjorn

> +			}
> +
> +			item_ptr =  cached_entry_to_item(e);
> +			if (WARN_ON(item_ptr < (void *)phdr))
> +				return ERR_PTR(-EINVAL);
> +
> +			return item_ptr;
>  		}
>  
>  		e = cached_entry_next(e, cacheline);
>  	}
> +	if (WARN_ON((void *)e < (void *)phdr))
> +		return ERR_PTR(-EINVAL);
>  
>  	return ERR_PTR(-ENOENT);
>  
> @@ -574,9 +637,8 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>   */
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
>  {
> -	struct smem_partition_header *phdr;
> +	struct smem_ptable_entry *entry;
>  	unsigned long flags;
> -	size_t cacheln;
>  	int ret;
>  	void *ptr = ERR_PTR(-EPROBE_DEFER);
>  
> @@ -592,14 +654,12 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
> -		phdr = __smem->partitions[host];
> -		cacheln = __smem->cacheline[host];
> -		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
> -	} else if (__smem->global_partition) {
> -		phdr = __smem->global_partition;
> -		cacheln = __smem->global_cacheline;
> -		ptr = qcom_smem_get_private(__smem, phdr, cacheln, item, size);
> +	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> +		entry = __smem->ptable_entries[host];
> +		ptr = qcom_smem_get_private(__smem, entry, item, size);
> +	} else if (__smem->global_partition_entry) {
> +		entry = __smem->global_partition_entry;
> +		ptr = qcom_smem_get_private(__smem, entry, item, size);
>  	} else {
>  		ptr = qcom_smem_get_global(__smem, item, size);
>  	}
> @@ -621,23 +681,37 @@ EXPORT_SYMBOL(qcom_smem_get);
>  int qcom_smem_get_free_space(unsigned host)
>  {
>  	struct smem_partition_header *phdr;
> +	struct smem_ptable_entry *entry;
>  	struct smem_header *header;
>  	unsigned ret;
>  
>  	if (!__smem)
>  		return -EPROBE_DEFER;
>  
> -	if (host < SMEM_HOST_COUNT && __smem->partitions[host]) {
> -		phdr = __smem->partitions[host];
> +	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> +		entry = __smem->ptable_entries[host];
> +		phdr = ptable_entry_to_phdr(entry);
> +
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
> -	} else if (__smem->global_partition) {
> -		phdr = __smem->global_partition;
> +
> +		if (ret > le32_to_cpu(entry->size))
> +			return -EINVAL;
> +	} else if (__smem->global_partition_entry) {
> +		entry = __smem->global_partition_entry;
> +		phdr = ptable_entry_to_phdr(entry);
> +
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
> +
> +		if (ret > le32_to_cpu(entry->size))
> +			return -EINVAL;
>  	} else {
>  		header = __smem->regions[0].virt_base;
>  		ret = le32_to_cpu(header->available);
> +
> +		if (ret > __smem->regions[0].size)
> +			return -EINVAL;
>  	}
>  
>  	return ret;
> @@ -772,7 +846,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
>  	bool found = false;
>  	int i;
>  
> -	if (smem->global_partition) {
> +	if (smem->global_partition_entry) {
>  		dev_err(smem->dev, "Already found the global partition\n");
>  		return -EINVAL;
>  	}
> @@ -807,8 +881,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
>  	if (!header)
>  		return -EINVAL;
>  
> -	smem->global_partition = header;
> -	smem->global_cacheline = le32_to_cpu(entry->cacheline);
> +	smem->global_partition_entry = entry;
>  
>  	return 0;
>  }
> @@ -848,7 +921,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  			return -EINVAL;
>  		}
>  
> -		if (smem->partitions[remote_host]) {
> +		if (smem->ptable_entries[remote_host]) {
>  			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
>  			return -EINVAL;
>  		}
> @@ -857,8 +930,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  		if (!header)
>  			return -EINVAL;
>  
> -		smem->partitions[remote_host] = header;
> -		smem->cacheline[remote_host] = le32_to_cpu(entry->cacheline);
> +		smem->ptable_entries[remote_host] = entry;
>  	}
>  
>  	return 0;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
