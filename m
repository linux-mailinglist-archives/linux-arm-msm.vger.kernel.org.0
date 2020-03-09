Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261A617E82F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCITVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:21:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35258 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCITVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:21:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id u68so4559077pfb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Ve3mrSvm1dOHAsegEEjiuaMrFQOijqF+lr2yreUyLE=;
        b=PKCtKC7uyC8i/DN0MO+jBy7A9dYjm0BvRQHCcABOBfgDupKb+axXLHJ1pIr5+0N6v+
         EOZwJYSIfs2miXWm90Qjb6yE5EBWGSBAsw/IRyuFapS9v6j5tiHTfsj8sy8fndA4ooO9
         UKs1UUhQk1xKwDJGKHHRiGZ4SR4ShkUpFn6QuntqJF3mhLrBK3keXR9SOUl0Epx2yryK
         dqYB3wkDKVT3frMmHokgUdQyCvgwBogJgN9Hy0rbNBvNYsfsuDcnCMas98lYqxyv775v
         T7xrFLTYcuTQgavNN3+2Qvly5vFOFiA8Upap+DllXIKkLvxGERM74sfSGkAAiWy7yk2p
         JNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Ve3mrSvm1dOHAsegEEjiuaMrFQOijqF+lr2yreUyLE=;
        b=PJnYMGGw9kXHCm4iLhVPlvSP8bjlMHe3+AE1cw+ustqHE+OHUZBMVayDfZvhW9WvGP
         XurvwJ3uXm5lufoAJBaBE8/CYwWCYdA0KwSezBCOYvkHbw0P/7qPXsqJApZAZaV4ypy6
         V0sTCq3i1+6BArhWeOKLQYghIEeAGG4AMi4JePMCEJriP6+3EFAGQFxrr3DY2BjFLzMK
         XLmMsd0s1cr0y3B6jbUThO+jWUlCcP9S1XzyW939A9diI1qgZJfunbaOwbkvhLgeztID
         4ct9svqG4DRnXDChy5hLUSmS/4INk5wXQRaoeQyA4X2B6tQBcV8oJmPKaOejvHlviiMy
         Aicg==
X-Gm-Message-State: ANhLgQ3aPJvOhuz3kfI9oQVsqky1Z6N1fnM8XfHXHayUGirjcTNJPB/x
        cNZ3MagiRX8NRvVRCQ/ljH61jQ==
X-Google-Smtp-Source: ADFU+vv4DHskMayr9V263F+RoX6mwXATWLbep1JlrTDrd3s5h6v5M8VMmhrUgv94rrg0OOERe/5wyg==
X-Received: by 2002:a62:25c3:: with SMTP id l186mr18053778pfl.52.1583781678971;
        Mon, 09 Mar 2020 12:21:18 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u14sm27167815pgg.67.2020.03.09.12.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 12:21:18 -0700 (PDT)
Date:   Mon, 9 Mar 2020 13:21:15 -0600
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
Subject: Re: [PATCH v5 2/8] remoteproc: Use size_t instead of int for
 rproc_mem_entry len
Message-ID: <20200309192115.GB1399@xps15>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-3-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-3-cleger@kalray.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 02, 2020 at 10:38:56AM +0100, Clement Leger wrote:
> Now that rproc_da_to_va uses a size_t for length, use a size_t for len field
> of rproc_mem_entry. Function used to create such structures now takes
> a size_t instead of int to allow full size range to be handled.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

With the checkpatch warning fixed:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/remoteproc_core.c    | 14 ++++++++------
>  drivers/remoteproc/remoteproc_debugfs.c |  2 +-
>  include/linux/remoteproc.h              |  6 +++---
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 5ab094fc1b55..4bfaf4a3c4a3 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -318,8 +318,9 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vring *rvring = &rvdev->vring[i];
>  	struct fw_rsc_vdev *rsc;
> -	int ret, size, notifyid;
> +	int ret, notifyid;
>  	struct rproc_mem_entry *mem;
> +	size_t size;
>  
>  	/* actual size of vring (in bytes) */
>  	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> @@ -746,11 +747,12 @@ static int rproc_alloc_carveout(struct rproc *rproc,
>  	va = dma_alloc_coherent(dev->parent, mem->len, &dma, GFP_KERNEL);
>  	if (!va) {
>  		dev_err(dev->parent,
> -			"failed to allocate dma memory: len 0x%x\n", mem->len);
> +			"failed to allocate dma memory: len 0x%zx\n",
> +			mem->len);
>  		return -ENOMEM;
>  	}
>  
> -	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%x\n",
> +	dev_dbg(dev, "carveout va %pK, dma %pad, len 0x%zx\n",
>  		va, &dma, mem->len);
>  
>  	if (mem->da != FW_RSC_ADDR_ANY && !rproc->domain) {
> @@ -957,7 +959,7 @@ EXPORT_SYMBOL(rproc_add_carveout);
>   */
>  struct rproc_mem_entry *
>  rproc_mem_entry_init(struct device *dev,
> -		     void *va, dma_addr_t dma, int len, u32 da,
> +		     void *va, dma_addr_t dma, size_t len, u32 da,
>  		     int (*alloc)(struct rproc *, struct rproc_mem_entry *),
>  		     int (*release)(struct rproc *, struct rproc_mem_entry *),
>  		     const char *name, ...)
> @@ -999,7 +1001,7 @@ EXPORT_SYMBOL(rproc_mem_entry_init);
>   * provided by client.
>   */
>  struct rproc_mem_entry *
> -rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
> +rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...)
>  {
>  	struct rproc_mem_entry *mem;
> @@ -1270,7 +1272,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
>  		unmapped = iommu_unmap(rproc->domain, entry->da, entry->len);
>  		if (unmapped != entry->len) {
>  			/* nothing much to do besides complaining */
> -			dev_err(dev, "failed to unmap %u/%zu\n", entry->len,
> +			dev_err(dev, "failed to unmap %zx/%zu\n", entry->len,
>  				unmapped);
>  		}
>  
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index dd93cf04e17f..82dc34b819df 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -293,7 +293,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
>  		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
>  		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
>  		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
> -		seq_printf(seq, "\tLength: 0x%x Bytes\n\n", carveout->len);
> +		seq_printf(seq, "\tLength: 0x%zx Bytes\n\n", carveout->len);
>  	}
>  
>  	return 0;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 89215798eaea..bee559330204 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -329,7 +329,7 @@ struct rproc;
>  struct rproc_mem_entry {
>  	void *va;
>  	dma_addr_t dma;
> -	int len;
> +	size_t len;
>  	u32 da;
>  	void *priv;
>  	char name[32];
> @@ -599,13 +599,13 @@ void rproc_add_carveout(struct rproc *rproc, struct rproc_mem_entry *mem);
>  
>  struct rproc_mem_entry *
>  rproc_mem_entry_init(struct device *dev,
> -		     void *va, dma_addr_t dma, int len, u32 da,
> +		     void *va, dma_addr_t dma, size_t len, u32 da,
>  		     int (*alloc)(struct rproc *, struct rproc_mem_entry *),
>  		     int (*release)(struct rproc *, struct rproc_mem_entry *),
>  		     const char *name, ...);
>  
>  struct rproc_mem_entry *
> -rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
> +rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
>  			     u32 da, const char *name, ...);
>  
>  int rproc_boot(struct rproc *rproc);
> -- 
> 2.15.0.276.g89ea799
> 
