Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2425145C34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 20:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgAVTEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 14:04:49 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:41396 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728988AbgAVTEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 14:04:49 -0500
Received: by mail-io1-f65.google.com with SMTP id m25so348988ioo.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ng4dIuUg5yRz0hwu5xj9+THWjTPrMNRdcfA9pUbwfPM=;
        b=gud8B4T6J/lhDZTcVVFxBnmPb1Hxjv6kX7chQ4j7pKsmrsqlKqYL1hI9pQVaRmnorG
         jTlx9RSgNtL1F45UcWFPDiSa7cUY7SoEvYpcjK6QlDD3B3A+97Brf3ctF1G/qYdTuBo3
         wyWPNKrbmlAS8IDiw7CyhEgmQTpvNilQYpUJmRw0UD6A0aIC4ONeYEVUosVfOIzY/DzU
         RfdvKnP3MzYYm6surnK/AzS1okdou1vAkAQyZp9Dcei52jgIiPdiD4mzP+HAR7jR5b0h
         IXXrTzrSbgy5FV8O1lUFLkjO4g/CPZxAFKqQPdOPcu8Toi/uIFldL1KOch1EfBUYGJ+M
         LayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ng4dIuUg5yRz0hwu5xj9+THWjTPrMNRdcfA9pUbwfPM=;
        b=ccAUa8X48F7FgROBkd9umcZ1Dn0eYPCrA0qUcfnC+WFLaHrxBtpsZrdS9lk2y+JVPo
         zJZUXjwCO+v9E7orjgMhaEpiL9ndpZRGvtQTEsvnQRGgurJ6zQNwZMp7Ih8BI5IVBPYk
         h5tdGLAUwHdpfSYmbc0uQoBngcFapyCMQvSwhlAovQnJUyzr++PgAPonzNcv5KO+5Per
         NKdD2ARMknDDwkVCx9oRQ0mf8niBpiS0Wc/klTYCzlcVlEOmA3PTqtF2IZMn72swt6b2
         1GtRoEruEUIkXLJrm24LzhQ/1xwP1Sq0wqBD0kWZ/ZEUlDj48eZHqZY/gVi/kk/wk016
         Njaw==
X-Gm-Message-State: APjAAAW3KNEtBgEkxxoMjs5b7xX+vQ17zu3lT39fgYN0CzoxpkbCuwtw
        WhxG3Ugc4IPJzter6rUx9/k+QZAaQx+2lLh053yS1w==
X-Google-Smtp-Source: APXvYqwf6PAMb4ScVoElrxpyf7o/5IIHXK+WCHRLhV1wpnTLUXwChv+RN3SpiQJevfhhlNBWO4M4MNq1mpP61KJxELE=
X-Received: by 2002:a02:864b:: with SMTP id e69mr8235435jai.83.1579719888182;
 Wed, 22 Jan 2020 11:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org> <20200110211846.GA11555@xps15>
 <20200122020234.GT1511@yoga>
