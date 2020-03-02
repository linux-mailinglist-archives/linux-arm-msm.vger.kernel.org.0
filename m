Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 333F61767D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 00:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgCBXH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 18:07:58 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34907 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCBXH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 18:07:58 -0500
Received: by mail-pg1-f194.google.com with SMTP id 7so561947pgr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2020 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rf9QZb3mjgzUT+Cz+8sSLrcBamktZJl01xW2Zxlkdn8=;
        b=Fmu6em312fYYtaLMdYJAxUWlb+DWa7rSsEQp+4c0MnRJDbDpWdeKUX95VYJE93U7sR
         YhzipcRMHwVttwBHTDT1UeiT3OSKF2InoC9nKs2oeiluumwsLbc1Z2APmWo3PwTYN6RA
         J1o+7447aOHquwGhK8VoWVpgKb7goT47ICVZLnBn+u9Yarolb333kCEj3bP7NcwUv0u7
         1AllSl9Mss1gcarqqXax8p7IKwU+9rVKaTFHjXCplxtCfsvuTm0gxOByVY6CvUxSLkB9
         v3mXfXHgHpyn1R7CWLCWaurJ9Ltf8b3b7npx2lLSQifjEt6Xpc6TMf85cDsvk4aE+EOr
         FbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rf9QZb3mjgzUT+Cz+8sSLrcBamktZJl01xW2Zxlkdn8=;
        b=b1F8MEQ8tYmhaKnEa76I3yKSSFwmW5AfaNMwtJLWgHrrCyqG/W6KMEvxzToeKoboFC
         z8GVRKHYL5HLJBWZ4iMluejtBmbMixUyA5m8V3scDFnAN1Aelvy0mzfhIJWJAIHjenpr
         A8dIKBlaeMrp7X1V3/iUI8tigGLnepN3WGYZsMCdk+FlclE9V9eKK6XYDIQiw6+GWB2k
         MEs6UJpbNt2Z5Le1CZYZyZQmt19sptPn6eyMEn7lgbIv+cwhk7VN9/gRBrM+ZWT2dfiA
         xv1FJND3FQ3FYzwPKT5jJhX8CJqzDIJAbJBPMOpIxKgt54upijoFdYpMdH5bnwiLHJFb
         4nLw==
X-Gm-Message-State: ANhLgQ3TTNz9RkXo6D5mdtZqOMyQ3RyqNtKIGcCvRi/gdBy1R4shPfbn
        f9lZP9A5ZHLqr7Xhk/pWPdOJ3w==
X-Google-Smtp-Source: ADFU+vutfcXaEUIULCiDyJq8DCHYBm8+8AApIk8RULq/D7ttfXLeW5DlU5hiIs2fKWalrHIPcoFKRw==
X-Received: by 2002:a63:8e44:: with SMTP id k65mr1128200pge.452.1583190476895;
        Mon, 02 Mar 2020 15:07:56 -0800 (PST)
Received: from yoga (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id p94sm251583pjp.15.2020.03.02.15.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 15:07:56 -0800 (PST)
Date:   Mon, 2 Mar 2020 15:07:53 -0800
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
Subject: Re: [PATCH v5 2/8] remoteproc: Use size_t instead of int for
 rproc_mem_entry len
Message-ID: <20200302230753.GB262924@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-3-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302093902.27849-3-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:

> Now that rproc_da_to_va uses a size_t for length, use a size_t for len field
> of rproc_mem_entry. Function used to create such structures now takes
> a size_t instead of int to allow full size range to be handled.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

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
