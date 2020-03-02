Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9741767D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 00:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgCBXIT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 18:08:19 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36488 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgCBXIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 18:08:18 -0500
Received: by mail-pl1-f195.google.com with SMTP id g12so420992plo.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2020 15:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bHCVavkwu6zfqNW43fiKG14XiAueMcaZslslsOZ/218=;
        b=ydM6de292BVaEG4QIuyq3YDVMoEUXf/csuA62Efwp3SSERMdRa78DTYxPii0GhrquH
         ISL5cY5PnKvvgsRwpvwPaI7vfbfzJRRffct/nD7NxWwzR5+nM5zXinq7KnqGZ6IXRQ0a
         oc6KW7Dm8G/R+weAy54bB+Jxgl2/2PE2CimSIockQWJAFk6q7ZWhhb2y9G0cGsaZQBON
         jzosmItoJcleMLSIQDULAkmSSKVBi4F1legP3yobRaXw6QIUtUx8/QLvUzOBvdLuhxec
         JlIVk7m0qsebia9QlP3xo1u+DZYQyvO4TS9/u4XLRK2D0zuABuQfYiyrBrjveBgHGgoz
         CgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHCVavkwu6zfqNW43fiKG14XiAueMcaZslslsOZ/218=;
        b=b0ZrqhHwBnYnf28TCsKDboaGd0O5wF6L9Cwedo6P7xU1j4xKEpKmqzvMHnsrBYNOPp
         CTPotnSHREfT3G92yTQrQNykAAcAaCgEhxjUUtayKPLa6MFMe6k/T2WyecyYnSpFx+xn
         QvGPKCeOML7tfViA3dNWS2OhJwXh7YPpN31EjX9gD2vg+HNlwGFRPKJHE34ZBW0sw7k3
         4yC22JbQUdW41hHuGyNQALk4ufnFnM1mA0SnlwK+a/rqQtMkLAWeS2yGYbvlmf/zEH7O
         mHgyYqe3FmV7Y6zqaMZtH85PH8YSBEGJipcd92KyvGpzjoiaDNGhH5KfC70pfo7B5Wpp
         4hFA==
X-Gm-Message-State: ANhLgQ0yi1TsYbmdpaQnvMb4Do5ynP7PxLqZaBA8NTrFLRk8PUoO1kLQ
        Ff3h0lGjggf2W52vCLr9GvyClg==
X-Google-Smtp-Source: ADFU+vu5Fn9LjuEv0zkVceFz7t9zzw21FhNfEeY+oO2Z6PSUfUEvK0xhiSdQzKkCOH96zHvBaDxllg==
X-Received: by 2002:a17:902:b7ca:: with SMTP id v10mr1336548plz.308.1583190497213;
        Mon, 02 Mar 2020 15:08:17 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id t11sm256202pjo.21.2020.03.02.15.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:08:16 -0800 (PST)
Date:   Mon, 2 Mar 2020 15:08:14 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 3/8] remoteproc: Use u64 type for boot_addr
Message-ID: <20200302230814.GC262924@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-4-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-4-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:

> elf64 entry is defined as a u64. Since boot_addr is used to store the
> elf entry point, change boot_addr type to u64 to support both elf32
> and elf64. In the same time, fix users that were using this variable.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  drivers/remoteproc/remoteproc_internal.h   | 2 +-
>  drivers/remoteproc/st_remoteproc.c         | 2 +-
>  include/linux/remoteproc.h                 | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 606aae166eba..c2a9783cfb9a 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -102,7 +102,7 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
>   * Note that the boot address is not a configurable property of all remote
>   * processors. Some will always boot at a specific hard-coded address.
>   */
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
>  
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 58580210575c..0deae5f237b8 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -55,7 +55,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
>  int rproc_trigger_recovery(struct rproc *rproc);
>  
>  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
> -u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
> +u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
>  struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index ee13d23b43a9..a3268d95a50e 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -190,7 +190,7 @@ static int st_rproc_start(struct rproc *rproc)
>  		}
>  	}
>  
> -	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> +	dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
>  
>  	return 0;
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index bee559330204..1683d6c386a6 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -382,7 +382,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> -	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> +	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  };
>  
>  /**
> @@ -498,7 +498,7 @@ struct rproc {
>  	int num_traces;
>  	struct list_head carveouts;
>  	struct list_head mappings;
> -	u32 bootaddr;
> +	u64 bootaddr;
>  	struct list_head rvdevs;
>  	struct list_head subdevs;
>  	struct idr notifyids;
> -- 
> 2.15.0.276.g89ea799
> 
