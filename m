Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5032C425B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 15:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbgKYOpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 09:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729577AbgKYOpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 09:45:15 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE09C061A4F
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 06:45:15 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id a19so2365705ilm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2020 06:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D4eQ8Jn3Hz9cSPZ/yR1FstpfWl6MeviStWOV4DS4PzE=;
        b=rncwyiYC3LDsijH0n9eccKCbmzMoK6e1LHFqDU0MTa9E/30nU/QSBoNjpWFbScMa8y
         jJQdlLUvBq906wNA7yMUIE/Dx5xpMqgDlM0R9hu+yDWlCAhhHj50Eyt0ijfB8DU3Z/On
         50v4wY1wbWo/JSwfT8A8pm413fzq7PgffZgmmAallNrPSRa7XaYycFS72OTtKMcL5isa
         TY5E48y3FfazIZp7YfgQ+xh721AHurknL/M3OlGDJEngu+ETHpONISQDS0J+MduqNobE
         GEwwwCIKXD1K6qGHiipS0vC0gTloaEqr25MX4n4qiDAYeMWGN35oivF43JzPkLHM/JhP
         gUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D4eQ8Jn3Hz9cSPZ/yR1FstpfWl6MeviStWOV4DS4PzE=;
        b=GDXMXTsNP51Eh6h+RvWMvXfqe2pVwgi81ThZUxjR1Q5OhPrGE5FhmSHsPDlYaNuW+K
         05/0J6z4BMhOw1XPX+82ehZCXyychVEZ7UEs6nRVioZuwLNoLnJGBlbQ5ikeNn6tHOTB
         B7KAfkWmhHKnbSjFss7wWsN1sOxLsf9tEMbXP1BVzHVCkgOpOCYdadb5H+i8SElmWnC6
         jbhnogBPPZHsHvFx3mbPu8RYQEU5lTSbpb1qmypZx9K3+McfvQzl0y+FgYjCi523H1vo
         eU/52I1RI1gSHqd37JkbeW0QryfVkS4VzK780EeYjkmrj5jx5AP+ajUPborND0EDwydB
         Uwow==
X-Gm-Message-State: AOAM533JRzaifPpAJbm1mT2Rxzryr7s3unHAhii1NDwMph/++6ApHhsm
        A88GLY0eUv5sqkdmqgCezNTKdzfCJcIVPw==
X-Google-Smtp-Source: ABdhPJyKa7RJMnezvEwCtVEwQrk3DUDGx8BYzxuZbJm9ENz+QcvG54TGsRXy5LAfxJcRZSeRjo1Nzw==
X-Received: by 2002:a92:5e9a:: with SMTP id f26mr3254609ilg.129.1606315514120;
        Wed, 25 Nov 2020 06:45:14 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id s17sm1496988ilj.25.2020.11.25.06.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 06:45:13 -0800 (PST)
Subject: Re: [PATCH] soc: qcom: Introduce debugfs interface to smem
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
References: <20201123052119.157551-1-bjorn.andersson@linaro.org>
From:   Alex Elder <elder@linaro.org>
Message-ID: <f975978a-3dba-6e64-68e5-2b263ab4ea2f@linaro.org>
Date:   Wed, 25 Nov 2020 08:45:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201123052119.157551-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/22/20 11:21 PM, Bjorn Andersson wrote:
> Every now and then it's convenient to be able to inspect the content of
> SMEM items. Rather than carrying some hack locally let's upstream a
> driver that when inserted exposes a debugfs interface for dumping
> available items.

I have a number of comments.  I think only two are things
you really need to act on, the rest are just some suggestions
to consider.

					-Alex

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/soc/qcom/Kconfig        |   7 +++
>   drivers/soc/qcom/Makefile       |   1 +
>   drivers/soc/qcom/smem_debugfs.c | 102 ++++++++++++++++++++++++++++++++
>   3 files changed, 110 insertions(+)
>   create mode 100644 drivers/soc/qcom/smem_debugfs.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 3dc3e3d61ea3..7e1dd6b3f33a 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -128,6 +128,13 @@ config QCOM_SMEM
>   	  The driver provides an interface to items in a heap shared among all
>   	  processors in a Qualcomm platform.
>   
> +config QCOM_SMEM_DEBUGFS
> +	tristate "Qualcomm Shared Memory Manager (SMEM) DebugFS interface"
> +	depends on QCOM_SMEM
> +	depends on DEBUG_FS
> +	help
> +	  Provides a debugfs interface for inspecting SMEM.
> +
>   config QCOM_SMD_RPM
>   	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
>   	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 93392d9dc7f7..632eefc5a897 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -15,6 +15,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
>   qcom_rpmh-y			+= rpmh.o
>   obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> +obj-$(CONFIG_QCOM_SMEM_DEBUGFS) += smem_debugfs.o
>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
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

This type is never used, so get rid of it.

> +
> +static int smem_debugfs_item_show(struct seq_file *seq, void *p)
> +{
> +	unsigned long data = (unsigned long)seq->private;
> +	unsigned long item = data & 0xffff;
> +	unsigned long host = data >> 16;

You extract the item and host from the data pointer here,
and encode it below.  Maybe you could encapsulate those
two operations into a pair of trivial helper functions.
When I see something like this I wonder about why 16 bits
is the right number, and having little functions like that
provides a place to explain it.

Also, as I will say again below, I prefer not to see raw
numbers in the code without explanation, i.e., go symbolic:

	unsigned long host = data >> ITEM_SHIFT & HOST_MASK;
	unsigned long item = data & ITEM_MASK;

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
> +

You could mention that SMEM entries never go away, and
that you intentionally ignore the EEXIST error that comes
back from failed attempts to re-create existing entries
I hope you aren't spewing errors for these (look at
start_creating() in "fs/debugfs/inode.c").  I agree
with your effort to avoid tracking all item files.

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

It would be nice if SMEM_HOST_COUNT were exposed so you could
use it here.  I prefer something symbolic anyway.

> +		for (item = 0; item < 512; item++) {

Same comment, about SMEM_ITEM_COUNT.

> +			ptr = qcom_smem_get(host, item, NULL);
> +			if (IS_ERR(ptr))
> +				continue;
> +
> +			sprintf(name, "%ld-%ld", host, item);

Use %lu for unsigned.

Is there any way you can think of that you can indicate which
items are fixed, and which are dynamically allocated?  (There
are only 8, so it's not that important.)

What about items in the global partition?  (I'm forgetting
some of the details about this right now, I'm just scanning
through the SMEM code as I review this.  So maybe this
comment doesn't make sense.)

> +
> +			data = host << 16 | item > +			debugfs_create_file(name, 0400, root,
> +					    (void *)data, &smem_debugfs_item_ops);
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
> 

