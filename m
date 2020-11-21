Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B0F2BBCDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 05:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgKUEDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 23:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbgKUEDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 23:03:32 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E1EC061A49
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:03:32 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id k26so12970716oiw.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tlz7U7npPipBn6IsirZtMQkNJbQdnD2Ve3tz8tI6S4M=;
        b=yenqgmdDX++5go+f+qQAEVL2MyNGDr0vmU8svgSKQWcIebv/JcIRfWBC4FyGwchH4i
         Om2CuBcPoKCUXS2kGSxUpXK65+JzA3eOCEN4lAvbCMrRGFfeQaPT82H8Jj1byKgRIH+K
         FzLEJOmRJ3pgQ+OhyDRSWstkW9lODd3MrtYAq1z1Hq2XjwbPsMNJuZHWz1Xk3+oxKGNH
         lUZawrFKXgS/EzLtNcomNmLI/nJ8iZVVXKhF9PmQEoxqdKdQfxsz0uoimlbEgeh8tfGC
         xQuK7//qz4A359r/D1mlbiOY5oWyPD93IvH7KTWQv9LlmKALzFLdSZTnz8JmqEdi1Izn
         8JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tlz7U7npPipBn6IsirZtMQkNJbQdnD2Ve3tz8tI6S4M=;
        b=E3qLTodnXP7yJ0XeoK2CV8ScpVLwWlBU/K1urDCuQ5y8oIRfw3q1FM7mxVGJdZL5a6
         4R9edcXGTl+FE7FHL7YWRUneJVJaYi1e0zxQe91BfHAVPOOej9av3+RvVCFzCPE0cObn
         tzKhsP2GVNCroetfLKyg6ZAyxxY9MH+QMj36E+BqEYSxLGQeBBqzh9inrHIwqv0bTInA
         s96zxbDWzEWoU619iRH2SEH1Jc31Sl9iwMJdsISPlEOP1f4kG0qQlqsRR1fLD5Aw2xX7
         Gj+y0Buo3RHSRdaP93JhW301fd5VF+pP5kjnuhlbkVp4owIGeWtNiIeOX1CtjIpDHBMj
         wpww==
X-Gm-Message-State: AOAM530NmgInppUHcM8I0y/hoxfzhwmySG7UINrDrrDN72O36KSjuiDx
        09QOww3W5iQ97oZIqntGbnGP6g==
X-Google-Smtp-Source: ABdhPJxpaV9N5DyYwYKZtKadQ4lZYHqYFSAJ1zHzmAPZblrQnVLNQs7YqIaEKyz9fx97G17LCXqqjw==
X-Received: by 2002:aca:e187:: with SMTP id y129mr8759099oig.61.1605931411856;
        Fri, 20 Nov 2020 20:03:31 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z12sm2489058oti.45.2020.11.20.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:03:31 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:03:29 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 2/4] remoteproc: coredump: Add minidump functionality
Message-ID: <20201121040329.GK9177@builder.lan>
References: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
 <1605819935-10726-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605819935-10726-3-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Nov 15:05 CST 2020, Siddharth Gupta wrote:

