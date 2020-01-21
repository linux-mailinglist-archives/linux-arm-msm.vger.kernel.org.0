Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973E614467F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 22:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgAUVeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 16:34:07 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34166 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728831AbgAUVeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 16:34:04 -0500
Received: by mail-lf1-f68.google.com with SMTP id l18so3611828lfc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5Zn66Cy2aTWAijjZ/0GebtuhocaBUP6kt+zrFUq/wv8=;
        b=SYFQZVv8gCQrkHK4/E/8BOcwBl3dYIR3X+rEbA3hPB/QTQK3IO0uhLPdNuHjYdUvZR
         wifBvVlqUdBTuKG2mAmbQLWTwjSno6dZy1gXc0dbN4HlC1hD7PUquElsxQx2MUjXWMs+
         NvIFsFdRQwTxOt8iqMLPq5yoW5hFWKTUzZf1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5Zn66Cy2aTWAijjZ/0GebtuhocaBUP6kt+zrFUq/wv8=;
        b=Nazt+mCiGfT4BvAgrOugOnmWOOwjXMZCCfuz0OR3BhjbA9PYF/GP+dy6F2Os0K7m3j
         pP3Mgb86ufevbWjKsGd5ilF9pctTVdbx9FVE/plpinpjQsY9ZTRV3RuMTgsAN5rqnaxD
         f+0+nflck+0BZWPXFx6Eo+3nZenysOFH0/vYGbuPUJ4uN+EDtMZda80ITUmMv6o2qHBP
         rO1wuory22WPakfphUmZxYTP4CZISl2ot+GRZXYq4IqVigRFqxX4s1ajVxooyi//FZM/
         aOdmggCdbzY2JBarSzGKCqI7K93kPVld4RwR8YTyDcdWzOmr2qiZuZ3F8e09YRYZtKeb
         UWmw==
X-Gm-Message-State: APjAAAWD/AgGy3l2MqXe4z/dT5gZ9EwrFiBt52vjDNjBG7A39OQXM5Kd
        I3RiJZd2XML9VhUtKzaY9hZvpYd5Jo8=
X-Google-Smtp-Source: APXvYqxZwQg6fbaVqBc6Uz3peWhqntSCkM3mW50oquIyOW8Ir/OJX0m6sHZY622jqVD4RtN3FVIPtg==
X-Received: by 2002:a19:9d5:: with SMTP id 204mr3672941lfj.120.1579642441023;
        Tue, 21 Jan 2020 13:34:01 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id f22sm19299846ljh.74.2020.01.21.13.33.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 13:33:59 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id o13so4422456ljg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 13:33:59 -0800 (PST)
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr3707946ljj.253.1579642439010;
 Tue, 21 Jan 2020 13:33:59 -0800 (PST)
MIME-Version: 1.0
References: <20200109211215.18930-1-sibis@codeaurora.org> <20200109211215.18930-3-sibis@codeaurora.org>
In-Reply-To: <20200109211215.18930-3-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 21 Jan 2020 13:33:22 -0800
X-Gmail-Original-Message-ID: <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
Message-ID: <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
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

On Thu, Jan 9, 2020 at 1:12 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
> resources of scaling L3 caches. Add a driver to handle bandwidth
> requests to OSM L3 from CPU on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/interconnect/qcom/Kconfig  |   7 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/osm-l3.c | 267 +++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
>
> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
> index a9bbbdf7400f9..b94d28e7bf700 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
>          This is a driver for the Qualcomm Network-on-Chip on msm8974-based
>          platforms.
>
> +config INTERCONNECT_QCOM_OSM_L3
> +       tristate "Qualcomm OSM L3 interconnect driver"
> +       depends on INTERCONNECT_QCOM || COMPILE_TEST
> +       help
> +         Say y here to support the Operating State Manager (OSM) interconnect
> +         driver which controls the scaling of L3 caches on Qualcomm SoCs.
> +
>  config INTERCONNECT_QCOM_QCS404
>         tristate "Qualcomm QCS404 interconnect driver"
>         depends on INTERCONNECT_QCOM
> diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
> index 55ec3c5c89dbd..89fecbd1257c7 100644
> --- a/drivers/interconnect/qcom/Makefile
> +++ b/drivers/interconnect/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> +icc-osm-l3-objs                                := osm-l3.o
>  qnoc-msm8974-objs                      := msm8974.o
>  qnoc-qcs404-objs                       := qcs404.o
>  qnoc-sc7180-objs                       := sc7180.o
> @@ -12,6 +13,7 @@ icc-smd-rpm-objs                      := smd-rpm.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
> new file mode 100644
> index 0000000000000..7fde53c70081e
> --- /dev/null
> +++ b/drivers/interconnect/qcom/osm-l3.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + *
> + */
> +
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +#define LUT_MAX_ENTRIES                        40U
> +#define LUT_SRC                                GENMASK(31, 30)
> +#define LUT_L_VAL                      GENMASK(7, 0)
> +#define LUT_ROW_SIZE                   32
> +#define CLK_HW_DIV                     2
> +
> +/* Register offsets */
> +#define REG_ENABLE                     0x0
> +#define REG_FREQ_LUT                   0x110
> +#define REG_PERF_STATE                 0x920
> +
> +#define OSM_L3_MAX_LINKS               1
> +#define SDM845_MAX_RSC_NODES           130

I'm nervous this define is going to fall out of date with
qcom,sdm845.h. I'm worried someone will end up adding a few more nodes
that were always there but previously hidden from Linux. Can we put
this define in include/dt-bindings/interconnect/qcom,sdm845.h, so at
least when that happens they'll come face to face with this define?
The same comment goes for the SC7180 define in patch 4.

On second thought, this trick only works once. Are we sure there
aren't going to be other drivers that might want to tag on
interconnect nodes as well? How about instead we just add the enum
values below in qcom,sdm845.h as defines?

-Evan
