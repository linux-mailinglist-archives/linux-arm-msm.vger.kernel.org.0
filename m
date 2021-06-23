Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60E9E3B204E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jun 2021 20:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFWSbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Jun 2021 14:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhFWSbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Jun 2021 14:31:36 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF2BC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:29:17 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso2882314otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jun 2021 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nhIjzJDIXt2MtlQA78vI8PJTqiu2lloNiqrbdbSQeu4=;
        b=oA930EkCO9/Sv6sFn0Uxw2UJJdZ1FEx8MdXxAlIS1FODIz8OYrIfaABy75ySIb/2/l
         XLfm+qVrkZVVdqD958VJuz26PaWs9BiaRXvHD8UWnDnfVM0L0pRILaYAr4AkiqVKGJ9R
         7CvLFJpcugxM53mPU+/RdoNEM/S/99fLug6/1NHjGKJmHbBv7dqhSI2qxEeEzA9oRfrK
         PHQ2eHsjDwsx6f7Y+YXL21wU60Tykaxd5SFOG3u6xVMzLqE3VXXvjOn14ONd4F3JW3qI
         2auRHpwhEBjpfav+NR2OfBDsyA1WuORZGsGJlIYgszcUECwAftVDDgTlKVWwRAQCyLLU
         FAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nhIjzJDIXt2MtlQA78vI8PJTqiu2lloNiqrbdbSQeu4=;
        b=TkNY7LR5nTGwmnROs+nZiucZGw8QtWR0ItgQpHdaWfsW83NNuAIauEpYagyy0gUDJJ
         J9zxrrg22fBd5caNcq90jpmBbXZzrpWwNqguOvXrTsy3j4BPCF+aguV21cPY1cnj/05b
         O6hFlEm8gJJ8wcNfGPCCrhP9YgohW4TcfnRvqDZOv1J7a2HFZYEgZDIOyA/4RXF2OHGq
         fDKPFgWFkt0lLrc73t/C19svsqc8xe6lJUCF1XXj/5MpJ2sAdbEmnjvFfQddK/OlFHRq
         vu/zzkmqvw3jUWGLF2J7pERjXPk63o6zwAPDw9ccrevCPOSpgRGHgAfZabnYqn/7FwLj
         tbEw==
X-Gm-Message-State: AOAM533rYI1cUT/9wSysB+RJD0GR7ukGkpARpTzfjCSHGZh3K9KhxJoT
        e30UqXGe6vJk2NLnBxeZYAlm7w==
X-Google-Smtp-Source: ABdhPJycskUQe8xaAZQJuZxae1GSV3HByFmQt+0GEvjVNAWhPmkaHKG9UjRD0ar7U3AE1b9og/rHMg==
X-Received: by 2002:a9d:4592:: with SMTP id x18mr1141830ote.74.1624472956989;
        Wed, 23 Jun 2021 11:29:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 26sm114382ooy.46.2021.06.23.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 11:29:16 -0700 (PDT)
Date:   Wed, 23 Jun 2021 13:29:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, aneela@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V1 2/2] soc: qcom: smem: map only partitions used by
 local HOST
Message-ID: <YNN9em9XCSPzwp25@builder.lan>
References: <1591702804-26223-1-git-send-email-deesin@codeaurora.org>
 <1591702804-26223-3-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591702804-26223-3-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Jun 06:40 CDT 2020, Deepak Kumar Singh wrote:

