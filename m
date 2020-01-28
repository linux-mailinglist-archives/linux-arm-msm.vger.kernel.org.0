Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063EF14C105
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 20:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgA1TcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 14:32:18 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43730 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbgA1TcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 14:32:18 -0500
Received: by mail-qk1-f195.google.com with SMTP id j20so14544736qka.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k16PGj1qUUwziMfMyn3s5qm2lit+ozL0yN14mkzck48=;
        b=VCuq4zNQI3kDYT7a2bEUe7emt8NIOG2ziynarqCfccw/g+7AtujVoRAlWhtU6S6M1a
         NV+pVh9dmzFPKybyCSQ5aS684JZkjevxgY6nX5F/aOosdYj5nlltq4EfLIZS4aONWGqC
         3MuERsazOp//jGrl2k6VckYP5c/IO09HqrOXCHwH8INvTHTf3vdbCBHw5XhqTmf0Yv4y
         1fpEVTrAx14NpqYWJPElYomJel2KlOMrouExyhNavBdJYTgf0K/Uq4kDjlr9evj/LqLy
         wK1P3tLF9OitxoSEF9VCwru8N5lZZGYI4uXOCN0QaUNjS66pXwnAdioIsa+y9WPcAYBk
         rVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k16PGj1qUUwziMfMyn3s5qm2lit+ozL0yN14mkzck48=;
        b=TDR9p9DtgDaqmnhoYLUMnCiyhgxI5y2BKixsSP5LCK0UhyB27ngpyXcIiYS2B8V7HX
         YIviY61DqC3+l2nnVojORMfSx8q7qTR3uu6p80zOKqyXJH0hY7AXd0bt1bZ3C8tCgzum
         E/eMPbABRYXpmE9iJXkP3BsF8w7IABSDlvbKk6wfENIv6dqzNkLkwhwoTaCSrxdSl0Px
         Ne1i18+XYRIFVBf+6JN91BeH3p+UsFPjrVCt8gceeDVXZ1o8DPt6DfnmXBazqk6JBiIC
         YLfCrlmK5qLAGy+xFU0QJQ3pcgZm0mV71NRHt7MLkf5yBLkmUzAifv0NmOlYfMxZovIq
         J3WA==
X-Gm-Message-State: APjAAAXbWJ8He98/VNoJG9nxHNkJIGGLx0ntlbrcY9ueLsvT3095Owia
        /CXqsJCF3wDWDF5lGK7k0mRpz8LT7jTVLl5QV7seXQ==
X-Google-Smtp-Source: APXvYqzjFiCsOsyFZYRIARaX+Cxwp6joYRuRYTlShoJmbGYCjLP+Q9xdZCbgZRx/xiZxfmZYvodgjgU8Xat5WYUFZ3Y=
X-Received: by 2002:a37:9c8a:: with SMTP id f132mr23481931qke.432.1580239937466;
 Tue, 28 Jan 2020 11:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20200113213149.25599-1-mike.leach@linaro.org> <20200113213149.25599-9-mike.leach@linaro.org>
 <396fc3a2-083b-29ef-2bb6-2fca066ea0ef@arm.com>
