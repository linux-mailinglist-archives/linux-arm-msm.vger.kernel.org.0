Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025962C2D1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390407AbgKXQj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390057AbgKXQj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:39:29 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E420CC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:39:28 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id n12so16412647otk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RltOMNQblglzvD5sQFGmoGqb874rAeV5SiXL374IQqs=;
        b=D3OtyGBAX3joJzMbS2rJMdlKys+ohh3GLRsgxQR77YbyAh6P6jj6HbORhNbRFZe+2r
         vrixVItHGkEgVb0znEfICfNfOKDRa1+pGmV5N1DOnBSfuGuEIY70UXd9WyQnKJ/131L2
         H7pAfoCcafvAYDH+uJn9X35I2LeQf7/3z1GetOuqPpoFLYmcFyiiWf1VuVDrwunWEwgD
         peUVI+3oJVZBPF6NENGbfONet+G3wrPsjiV3nf3bzdpDXlMpvZk7jzdfYvaijm4VlGj7
         HDUDINmD4qxrExO8oKKdw8tOSYiWvxtM6SJ1YiJ2sDPfXQPWR+wSI0EaPrHXFWm/Zk8F
         NzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RltOMNQblglzvD5sQFGmoGqb874rAeV5SiXL374IQqs=;
        b=kAFftoAzx5PwnBm+OGvCsDeLbmb6JgQjhbaQBHIro3QxDYyqhxOc9YHrddwx7BaQyA
         tf02lqamD9j70eQI1BuFoK5K6AOwwe4c1DodR6Hp6DqKEXqcRixm/wEsKlEBpIt18XDP
         hC2118eNhz8l51+qZ5IHapmqb1tUOaCejDOmpkwEgAfyIAQGDL1C11q6PL2+3D2Qjn1U
         /5DvAVO0paw5FARc8a2sILq7SOQ9uux7CqyKQjv80ZoPCGbOZqnj752hy+oMbHXDbKZH
         TfMT0CSpUK7HoZjNJovNqqmGu040g7t+Bh5IDjVgreSfZQDIa90A7o2x5Uwp84ySJEAd
         qODQ==
X-Gm-Message-State: AOAM530CSTUryaxf0b7Urz0sjyvJuNdxvQtp/Xb4jUzjG8Rkv0GHyYtM
        AfJlyA0vXYIk8U3ZXfe0XvpCOi5I9RpIPw==
X-Google-Smtp-Source: ABdhPJxGZu7A4Arjh/j+gunT3yTLotWwt6/FKyfYmDrmsoedfsKYylgTq71bnyPwMqU51N1NTKTrpw==
X-Received: by 2002:a05:6830:1015:: with SMTP id a21mr4178032otp.143.1606235968144;
        Tue, 24 Nov 2020 08:39:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w6sm8691228otj.12.2020.11.24.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 08:39:26 -0800 (PST)
Date:   Tue, 24 Nov 2020 10:39:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, elder@linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: Introduce debugfs interface to smem
Message-ID: <20201124163925.GN95182@builder.lan>
References: <20201123052119.157551-1-bjorn.andersson@linaro.org>
 <20201124153422.GO8403@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124153422.GO8403@vkoul-mobl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 24 Nov 09:34 CST 2020, Vinod Koul wrote:

> On 22-11-20, 23:21, Bjorn Andersson wrote:
> > Every now and then it's convenient to be able to inspect the content of
> > SMEM items. Rather than carrying some hack locally let's upstream a
> > driver that when inserted exposes a debugfs interface for dumping
> > available items.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/soc/qcom/Kconfig        |   7 +++
> >  drivers/soc/qcom/Makefile       |   1 +
> >  drivers/soc/qcom/smem_debugfs.c | 102 ++++++++++++++++++++++++++++++++
> >  3 files changed, 110 insertions(+)
> >  create mode 100644 drivers/soc/qcom/smem_debugfs.c
> > 
> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > index 3dc3e3d61ea3..7e1dd6b3f33a 100644
> > --- a/drivers/soc/qcom/Kconfig
> > +++ b/drivers/soc/qcom/Kconfig
> > @@ -128,6 +128,13 @@ config QCOM_SMEM
> >  	  The driver provides an interface to items in a heap shared among all
> >  	  processors in a Qualcomm platform.
> >  
> > +config QCOM_SMEM_DEBUGFS
> > +	tristate "Qualcomm Shared Memory Manager (SMEM) DebugFS interface"
> > +	depends on QCOM_SMEM
> > +	depends on DEBUG_FS
> > +	help
> > +	  Provides a debugfs interface for inspecting SMEM.
> 
> Do we need additional debugfs entry, maybe better to depend on DEBUG_FS
> being enabled and this file part of QCOM_SMEM?
> 

We don't need this in any form of production system, so rather than
tainting qcom_smem.c I put it in a separate driver that isn't even
automatically loaded.

