Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8572117E948
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgCITww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:52:52 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42293 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgCITww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:52:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id f5so5305169pfk.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 12:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z6CzFVUTmbba/AoB85RS3nr6uH+MlqeQEe/r4/Zh99Y=;
        b=wDLkXcCbKfKQ/LaQ5JGk5OZxyZO0H8nu//+GoeXir5ZiBfMnciqCXYux/Vo34z4LmU
         Fy8MlfSucuT3hu0Omzu6/gRcWm5AvUkPq6LbBftR/hYYC+jXHJEF2WxlSZ7RWplDkcXi
         GddHkakFvne0aQuHyp2kJ1WIYU9xNMMG7IMNTUmSVOoM9wnf2sTxT+0gRYfKWHEuLI+s
         y+7jWnzY6CwjezEo6zFvqwWO60jVqzgyT+caE60jXlyfuYxeRe0HCLlWPeceIIAXaAXq
         M5XHHt3Km4pVGbRBbYKUsc80Vo69UevSO0VutCg8Dy4Kn+O4y26Xjg/GeGlYFvGm/5Ar
         3Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z6CzFVUTmbba/AoB85RS3nr6uH+MlqeQEe/r4/Zh99Y=;
        b=t1LZwNTld7eQztIZWqor2738XdL2yR6C7KoFz+1C+/cQ1AHy8iHU9bP6Vx5MQ/5ifs
         GOvErdsCVCqsZYrAi2i9KQ3vj8hyqUJakR4bveyVMseNV20hGuMnaMy2pZQitniYKxz4
         E0z4k69UpnZcgKYVjZi4o5QNI2LAVDFCPd9l/lx3802EPvS71D2xsI5zwi6dAY8HmEi6
         elXbOIhxscEX8HmmO9mBU8eKWB67dJRiPexKnIpAVxj64zVplFk3u0MvkeFeT+BlhaBi
         WXsYntkv4QvYUKXX8Y6r8RdDYHYYz6w5zTBByrgLpiWLuE61vc7T3ySJZIKeJe0WsMtk
         lnzw==
X-Gm-Message-State: ANhLgQ3exwktXVojoK7wrVDy2Yq9etunuIeKY/KKZzrkmDzJAnx0pT4M
        vnLqyaRlP9Zh82+aZq5dsmUwvA==
X-Google-Smtp-Source: ADFU+vtu9bX5XLEjumqvL1lZkx/1YphlPxprCuGo9T4TyenxyJr/YDNRk6Asdhf/m59YPzBjgDvlcQ==
X-Received: by 2002:aa7:953b:: with SMTP id c27mr5965025pfp.201.1583783570743;
        Mon, 09 Mar 2020 12:52:50 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c17sm24619108pfo.71.2020.03.09.12.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:52:50 -0700 (PDT)
Date:   Mon, 9 Mar 2020 13:52:47 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Subject: Re: [PATCH v5 3/8] remoteproc: Use u64 type for boot_addr
Message-ID: <20200309195247.GC1399@xps15>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-4-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-4-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 02, 2020 at 10:38:57AM +0100, Clement Leger wrote:
> elf64 entry is defined as a u64. Since boot_addr is used to store the
> elf entry point, change boot_addr type to u64 to support both elf32
> and elf64. In the same time, fix users that were using this variable.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
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

The return type of function rproc_get_boot_addr() should also be changed from
u32 to u64.  Or perhaps this is intentional to make sure rproc->bootaddr never
occupies more than 32bit?

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
