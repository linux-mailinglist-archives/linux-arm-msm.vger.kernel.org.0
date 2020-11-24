Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC412C2DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389854AbgKXREY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:04:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:36466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389441AbgKXREX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:04:23 -0500
Received: from localhost (unknown [122.167.149.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 92A6A206E5;
        Tue, 24 Nov 2020 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606237462;
        bh=Fd1O/rbyizndm4PeYTfv2bKz7c/kDJz294v3zubCqNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ytyDE+sR042Y44CDa3xEEeOooOytlK/9Rn0uToaVb1diWa/xSBpHyX/qSg2FxM4Jb
         nNwhgtY3HwY7SE/2jgp9FYU2mfP/rdoD42Wqfz5SIN0dwl/pemDvWyIgd5EcaNugzn
         TD46D1OhsbVzrSoM6PmQdD4u3R1eSEp5jnmPLSdE=
Date:   Tue, 24 Nov 2020 22:34:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, elder@linaro.org,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: Introduce debugfs interface to smem
Message-ID: <20201124170417.GP8403@vkoul-mobl>
References: <20201123052119.157551-1-bjorn.andersson@linaro.org>
 <20201124153422.GO8403@vkoul-mobl>
 <20201124163925.GN95182@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124163925.GN95182@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-11-20, 10:39, Bjorn Andersson wrote:
> On Tue 24 Nov 09:34 CST 2020, Vinod Koul wrote:
> 
> > On 22-11-20, 23:21, Bjorn Andersson wrote:
> > > Every now and then it's convenient to be able to inspect the content of
> > > SMEM items. Rather than carrying some hack locally let's upstream a
> > > driver that when inserted exposes a debugfs interface for dumping
> > > available items.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  drivers/soc/qcom/Kconfig        |   7 +++
> > >  drivers/soc/qcom/Makefile       |   1 +
> > >  drivers/soc/qcom/smem_debugfs.c | 102 ++++++++++++++++++++++++++++++++
> > >  3 files changed, 110 insertions(+)
> > >  create mode 100644 drivers/soc/qcom/smem_debugfs.c
> > > 
> > > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> > > index 3dc3e3d61ea3..7e1dd6b3f33a 100644
> > > --- a/drivers/soc/qcom/Kconfig
> > > +++ b/drivers/soc/qcom/Kconfig
> > > @@ -128,6 +128,13 @@ config QCOM_SMEM
> > >  	  The driver provides an interface to items in a heap shared among all
> > >  	  processors in a Qualcomm platform.
> > >  
> > > +config QCOM_SMEM_DEBUGFS
> > > +	tristate "Qualcomm Shared Memory Manager (SMEM) DebugFS interface"
> > > +	depends on QCOM_SMEM
> > > +	depends on DEBUG_FS
> > > +	help
> > > +	  Provides a debugfs interface for inspecting SMEM.
> > 
> > Do we need additional debugfs entry, maybe better to depend on DEBUG_FS
> > being enabled and this file part of QCOM_SMEM?
> > 
> 
> We don't need this in any form of production system, so rather than
> tainting qcom_smem.c I put it in a separate driver that isn't even
> automatically loaded.

Debugfs in production :D

I would leave it to you to decide.. lazy me needs to select another
option!

> > > +static int smem_debugfs_rescan(struct seq_file *seq, void *p)
> > > +{
> > > +	struct dentry *root = seq->private;
> > > +	unsigned long item;
> > > +	unsigned long host;
> > > +	unsigned long data;
> > > +	char name[10];
> > > +	char *ptr;
> > > +
> > > +	for (host = 0; host < 10; host++) {
> > > +		for (item = 0; item < 512; item++) {
> > > +			ptr = qcom_smem_get(host, item, NULL);
> > > +			if (IS_ERR(ptr))
> > > +				continue;
> > > +
> > > +			sprintf(name, "%ld-%ld", host, item);
> > > +
> > > +			data = host << 16 | item;
> > > +			debugfs_create_file(name, 0400, root,
> > > +					    (void *)data, &smem_debugfs_item_ops);
> > 
> > So IIUC user invokes scan file which creates additional files, right?
> > Additional invoke will do that as well..?
> > 
> 
> Yes, so if you run it a second time debugfs_create_file() will fail for
> any items that was present during the last invocation.
> 
> I did consider adding some logic to keep track of what items we have
> already registered, but it is just debugging code and given that after a
> few second of operations the set of items has stabilized you typically
> don't run this repeatedly.
> 
> So I don't think it's worth the memory occupied by an idr or 5000+ bits
> in a map.

Okay sounds good to me

-- 
~Vinod
