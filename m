Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9801B2B8248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 17:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgKRQto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 11:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbgKRQtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 11:49:43 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6115EC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:49:43 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id f16so2361779otl.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p+SOE/rAqBuwPeUjldSRcpwpCjZRWiR7qywW+NnTMJM=;
        b=iVxh/yO7gtWQtd1BTTKNNSX2Rj/hhKuW/TnKXhtxKSButgJuMl6sMvKSBny9kK+4XE
         4CPboGivxwx4JCMUwVI0ntpyc9WPnelkGUvHOTkW/XSasy+ww751myCqLgxpH18knN/t
         TKz2QnPUucS6t1B3SNwQvz5lhh0sEorDy1kd9V2SyZ8di32O+I7dseuBGtKjX7CNNYm7
         /Jqwdv5F+fIvx5l5V0JXDfla6jGnby86mWbN6r/YPSrh0DpHeCbYAXw/KnoE4crzAP8w
         92OoB/ZAjRXQy0YmalYgbES+0STbZZQNJK08L4BABcJKkEr1Vi3vMlv1FuIRXqnNSxj1
         KBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p+SOE/rAqBuwPeUjldSRcpwpCjZRWiR7qywW+NnTMJM=;
        b=C1JlMZ+DDC4d9Df3GkrREaRiL0PlZ9HfZh7UZ8UGdPzE7zAwK19EvD9wlH1GSyypG2
         Mtsxbs8+jxIK776YoQt6LG41G3agZ7MG+ldKIO2kKGN7GMX8IiGHgftAO8sIJ3J8i+md
         DNGsgb36ow71iW/YPwRxxwZzyzigQ/modlSmD9piImqJ6cHAqWaFzpN7vgMCY1wUGNmP
         dTYpheeb2SPdFlHopHbnrW8ZnC25IwDS/93xS1l18ciTUaRddGSDhksK+/1sppEM9Ii9
         NrK4nxwkgC30eQYlalmsm7ZXwOur61Hk+r3BELuYUnoIYZgiLz91Gt5gK33k0OCBNdi2
         APwg==
X-Gm-Message-State: AOAM531gXgL5o+2fZMO3qgNMotHZWWs7YGXKT1U/vvJqQdp/OD1ITQrO
        frR8sUadMSPUCKJmfhZsXH2nxA==
X-Google-Smtp-Source: ABdhPJyj96YLdzSxlMbF4O55y5sOtYgISoVbnwmI08N8HBJ8bWRH0eP2iuag5I2hkhCqaxVXQTCHzQ==
X-Received: by 2002:a05:6830:d7:: with SMTP id x23mr6971830oto.59.1605718182220;
        Wed, 18 Nov 2020 08:49:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 66sm7653925otp.33.2020.11.18.08.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 08:49:41 -0800 (PST)
Date:   Wed, 18 Nov 2020 10:49:39 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: Re: [PATCH v7 3/4] remoteproc: qcom: Add capability to collect
 minidumps
Message-ID: <20201118164939.GC9177@builder.lan>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
 <1604395160-12443-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604395160-12443-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 03 Nov 03:19 CST 2020, Siddharth Gupta wrote:

> This patch adds support for collecting minidump in the event of remoteproc
> crash. Parse the minidump table based on remoteproc's unique minidump-id,
> read all memory regions from the remoteproc's minidump table entry and
> expose the memory to userspace. The remoteproc platform driver can choose
> to collect a full/mini dump by specifying the coredump op.
> 
> Co-developed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Co-developed-by: Gurbir Arora <gurbaror@codeaurora.org>
> Signed-off-by: Gurbir Arora <gurbaror@codeaurora.org>
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_minidump.h |  64 +++++++++++++++++++++++
>  drivers/remoteproc/qcom_q6v5_pas.c | 104 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 166 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/remoteproc/qcom_minidump.h
> 
> diff --git a/drivers/remoteproc/qcom_minidump.h b/drivers/remoteproc/qcom_minidump.h

This only needs to live in a header file if it's going to be accessed
from more than 1 c-file.

