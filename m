Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79966145A3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 17:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgAVQt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 11:49:26 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34753 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgAVQtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 11:49:25 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so153567lfc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aE9tvRHsNGw+QePOFcIWewZ+atRLpc2aXzwNWF24kPY=;
        b=PcgrxDxXDYKvoiByUVx2zZR+94AGBX9I70hgBN2coxBacYj/mNkQlhgRcjd0KpJl5K
         N1WdO4jEBHzTBZ6KZW3/sCzM4lqlzQp2yy7f3FDe+WfnJz3cSUwWZ/bmWUX7Pp50QNT5
         bJCSfTBun4GodFlYaNKron5tfiSuZ3RE/ojD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aE9tvRHsNGw+QePOFcIWewZ+atRLpc2aXzwNWF24kPY=;
        b=T42ZC7Niz5Fs8AjwVf6vs/5uG8d44NrecSwps1q9ayPM3WDX/rysebZYeGLUkuOE5b
         0ZawSrTsLV+bjTD2TpzmrNDg3OK4WeIK7Rzd5JmlwgX3CjYQOCLSHRsr0MWO9H+6BV8o
         HH72phc3m3kjF7SyLUVdil9aznRCo4+ldLBOktzf30dz4x0FbOH8e9HrJ22XYi8cOl16
         GzJktKiV1LiEZnPEz27ev77GtuPKCIwvg7AQWdn9H6IDM6YCpSO8lTzn7LG45vJ8RhlA
         1ptmE+gO8ukDKxh9sRuW1LiMHdbFeXbCCIlODyv81Rv6Zox1d0kIN18OwtMKJhkSZ69Q
         N0hA==
X-Gm-Message-State: APjAAAWnEM1cgchVA8LEGqScM0JL019c+ViZvpwLXUg6HHuhK65R7hKp
        +Jyr+Q4aw6c1q/5spKFixq6qm164A50=
X-Google-Smtp-Source: APXvYqxryb11Y9fZHwnwNYT9u2xKJrAgO7PBl2R4qVBqE1gnmuNl10PqpwXF8uXwPU9ug50a7c7zwA==
X-Received: by 2002:a19:4208:: with SMTP id p8mr2291662lfa.160.1579711762371;
        Wed, 22 Jan 2020 08:49:22 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id r2sm10297381lff.63.2020.01.22.08.49.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 08:49:21 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id o13so7602829ljg.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 08:49:21 -0800 (PST)
X-Received: by 2002:a2e:b054:: with SMTP id d20mr19683516ljl.190.1579711760442;
 Wed, 22 Jan 2020 08:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20200109211215.18930-1-sibis@codeaurora.org> <20200109211215.18930-3-sibis@codeaurora.org>
 <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
 <dad8936ba4444c3377d777cbbb879dc3@codeaurora.org> <03f83755-bdcc-dc39-0eae-08414751be57@linaro.org>
