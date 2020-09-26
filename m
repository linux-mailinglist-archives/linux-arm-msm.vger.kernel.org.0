Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B44E27968B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 06:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgIZEPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 00:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729426AbgIZEPV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 00:15:21 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50348C0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 21:15:21 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m12so4327091otr.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PgLlAkVjBALPraH/TkEhWnDRyK4hqMezny8n+Ylaz+8=;
        b=RKqiaoMIggCvBMbPQBq16LFizwGZZnbRYORFHE72ZD8CqR0o9/1kMP/HVQNW7N5nX1
         IJ437RrMA6KQQoGwZjyPovVA2RNGNTS/xgiVvTtuxoaLpfrBIYS2ZXE5OYq7ZGTiD37L
         XtX4UBxmDCVSp2PnitafwKa2y2PV+z/p5yu1sR1WWRstDaIQHBZziC9XyCgcHcuhGJbC
         31iE/hJZ1eKlI6Qt4+1Wlhm30A0shq7XU9VrPfK7LBaUtf2BDY49C0eDNgg+uPQjvJae
         ZzvjackWqR/twCVRsxjNd2vC8YZAdKWJEA0f0El/0axCO3FUpGtpOetffsqxgM+k7WPm
         b5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PgLlAkVjBALPraH/TkEhWnDRyK4hqMezny8n+Ylaz+8=;
        b=T/XsbD6es4mI1TF2z8qY3NamkK/XTO43t88drHHvq1As90otUjVvH3xb+nPUUnWDUn
         4aoScs/MkOkkegAl2qkPD4IPlWLzotXoQ78dyvuMrhYALEzmYp8Vbp3k0Ctw34P1Mvs7
         GTFKhXGhpL4FNQIM++lePShCcVdOyoQxuwLlnDcyRvKYIIjWB5VAHeiiYDHLNcnolh2j
         U4OhzMPRlkn0utGwx+9yKcssP6Xnc6oRc0VZ1uh/1seQZiAGWHmZot5RVSho+KOm+EkE
         TA++zWd5DCqAUCCrlCnR9vysIlYkXMODqbHdJJo8O8JUcx82wzWq6naGTsL7RJCFn2Qa
         b/vA==
X-Gm-Message-State: AOAM532S9O+2qfkjqZCUXdd5R4gVmjNCzf/BKVfVDOEJJ74pS3NEgFor
        q56iWXGDi/fWwWMECs+Xk/IbIw==
X-Google-Smtp-Source: ABdhPJyVnODWZDHUqfB2HVQQaTl522RPYREDddNacRIabjGAy/gW5aHBIrWEYrwDJo8SUpKrZOaXQg==
X-Received: by 2002:a9d:5550:: with SMTP id h16mr2500173oti.157.1601093720359;
        Fri, 25 Sep 2020 21:15:20 -0700 (PDT)
