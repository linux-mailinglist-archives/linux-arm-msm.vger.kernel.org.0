Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C5F2C2B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389360AbgKXPe3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:34:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388503AbgKXPe3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:34:29 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21FA7206D9;
        Tue, 24 Nov 2020 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232068;
        bh=ygx751/q41x3b/CvIyWP1Woh3mwcQeXt++6JywZvU6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aFle7WQI7jsE9JZrNB3KDIzD95MHptn5s/KPWz5sFxniEFQkSwh2srIQNUw4+1yX7
         Xnpzj4luHylIDYA+3PKu0PkacnIIizLDhnNaVeAlOMEvV/yAG+0YDyvkEPWy9h5btR
         Np6wC/xEQxbyGo0sgG2tYkqmYRYCNGEZFNspNr9o=
Date:   Tue, 24 Nov 2020 21:04:22 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, elder@linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: Introduce debugfs interface to smem
Message-ID: <20201124153422.GO8403@vkoul-mobl>
References: <20201123052119.157551-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123052119.157551-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-11-20, 23:21, Bjorn Andersson wrote:
> Every now and then it's convenient to be able to inspect the content of
> SMEM items. Rather than carrying some hack locally let's upstream a
> driver that when inserted exposes a debugfs interface for dumping
> available items.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/soc/qcom/Kconfig        |   7 +++
>  drivers/soc/qcom/Makefile       |   1 +
>  drivers/soc/qcom/smem_debugfs.c | 102 ++++++++++++++++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 drivers/soc/qcom/smem_debugfs.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 3dc3e3d61ea3..7e1dd6b3f33a 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -128,6 +128,13 @@ config QCOM_SMEM
>  	  The driver provides an interface to items in a heap shared among all
>  	  processors in a Qualcomm platform.
>  
> +config QCOM_SMEM_DEBUGFS
> +	tristate "Qualcomm Shared Memory Manager (SMEM) DebugFS interface"
> +	depends on QCOM_SMEM
> +	depends on DEBUG_FS
> +	help
> +	  Provides a debugfs interface for inspecting SMEM.

Do we need additional debugfs entry, maybe better to depend on DEBUG_FS
being enabled and this file part of QCOM_SMEM?

> +
>  config QCOM_SMD_RPM
>  	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 93392d9dc7f7..632eefc5a897 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -15,6 +15,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
>  qcom_rpmh-y			+= rpmh.o
>  obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>  obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> +obj-$(CONFIG_QCOM_SMEM_DEBUGFS) += smem_debugfs.o
>  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
> diff --git a/drivers/soc/qcom/smem_debugfs.c b/drivers/soc/qcom/smem_debugfs.c
> new file mode 100644
> index 000000000000..11ef29a0cada
> --- /dev/null
> +++ b/drivers/soc/qcom/smem_debugfs.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2020, Linaro Ltd.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/qcom/smem.h>
> +
> +struct smem_debugfs {
> +	struct dentry *root;
> +};
> +
> +static int smem_debugfs_item_show(struct seq_file *seq, void *p)
> +{
> +	unsigned long data = (unsigned long)seq->private;
> +	unsigned long item = data & 0xffff;
> +	unsigned long host = data >> 16;
> +	size_t len;
> +	void *ptr;
> +
> +	ptr = qcom_smem_get(host, item, &len);
> +	if (IS_ERR(ptr))
> +		return PTR_ERR(ptr);
> +
> +	seq_hex_dump(seq, "", DUMP_PREFIX_OFFSET, 16, 1, ptr, len, true);
> +
> +	return 0;
> +}
> +
> +static int smem_debugfs_item_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, smem_debugfs_item_show, inode->i_private);
> +}
> +
> +static const struct file_operations smem_debugfs_item_ops = {
> +	.open = smem_debugfs_item_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};

How about using DEFINE_SHOW_ATTRIBUTE() instead? That will help cut down
this boiler plate code..

> +
> +static int smem_debugfs_rescan(struct seq_file *seq, void *p)
> +{
> +	struct dentry *root = seq->private;
> +	unsigned long item;
> +	unsigned long host;
> +	unsigned long data;
> +	char name[10];
> +	char *ptr;
> +
> +	for (host = 0; host < 10; host++) {
> +		for (item = 0; item < 512; item++) {
> +			ptr = qcom_smem_get(host, item, NULL);
> +			if (IS_ERR(ptr))
> +				continue;
> +
> +			sprintf(name, "%ld-%ld", host, item);
> +
> +			data = host << 16 | item;
> +			debugfs_create_file(name, 0400, root,
> +					    (void *)data, &smem_debugfs_item_ops);

So IIUC user invokes scan file which creates additional files, right?
Additional invoke will do that as well..?

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int smem_debugfs_rescan_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, smem_debugfs_rescan, inode->i_private);
> +}
> +
> +static const struct file_operations smem_debugfs_rescan_ops = {
> +	.open = smem_debugfs_rescan_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};

Here as well?

> +
> +static struct dentry *smem_debugfs_root;
> +
> +static int __init qcom_smem_debugfs_init(void)
> +{
> +	smem_debugfs_root = debugfs_create_dir("qcom_smem", NULL);
> +	debugfs_create_file("rescan", 0400, smem_debugfs_root,
> +			    smem_debugfs_root, &smem_debugfs_rescan_ops);
> +
> +	return 0;
> +}
> +
> +static void __exit qcom_smem_debugfs_exit(void)
> +{
> +	debugfs_remove_recursive(smem_debugfs_root);
> +}
> +
> +module_init(qcom_smem_debugfs_init);
> +module_exit(qcom_smem_debugfs_exit);
> +
> +MODULE_DESCRIPTION("Qualcomm SMEM debugfs driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.29.2

-- 
~Vinod