In-Reply-To: <03f83755-bdcc-dc39-0eae-08414751be57@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 22 Jan 2020 08:48:43 -0800
X-Gmail-Original-Message-ID: <CAE=gft6NMD7+Bt0ab8tnb8r2DjPkb2si7+0-R+f=SYk2YMCX0A@mail.gmail.com>
Message-ID: <CAE=gft6NMD7+Bt0ab8tnb8r2DjPkb2si7+0-R+f=SYk2YMCX0A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 12:20 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> On 1/22/20 08:45, Sibi Sankar wrote:
> > Hey Evan,
> >
> > Thanks for the review!
> >
> > On 2020-01-22 03:03, Evan Green wrote:
> >> On Thu, Jan 9, 2020 at 1:12 PM Sibi Sankar <sibis@codeaurora.org> wrote:
> >>>
> >>> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
> >>> resources of scaling L3 caches. Add a driver to handle bandwidth
> >>> requests to OSM L3 from CPU on SDM845 SoCs.
> >>>
> >>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> >>> ---
> >>>  drivers/interconnect/qcom/Kconfig  |   7 +
> >>>  drivers/interconnect/qcom/Makefile |   2 +
> >>>  drivers/interconnect/qcom/osm-l3.c | 267 +++++++++++++++++++++++++++++
> >>>  3 files changed, 276 insertions(+)
> >>>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
> >>>
> >>> diff --git a/drivers/interconnect/qcom/Kconfig
> >>> b/drivers/interconnect/qcom/Kconfig
> >>> index a9bbbdf7400f9..b94d28e7bf700 100644
> >>> --- a/drivers/interconnect/qcom/Kconfig
> >>> +++ b/drivers/interconnect/qcom/Kconfig
> >>> @@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
> >>>          This is a driver for the Qualcomm Network-on-Chip on msm8974-based
> >>>          platforms.
> >>>
> >>> +config INTERCONNECT_QCOM_OSM_L3
> >>> +       tristate "Qualcomm OSM L3 interconnect driver"
> >>> +       depends on INTERCONNECT_QCOM || COMPILE_TEST
> >>> +       help
> >>> +         Say y here to support the Operating State Manager (OSM) interconnect
> >>> +         driver which controls the scaling of L3 caches on Qualcomm SoCs.
> >>> +
> >>>  config INTERCONNECT_QCOM_QCS404
> >>>         tristate "Qualcomm QCS404 interconnect driver"
> >>>         depends on INTERCONNECT_QCOM
> >>> diff --git a/drivers/interconnect/qcom/Makefile
> >>> b/drivers/interconnect/qcom/Makefile
> >>> index 55ec3c5c89dbd..89fecbd1257c7 100644
> >>> --- a/drivers/interconnect/qcom/Makefile
> >>> +++ b/drivers/interconnect/qcom/Makefile
> >>> @@ -1,5 +1,6 @@
> >>>  # SPDX-License-Identifier: GPL-2.0
> >>>
> >>> +icc-osm-l3-objs                                := osm-l3.o
> >>>  qnoc-msm8974-objs                      := msm8974.o
> >>>  qnoc-qcs404-objs                       := qcs404.o
> >>>  qnoc-sc7180-objs                       := sc7180.o
> >>> @@ -12,6 +13,7 @@ icc-smd-rpm-objs                      := smd-rpm.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
> >>> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
> >>>  obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
> >>> diff --git a/drivers/interconnect/qcom/osm-l3.c
> >>> b/drivers/interconnect/qcom/osm-l3.c
> >>> new file mode 100644
> >>> index 0000000000000..7fde53c70081e
> >>> --- /dev/null
> >>> +++ b/drivers/interconnect/qcom/osm-l3.c
> >>> @@ -0,0 +1,267 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> >>> + *
> >>> + */
> >>> +
> >>> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
> >>> +#include <linux/bitfield.h>
> >>> +#include <linux/clk.h>
> >>> +#include <linux/interconnect-provider.h>
> >>> +#include <linux/io.h>
> >>> +#include <linux/kernel.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/of_device.h>
> >>> +#include <linux/of_platform.h>
> >>> +#include <linux/platform_device.h>
> >>> +
> >>> +#define LUT_MAX_ENTRIES                        40U
> >>> +#define LUT_SRC                                GENMASK(31, 30)
> >>> +#define LUT_L_VAL                      GENMASK(7, 0)
> >>> +#define LUT_ROW_SIZE                   32
> >>> +#define CLK_HW_DIV                     2
> >>> +
> >>> +/* Register offsets */
> >>> +#define REG_ENABLE                     0x0
> >>> +#define REG_FREQ_LUT                   0x110
> >>> +#define REG_PERF_STATE                 0x920
> >>> +
> >>> +#define OSM_L3_MAX_LINKS               1
> >>> +#define SDM845_MAX_RSC_NODES           130
> >>
> >> I'm nervous this define is going to fall out of date with
> >> qcom,sdm845.h. I'm worried someone will end up adding a few more nodes
> >> that were always there but previously hidden from Linux. Can we put
> >> this define in include/dt-bindings/interconnect/qcom,sdm845.h, so at
> >> least when that happens they'll come face to face with this define?
> >> The same comment goes for the SC7180 define in patch 4.
> >
> > Yeah both solution require manual
> > intervention how about we just go
> > with what I proposed below.
> >
> >>
> >> On second thought, this trick only works once. Are we sure there
> >> aren't going to be other drivers that might want to tag on
> >> interconnect nodes as well? How about instead we just add the enum
> >> values below in qcom,sdm845.h as defines?
> >
> > Georgi/Evan,
> > Since qcom,sdm845.h is specific to
> > bindings shouldn't I just create a
> > .h file with all the enums so that
> > it can used across all icc providers
> > on SDM845?
>
> This sounds good to me, unless Evan has any objections.

So is this a new .h file with all the node numbers from qcom,sdm845.h
and your new couple of nodes here? That would be fine with me.

Or is it a .h file with only your two new node numbers? My worry there
is when there are two or three other drivers like this one, it will be
difficult to follow the total order of nodes as "base provider', "L3
driver", "new driver 1", "new driver 2".... any thoughts on how we
might address that?
-Evan