> SMEM driver is IO mapping complete region and CPU is doing a speculative
> read into a partition where local HOST does not have permission resulting
> in a NOC error.
> 
> Map only those partitions which are accessibly to local HOST.
> 
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smem.c | 226 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 167 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index c1bd310..4a152d6 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -193,6 +193,19 @@ struct smem_partition_header {
>  	__le32 offset_free_cached;
>  	__le32 reserved[3];
>  };
> +/**
> + * struct smem_partition_desc - descriptor for partition

"struct smem_partition" sounds like a generic name to describe a
partition.

> + * @virt_base:	starting virtual address of partition
> + * @phys_base:	starting physical address of partition
> + * @cacheline:	alignment for "cached" entries
> + * @size:	size of partition
> + */
> +struct smem_partition_desc {
> +	void __iomem *virt_base;
> +	u32 phys_base;

This is a phys_addr_t

> +	u32 cacheline;
> +	u32 size;

size_t is a good type for sizes and can also be used for cacheline.

> +};
>  
>  static const u8 SMEM_PART_MAGIC[] = { 0x24, 0x50, 0x52, 0x54 };
>  
> @@ -249,9 +262,9 @@ struct smem_region {
>   * struct qcom_smem - device data for the smem device
>   * @dev:	device pointer
>   * @hwlock:	reference to a hwspinlock
> - * @global_partition_entry: pointer to global partition entry when in use
> - * @ptable_entries: list of pointers to partitions table entry of current
> - *		processor/host
> + * @ptable_base: virtual base of partition table

"base" here sounds like filler as this is actually the pointer to a
smem_ptable, wouldn't ptable be sufficient?

> + * @global_partition_desc: descriptor for global partition when in use
> + * @partition_desc: list of partition descriptor of current processor/host
>   * @item_count: max accepted item number
>   * @num_regions: number of @regions
>   * @regions:	list of the memory regions defining the shared memory
> @@ -261,9 +274,11 @@ struct qcom_smem {
>  
>  	struct hwspinlock *hwlock;
>  
> -	struct smem_ptable_entry *global_partition_entry;
> -	struct smem_ptable_entry *ptable_entries[SMEM_HOST_COUNT];
>  	u32 item_count;
> +	struct smem_ptable *ptable_base;
> +	struct smem_partition_desc global_partition_desc;
> +	struct smem_partition_desc partition_desc[SMEM_HOST_COUNT];

Perhaps worth doing this change before the other patch, to avoid
having to change these types twice?

> +
>  	struct platform_device *socinfo;
>  
>  	unsigned num_regions;
> @@ -276,12 +291,6 @@ static struct qcom_smem *__smem;
>  /* Timeout (ms) for the trylock of remote spinlocks */
>  #define HWSPINLOCK_TIMEOUT     1000
>  
> -static struct smem_partition_header *
> -ptable_entry_to_phdr(struct smem_ptable_entry *entry)
> -{
> -	return __smem->regions[0].virt_base + le32_to_cpu(entry->offset);
> -}

And you just introduced this function in patch 1, seems like the diff
would be cleaner if done in opposite order.

> -
>  static struct smem_private_entry *
>  phdr_to_last_uncached_entry(struct smem_partition_header *phdr)
>  {
> @@ -348,7 +357,7 @@ static void *cached_entry_to_item(struct smem_private_entry *e)
>  }
>  
>  static int qcom_smem_alloc_private(struct qcom_smem *smem,
> -				   struct smem_ptable_entry *entry,
> +				   struct smem_partition_desc *p_desc,
>  				   unsigned item,
>  				   size_t size)
>  {
> @@ -358,8 +367,8 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	void *cached;
>  	void *p_end;
>  
> -	phdr = ptable_entry_to_phdr(entry);
> -	p_end = (void *)phdr + le32_to_cpu(entry->size);
> +	phdr = p_desc->virt_base;
> +	p_end = (void *)phdr + p_desc->size;
>  
>  	hdr = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
> @@ -452,7 +461,7 @@ static int qcom_smem_alloc_global(struct qcom_smem *smem,
>   */
>  int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>  {
> -	struct smem_ptable_entry *entry;
> +	struct smem_partition_desc *p_desc;

"partition" or "part" seems like a better variable name.

>  	unsigned long flags;
>  	int ret;
>  
> @@ -474,12 +483,12 @@ int qcom_smem_alloc(unsigned host, unsigned item, size_t size)
>  	if (ret)
>  		return ret;
>  
> -	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> -		entry = __smem->ptable_entries[host];
> -		ret = qcom_smem_alloc_private(__smem, entry, item, size);
> -	} else if (__smem->global_partition_entry) {
> -		entry = __smem->global_partition_entry;
> -		ret = qcom_smem_alloc_private(__smem, entry, item, size);
> +	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
> +		p_desc = &__smem->partition_desc[host];
> +		ret = qcom_smem_alloc_private(__smem, p_desc, item, size);
> +	} else if (__smem->global_partition_desc.virt_base) {
> +		p_desc = &__smem->global_partition_desc;
> +		ret = qcom_smem_alloc_private(__smem, p_desc, item, size);
>  	} else {
>  		ret = qcom_smem_alloc_global(__smem, item, size);
>  	}
> @@ -530,22 +539,20 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
>  }
>  
>  static void *qcom_smem_get_private(struct qcom_smem *smem,
> -				   struct smem_ptable_entry *entry,
> +				   struct smem_partition_desc *p_desc,
>  				   unsigned item,
>  				   size_t *size)
>  {
>  	struct smem_private_entry *e, *end;
>  	struct smem_partition_header *phdr;
>  	void *item_ptr, *p_end;
> -	u32 partition_size;
>  	size_t cacheline;
>  	u32 padding_data;
>  	u32 e_size;
>  
> -	phdr = ptable_entry_to_phdr(entry);
> -	partition_size = le32_to_cpu(entry->size);
> -	p_end = (void *)phdr + partition_size;
> -	cacheline = le32_to_cpu(entry->cacheline);
> +	phdr = p_desc->virt_base;
> +	p_end = (void *)phdr + p_desc->size;
> +	cacheline = p_desc->cacheline;

Looking at the current code, I think you can just use part->cacheline in
place and avoid the local variable.

>  
>  	e = phdr_to_first_uncached_entry(phdr);
>  	end = phdr_to_last_uncached_entry(phdr);
> @@ -562,7 +569,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  				e_size = le32_to_cpu(e->size);
>  				padding_data = le16_to_cpu(e->padding_data);
>  
> -				if (e_size < partition_size
> +				if (e_size < p_desc->size
>  				    && padding_data < e_size)
>  					*size = e_size - padding_data;
>  				else
> @@ -598,7 +605,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  				e_size = le32_to_cpu(e->size);
>  				padding_data = le16_to_cpu(e->padding_data);
>  
> -				if (e_size < partition_size
> +				if (e_size < p_desc->size
>  				    && padding_data < e_size)
>  					*size = e_size - padding_data;
>  				else
> @@ -637,7 +644,7 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>   */
>  void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
>  {
> -	struct smem_ptable_entry *entry;
> +	struct smem_partition_desc *p_desc;
>  	unsigned long flags;
>  	int ret;
>  	void *ptr = ERR_PTR(-EPROBE_DEFER);
> @@ -654,12 +661,12 @@ void *qcom_smem_get(unsigned host, unsigned item, size_t *size)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> -	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> -		entry = __smem->ptable_entries[host];
> -		ptr = qcom_smem_get_private(__smem, entry, item, size);
> -	} else if (__smem->global_partition_entry) {
> -		entry = __smem->global_partition_entry;
> -		ptr = qcom_smem_get_private(__smem, entry, item, size);
> +	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
> +		p_desc = &__smem->partition_desc[host];
> +		ptr = qcom_smem_get_private(__smem, p_desc, item, size);
> +	} else if (__smem->global_partition_desc.virt_base) {
> +		p_desc = &__smem->global_partition_desc;
> +		ptr = qcom_smem_get_private(__smem, p_desc, item, size);
>  	} else {
>  		ptr = qcom_smem_get_global(__smem, item, size);
>  	}
> @@ -681,30 +688,30 @@ EXPORT_SYMBOL(qcom_smem_get);
>  int qcom_smem_get_free_space(unsigned host)
>  {
>  	struct smem_partition_header *phdr;
> -	struct smem_ptable_entry *entry;
> +	struct smem_partition_desc *p_desc;
>  	struct smem_header *header;
>  	unsigned ret;
>  
>  	if (!__smem)
>  		return -EPROBE_DEFER;
>  
> -	if (host < SMEM_HOST_COUNT && __smem->ptable_entries[host]) {
> -		entry = __smem->ptable_entries[host];
> -		phdr = ptable_entry_to_phdr(entry);
> +	if (host < SMEM_HOST_COUNT && __smem->partition_desc[host].virt_base) {
> +		p_desc = &__smem->partition_desc[host];
> +		phdr = p_desc->virt_base;
>  
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
>  
> -		if (ret > le32_to_cpu(entry->size))
> +		if (ret > p_desc->size)
>  			return -EINVAL;
> -	} else if (__smem->global_partition_entry) {
> -		entry = __smem->global_partition_entry;
> -		phdr = ptable_entry_to_phdr(entry);
> +	} else if (__smem->global_partition_desc.virt_base) {
> +		p_desc = &__smem->global_partition_desc;
> +		phdr = p_desc->virt_base;
>  
>  		ret = le32_to_cpu(phdr->offset_free_cached) -
>  		      le32_to_cpu(phdr->offset_free_uncached);
>  
> -		if (ret > le32_to_cpu(entry->size))
> +		if (ret > p_desc->size)
>  			return -EINVAL;
>  	} else {
>  		header = __smem->regions[0].virt_base;
> @@ -718,6 +725,15 @@ int qcom_smem_get_free_space(unsigned host)
>  }
>  EXPORT_SYMBOL(qcom_smem_get_free_space);
>  
> +static int addr_in_range(void *virt_base, unsigned int size, void *addr)

size_t would be a better type for size and the "virt_" prefix doesn't
seem to add any thing over just "base" - except giving me a clue that
you missed the __iomem on it :)

> +{
> +	if (virt_base && addr >= virt_base &&
> +			addr < virt_base + size)

This doesn't need to be broken, but even better would be:

	return base && addr >= base && addr < base + size;


And the return type seems like a bool...

> +		return 1;
> +
> +	return 0;
> +}
> +
>  /**
>   * qcom_smem_virt_to_phys() - return the physical address associated
>   * with an smem item pointer (previously returned by qcom_smem_get()
> @@ -727,17 +743,36 @@ EXPORT_SYMBOL(qcom_smem_get_free_space);
>   */
>  phys_addr_t qcom_smem_virt_to_phys(void *p)
>  {
> -	unsigned i;
> +	struct smem_partition_desc *p_desc;
> +	struct smem_region *area;
> +	u64 offset;
> +	u32 i;
> +
> +	for (i = 0; i < SMEM_HOST_COUNT; i++) {
> +		p_desc = &__smem->partition_desc[i];
> +
> +		if (addr_in_range(p_desc->virt_base, p_desc->size, p)) {
> +			offset = p - p_desc->virt_base;
> +
> +			return (phys_addr_t)p_desc->phys_base + offset;
> +		}
> +	}
> +
> +	p_desc = &__smem->global_partition_desc;
> +
> +	if (addr_in_range(p_desc->virt_base, p_desc->size, p)) {
> +		offset = p - p_desc->virt_base;
> +
> +		return (phys_addr_t)p_desc->phys_base + offset;
> +	}
>  
>  	for (i = 0; i < __smem->num_regions; i++) {
> -		struct smem_region *region = &__smem->regions[i];
> +		area = &__smem->regions[i];
>  
> -		if (p < region->virt_base)
> -			continue;
> -		if (p < region->virt_base + region->size) {
> -			u64 offset = p - region->virt_base;
> +		if (addr_in_range(area->virt_base, area->size, p)) {
> +			offset = p - area->virt_base;
>  
> -			return (phys_addr_t)region->aux_base + offset;
> +			return (phys_addr_t)area->aux_base + offset;
>  		}
>  	}
>  
> @@ -761,7 +796,7 @@ static struct smem_ptable *qcom_smem_get_ptable(struct qcom_smem *smem)
>  	struct smem_ptable *ptable;
>  	u32 version;
>  
> -	ptable = smem->regions[0].virt_base + smem->regions[0].size - SZ_4K;
> +	ptable = smem->ptable_base;
>  	if (memcmp(ptable->magic, SMEM_PTABLE_MAGIC, sizeof(ptable->magic)))
>  		return ERR_PTR(-ENOENT);
>  
> @@ -800,9 +835,15 @@ qcom_smem_partition_header(struct qcom_smem *smem,
>  		struct smem_ptable_entry *entry, u16 host0, u16 host1)
>  {
>  	struct smem_partition_header *header;
> +	u32 phys_addr;
>  	u32 size;
>  
> -	header = smem->regions[0].virt_base + le32_to_cpu(entry->offset);
> +	phys_addr = smem->regions[0].aux_base + le32_to_cpu(entry->offset);
> +	header = devm_ioremap_wc(smem->dev,
> +                                  phys_addr, le32_to_cpu(entry->size));
> +
> +	if (!header)
> +		return NULL;
>  
>  	if (memcmp(header->magic, SMEM_PART_MAGIC, sizeof(header->magic))) {
>  		dev_err(smem->dev, "bad partition magic %02x %02x %02x %02x\n",
> @@ -846,7 +887,7 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
>  	bool found = false;
>  	int i;
>  
> -	if (smem->global_partition_entry) {
> +	if (smem->global_partition_desc.virt_base) {
>  		dev_err(smem->dev, "Already found the global partition\n");
>  		return -EINVAL;
>  	}
> @@ -881,7 +922,11 @@ static int qcom_smem_set_global_partition(struct qcom_smem *smem)
>  	if (!header)
>  		return -EINVAL;
>  
> -	smem->global_partition_entry = entry;
> +	smem->global_partition_desc.virt_base = (void __iomem *)header;
> +	smem->global_partition_desc.phys_base = smem->regions[0].aux_base +
> +						 le32_to_cpu(entry->offset);
> +	smem->global_partition_desc.size = le32_to_cpu(entry->size);
> +	smem->global_partition_desc.cacheline = le32_to_cpu(entry->cacheline);
>  
>  	return 0;
>  }
> @@ -921,7 +966,7 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  			return -EINVAL;
>  		}
>  
> -		if (smem->ptable_entries[remote_host]) {
> +		if (smem->partition_desc[remote_host].virt_base) {
>  			dev_err(smem->dev, "duplicate host %hu\n", remote_host);
>  			return -EINVAL;
>  		}
> @@ -930,7 +975,14 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
>  		if (!header)
>  			return -EINVAL;
>  
> -		smem->ptable_entries[remote_host] = entry;
> +		smem->partition_desc[remote_host].virt_base =
> +						(void __iomem *)header;
> +		smem->partition_desc[remote_host].phys_base =
> +			smem->regions[0].aux_base + le32_to_cpu(entry->offset);
> +		smem->partition_desc[remote_host].size =
> +						le32_to_cpu(entry->size);
> +		smem->partition_desc[remote_host].cacheline =
> +						le32_to_cpu(entry->cacheline);
>  	}
>  
>  	return 0;
> @@ -965,6 +1017,61 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
>  	return 0;
>  }
>  
> +static int qcom_smem_map_toc(struct qcom_smem *smem, struct device *dev,
> +				const char *name, int i)
> +{
> +	struct device_node *np;
> +	struct resource r;
> +	int ret;
> +
> +	np = of_parse_phandle(dev->of_node, name, 0);
> +	if (!np) {
> +		dev_err(dev, "No %s specified\n", name);
> +		return -EINVAL;
> +	}
> +
> +	ret = of_address_to_resource(np, 0, &r);
> +	of_node_put(np);
> +	if (ret)
> +		return ret;
> +
> +	smem->regions[i].aux_base = (u32)r.start;
> +	smem->regions[i].size = resource_size(&r);
> +	/* map starting 4K for smem header */
> +	smem->regions[i].virt_base = devm_ioremap_wc(dev, r.start, SZ_4K);
> +	/* map last 4k for toc */
> +	smem->ptable_base = devm_ioremap_wc(dev,
> +				r.start + resource_size(&r) - SZ_4K, SZ_4K);

The ptable_start would benefit from a local variable.

> +
> +	if (!smem->regions[i].virt_base || !smem->ptable_base)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static int qcom_smem_mamp_legacy(struct qcom_smem *smem)

qcom_smem_map_global() seems like a better name for this.

> +{
> +	struct smem_header *header;
> +	u32 phys_addr;
> +	u32 p_size;
> +
> +	phys_addr = smem->regions[0].aux_base;
> +	header = smem->regions[0].virt_base;
> +	p_size = header->available;
> +
> +	/* unmap previously mapped starting 4k for smem header */
> +	devm_iounmap(smem->dev, smem->regions[0].virt_base);

Could we restructure things so that we map the header, read the version,
then unmap the header and then map the relevant pieces? Instead of only
for this case unmap the header and remap the whole region?


Just as a general note, I dislike the fact that we now have 3 different
ioremap functions...but perhaps that's just how it has to be...

> +
> +	smem->regions[0].size = p_size;
> +	smem->regions[0].virt_base = devm_ioremap_wc(smem->dev,
> +						      phys_addr, p_size);

No need to wrap this.

Regards,
Bjorn

> +
> +	if (!smem->regions[0].virt_base)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int qcom_smem_probe(struct platform_device *pdev)
>  {
>  	struct smem_header *header;
> @@ -987,7 +1094,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  	smem->dev = &pdev->dev;
>  	smem->num_regions = num_regions;
>  
> -	ret = qcom_smem_map_memory(smem, &pdev->dev, "memory-region", 0);
> +	ret = qcom_smem_map_toc(smem, &pdev->dev, "memory-region", 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1011,6 +1118,7 @@ static int qcom_smem_probe(struct platform_device *pdev)
>  		smem->item_count = qcom_smem_get_item_count(smem);
>  		break;
>  	case SMEM_GLOBAL_HEAP_VERSION:
> +		qcom_smem_mamp_legacy(smem);
>  		smem->item_count = SMEM_ITEM_COUNT;
>  		break;
>  	default:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
