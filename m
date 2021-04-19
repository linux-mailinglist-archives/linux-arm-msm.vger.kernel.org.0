Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8F0364629
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239978AbhDSOdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 10:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239935AbhDSOdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 10:33:00 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD8EC061761
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 07:32:29 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id x20so1849840oix.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4nWRWEmvjlM65gvpUkZGPybpr9Usfroi21CGmSCGgnQ=;
        b=dKL+8Di3Vh6QSg4UqSIU/ueXxsqOGsn3aeAhCMqzWv41AGVzSLAx1Ybl794pFYHlfG
         3TUX1OT/sBVmuDWRZOG8OqLuCv0p08RsLlCGp5JmsYmuOLPShTe2tXYNpIVo1mXY4nPg
         8W94VxamJxc4H91RpnHe8FbFMEXdkhnkEbNv5G3SHB+Pl7IZDP8DwwLKVe0VITYW7Z6O
         hVIKKJzfjEB0Zxd0+uM9b/b76cwX63K/kOrrVNR++7bhgj90+LQIuCzqmjUhKKf0IQiO
         fuCn9ZmD3+G8qXxepR7uHqrVcdxpjY8KisVw5KC7qdNTn9x8SioiKjV/nTVbgTFw1TGR
         C7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4nWRWEmvjlM65gvpUkZGPybpr9Usfroi21CGmSCGgnQ=;
        b=oN1psecPSZ2wMaFRwEhdKCiyHMggr5l5n7OJErzfKwg8fMSPX/DhK3IesTxB0GUyKN
         z4MbxbGSMSznLiOYEsLM1rxPfnBOX3do1+i51a5sPE2qixd22/9X/6EyC/kA2vIf+vVl
         a5bkZejE3FF3K5YpsFfGltv4Aro4C+ix9aWhy0/UMBmjdohRfGgH6Xoie/AAlgTJWAV3
         Nzz2qhwRZrtHiRrSvrllnlB8Y8GPesAj8EHU3wC4GMSYWdTfbiTIHL3bj7X6LSp+t8ai
         8Vy7pJZD/NQ5GWds1AAzTH7klw7f9cYM7yMm5+ZYBKD1OkhYsggxVNCMB0zczIUtzucg
         pWOw==
X-Gm-Message-State: AOAM532U8wQpczBxdI1LikFJ6eR8maeHssUOFdNyWpPu9fsvoQBXozG2
        PQntbDoXmv1O2Bc1XqXHD/udLkJBn+EIQw==
X-Google-Smtp-Source: ABdhPJy3ipgPHZ4m9cveqEO3UoOQ3lZDcUGjgRZW0c3MiRNf9Yn6lUjxnt5tD4qel7g8ZRGUhgynJA==
X-Received: by 2002:aca:408b:: with SMTP id n133mr13137273oia.13.1618842748685;
        Mon, 19 Apr 2021 07:32:28 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g26sm3567915otr.73.2021.04.19.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 07:32:28 -0700 (PDT)
Date:   Mon, 19 Apr 2021 09:32:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     schowdhu@codeaurora.org
Cc:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V3 2/4] soc: qcom: dcc:Add driver support for Data
 Capture and Compare unit(DCC)
Message-ID: <20210419143225.GO1538589@yoga>
References: <cover.1618387606.git.schowdhu@codeaurora.org>
 <59b2e83d5d0f435112f6ae266612ff91c85b120f.1618387606.git.schowdhu@codeaurora.org>
 <87k0p4njni.fsf@kernel.org>
 <ffc2076e7145af0099bab8ef37611556@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffc2076e7145af0099bab8ef37611556@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 19 Apr 05:32 CDT 2021, schowdhu@codeaurora.org wrote:

> On 2021-04-15 12:01, Felipe Balbi wrote:
> > Hi,
> > 
> > Souradeep Chowdhury <schowdhu@codeaurora.org> writes:
> > > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > > index ad675a6..e7f0ccb 100644
> > > --- a/drivers/soc/qcom/Makefile
> > > +++ b/drivers/soc/qcom/Makefile
> > > @@ -1,19 +1,22 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  CFLAGS_rpmh-rsc.o := -I$(src)
> > >  obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
> > > -obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
> > > +obj-$(CONFIG_QCOM_APR) += apr.o
> > >  obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
> > >  obj-$(CONFIG_QCOM_CPR)		+= cpr.o
> > > +obj-$(CONFIG_QCOM_DCC) += dcc.o
> > > +obj-$(CONFIG_QCOM_GENI_SE) +=   qcom-geni-se.o
> > >  obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
> > > +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) += kryo-l2-accessors.o
> > > +obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
> > >  obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
> > >  obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
> > >  obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
> > >  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
> > > -qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> > >  obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
> > >  obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
> > > -qcom_rpmh-y			+= rpmh-rsc.o
> > > -qcom_rpmh-y			+= rpmh.o
> > > +obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
> > > +obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> > >  obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
> > >  obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> > >  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> > > @@ -21,8 +24,6 @@ obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
> > >  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
> > >  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
> > >  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
> > > -obj-$(CONFIG_QCOM_APR) += apr.o
> > > -obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
> > > -obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
> > > -obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
> > > -obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
> > > +qmi_helpers-y   += qmi_encdec.o qmi_interface.o
> > > +qcom_rpmh-y                     += rpmh-rsc.o
> > > +qcom_rpmh-y                     += rpmh.o
> > 
> > why so many changes?
> 
> This has been accidentally sorted based on the config names. Will be fixing
> this in next version of the patch.
> 
> > 
> > > diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> > > new file mode 100644
> > > index 0000000..fcd5580
> > > --- /dev/null
> > > +++ b/drivers/soc/qcom/dcc.c
> > > @@ -0,0 +1,1539 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2015-2021, The Linux Foundation. All rights
> > > reserved.
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cdev.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/fs.h>
> > > +#include <linux/io.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/uaccess.h>
> > > +
> > > +
> > 
> > one blank line is enough
> 
> Ack
> 
> > 
> > > +#define TIMEOUT_US		100
> > > +
> > > +#define dcc_writel(drvdata, val, off)					\
> > > +	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
> > > +#define dcc_readl(drvdata, off)						\
> > > +	readl(drvdata->base + dcc_offset_conv(drvdata, off))
> > > +
> > > +#define dcc_sram_readl(drvdata, off)					\
> > > +	readl(drvdata->ram_base + off)
> > 
> > this would be probably be better as static inlines.
> 
> These are simple read and write operations used in the driver
> which just calls the generic writel and readl function.
> That's why macros have been used here to lesson the overhead
> of an extra function call.

The compiler will realize that your static dcc_sram_readl() is cheaper
to inline than call and do so for you. So you can expect that there's no
difference in the output from the compiler, and if there is then the
compiler knows something that you're overlooking.

Regards,
Bjorn