Received: from builder.lan (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id p16sm1183237otl.17.2020.09.25.21.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:15:19 -0700 (PDT)
Date:   Fri, 25 Sep 2020 21:10:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: Re: [PATCH v5 2/3] remoteproc: qcom: Add capability to collect
 minidumps
Message-ID: <20200926041046.GC10036@builder.lan>
References: <1600991488-17877-1-git-send-email-sidgup@codeaurora.org>
 <1600991488-17877-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600991488-17877-3-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Sep 16:51 PDT 2020, Siddharth Gupta wrote:

> This patch adds support for collecting minidump in the event of remoteproc
> crash. Parse the minidump table based on remoteproc's unique minidump-id,
> read all memory regions from the remoteproc's minidump table entry and
> expose the memory to userspace. The remoteproc platform driver can choose
> to collect a full/mini dump by specifying the coredump op.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

If the three of you authored this patch you should add Co-developed-by
for Rishabh and Gurbir as well.

> ---
>  drivers/remoteproc/qcom_minidump.h          |  64 +++++++++++++
>  drivers/remoteproc/qcom_q6v5_pas.c          | 106 ++++++++++++++++++++-
>  drivers/remoteproc/remoteproc_coredump.c    | 138 ++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
>  include/linux/remoteproc.h                  |   1 +
>  5 files changed, 334 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/remoteproc/qcom_minidump.h
> 
> diff --git a/drivers/remoteproc/qcom_minidump.h b/drivers/remoteproc/qcom_minidump.h
> new file mode 100644
> index 0000000..437e030
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_minidump.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __QCOM_MINIDUMP_H
> +#define __QCOM_MINIDUMP_H
> +
> +#define MAX_NUM_OF_SS           10
> +#define MAX_REGION_NAME_LENGTH  16
> +#define SBL_MINIDUMP_SMEM_ID	602
> +#define MD_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
> +#define MD_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
> +#define MD_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
> +
> +/**
> + * md_ss_region - Minidump region

Valid kerneldoc should be:

 * struct md_ss_region - Minidump region

> + * @name		: Name of the region to be dumped
> + * @seq_num:		: Use to differentiate regions with same name.
> + * @md_valid		: This entry to be dumped (if set to 1)
> + * @region_base_address	: Physical address of region to be dumped
> + * @region_size		: Size of the region
> + */
> +struct md_ss_region {

But why don't you call this struct minidump_region?

> +	char	name[MAX_REGION_NAME_LENGTH];
> +	u32	seq_num;

Is this __le32 or __be32?

> +	u32	md_valid;

"valid" would be sufficient

> +	u64	region_base_address;

"address"

> +	u64	region_size;

"size"

> +};
> +
> +/**
> + * md_ss_toc: Subsystem's SMEM Table of content
> + * @md_ss_toc_init : Subsystem toc init status
> + * @md_ss_enable_status : if set to 1, this region would be copied during coredump
> + * @encryption_status: Encryption status for this subsystem
> + * @encryption_required : Decides to encrypt the subsystem regions or not
> + * @ss_region_count : Number of regions added in this subsystem toc
> + * @md_ss_smem_regions_baseptr : regions base pointer of the subsystem
> + */
> +struct md_ss_toc {

minidump_subsystem_toc

> +	u32			md_ss_toc_init;

"status"

> +	u32			md_ss_enable_status;

"enabled"

> +	u32			encryption_status;
> +	u32			encryption_required;
> +	u32			ss_region_count;
> +	u64			md_ss_smem_regions_baseptr;
> +};
> +
> +/**
> + * md_global_toc: Global Table of Content
> + * @md_toc_init : Global Minidump init status
> + * @md_revision : Minidump revision
> + * @md_enable_status : Minidump enable status
> + * @md_ss_toc : Array of subsystems toc
> + */
> +struct md_global_toc {

minidump_global_toc

> +	u32			md_toc_init;
> +	u32			md_revision;
> +	u32			md_enable_status;
> +	struct md_ss_toc	md_ss_toc[MAX_NUM_OF_SS];
> +};
> +
> +#endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3837f23..752c862 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -28,11 +28,13 @@
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  #include "remoteproc_internal.h"
> +#include "qcom_minidump.h"
>  
>  struct adsp_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
>  	int pas_id;
> +	unsigned int minidump_id;
>  	bool has_aggre2_clk;
>  	bool auto_boot;
>  
> @@ -63,6 +65,7 @@ struct qcom_adsp {
>  	int proxy_pd_count;
>  
>  	int pas_id;
> +	unsigned int minidump_id;
>  	int crash_reason_smem;
>  	bool has_aggre2_clk;
>  	const char *info_name;
> @@ -81,6 +84,8 @@ struct qcom_adsp {
>  	struct qcom_sysmon *sysmon;
>  };
>  
> +static struct md_global_toc *g_md_toc;

"minidump_toc", but I would prefer that you just resolve it from SMEM
each time, over carrying a global pointer.

> +
>  static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
>  			   size_t pd_count)
>  {
> @@ -116,6 +121,88 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
>  	}
>  }
>  
> +static void adsp_add_minidump_segments(struct rproc *rproc, struct md_ss_toc *minidump_ss)
> +{
> +	struct md_ss_region __iomem *region_info;

"region" would be more succinct.

> +	int seg_cnt = 0, i;

No need to initialize the segment count, the first access is an
assignment. And spelling it "count" would be easier to read.

> +	void __iomem *ptr;
> +	dma_addr_t da;
> +	size_t size;
> +	char *name;
> +
> +	seg_cnt = minidump_ss->ss_region_count;
> +	ptr = ioremap((unsigned long)minidump_ss->md_ss_smem_regions_baseptr,
> +		      seg_cnt * sizeof(struct md_ss_region));
> +
> +	if (!ptr)
> +		return;
> +
> +	region_info = ptr;
> +
> +	if (!list_empty(&rproc->dump_segments)) {

You can check this before the ioremap() and simplify the error handling.

But afaict you should see this every time except the first crash for a
given remoteproc. As adsp_priv_cleanup() is only invoked to empty the
list upon shutdown.

Does this imply that you build the list on the first crash and after
that you will just use the old list? If so you should omit the
dev_info() as this is normal behavior.

> +		dev_info(&rproc->dev, "dump segment list already populated\n");
> +		goto unmap_iomem;
> +	}
> +
> +	for (i = 0; i < seg_cnt; i++) {
> +		if (__raw_readl(&region_info->md_valid) == MD_REGION_VALID) {

Why not just memcpy_fromio the entire region_info, fix up the endian of
the entries with some leXX_to_cpu() and then add it to the segment list
if it's marked valid?

> +			name = kmalloc(MAX_REGION_NAME_LENGTH, GFP_KERNEL);
> +			memcpy_fromio(name, region_info->name, sizeof(region_info->name));
> +			da = __raw_readq(&region_info->region_base_address);
> +			size = __raw_readq(&region_info->region_size);
> +			rproc_coredump_add_custom_segment(rproc, da, size, NULL, name);
> +		}
> +		region_info++;
> +	}
> +
> +unmap_iomem:
> +	iounmap(ptr);
> +}
> +
> +static void adsp_dump(struct rproc *rproc)
> +{
> +	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;

priv is a void *, so no need to explicitly cast it.

> +	struct md_ss_toc *minidump_ss;
> +	size_t size;

You can pass NULL as last parameter to qcom_smem_get() if you don't care
for the result.

> +
> +	/* Get Global minidump ToC*/
> +	if (!g_md_toc)
> +		g_md_toc = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +					 SBL_MINIDUMP_SMEM_ID, &size);
> +
> +	/* check if global table pointer exists and init is set */
> +	if (IS_ERR(g_md_toc) || !(g_md_toc->md_toc_init)) {

No need for the parenthesis around the second expression.

> +		dev_err(&rproc->dev, "SMEM is not initialized.\n");
> +		return;
> +	}
> +
> +	/* Get subsystem table of contents using the minidump id */
> +	minidump_ss = &g_md_toc->md_ss_toc[adsp->minidump_id];
> +
> +	/**
> +	 * Collect minidump if SS ToC is valid and segment table
> +	 * is initialized in memory and encryption status is set.
> +	 */
> +	if (minidump_ss->md_ss_smem_regions_baseptr == 0 ||
> +	    minidump_ss->md_ss_toc_init != 1 ||
> +	    minidump_ss->md_ss_enable_status != MD_SS_ENABLED ||
> +	    minidump_ss->encryption_status != MD_SS_ENCR_DONE) {
> +		dev_err(&rproc->dev, "Minidump not ready!! Aborting\n");
> +		return;
> +	}
> +
> +	adsp_add_minidump_segments(rproc, minidump_ss);
> +	rproc_minidump(rproc);
> +}
> +
> +static void adsp_priv_cleanup(struct rproc *rproc)
> +{
> +	struct rproc_dump_segment *segment;
> +
> +	list_for_each_entry(segment, &rproc->dump_segments, node)
> +		kfree(segment->priv);

In the case of "inline" coredumps this will be a double free as you end
rproc_minidump() with freeing this...

> +}
> +
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> @@ -258,6 +345,15 @@ static const struct rproc_ops adsp_ops = {
>  	.panic = adsp_panic,
>  };
>  
> +static const struct rproc_ops adsp_minidump_ops = {
> +	.start = adsp_start,
> +	.stop = adsp_stop,
> +	.da_to_va = adsp_da_to_va,
> +	.load = adsp_load,
> +	.coredump = adsp_dump,
> +	.priv_cleanup = adsp_priv_cleanup,
> +};
> +
>  static int adsp_init_clock(struct qcom_adsp *adsp)
>  {
>  	int ret;
> @@ -398,8 +494,13 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret < 0 && ret != -EINVAL)
>  		return ret;
>  
> -	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
> -			    fw_name, sizeof(*adsp));
> +	if (desc->minidump_id)