In-Reply-To: <20200122020234.GT1511@yoga>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 22 Jan 2020 12:04:37 -0700
Message-ID: <CANLsYkykgpLAQqG3Tk73HFR9+Uadr2caiBx-6op5Cyv4BBcPFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jan 2020 at 19:02, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 10 Jan 13:18 PST 2020, Mathieu Poirier wrote:
> > On Thu, Dec 26, 2019 at 09:32:09PM -0800, Bjorn Andersson wrote:
> [..]
> > > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> > > new file mode 100644
> > > index 000000000000..b0897ae9eae5
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/qcom_pil_info.c
> > > @@ -0,0 +1,150 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2019 Linaro Ltd.
> > > + */
> > > +#include <linux/module.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/slab.h>
> >
> > These should be in alphabetical order if there is no depencencies
> > between them, something checkpatch complains about.
> >
>
> Of course.
>
> > > +
> > > +struct pil_reloc_entry {
> > > +   char name[8];
> >
> > Please add a #define for the name length and reuse it in qcom_pil_info_store()
> >
>
> Ok
>
> [..]
> > > +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
> > > +{
> > > +   struct pil_reloc_entry *entry;
> > > +   int idx = -1;
> > > +   int i;
> > > +
> > > +   mutex_lock(&reloc_mutex);
> > > +   if (!_reloc)
> >
> > Since it is available, I would use function qcom_pil_info_available().  Also
> > checkpatch complains about indentation problems related to the 'if' condition
> > but I can't see what makes it angry.
> >
>
> Sure thing, and I'll double check the indentation.
>
> > > +           goto unlock;
> > > +
> > > +   for (i = 0; i < PIL_INFO_ENTRIES; i++) {
> > > +           if (!_reloc->entries[i].name[0]) {
> > > +                   if (idx == -1)
> > > +                           idx = i;
> > > +                   continue;
> > > +           }
> > > +
> > > +           if (!strncmp(_reloc->entries[i].name, image, 8)) {
> > > +                   idx = i;
> > > +                   goto found;
> > > +           }
> > > +   }
> > > +
> > > +   if (idx == -1) {
> > > +           dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> > > +           goto unlock;
> >
> > Given how this function is used in the next patch I think an error should be
> > reported to the caller.
> >
>
> Just to clarify, certain global errors will cause the entire device to
> be reset and allow memory contents to be extracted for analysis in post
> mortem tools. This patch ensures that this information contains
> (structured) information about where each remote processor is loaded.
> Afaict the purpose of propagating errors from this function would be for
> the caller to abort the launching of a remote processor.
>
> I think it's better to take the risk of having insufficient data for the
> post mortem tools than to fail booting a remote processor for a reason
> that won't affect normal operation.

I understand the reasoning.  In that case it is probably best to let
the caller decide what to do with the returned error than deal with it
locally, especially since this is an exported function.  When using
qcom_pil_info_store(), I would write a comment that justifies the
reason for ignoring the return value (what you have above is quite
good).  Otherwise it is just a matter of time before automated tools
pickup on the anomaly and send patches to fix it.

Thanks,
Mathieu

>
> > > +   }
> > > +
> > > +found:
> > > +   entry = &_reloc->entries[idx];
> > > +   stracpy(entry->name, image);
> >
> > Function stracpy() isn't around in mainline.
> >
>
> Good catch, I'll spin this with a strscpy() to avoid build errors until
> stracpy lands.
>
> > > +   entry->base = base;
> > > +   entry->size = size;
> > > +
> > > +   regmap_bulk_write(_reloc->map, _reloc->offset + idx * sizeof(*entry),
> > > +                     entry, sizeof(*entry) / _reloc->val_bytes);
> >
> > Same here - the error code should be handled and reported to the caller.
> >
>
> Will undo the "allocation" of _reloc->entries[idx] on failure, let me
> know what you think about my reasoning above regarding propagating this
> error (or in particular acting upon the propagated value).
>
> > > +
> > > +unlock:
> > > +   mutex_unlock(&reloc_mutex);
> > > +}
> > > +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
> [..]
> > > +static int pil_reloc_probe(struct platform_device *pdev)
> > > +{
> > > +   struct pil_reloc *reloc;
> > > +
> > > +   reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> > > +   if (!reloc)
> > > +           return -ENOMEM;
> > > +
> > > +   reloc->dev = &pdev->dev;
> > > +   reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> > > +   if (IS_ERR(reloc->map))
> > > +           return PTR_ERR(reloc->map);
> > > +
> > > +   if (of_property_read_u32(pdev->dev.of_node, "offset", &reloc->offset))
> > > +           return -EINVAL;
> > > +
> > > +   reloc->val_bytes = regmap_get_val_bytes(reloc->map);
> > > +   if (reloc->val_bytes < 0)
> > > +           return -EINVAL;
> > > +
> > > +   regmap_bulk_write(reloc->map, reloc->offset, reloc->entries,
> > > +                     sizeof(reloc->entries) / reloc->val_bytes);
> >
> > Error code handling.
> >
>
> Yes, that makes sense.
>
> Thanks for the review Mathieu!
>
> Regards,
> Bjorn
>
> > Thanks,
> > Mathieu
> >
> > > +
> > > +   mutex_lock(&reloc_mutex);
> > > +   _reloc = reloc;
> > > +   mutex_unlock(&reloc_mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int pil_reloc_remove(struct platform_device *pdev)
> > > +{
> > > +   mutex_lock(&reloc_mutex);
> > > +   _reloc = NULL;
> > > +   mutex_unlock(&reloc_mutex);
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static const struct of_device_id pil_reloc_of_match[] = {
> > > +   { .compatible = "qcom,pil-reloc-info" },
> > > +   {}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
> > > +
> > > +static struct platform_driver pil_reloc_driver = {
> > > +   .probe = pil_reloc_probe,
> > > +   .remove = pil_reloc_remove,
> > > +   .driver = {
> > > +           .name = "qcom-pil-reloc-info",
> > > +           .of_match_table = pil_reloc_of_match,
> > > +   },
> > > +};
> > > +module_platform_driver(pil_reloc_driver);
> > > +
> > > +MODULE_DESCRIPTION("Qualcomm PIL relocation info");
> > > +MODULE_LICENSE("GPL v2");
> > > diff --git a/drivers/remoteproc/qcom_pil_info.h b/drivers/remoteproc/qcom_pil_info.h
> > > new file mode 100644
> > > index 000000000000..0372602fae1d
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/qcom_pil_info.h
> > > @@ -0,0 +1,8 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef __QCOM_PIL_INFO_H__
> > > +#define __QCOM_PIL_INFO_H__
> > > +
> > > +void qcom_pil_info_store(const char *image, phys_addr_t base, size_t size);
> > > +bool qcom_pil_info_available(void);
> > > +
> > > +#endif
> > > --
> > > 2.24.0
> > >