In-Reply-To: <396fc3a2-083b-29ef-2bb6-2fca066ea0ef@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 28 Jan 2020 19:32:06 +0000
Message-ID: <CAJ9a7VghcnAR7V9moPRAFRCTLvce-8qroZ23pG6Z9B3PSM4feQ@mail.gmail.com>
Subject: Re: [PATCH v8 08/15] coresight: cti: Enable CTI associated with devices.
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On Wed, 15 Jan 2020 at 11:14, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> On 13/01/2020 21:31, Mike Leach wrote:
> > The CoreSight subsystem enables a path of devices from source to sink.
> > Any CTI devices associated with the path devices must be enabled at the
> > same time.
> >
> > This patch adds an associated coresight_device element to the main
> > coresight device structure, and uses this to create associations between
> > the CTI and other devices based on the device tree data. The associated
> > device element is used to enable CTI in conjunction with the path elements.
> >
> > CTI devices are reference counted so where a single CTI is associated with
> > multiple elements on the path, it will be enabled on the first associated
> > device enable, and disabled with the last associated device disable.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   drivers/hwtracing/coresight/coresight-cti.c   | 129 ++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-cti.h   |   1 +
> >   .../hwtracing/coresight/coresight-platform.c  |   1 +
> >   drivers/hwtracing/coresight/coresight-priv.h  |  12 ++
> >   drivers/hwtracing/coresight/coresight.c       |  71 +++++++++-
> >   include/linux/coresight.h                     |   4 +
> >   6 files changed, 213 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > index 77c2af247917..2be1b310e854 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > @@ -4,6 +4,7 @@
> >    * Author: Mike Leach <mike.leach@linaro.org>
> >    */
> >
> > +#include <linux/property.h>
> >   #include "coresight-cti.h"
> >
> >   /**
> > @@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> >       return err;
> >   }
> >
> > +/*
> > + * Look for a matching connection device name in the list of connections.
> > + * If found then swap in the csdev name, set trig con association pointer
> > + * and return found.
> > + */
> > +static bool
> > +cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > +                   struct coresight_device *csdev)
> > +{
> > +     struct cti_trig_con *trig_con;
>
> super minor nit: Please use "struct cti_trig_con *tc;" consistent with
> the naming everywhere else. Helps a lot in reading the code, especially
> which has a lot of different structures.
>
> > +     const char *csdev_name;
> > +
> > +     list_for_each_entry(trig_con, &ctidev->trig_cons, node) {
> > +             if (trig_con->con_dev_name) {
>
> This was allocated via devm_* and ...
>
> > +                     if (!strcmp(node_name, trig_con->con_dev_name)) {
> > +                             /* match: so swap in csdev name & dev */
> > +                             kfree(trig_con->con_dev_name);
>
> ... we free it here using kfree() without devm_ being aware. This could
> cause double-free when the device is removed. This should either be
> devm_kfree() or simply overwritten with the new string and leave
> the device cleanup to free it.
>

Agreed - fixed up in v9.

> > +                             csdev_name = dev_name(&csdev->dev);
> > +                             trig_con->con_dev_name =
> > +                                     kstrdup(csdev_name, GFP_KERNEL);
>
> Please use devm_kstrdup() here on the CTI device to have a consistent
> allocation.
>
>
> > +                             trig_con->con_dev = csdev;
> > +                             return true;
> > +                     }
> > +             }
> > +     }
> > +     return false;
> > +}
> >
>
>
> > +/*
> > + * Removing the associated devices is easier.
> > + * A CTI will not have a value for csdev->ect_dev.
> > + */
> > +void cti_remove_assoc_from_csdev(struct coresight_device *csdev)
> > +{
> > +     struct cti_drvdata *ctidrv;
> > +     struct cti_trig_con *tc;
> > +     struct cti_device *ctidev;
> > +
> > +     mutex_lock(&ect_mutex);
> > +     if (csdev->ect_dev) {
> > +             ctidrv = csdev_to_cti_drvdata(csdev->ect_dev);
> > +             ctidev = &ctidrv->ctidev;
> > +             list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > +                     if (tc->con_dev == csdev->ect_dev) {
> > +                             tc->con_dev = NULL;
>
> Should we clear/free the name too ?
>

Not now devm_ allocation is being used.

> > +                             break;
> > +                     }
> > +             }
> > +             csdev->ect_dev = NULL;
> > +     }
> > +     mutex_unlock(&ect_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(cti_remove_assoc_from_csdev);
> > +
>
> ...
>
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> > index 469a06a1bb78..578d7e9ac67e 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.h
> > +++ b/drivers/hwtracing/coresight/coresight-cti.h
> > @@ -216,6 +216,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> >                     u32 channel_idx);
> >   struct coresight_platform_data *
> >   coresight_cti_get_platform_data(struct device *dev);
> > +const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
> >
> >   /* cti powered and enabled */
> >   static inline bool cti_active(struct cti_config *cfg)
> > diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> > index 43418a2126ff..421d4fc95f41 100644
> > --- a/drivers/hwtracing/coresight/coresight-platform.c
> > +++ b/drivers/hwtracing/coresight/coresight-platform.c
> > @@ -313,6 +313,7 @@ static int of_get_coresight_platform_data(struct device *dev,
> >
> >       return 0;
> >   }
> > +
>
> nit : spurious hunk ?
>
> >   #else
> >   static inline int
> >   of_get_coresight_platform_data(struct device *dev,
>
> Otherwise looks good to me
>
> Suzuki

Thanks.

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