> > +
> >  config QCOM_SMD_RPM
> >  	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
> >  	depends on ARCH_QCOM || COMPILE_TEST
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > index 93392d9dc7f7..632eefc5a897 100644
> > --- a/drivers/soc/qcom/Makefile
> > +++ b/drivers/soc/qcom/Makefile
> > @@ -15,6 +15,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
> >  qcom_rpmh-y			+= rpmh.o
> >  obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
> >  obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> > +obj-$(CONFIG_QCOM_SMEM_DEBUGFS) += smem_debugfs.o
> >  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> >  obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
> >  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
> > diff --git a/drivers/soc/qcom/smem_debugfs.c b/drivers/soc/qcom/smem_debugfs.c
> > new file mode 100644
> > index 000000000000..11ef29a0cada
> > --- /dev/null
> > +++ b/drivers/soc/qcom/smem_debugfs.c
> > @@ -0,0 +1,102 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020, Linaro Ltd.
> > + */
> > +
> > +#include <linux/debugfs.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/soc/qcom/smem.h>
> > +
> > +struct smem_debugfs {
> > +	struct dentry *root;
> > +};
> > +
> > +static int smem_debugfs_item_show(struct seq_file *seq, void *p)
> > +{
> > +	unsigned long data = (unsigned long)seq->private;
> > +	unsigned long item = data & 0xffff;
> > +	unsigned long host = data >> 16;
> > +	size_t len;
> > +	void *ptr;
> > +
> > +	ptr = qcom_smem_get(host, item, &len);
> > +	if (IS_ERR(ptr))
> > +		return PTR_ERR(ptr);
> > +
> > +	seq_hex_dump(seq, "", DUMP_PREFIX_OFFSET, 16, 1, ptr, len, true);
> > +
> > +	return 0;
> > +}
> > +
> > +static int smem_debugfs_item_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, smem_debugfs_item_show, inode->i_private);
> > +}
> > +
> > +static const struct file_operations smem_debugfs_item_ops = {
> > +	.open = smem_debugfs_item_open,
> > +	.read = seq_read,
> > +	.llseek = seq_lseek,
> > +	.release = single_release,
> > +};
> 
> How about using DEFINE_SHOW_ATTRIBUTE() instead? That will help cut down
> this boiler plate code..
> 

Forgot about that, thank you.

> > +
> > +static int smem_debugfs_rescan(struct seq_file *seq, void *p)
> > +{
> > +	struct dentry *root = seq->private;
> > +	unsigned long item;
> > +	unsigned long host;
> > +	unsigned long data;
> > +	char name[10];
> > +	char *ptr;
> > +
> > +	for (host = 0; host < 10; host++) {
> > +		for (item = 0; item < 512; item++) {
> > +			ptr = qcom_smem_get(host, item, NULL);
> > +			if (IS_ERR(ptr))
> > +				continue;
> > +
> > +			sprintf(name, "%ld-%ld", host, item);
> > +
> > +			data = host << 16 | item;
> > +			debugfs_create_file(name, 0400, root,
> > +					    (void *)data, &smem_debugfs_item_ops);
> 
> So IIUC user invokes scan file which creates additional files, right?
> Additional invoke will do that as well..?
> 

Yes, so if you run it a second time debugfs_create_file() will fail for
any items that was present during the last invocation.

I did consider adding some logic to keep track of what items we have
already registered, but it is just debugging code and given that after a
few second of operations the set of items has stabilized you typically
don't run this repeatedly.

So I don't think it's worth the memory occupied by an idr or 5000+ bits
in a map.

> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int smem_debugfs_rescan_open(struct inode *inode, struct file *file)
> > +{
> > +	return single_open(file, smem_debugfs_rescan, inode->i_private);
> > +}
> > +
> > +static const struct file_operations smem_debugfs_rescan_ops = {
> > +	.open = smem_debugfs_rescan_open,
> > +	.read = seq_read,
> > +	.llseek = seq_lseek,
> > +	.release = single_release,
> > +};
> 
> Here as well?
> 

Will fix.

Thank you,
Bjorn

> > +
> > +static struct dentry *smem_debugfs_root;
> > +
> > +static int __init qcom_smem_debugfs_init(void)
> > +{
> > +	smem_debugfs_root = debugfs_create_dir("qcom_smem", NULL);
> > +	debugfs_create_file("rescan", 0400, smem_debugfs_root,
> > +			    smem_debugfs_root, &smem_debugfs_rescan_ops);
> > +
> > +	return 0;
> > +}
> > +
> > +static void __exit qcom_smem_debugfs_exit(void)
> > +{
> > +	debugfs_remove_recursive(smem_debugfs_root);
> > +}
> > +
> > +module_init(qcom_smem_debugfs_init);
> > +module_exit(qcom_smem_debugfs_exit);
> > +
> > +MODULE_DESCRIPTION("Qualcomm SMEM debugfs driver");
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 2.29.2
> 
> -- 
> ~Vinod
