Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 154CE2BBCE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 05:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgKUEEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 23:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbgKUEEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 23:04:30 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6764C061A49
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:04:29 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id v202so9783443oia.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I9OjLDpUAdJdIDWWKSXWPbWDIsGLch+DzF3Ao844iWU=;
        b=bjchQ5z3ougCAmMBqbyImP79kdBvEixt12lvreHOt+EDYq4EC7LiWuaQefJ2A1dlVW
         9BF3FTGYR6U7riZXA2u+zbdIcEZGicsvW0bNv8OR0neshc4rzKU7oDfeZpcqsSA5IcjE
         gSkOch/Ec3HSoRCcO9fDjOSRWuuobl66+clibFIZiJwGV2Cdr2eHENfPsp32JK8xl+2D
         Oo2USCZ1/v7jH7rtIfT54t1gfGxnm1p5e4uU849Yk+WinGKX+JcpWYVHrD0h24RdwPaQ
         UtHY/N/gN+h2zKBERAGL6SZPoCxnmnJbcrnP2T/Eudt2ZVyab3wN8tiRGuRJmRLiHT1G
         Oc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I9OjLDpUAdJdIDWWKSXWPbWDIsGLch+DzF3Ao844iWU=;
        b=nzTcGcZq4lNSzV6TaovrofEXMTfqrah4hIHoF5FZ0+H48Tj5H+SoSJ1a/mo2CuI28s
         poXIvVBqg+kyQHfVrIn6VgCPJ6PXJjbB1ICIwXlBOa7hGOG50jBDqbZV8cgWQ/ftOPW7
         bUrWIulGhqTtT36PQuHP2Wx7FfR1aYxAIJklL0V8rm8Og7itLBYqHWbizrlFR91eHwLG
         X50LMZI7VYyNlG9JG37hc6O//cQNTTpofwS0SQKccMs3fHXEUnXb016UZNQo4fiitOic
         4DILr7G5Nk9HqrLgKaqg2BP0lAz0UX/IB+Vt/l0oJRMgZdpiZz+7ZfVnizLt+EDp71zc
         5WdA==
X-Gm-Message-State: AOAM53012KZloc+kNKZq5NoMOZ4qwC1wQimda43nO/Zv8xwyCH0T8FhH
        FxW1Ool/zUSok3vs8MeT8LBgdg==
X-Google-Smtp-Source: ABdhPJxAjIMKOaN5hmgz9ZkVf+HrW8Y06+KG9j3VdK+wWONWJa1pSX1+FT/bV4SkQa430U4Tbu+6ag==
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr7999159oic.150.1605931469317;
        Fri, 20 Nov 2020 20:04:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h94sm685377otb.21.2020.11.20.20.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:04:28 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:04:26 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org, Gurbir Arora <gurbaror@codeaurora.org>
Subject: Re: [PATCH v8 3/4] remoteproc: qcom: Add capability to collect
 minidumps
Message-ID: <20201121040426.GL9177@builder.lan>
References: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
 <1605819935-10726-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605819935-10726-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Nov 15:05 CST 2020, Siddharth Gupta wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_common.c   | 147 +++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/qcom_common.h   |   2 +