> This change adds a new kind of core dump mechanism which instead of dumping
> entire program segments of the firmware, dumps sections of the remoteproc
> memory which are sufficient to allow debugging the firmware. This function
> thus uses section headers instead of program headers during creation of the
> core dump elf.
> 
> Co-developed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_coredump.c    | 140 ++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_elf_helpers.h |  26 ++++++
>  include/linux/remoteproc.h                  |   1 +
>  3 files changed, 167 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index 34530dc..81ec154 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -323,3 +323,143 @@ void rproc_coredump(struct rproc *rproc)
>  	 */
>  	wait_for_completion(&dump_state.dump_done);
>  }
> +
> +/**
> + * rproc_coredump_using_sections() - perform coredump using section headers
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
> +void rproc_coredump_using_sections(struct rproc *rproc)
> +{
> +	struct rproc_dump_segment *segment;
> +	void *shdr;
> +	void *ehdr;
> +	size_t data_size;
> +	size_t strtbl_size = 0;
> +	size_t strtbl_index = 1;
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
> +	data_size = elf_size_of_hdr(class) + 2 * elf_size_of_shdr(class);
> +	shnum = 2;
> +
> +	/* the extra byte is for the null character at index 0 */
> +	strtbl_size += strlen(str_tbl) + 2;
> +
> +	list_for_each_entry(segment, &rproc->dump_segments, node) {
> +		data_size += elf_size_of_shdr(class);
> +		strtbl_size += strlen(segment->priv) + 1;
> +		if (dump_conf == RPROC_COREDUMP_ENABLED)
> +			data_size += segment->size;
> +		shnum++;
> +	}
> +
> +	data_size += strtbl_size;
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
> +	/*
> +	 * The zeroth index of the section header is reserved and is rarely used.
> +	 * Set the section header as null (SHN_UNDEF) and move to the next one.
> +	 */
> +	shdr = data + elf_hdr_get_e_shoff(class, ehdr);
> +	memset(shdr, 0, elf_size_of_shdr(class));
> +	shdr += elf_size_of_shdr(class);
> +
> +	/* Initialize the string table. */
> +	offset = elf_hdr_get_e_shoff(class, ehdr) +
> +		 elf_size_of_shdr(class) * elf_hdr_get_e_shnum(class, ehdr);
> +	memset(data + offset, 0, strtbl_size);
> +
> +	/* Fill in the string table section header. */
> +	memset(shdr, 0, elf_size_of_shdr(class));
> +	elf_shdr_set_sh_type(class, shdr, SHT_STRTAB);
> +	elf_shdr_set_sh_offset(class, shdr, offset);
> +	elf_shdr_set_sh_size(class, shdr, strtbl_size);
> +	elf_shdr_set_sh_entsize(class, shdr, 0);
> +	elf_shdr_set_sh_flags(class, shdr, 0);
> +	elf_shdr_set_sh_name(class, shdr, elf_strtbl_add(str_tbl, ehdr, class, &strtbl_index));
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
> +				     elf_strtbl_add(segment->priv, ehdr, class, &strtbl_index));
> +
> +		/* No need to copy segments for inline dumps */
> +		if (dump_conf == RPROC_COREDUMP_ENABLED)
> +			rproc_copy_segment(rproc, data + offset, segment, 0,
> +					   segment->size);
> +		offset += elf_shdr_get_sh_size(class, shdr);
> +		shdr += elf_size_of_shdr(class);
> +	}
> +
> +	if (dump_conf == RPROC_COREDUMP_ENABLED) {
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
> +}
> +EXPORT_SYMBOL(rproc_coredump_using_sections);
> diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
> index 4b6be7b..26404e6 100644
> --- a/drivers/remoteproc/remoteproc_elf_helpers.h
> +++ b/drivers/remoteproc/remoteproc_elf_helpers.h
> @@ -65,6 +65,7 @@ ELF_GEN_FIELD_GET_SET(hdr, e_type, u16)
>  ELF_GEN_FIELD_GET_SET(hdr, e_version, u32)
>  ELF_GEN_FIELD_GET_SET(hdr, e_ehsize, u32)
>  ELF_GEN_FIELD_GET_SET(hdr, e_phentsize, u16)
> +ELF_GEN_FIELD_GET_SET(hdr, e_shentsize, u16)
>  
>  ELF_GEN_FIELD_GET_SET(phdr, p_paddr, u64)
>  ELF_GEN_FIELD_GET_SET(phdr, p_vaddr, u64)
> @@ -75,6 +76,9 @@ ELF_GEN_FIELD_GET_SET(phdr, p_offset, u64)
>  ELF_GEN_FIELD_GET_SET(phdr, p_flags, u32)
>  ELF_GEN_FIELD_GET_SET(phdr, p_align, u64)
>  
> +ELF_GEN_FIELD_GET_SET(shdr, sh_type, u32)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_flags, u32)
> +ELF_GEN_FIELD_GET_SET(shdr, sh_entsize, u16)
>  ELF_GEN_FIELD_GET_SET(shdr, sh_size, u64)
>  ELF_GEN_FIELD_GET_SET(shdr, sh_offset, u64)
>  ELF_GEN_FIELD_GET_SET(shdr, sh_name, u32)
> @@ -93,4 +97,26 @@ ELF_STRUCT_SIZE(shdr)
>  ELF_STRUCT_SIZE(phdr)
>  ELF_STRUCT_SIZE(hdr)
>  
> +static inline unsigned int elf_strtbl_add(const char *name, void *ehdr, u8 class, size_t *index)
> +{
> +	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
> +	void *shdr;
> +	char *strtab;
> +	size_t idx, ret;
> +
> +	shdr = ehdr + elf_size_of_hdr(class) + shstrndx * elf_size_of_shdr(class);
> +	strtab = ehdr + elf_shdr_get_sh_offset(class, shdr);
> +	idx = index ? *index : 0;
> +	if (!strtab || !name)
> +		return 0;
> +
> +	ret = idx;
> +	strcpy((strtab + idx), name);
> +	idx += strlen(name) + 1;
> +	if (index)
> +		*index = idx;
> +
> +	return ret;
> +}
> +
>  #endif /* REMOTEPROC_ELF_LOADER_H */
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index a419878..cdf2722 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  int rproc_boot(struct rproc *rproc);
>  void rproc_shutdown(struct rproc *rproc);
>  void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
> +void rproc_coredump_using_sections(struct rproc *rproc);
>  int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>  int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  				      dma_addr_t da, size_t size,
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