> new file mode 100644
> index 0000000..5857d06
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
> + * struct minidump_region - Minidump region
> + * @name		: Name of the region to be dumped
> + * @seq_num:		: Use to differentiate regions with same name.
> + * @valid		: This entry to be dumped (if set to 1)
> + * @address		: Physical address of region to be dumped
> + * @size		: Size of the region
> + */
> +struct minidump_region {
> +	char	name[MAX_REGION_NAME_LENGTH];
> +	__le32	seq_num;
> +	__le32	valid;
> +	__le64	address;
> +	__le64	size;
> +};
> +
> +/**
> + * struct minidump_subsystem_toc: Subsystem's SMEM Table of content
> + * @status : Subsystem toc init status
> + * @enabled : if set to 1, this region would be copied during coredump
> + * @encryption_status: Encryption status for this subsystem
> + * @encryption_required : Decides to encrypt the subsystem regions or not
> + * @ss_region_count : Number of regions added in this subsystem toc
> + * @md_ss_smem_regions_baseptr : regions base pointer of the subsystem
> + */
> +struct minidump_subsystem_toc {
> +	__le32	status;
> +	__le32	enabled;
> +	__le32	encryption_status;
> +	__le32	encryption_required;
> +	__le32	ss_region_count;

Please drop the "ss_" prefix.

> +	__le64	md_ss_smem_regions_baseptr;

Please drop the "md_ss_smem_" prefix.

> +};
> +
> +/**
> + * struct minidump_global_toc: Global Table of Content
> + * @md_toc_init : Global Minidump init status
> + * @md_revision : Minidump revision
> + * @md_enable_status : Minidump enable status
> + * @md_ss_toc : Array of subsystems toc
> + */
> +struct minidump_global_toc {
> +	__le32				status;
> +	__le32				md_revision;
> +	__le32				enabled;
> +	struct minidump_subsystem_toc	md_ss_toc[MAX_NUM_OF_SS];

How about "subsystems" and how about dropping the "_toc" suffix on the
type?

> +};
> +
> +#endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3837f23..349f725 100644
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
> @@ -116,6 +119,88 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
>  	}
>  }
>  
> +static void adsp_minidump_cleanup(struct rproc *rproc)
> +{
> +	struct rproc_dump_segment *entry, *tmp;
> +
> +	list_for_each_entry_safe(entry, tmp, &rproc->dump_segments, node) {
> +		list_del(&entry->node);
> +		kfree(entry->priv);
> +		kfree(entry);
> +	}
> +}
> +
> +static void adsp_add_minidump_segments(struct rproc *rproc,
> +				       struct minidump_subsystem_toc *minidump_ss)
> +{
> +	struct minidump_region __iomem *ptr;
> +	struct minidump_region region;
> +	int seg_cnt, i;
> +	dma_addr_t da;
> +	size_t size;
> +	char *name;
> +
> +	if (!list_empty(&rproc->dump_segments)) {

if (WARN_ON(!list_empty()))

Because this would only happen if we have a bug somewhere that leaves
items lingering on the dump_segments list.

> +		dev_err(&rproc->dev, "dump segment list already populated\n");
> +		return;
> +	}
> +
> +	seg_cnt = le32_to_cpu(minidump_ss->ss_region_count);
> +	ptr = ioremap((unsigned long)le64_to_cpu(minidump_ss->md_ss_smem_regions_baseptr),
> +		      seg_cnt * sizeof(struct minidump_region));
> +
> +	if (!ptr)
> +		return;
> +
> +	for (i = 0; i < seg_cnt; i++) {
> +		memcpy_fromio(&region, ptr + i, sizeof(region));
> +		if (region.valid == MD_REGION_VALID) {
> +			name = kmalloc(MAX_REGION_NAME_LENGTH, GFP_KERNEL);
> +			strlcpy(name, region.name, MAX_REGION_NAME_LENGTH);

Please use kstrdup() and don't forget to check for (and handle)
allocation failures.

> +			da = le64_to_cpu(region.address);
> +			size = le32_to_cpu(region.size);
> +			rproc_coredump_add_custom_segment(rproc, da, size, NULL, name);
> +		}
> +	}
> +
> +	iounmap(ptr);
> +}
> +
> +static void adsp_dump(struct rproc *rproc)

Here I think it makes sense to spell out adsp_minidump()

That said, the only thing I see specific to this driver here is the
use of adsp->minidump_id, so how about moving all this to qcom_common.c
and just call qcom_minidump(rproc, adsp->minidump_id); from here?

That way we can easily integrate it in the other remoteprocs as needed
later.

> +{
> +	struct qcom_adsp *adsp = rproc->priv;
> +	struct minidump_subsystem_toc *minidump_ss;
> +	struct minidump_global_toc *minidump_toc;

How about just naming this "toc" and minidump_ss just "minidump"?

> +
> +	/* Get Global minidump ToC*/
> +	minidump_toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
> +
> +	/* check if global table pointer exists and init is set */
> +	if (IS_ERR(minidump_toc) || !minidump_toc->status) {
> +		dev_err(&rproc->dev, "SMEM is not initialized.\n");

"Minidump TOC not found in SMEM\n"

> +		return;
> +	}
> +
> +	/* Get subsystem table of contents using the minidump id */
> +	minidump_ss = &minidump_toc->md_ss_toc[adsp->minidump_id];
> +
> +	/**
> +	 * Collect minidump if SS ToC is valid and segment table
> +	 * is initialized in memory and encryption status is set.
> +	 */
> +	if (minidump_ss->md_ss_smem_regions_baseptr == 0 ||
> +	    le32_to_cpu(minidump_ss->status) != 1 ||
> +	    le32_to_cpu(minidump_ss->enabled) != MD_SS_ENABLED ||
> +	    le32_to_cpu(minidump_ss->encryption_status) != MD_SS_ENCR_DONE) {
> +		dev_err(&rproc->dev, "Minidump not ready!! Aborting\n");

"Minidump not ready, skipping\n"

> +		return;
> +	}
> +
> +	adsp_add_minidump_segments(rproc, minidump_ss);
> +	rproc_minidump(rproc);
> +	adsp_minidump_cleanup(rproc);
> +}
> +
>  static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
> @@ -258,6 +343,15 @@ static const struct rproc_ops adsp_ops = {
>  	.panic = adsp_panic,
>  };
>  
> +static const struct rproc_ops adsp_minidump_ops = {
> +	.start = adsp_start,
> +	.stop = adsp_stop,
> +	.da_to_va = adsp_da_to_va,
> +	.load = adsp_load,
> +	.panic = adsp_panic,
> +	.coredump = adsp_dump,
> +};
> +
>  static int adsp_init_clock(struct qcom_adsp *adsp)
>  {
>  	int ret;
> @@ -398,8 +492,13 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret < 0 && ret != -EINVAL)
>  		return ret;
>  
> -	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
> -			    fw_name, sizeof(*adsp));
> +	if (desc->minidump_id)

Please use a local variable to reference adsp_minidump_ops vs adsp_ops.
Instead of making the whole thing conditional.

Regards,
Bjorn

> +		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_minidump_ops, fw_name,
> +				    sizeof(*adsp));
> +	else
> +		rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops, fw_name,
> +				    sizeof(*adsp));
> +
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
> @@ -411,6 +510,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
>  	adsp->rproc = rproc;
> +	adsp->minidump_id = desc->minidump_id;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
>  	adsp->info_name = desc->sysmon_name;
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
