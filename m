Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5FD1A4D36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 03:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDKB3g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 21:29:36 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40881 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgDKB3g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 21:29:36 -0400
Received: by mail-pj1-f67.google.com with SMTP id kx8so1350558pjb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jjYLKh9SotG0YtERlH9bytRNUj0Elct+prFzmtVxREo=;
        b=GW+/vmRNntb92CWhFIBWUecdvoGXMm6YrEN1iqYZtDMGkJ49tVRIB1slxM+BJeyVfV
         +xuGD965x3wSdTf+3t8yIRIWQe3Wsx0WP/hfBfoovLdSJFm6X/xCj+wfpk9dlz2XSI/Z
         +KB++MoNQX1cHGbkASro0MgITL/J5PNihPiRrK+fJgAlSxgmJk16IhqYi4nHgVhfqaND
         EeRVTXjh9e7w5Q7RpmQDotl1z34P05+8M6dQ2u6FqPre99509jKhOb8YzP0HgholBBXI
         Jx16vnM0on7TZxW9md5IxS3gUv8wX/HOmRRQ97jMzbF5voNLZL1uC0IPVtsyk7xjKT13
         /A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jjYLKh9SotG0YtERlH9bytRNUj0Elct+prFzmtVxREo=;
        b=FhG9feiU3V0teW3aQVjkZ//T1glUsnmcee9FGQBc57pp9RC8irZJ5iZS66eCR5b6ha
         1+vkyj4/XC3HeUw2ras6djJ6P02/wBTiRnTMU9lK6yY0bXyjDG8N8L2IHhjhfa1LxbNZ
         K0YAAXkIIKq5vJpxCaBm6OQ0pOqecVWC35gWEWGGodwOuHqnJlNcIa/aJ+uS4i1Vj61V
         JkAxoNzzshhijERyBMFIFtdZ4SQ3mkRiHnMnuHmjkWiEZNEsuYN7/gTCyzFQmesUKPTh
         KcLb3+Fckgtqnv8U1yWpftmx4q4qJbZ9aHDkhgdV6PJf1cyfvnQNYj75Y9Mgo8QmEE4s
         DYXA==
X-Gm-Message-State: AGi0PuZolDxtgiexbyzJbdyEVwz/BOK1P2LX+hjEOhQ4PmRA8FQ+kxuN
        CAWwuDKmLw8vr7SSJS69sVDDrw==
X-Google-Smtp-Source: APiQypIQLhZvVNf+E+zRbulkesaX5wgMjA4fNlnHIAiRrCty7EwiCQPbiGtO00aszYz0p9cR8hTNBg==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr7155503plo.3.1586568573216;
        Fri, 10 Apr 2020 18:29:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d84sm2859696pfd.197.2020.04.10.18.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 18:29:32 -0700 (PDT)
Date:   Fri, 10 Apr 2020 18:29:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] remoteproc: add rproc_coredump_set_elf_info
Message-ID: <20200411012942.GF576963@builder.lan>
References: <20200410102433.2672-1-cleger@kalray.eu>
 <20200410102433.2672-2-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410102433.2672-2-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 10 Apr 03:24 PDT 2020, Clement Leger wrote:

> This function allows drivers to correctly setup the coredump output
> elf information.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
>  drivers/remoteproc/remoteproc_elf_loader.c |  3 --
>  include/linux/remoteproc.h                 |  2 ++
>  3 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a9ac1d01e09b..382443bab583 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1562,6 +1562,28 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  }
>  EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
>  
> +/**
> + * rproc_coredump_set_elf_info() - set coredump elf information
> + * @rproc:	handle of a remote processor
> + * @class:	elf class for coredump elf file
> + * @size:	elf machine for coredump elf file
> + *
> + * Set elf information which will be used for coredump elf file.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine)
> +{
> +	if (class != ELFCLASS64 && class != ELFCLASS32)
> +		return -EINVAL;
> +
> +	rproc->elf_class = class;
> +	rproc->elf_machine = machine;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rproc_coredump_set_elf_info);
> +
>  /**
>   * rproc_coredump() - perform coredump
>   * @rproc:	rproc handle
> @@ -1584,6 +1606,11 @@ static void rproc_coredump(struct rproc *rproc)
>  	if (list_empty(&rproc->dump_segments))
>  		return;
>  
> +	if (class == ELFCLASSNONE) {
> +		dev_err(&rproc->dev, "Elf class is not set\n");
> +		return;
> +	}
> +
>  	data_size = elf_size_of_hdr(class);
>  	list_for_each_entry(segment, &rproc->dump_segments, node) {
>  		data_size += elf_size_of_phdr(class) + segment->size;
> @@ -1602,7 +1629,7 @@ static void rproc_coredump(struct rproc *rproc)
>  	elf_hdr_init_ident(ehdr, class);
>  
>  	elf_hdr_set_e_type(class, ehdr, ET_CORE);
> -	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
> +	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
>  	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
>  	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
>  	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
> @@ -2043,7 +2070,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>  	rproc->name = name;
>  	rproc->priv = &rproc[1];
>  	rproc->auto_boot = true;
> -	rproc->elf_class = ELFCLASS32;
> +	rproc->elf_class = ELFCLASSNONE;
> +	rproc->elf_machine = EM_NONE;
>  
>  	device_initialize(&rproc->dev);
>  	rproc->dev.parent = dev;
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 16e2c496fd45..4869fb7d8fe4 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -248,9 +248,6 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			memset(ptr + filesz, 0, memsz - filesz);
>  	}
>  
> -	if (ret == 0)
> -		rproc->elf_class = class;
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL(rproc_elf_load_segments);
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ed127b2d35ca..d67eb5a40476 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -515,6 +515,7 @@ struct rproc {
>  	struct list_head dump_segments;
>  	int nb_vdev;
>  	u8 elf_class;
> +	u16 elf_machine;
>  };
>  
>  /**
> @@ -619,6 +620,7 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
>  						     struct rproc_dump_segment *segment,
>  						     void *dest),
>  				      void *priv);
> +int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
>  
>  static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>  {
> -- 
> 2.17.1
> 
