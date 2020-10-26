Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8853C29988F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 22:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730085AbgJZVJS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 17:09:18 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35843 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730102AbgJZVJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 17:09:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id 32so9326686otm.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dQMkIjhrBGIcH4BkK1b0L54eYjGzpyihmX/ddTl1/z8=;
        b=WpWfpSsWEljzeAo9BgcXjva+uM7Syije3ZkmMSwxfTfV3jc5tRInHXQ6gqyoYfcajP
         4up8975YXIb1Mdx5+mx+L8kDViLLgTUUgn6kZUZRqw2hdl8GkXeSD29usozPcSCjA2Jm
         FhLfpehCLEBIU7BXNhLagAmwhrweZCW/HKTOhHtgRdaaocFBAkM26rOnmfFKisVAZvLF
         vTpXYnKMNmEvouXdpgei1X32qza1AWtG33x4PRyycvvZHNfTzr+9WkV9tWpjCJyWLbkC
         /Lt9NJayoG21oCS3GcX1Qyk+vzl3EMTkVNwrsTRqyAwBsk1/Y3+iseYSlwnxl3fzmNoY
         6cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dQMkIjhrBGIcH4BkK1b0L54eYjGzpyihmX/ddTl1/z8=;
        b=T+hMJEMWE+VFR01A90kI3rs2SQPX1IsdhV1Upc3XDORM3ge627L2awNuJGSwqekfYs
         NUsUYfsps7VxVjr2NXree1T0sdEe5NRWc4ve0NilDaQo0b3rTB2r5NYeNxApDskuW+rB
         ckxdxJaySvpZ0qpxXOAblwmV1RzwVOl6X57Iht3W6WMLGm+9aDfydRfIgPCjTNXA3Hfy
         HYecdz1OSYCnWEsTvEAbR3reuUkP+BxHT95+ji5d7OsfPgQeWsyfipOXW/Hx5EiOooBf
         J3roHsbMu/5+vUw4tiJBsrShz+G3Fs97OtFMI+WzNDn3h8EmJpWbRnDxj4p3/GmJDdEG
         XN3A==
X-Gm-Message-State: AOAM533zEQae0qlZKv6P7+3bgHMhbtWyqucumUgZS5rlwsN7IUjzUtJc
        x+haFWa69WvfX/O3UM+hPJC3FA==
X-Google-Smtp-Source: ABdhPJxCAXdOF6XzdZnXikN9EaIFGf9iC54nMk+ZVlBCK5TB7hdM98ic3z/CjKy4fc8yq1On5EF3WA==
X-Received: by 2002:a05:6830:1282:: with SMTP id z2mr14889462otp.301.1603746555264;
        Mon, 26 Oct 2020 14:09:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v11sm4305971otj.73.2020.10.26.14.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 14:09:14 -0700 (PDT)
Date:   Mon, 26 Oct 2020 16:09:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] remoteproc: coredump: Add minidump functionality
Message-ID: <20201026210912.GA4611@builder.lan>
References: <1601690757-25726-1-git-send-email-sidgup@codeaurora.org>
 <1601690757-25726-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601690757-25726-3-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 02 Oct 21:05 CDT 2020, Siddharth Gupta wrote:

> This change adds a new kind of core dump mechanism which instead of dumping
> entire program segments of the firmware, dumps sections of the remoteproc
> memory which are sufficient to allow debugging the firmware. This function
> thus uses section headers instead of program headers during creation of the
> core dump elf.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_coredump.c    | 132 ++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
>  include/linux/remoteproc.h                  |   1 +
>  3 files changed, 160 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
> index bb15a29..e7d1394 100644
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
> @@ -323,3 +325,133 @@ void rproc_coredump(struct rproc *rproc)
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

Just to confirm, this does the same thing as rproc_coredump() with the
difference that instead of storing the segments in program headers, you
reference them using section headers?

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

Once you start populating the string table there's no checks that this
isn't overrun.

But really

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

I assume this last part creates the null entry? How about mentioning
that in a comment - and perhaps why there needs to be a null entry.

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

This name is too generic. Why is it 16?

> +static inline unsigned int set_section_name(const char *name, void *ehdr,
> +					    u8 class)
> +{
> +	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
> +	void *shdr;
> +	char *strtab;
> +	static int strtable_idx = 1;

This can't be static as this will only start at 1 on the first
invocation of rproc_minidump().

I think it would be perfectly fine if you simply scan the string list to
find the next available slot.

> +	int idx, ret = 0;

No need to initialize ret as the first usage is an assignment.

Regards,
Bjorn