So for platforms with minidump_id specified we will never attempt to
grab coredumps?

> +		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_minidump_ops, fw_name,
> +				    sizeof(*adsp));
> +	else
> +		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops, fw_name,
> +				    sizeof(*adsp));
> +
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
> @@ -411,6 +512,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
>  	adsp->rproc = rproc;
> +	adsp->minidump_id = desc->minidump_id;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
>  	adsp->info_name = desc->sysmon_name;
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index bb15a29..0495389 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -13,6 +13,8 @@
>  #include "remoteproc_internal.h"
>  #include "remoteproc_elf_helpers.h"
>  
> +#define MAX_STRTBL_SIZE 512
> +
>  struct rproc_coredump_state {
>  	struct rproc *rproc;
>  	void *header;
> @@ -27,6 +29,9 @@ void rproc_coredump_cleanup(struct rproc *rproc)
>  {
>  	struct rproc_dump_segment *entry, *tmp;
>  
> +	if (rproc->ops->priv_cleanup)
> +		rproc->ops->priv_cleanup(rproc);
> +

This should be done in a patch separate from the qcom pieces.

>  	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
>  		list_del(&entry->node);
>  		kfree(entry);
> @@ -323,3 +328,136 @@ void rproc_coredump(struct rproc *rproc)
>  	 */
>  	wait_for_completion(&dump_state.dump_done);
>  }
> +
> +/**
> + * rproc_minidump() - perform minidump
> + * @rproc:	rproc handle
> + *
> + * This function will generate an ELF header for the registered sections of
> + * segments and create a devcoredump device associated with rproc. Based on
> + * the coredump configuration this function will directly copy the segments
> + * from device memory to userspace or copy segments from device memory to
> + * a separate buffer, which can then be read by userspace.
> + * The first approach avoids using extra vmalloc memory. But it will stall
> + * recovery flow until dump is read by userspace.
> + */
> +void rproc_minidump(struct rproc *rproc)

This is far too similar to rproc_coredump().

What are the exact differences and why can't we refactor
rproc_coredump() to do what you need?

> +{
> +	struct rproc_dump_segment *segment;
> +	void *shdr;
> +	void *ehdr;
> +	size_t data_size;
> +	size_t offset;
> +	void *data;
> +	u8 class = rproc->elf_class;
> +	int shnum;
> +	struct rproc_coredump_state dump_state;
> +	unsigned int dump_conf = rproc->dump_conf;
> +	char *str_tbl = "STR_TBL";
> +
> +	if (list_empty(&rproc->dump_segments) ||
> +	    dump_conf == RPROC_COREDUMP_DISABLED)
> +		return;
> +
> +	if (class == ELFCLASSNONE) {
> +		dev_err(&rproc->dev, "Elf class is not set\n");
> +		return;
> +	}
> +
> +	/*
> +	 * We allocate two extra section headers. The first one is null.
> +	 * Second section header is for the string table. Also space is
> +	 * allocated for string table.
> +	 */
> +	data_size = elf_size_of_hdr(class) + 2 * elf_size_of_shdr(class) +
> +		    MAX_STRTBL_SIZE;
> +	shnum = 2;
> +
> +	list_for_each_entry(segment, &rproc->dump_segments, node) {
> +		data_size += elf_size_of_shdr(class);
> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
> +			data_size += segment->size;
> +		shnum++;
> +	}
> +
> +	data = vmalloc(data_size);
> +	if (!data)
> +		return;
> +
> +	ehdr = data;
> +	memset(ehdr, 0, elf_size_of_hdr(class));
> +	/* e_ident field is common for both elf32 and elf64 */
> +	elf_hdr_init_ident(ehdr, class);
> +
> +	elf_hdr_set_e_type(class, ehdr, ET_CORE);
> +	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
> +	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
> +	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
> +	elf_hdr_set_e_shoff(class, ehdr, elf_size_of_hdr(class));
> +	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
> +	elf_hdr_set_e_shentsize(class, ehdr, elf_size_of_shdr(class));
> +	elf_hdr_set_e_shnum(class, ehdr, shnum);
> +	elf_hdr_set_e_shstrndx(class, ehdr, 1);
> +
> +	/* Set the first section header as null and move to the next one. */
> +	shdr = data + elf_hdr_get_e_shoff(class, ehdr);
> +	memset(shdr, 0, elf_size_of_shdr(class));
> +	shdr += elf_size_of_shdr(class);
> +
> +	/* Initialize the string table. */
> +	offset = elf_hdr_get_e_shoff(class, ehdr) +
> +		 elf_size_of_shdr(class) * elf_hdr_get_e_shnum(class, ehdr);
> +	memset(data + offset, 0, MAX_STRTBL_SIZE);
> +
> +	/* Fill in the string table section header. */
> +	memset(shdr, 0, elf_size_of_shdr(class));
> +	elf_shdr_set_sh_type(class, shdr, SHT_STRTAB);
> +	elf_shdr_set_sh_offset(class, shdr, offset);
> +	elf_shdr_set_sh_size(class, shdr, MAX_STRTBL_SIZE);
> +	elf_shdr_set_sh_entsize(class, shdr, 0);
> +	elf_shdr_set_sh_flags(class, shdr, 0);
> +	elf_shdr_set_sh_name(class, shdr, set_section_name(str_tbl, ehdr, class));
> +	offset += elf_shdr_get_sh_size(class, shdr);
> +	shdr += elf_size_of_shdr(class);
> +
> +	list_for_each_entry(segment, &rproc->dump_segments, node) {
> +		memset(shdr, 0, elf_size_of_shdr(class));
> +		elf_shdr_set_sh_type(class, shdr, SHT_PROGBITS);
> +		elf_shdr_set_sh_offset(class, shdr, offset);
> +		elf_shdr_set_sh_addr(class, shdr, segment->da);
> +		elf_shdr_set_sh_size(class, shdr, segment->size);
> +		elf_shdr_set_sh_entsize(class, shdr, 0);
> +		elf_shdr_set_sh_flags(class, shdr, SHF_WRITE);
> +		elf_shdr_set_sh_name(class, shdr,
> +				     set_section_name(segment->priv, ehdr, class));
> +
> +		/* No need to copy segments for inline dumps */
> +		if (dump_conf == RPROC_COREDUMP_DEFAULT)
> +			rproc_copy_segment(rproc, data + offset, segment, 0,
> +					   segment->size);
> +		offset += elf_shdr_get_sh_size(class, shdr);
> +		shdr += elf_size_of_shdr(class);
> +	}
> +
> +	if (dump_conf == RPROC_COREDUMP_DEFAULT) {
> +		dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
> +		return;
> +	}
> +
> +	/* Initialize the dump state struct to be used by rproc_coredump_read */
> +	dump_state.rproc = rproc;
> +	dump_state.header = data;
> +	init_completion(&dump_state.dump_done);
> +
> +	dev_coredumpm(&rproc->dev, NULL, &dump_state, data_size, GFP_KERNEL,
> +		      rproc_coredump_read, rproc_coredump_free);
> +
> +	/* Wait until the dump is read and free is called. Data is freed
> +	 * by devcoredump framework automatically after 5 minutes.
> +	 */
> +	wait_for_completion(&dump_state.dump_done);
> +
> +	list_for_each_entry(segment, &rproc->dump_segments, node)
> +		kfree(segment->priv);

As stated above this will lead to double free, but givent hat you don't
empty dump_segments between invocations of rproc_minidump() you will in
above elf_shdr_set_sh_name() hit a use-after-free as well.

> +}
> +EXPORT_SYMBOL(rproc_minidump);
> diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
> index 4b6be7b..d83ebca 100644
> --- a/drivers/remoteproc/remoteproc_elf_helpers.h
> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
> @@ -11,6 +11,7 @@
>  #include <linux/elf.h>
>  #include <linux/types.h>
>  
> +#define MAX_NAME_LENGTH 16
>  /**
>   * fw_elf_get_class - Get elf class
>   * @fw: the ELF firmware image
> @@ -65,6 +66,7 @@ ELF_GEN_FIELD_GET_SET(hdr, e_type, u16)
>  ELF_GEN_FIELD_GET_SET(hdr, e_version, u32)
>  ELF_GEN_FIELD_GET_SET(hdr, e_ehsize, u32)
>  ELF_GEN_FIELD_GET_SET(hdr, e_phentsize, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_shentsize, u16)
>  
>  ELF_GEN_FIELD_GET_SET(phdr, p_paddr, u64)
>  ELF_GEN_FIELD_GET_SET(phdr, p_vaddr, u64)
> @@ -74,6 +76,9 @@ ELF_GEN_FIELD_GET_SET(phdr, p_type, u32)
>  ELF_GEN_FIELD_GET_SET(phdr, p_offset, u64)
>  ELF_GEN_FIELD_GET_SET(phdr, p_flags, u32)
>  ELF_GEN_FIELD_GET_SET(phdr, p_align, u64)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_type, u32)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_flags, u32)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_entsize, u16)
>  
>  ELF_GEN_FIELD_GET_SET(shdr, sh_size, u64)
>  ELF_GEN_FIELD_GET_SET(shdr, sh_offset, u64)
> @@ -93,4 +98,26 @@ ELF_STRUCT_SIZE(shdr)
>  ELF_STRUCT_SIZE(phdr)
>  ELF_STRUCT_SIZE(hdr)
>  
> +static inline unsigned int set_section_name(const char *name, void *ehdr,
> +					    u8 class)
> +{
> +	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
> +	void *shdr;
> +	char *strtab;
> +	static int strtable_idx = 1;
> +	int idx, ret = 0;
> +
> +	shdr = ehdr + elf_size_of_hdr(class) + shstrndx * elf_size_of_shdr(class);
> +	strtab = ehdr + elf_shdr_get_sh_offset(class, shdr);
> +	idx = strtable_idx;
> +	if (!strtab || !name)
> +		return 0;
> +
> +	ret = idx;
> +	idx += strlcpy((strtab + idx), name, MAX_NAME_LENGTH);
> +	strtable_idx = idx + 1;
> +
> +	return ret;
> +}
> +

This is generic pieces and should as such be in a patch separate from
the qcom specifics.

Regards,
Bjorn

>  #endif /* REMOTEPROC_ELF_LOADER_H */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a489aec..b7a5f93 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -658,6 +658,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> +void rproc_minidump(struct rproc *rproc);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