>  drivers/remoteproc/qcom_q6v5_pas.c |  27 ++++++-
>  3 files changed, 174 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 085fd73..c41c3a5 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -17,6 +17,7 @@
>  #include <linux/rpmsg/qcom_smd.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> +#include <linux/soc/qcom/smem.h>
>  
>  #include "remoteproc_internal.h"
>  #include "qcom_common.h"
> @@ -25,6 +26,61 @@
>  #define to_smd_subdev(d) container_of(d, struct qcom_rproc_subdev, subdev)
>  #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
>  
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
> + * @region_count : Number of regions added in this subsystem toc
> + * @regions_baseptr : regions base pointer of the subsystem
> + */
> +struct minidump_subsystem {
> +	__le32	status;
> +	__le32	enabled;
> +	__le32	encryption_status;
> +	__le32	encryption_required;
> +	__le32	region_count;
> +	__le64	regions_baseptr;
> +};
> +
> +/**
> + * struct minidump_global_toc: Global Table of Content
> + * @status : Global Minidump init status
> + * @md_revision : Minidump revision
> + * @enabled : Minidump enable status
> + * @subsystems : Array of subsystems toc
> + */
> +struct minidump_global_toc {
> +	__le32				status;
> +	__le32				md_revision;
> +	__le32				enabled;
> +	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
> +};
> +
>  struct qcom_ssr_subsystem {
>  	const char *name;
>  	struct srcu_notifier_head notifier_list;
> @@ -34,6 +90,97 @@ struct qcom_ssr_subsystem {
>  static LIST_HEAD(qcom_ssr_subsystem_list);
>  static DEFINE_MUTEX(qcom_ssr_subsys_lock);
>  
> +
> +static void qcom_minidump_cleanup(struct rproc *rproc)
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
> +static int qcom_add_minidump_segments(struct rproc *rproc, struct minidump_subsystem *subsystem)
> +{
> +	struct minidump_region __iomem *ptr;
> +	struct minidump_region region;
> +	int seg_cnt, i;
> +	dma_addr_t da;
> +	size_t size;
> +	char *name;
> +
> +	if (WARN_ON(!list_empty(&rproc->dump_segments))) {
> +		dev_err(&rproc->dev, "dump segment list already populated\n");
> +		return -EUCLEAN;
> +	}
> +
> +	seg_cnt = le32_to_cpu(subsystem->region_count);
> +	ptr = ioremap((unsigned long)le64_to_cpu(subsystem->regions_baseptr),
> +		      seg_cnt * sizeof(struct minidump_region));
> +	if (!ptr)
> +		return -EFAULT;
> +
> +	for (i = 0; i < seg_cnt; i++) {
> +		memcpy_fromio(&region, ptr + i, sizeof(region));
> +		if (region.valid == MD_REGION_VALID) {
> +			name = kstrdup(region.name, GFP_KERNEL);
> +			if (!name) {
> +				iounmap(ptr);
> +				return -ENOMEM;
> +			}
> +			da = le64_to_cpu(region.address);
> +			size = le32_to_cpu(region.size);
> +			rproc_coredump_add_custom_segment(rproc, da, size, NULL, name);
> +		}
> +	}
> +
> +	iounmap(ptr);
> +	return 0;
> +}
> +
> +void qcom_minidump(struct rproc *rproc, unsigned int minidump_id)
> +{
> +	int ret;
> +	struct minidump_subsystem *subsystem;
> +	struct minidump_global_toc *toc;
> +
> +	/* Get Global minidump ToC*/
> +	toc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, NULL);
> +
> +	/* check if global table pointer exists and init is set */
> +	if (IS_ERR(toc) || !toc->status) {
> +		dev_err(&rproc->dev, "Minidump TOC not found in SMEM\n");
> +		return;
> +	}
> +
> +	/* Get subsystem table of contents using the minidump id */
> +	subsystem = &toc->subsystems[minidump_id];
> +
> +	/**
> +	 * Collect minidump if SS ToC is valid and segment table
> +	 * is initialized in memory and encryption status is set.
> +	 */
> +	if (subsystem->regions_baseptr == 0 ||
> +	    le32_to_cpu(subsystem->status) != 1 ||
> +	    le32_to_cpu(subsystem->enabled) != MD_SS_ENABLED ||
> +	    le32_to_cpu(subsystem->encryption_status) != MD_SS_ENCR_DONE) {
> +		dev_err(&rproc->dev, "Minidump not ready, skipping\n");
> +		return;
> +	}
> +
> +	ret = qcom_add_minidump_segments(rproc, subsystem);
> +	if (ret) {
> +		dev_err(&rproc->dev, "Failed with error: %d while adding minidump entries\n", ret);
> +		goto clean_minidump;
> +	}
> +	rproc_coredump_using_sections(rproc);
> +clean_minidump:
> +	qcom_minidump_cleanup(rproc);
> +}
> +EXPORT_SYMBOL_GPL(qcom_minidump);
> +
>  static int glink_subdev_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
> index dfc641c..a359f16 100644
> --- a/drivers/remoteproc/qcom_common.h
> +++ b/drivers/remoteproc/qcom_common.h
> @@ -33,6 +33,8 @@ struct qcom_rproc_ssr {
>  	struct qcom_ssr_subsystem *info;
>  };
>  
> +void qcom_minidump(struct rproc *rproc, unsigned int minidump_id);
> +
>  void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink,
>  			   const char *ssr_name);
>  void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 3837f23..ca05c2ef 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -33,6 +33,7 @@ struct adsp_data {
>  	int crash_reason_smem;
>  	const char *firmware_name;
>  	int pas_id;
> +	unsigned int minidump_id;
>  	bool has_aggre2_clk;
>  	bool auto_boot;
>  
> @@ -63,6 +64,7 @@ struct qcom_adsp {
>  	int proxy_pd_count;
>  
>  	int pas_id;
> +	unsigned int minidump_id;
>  	int crash_reason_smem;
>  	bool has_aggre2_clk;
>  	const char *info_name;
> @@ -81,6 +83,13 @@ struct qcom_adsp {
>  	struct qcom_sysmon *sysmon;
>  };
>  
> +static void adsp_minidump(struct rproc *rproc)
> +{
> +	struct qcom_adsp *adsp = rproc->priv;
> +
> +	qcom_minidump(rproc, adsp->minidump_id);
> +}
> +
>  static int adsp_pds_enable(struct qcom_adsp *adsp, struct device **pds,
>  			   size_t pd_count)
>  {
> @@ -258,6 +267,15 @@ static const struct rproc_ops adsp_ops = {
>  	.panic = adsp_panic,
>  };
>  
> +static const struct rproc_ops adsp_minidump_ops = {
> +	.start = adsp_start,
> +	.stop = adsp_stop,
> +	.da_to_va = adsp_da_to_va,
> +	.load = adsp_load,
> +	.panic = adsp_panic,
> +	.coredump = adsp_minidump,
> +};
> +
>  static int adsp_init_clock(struct qcom_adsp *adsp)
>  {
>  	int ret;
> @@ -383,6 +401,7 @@ static int adsp_probe(struct platform_device *pdev)
>  	struct qcom_adsp *adsp;
>  	struct rproc *rproc;
>  	const char *fw_name;
> +	const struct rproc_ops *ops = &adsp_ops;
>  	int ret;
>  
>  	desc = of_device_get_match_data(&pdev->dev);
> @@ -398,8 +417,11 @@ static int adsp_probe(struct platform_device *pdev)
>  	if (ret < 0 && ret != -EINVAL)
>  		return ret;
>  
> -	rproc = rproc_alloc(&pdev->dev, pdev->name, &adsp_ops,
> -			    fw_name, sizeof(*adsp));
> +	if (desc->minidump_id)
> +		ops = &adsp_minidump_ops;
> +
> +	rproc = rproc_alloc(&pdev->dev, pdev->name, ops, fw_name, sizeof(*adsp));
> +
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;
> @@ -411,6 +433,7 @@ static int adsp_probe(struct platform_device *pdev)
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
