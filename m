Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C987C36526A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 08:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhDTGhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 02:37:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51010 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhDTGhN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 02:37:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618900602; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gF2N9F5JrCVqmJS3xEbcufJab97Iq2avZ9Jdu5gpc7I=;
 b=fyynRMB8C41g7PxfwNQL9BFJdZFVLFpAAX62TIi9io+ldIL7Clw9Ek1CYBFA/o9kLn/0tqXx
 hh8z23xfgGi4w43MigpYGjSnvCoAFWRxorhnDdz/8xFDRU3kBe0gtFDGmKwC944nJMIAERSQ
 7ceubrZpiIuL3SeR+s2AAQIAv1Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 607e7679febcffa80f1b4dca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 06:36:41
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6885EC4338A; Tue, 20 Apr 2021 06:36:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 71C7EC433F1;
        Tue, 20 Apr 2021 06:36:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Apr 2021 12:06:40 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V3 2/4] soc: qcom: dcc:Add driver support for Data Capture
 and Compare unit(DCC)
In-Reply-To: <20210419143225.GO1538589@yoga>
References: <cover.1618387606.git.schowdhu@codeaurora.org>
 <59b2e83d5d0f435112f6ae266612ff91c85b120f.1618387606.git.schowdhu@codeaurora.org>
 <87k0p4njni.fsf@kernel.org>
 <ffc2076e7145af0099bab8ef37611556@codeaurora.org>
 <20210419143225.GO1538589@yoga>
Message-ID: <f9b28acabea8836b713cab2e0de53542@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-19 20:02, Bjorn Andersson wrote:
> On Mon 19 Apr 05:32 CDT 2021, schowdhu@codeaurora.org wrote:
> 
>> On 2021-04-15 12:01, Felipe Balbi wrote:
>> > Hi,
>> >
>> > Souradeep Chowdhury <schowdhu@codeaurora.org> writes:
>> > > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> > > index ad675a6..e7f0ccb 100644
>> > > --- a/drivers/soc/qcom/Makefile
>> > > +++ b/drivers/soc/qcom/Makefile
>> > > @@ -1,19 +1,22 @@
>> > >  # SPDX-License-Identifier: GPL-2.0
>> > >  CFLAGS_rpmh-rsc.o := -I$(src)
>> > >  obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
>> > > -obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
>> > > +obj-$(CONFIG_QCOM_APR) += apr.o
>> > >  obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
>> > >  obj-$(CONFIG_QCOM_CPR)		+= cpr.o
>> > > +obj-$(CONFIG_QCOM_DCC) += dcc.o
>> > > +obj-$(CONFIG_QCOM_GENI_SE) +=   qcom-geni-se.o
>> > >  obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>> > > +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) += kryo-l2-accessors.o
>> > > +obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>> > >  obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>> > >  obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
>> > >  obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
>> > >  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>> > > -qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>> > >  obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
>> > >  obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
>> > > -qcom_rpmh-y			+= rpmh-rsc.o
>> > > -qcom_rpmh-y			+= rpmh.o
>> > > +obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>> > > +obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>> > >  obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>> > >  obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>> > >  obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>> > > @@ -21,8 +24,6 @@ obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>> > >  obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>> > >  obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
>> > >  obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
>> > > -obj-$(CONFIG_QCOM_APR) += apr.o
>> > > -obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>> > > -obj-$(CONFIG_QCOM_RPMHPD) += rpmhpd.o
>> > > -obj-$(CONFIG_QCOM_RPMPD) += rpmpd.o
>> > > -obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>> > > +qmi_helpers-y   += qmi_encdec.o qmi_interface.o
>> > > +qcom_rpmh-y                     += rpmh-rsc.o
>> > > +qcom_rpmh-y                     += rpmh.o
>> >
>> > why so many changes?
>> 
>> This has been accidentally sorted based on the config names. Will be 
>> fixing
>> this in next version of the patch.
>> 
>> >
>> > > diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
>> > > new file mode 100644
>> > > index 0000000..fcd5580
>> > > --- /dev/null
>> > > +++ b/drivers/soc/qcom/dcc.c
>> > > @@ -0,0 +1,1539 @@
>> > > +// SPDX-License-Identifier: GPL-2.0-only
>> > > +/*
>> > > + * Copyright (c) 2015-2021, The Linux Foundation. All rights
>> > > reserved.
>> > > + */
>> > > +
>> > > +#include <linux/bitfield.h>
>> > > +#include <linux/bitops.h>
>> > > +#include <linux/cdev.h>
>> > > +#include <linux/delay.h>
>> > > +#include <linux/fs.h>
>> > > +#include <linux/io.h>
>> > > +#include <linux/iopoll.h>
>> > > +#include <linux/module.h>
>> > > +#include <linux/of.h>
>> > > +#include <linux/of_device.h>
>> > > +#include <linux/platform_device.h>
>> > > +#include <linux/slab.h>
>> > > +#include <linux/uaccess.h>
>> > > +
>> > > +
>> >
>> > one blank line is enough
>> 
>> Ack
>> 
>> >
>> > > +#define TIMEOUT_US		100
>> > > +
>> > > +#define dcc_writel(drvdata, val, off)					\
>> > > +	writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
>> > > +#define dcc_readl(drvdata, off)						\
>> > > +	readl(drvdata->base + dcc_offset_conv(drvdata, off))
>> > > +
>> > > +#define dcc_sram_readl(drvdata, off)					\
>> > > +	readl(drvdata->ram_base + off)
>> >
>> > this would be probably be better as static inlines.
>> 
>> These are simple read and write operations used in the driver
>> which just calls the generic writel and readl function.
>> That's why macros have been used here to lesson the overhead
>> of an extra function call.
> 
> The compiler will realize that your static dcc_sram_readl() is cheaper
> to inline than call and do so for you. So you can expect that there's 
> no
> difference in the output from the compiler, and if there is then the
> compiler knows something that you're overlooking.

Ack. Will go for static inline here.

> 
> Regards,
> Bjorn
