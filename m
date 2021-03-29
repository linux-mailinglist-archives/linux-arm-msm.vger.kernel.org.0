Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E8134D8CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 22:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhC2UGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 16:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231725AbhC2UFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 16:05:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26D6C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 13:05:48 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id v10so5234964pfn.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 13:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=volifUdZnyXtw9Vknx18Dn/f9+QqahAZPCnHGVaMx6I=;
        b=ggMW5XzXdlmWwWxvMQ1FuCT8nalT//RzySmP1KDwLv4rkHSrm6HaY0OdaJimZRlHFl
         yqo7J0XjuzTZPw/nVYsp3mGyxwomHoyXLVIMc+D51kbaLzVTXUNOw97EZnn6ltxhMMh7
         0fFpPJ5tjKIUDbQhY1mwJrAMZdoJU/aNZ5iWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=volifUdZnyXtw9Vknx18Dn/f9+QqahAZPCnHGVaMx6I=;
        b=S9qSFUu8noKB+/DTxO/qrGpgChEHd8n3gMF0nXKN79zGQayEN+Za09Am4PviFWDwVg
         j9/VQvEGH3AOIu3kz6jlu1c4bn1Os39ltt2/pGVH68Sr3xFjoUuhdJG3AoneISv7O0dA
         3KbW2KT//kslM7NzcmsDWnUrQsB2db/52FYMA0W39NbL3sgIyCk8qJzDLvLAUlXodfSj
         GzyztLCumfP0mNVIAjEFk9hJTq8W/LkRxW2G0ejQeO7+QiGeZh8AciIQQT6eRBrC2yS/
         4oyHsYy5xNdg9vT99SkhT9RM+Odq3R9rdtTTdaSsYeeMZOO1TBysTj8r7gcmV36FToKf
         KqNQ==
X-Gm-Message-State: AOAM5334mj6byrZUKi5RRUrdKfWa+DqurE5Y1wW6XdlqbamEOYmrSCSX
        FO5TGuEP/+gf6TJ8jINXazd37A==
X-Google-Smtp-Source: ABdhPJwNUfVnb6eInaAUzfW5o/BdacS0MSvZj3UkuoHf4nd4eZlZ66v0/XoGSTSE5NMtDH0TAvB0tQ==
X-Received: by 2002:a65:5088:: with SMTP id r8mr9354552pgp.434.1617048347974;
        Mon, 29 Mar 2021 13:05:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
        by smtp.gmail.com with ESMTPSA id o197sm18424205pfd.42.2021.03.29.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 13:05:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dc058ed6d05f1aec4e97fee6d4c007abdf3b54a0.1616651305.git.schowdhu@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org> <dc058ed6d05f1aec4e97fee6d4c007abdf3b54a0.1616651305.git.schowdhu@codeaurora.org>
Subject: Re: [PATCH V2 2/5] soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Date:   Mon, 29 Mar 2021 13:05:45 -0700
Message-ID: <161704834593.3012082.17486072850156076295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Souradeep Chowdhury (2021-03-25 01:02:33)
> The DCC is a DMA Engine designed to capture and store data
> during system crash or software triggers.The DCC operates
> based on user inputs via the sysfs interface.The user gives
> addresses as inputs and these addresses are stored in the
> form of linkedlists.In case of a system crash or a manual
> software trigger by the user through the sysfs interface,
> the dcc captures and stores the values at these addresses.
> This patch contains the driver which has all the methods
> pertaining to the sysfs interface, auxiliary functions to
> support all the four fundamental operations of dcc namely
> read, write, first read then write and loop.The probe method
> here instantiates all the resources necessary for dcc to
> operate mainly the dedicated dcc sram where it stores the
> values.The DCC driver can be used for debugging purposes
> without going for a reboot since it can perform manual
> triggers.
>=20
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig  |    8 +
>  drivers/soc/qcom/Makefile |    1 +
>  drivers/soc/qcom/dcc.c    | 1549 +++++++++++++++++++++++++++++++++++++++=
++++++

Where's the document for various sysfs attributes in Documentation/ABI?

>  3 files changed, 1558 insertions(+)
>  create mode 100644 drivers/soc/qcom/dcc.c
>=20
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 79b568f..8819e0b 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -69,6 +69,14 @@ config QCOM_LLCC
>           SDM845. This provides interfaces to clients that use the LLCC.
>           Say yes here to enable LLCC slice driver.
>=20
> +config QCOM_DCC
> +       tristate "Qualcomm Technologies, Inc. Data Capture and Compare en=
gine driver"

Put (DCC) after Compare?

> +       depends on ARCH_QCOM || COMPILE_TEST
> +       help
> +         This option enables driver for Data Capture and Compare engine.=
 DCC
> +         driver provides interface to configure DCC block and read back
> +         captured data from DCC's internal SRAM.
> +
>  config QCOM_KRYO_L2_ACCESSORS
>         bool
>         depends on ARCH_QCOM && ARM64 || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6..1b00870 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -26,3 +26,4 @@ obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
>  obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D        kryo-l2-accessors.o
> +obj-$(CONFIG_QCOM_DCC) +=3D dcc.o

Can this be sorted based on config or file name instead of adding to the
end of the file and leading to endless conflicts?

> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> new file mode 100644
> index 0000000..a55d8ca7
> --- /dev/null
> +++ b/drivers/soc/qcom/dcc.c
> @@ -0,0 +1,1549 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/cdev.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +
> +#define TIMEOUT_US             100
> +
> +#define dcc_writel(drvdata, val, off)                                  \
> +       writel((val), drvdata->base + dcc_offset_conv(drvdata, off))
> +#define dcc_readl(drvdata, off)                                         =
       \
> +       readl(drvdata->base + dcc_offset_conv(drvdata, off))
> +
> +#define dcc_sram_readl(drvdata, off)                                   \
> +       readl(drvdata->ram_base + off)
> +
> +#define DCC_SRAM_NODE "dcc_sram"
> +
> +/* DCC registers */
> +#define DCC_HW_INFO                    0x04
> +#define DCC_LL_NUM_INFO                        0x10
> +#define DCC_STATUS                     0x1C
> +#define DCC_LL_LOCK(m)                 (0x34 + 0x80 * m)
> +#define DCC_LL_CFG(m)                  (0x38 + 0x80 * m)
> +#define DCC_LL_BASE(m)                 (0x3c + 0x80 * m)
> +#define DCC_FD_BASE(m)                 (0x40 + 0x80 * m)
> +#define DCC_LL_TIMEOUT(m)              (0x44 + 0x80 * m)
> +#define DCC_LL_INT_ENABLE(m)           (0x4C + 0x80 * m)
> +#define DCC_LL_INT_STATUS(m)           (0x50 + 0x80 * m)
> +#define DCC_LL_SW_TRIGGER(m)           (0x60 + 0x80 * m)
> +#define DCC_LL_BUS_ACCESS_STATUS(m)    (0x64 + 0x80 * m)
> +
> +#define DCC_MAP_LEVEL1                 0x18
> +#define DCC_MAP_LEVEL2                 0x34
> +#define DCC_MAP_LEVEL3                 0x4C
> +
> +#define DCC_MAP_OFFSET1                        0x10
> +#define DCC_MAP_OFFSET2                        0x18
> +#define DCC_MAP_OFFSET3                        0x1C
> +#define DCC_MAP_OFFSET4                        0x8
> +
> +#define DCC_FIX_LOOP_OFFSET            16
> +#define DCC_VER_INFO_BIT               9
> +
> +#define DCC_READ                       0
> +#define DCC_WRITE                      1
> +#define DCC_LOOP                       2
> +#define DCC_READ_WRITE                 3
> +
> +#define MAX_DCC_OFFSET                 GENMASK(9, 2)
> +#define MAX_DCC_LEN                    GENMASK(6, 0)
> +#define MAX_LOOP_CNT                   GENMASK(7, 0)
> +
> +#define DCC_ADDR_DESCRIPTOR            0x00
> +#define DCC_LOOP_DESCRIPTOR            BIT(30)
> +#define DCC_RD_MOD_WR_DESCRIPTOR       BIT(31)
> +#define DCC_LINK_DESCRIPTOR            GENMASK(31, 30)
> +
> +#define DCC_READ_IND                   0x00
> +#define DCC_WRITE_IND                  (BIT(28))
> +
> +#define DCC_AHB_IND                    0x00
> +#define DCC_APB_IND                    BIT(29)
> +
> +#define DCC_MAX_LINK_LIST              8
> +#define DCC_INVALID_LINK_LIST          GENMASK(7, 0)
> +
> +#define DCC_VER_MASK1                  GENMASK(6, 0)
> +#define DCC_VER_MASK2                  GENMASK(5, 0)
> +
> +#define DCC_RD_MOD_WR_ADDR              0xC105E
> +
> +struct qcom_dcc_config {
> +       const int dcc_ram_offset;

Why const here? The container structure can be const and then this is
easier to read.

> +};
> +
> +enum dcc_descriptor_type {
> +       DCC_ADDR_TYPE,
> +       DCC_LOOP_TYPE,
> +       DCC_READ_WRITE_TYPE,
> +       DCC_WRITE_TYPE
> +};
> +
> +enum dcc_mem_map_ver {
> +       DCC_MEM_MAP_VER1 =3D 1,
> +       DCC_MEM_MAP_VER2 =3D 2,
> +       DCC_MEM_MAP_VER3 =3D 3
> +};
> +
> +struct dcc_config_entry {
> +       u32                             base;
> +       u32                             offset;
> +       u32                             len;
> +       u32                             index;
> +       u32                             loop_cnt;
> +       u32                             write_val;
> +       u32                             mask;
> +       bool                            apb_bus;
> +       enum dcc_descriptor_type        desc_type;
> +       struct list_head                list;
> +};
> +
> +struct dcc_drvdata {

Can we get some kernel doc on this structure?

> +       void __iomem            *base;
> +       u32                     reg_size;
> +       struct device           *dev;
> +       struct mutex            mutex;

In particular what this mutex is protecting.

> +       void __iomem            *ram_base;
> +       u32                     ram_size;
> +       u32                     ram_offset;
> +       enum dcc_mem_map_ver    mem_map_ver;
> +       u32                     ram_cfg;
> +       u32                     ram_start;

phys_addr_t?

> +       bool                    *enable;
> +       bool                    *configured;
> +       bool                    interrupt_disable;
> +       char                    *sram_node;

This is always a define, so why make a struct member?

> +       struct cdev             sram_dev;
> +       struct class            *sram_class;
> +       struct list_head        *cfg_head;
> +       u32                     *nr_config;
> +       u32                     nr_link_list;

size_t?

> +       u8                      curr_list;
> +       u8                      loopoff;
> +};
> +
> +struct dcc_cfg_attr {
> +       u32     addr;
> +       u32     prev_addr;
> +       u32     prev_off;
> +       u32     link;
> +       u32     sram_offset;
> +};
> +
> +struct dcc_cfg_loop_attr {
> +       u32     loop;
> +       bool    loop_start;
> +       u32     loop_cnt;
> +       u32     loop_len;
> +       u32     loop_off;
> +};
> +
> +static size_t dcc_offset_conv(struct dcc_drvdata *drvdata, size_t off)
> +{
> +       if (drvdata->mem_map_ver =3D=3D DCC_MEM_MAP_VER1) {
> +               if ((off & DCC_VER_MASK1) >=3D DCC_MAP_LEVEL3)
> +                       return (off - DCC_MAP_OFFSET3);

Drop useless parenthesis please.

> +               if ((off & DCC_VER_MASK1) >=3D DCC_MAP_LEVEL2)
> +                       return (off - DCC_MAP_OFFSET2);

Drop useless parenthesis please.

> +               else if ((off & DCC_VER_MASK1) >=3D DCC_MAP_LEVEL1)
> +                       return (off - DCC_MAP_OFFSET1);

Drop useless parenthesis please.

> +       } else if (drvdata->mem_map_ver =3D=3D DCC_MEM_MAP_VER2) {
> +               if ((off & DCC_VER_MASK1) >=3D DCC_MAP_LEVEL2)
> +                       return (off - DCC_MAP_OFFSET4);

Drop useless parenthesis please.

> +       }

Newline please.

> +       return off;
> +}
> +
> +static int dcc_sram_writel(struct dcc_drvdata *drvdata,
> +                                       u32 val, u32 off)
> +{
> +       if (unlikely(off > (drvdata->ram_size - 4)))
> +               return -EINVAL;

Can this be pushed up one level? It would be great if we didn't have to
track the fact that we've gone off the end of the ram in each writel
call, instead doing something for every word in the ram and stopping
that loop higher up.

> +
> +       writel((val), drvdata->ram_base + off);

Drop useless parenthesis please.

> +
> +       return 0;
> +}
> +
> +static bool dcc_ready(struct dcc_drvdata *drvdata)
> +{
> +       u32 val;
> +
> +       /* poll until DCC ready */

Drop useless comment please.

> +       if (!readl_poll_timeout((drvdata->base + DCC_STATUS), val,
> +                               (FIELD_GET(GENMASK(1, 0), val) =3D=3D 0),=
 1, TIMEOUT_US))
> +               return true;
> +
> +       return false;

return !readl_poll_timeout(...) instead?

> +}
> +
> +static int dcc_read_status(struct dcc_drvdata *drvdata)
> +{
> +       int curr_list;
> +       u32 bus_status;
> +       u32 ll_cfg =3D 0;
> +       u32 tmp_ll_cfg =3D 0;

Drop assignments as they're overwritten.

> +
> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list; curr_lis=
t++) {
> +               if (!drvdata->enable[curr_list])
> +                       continue;
> +
> +               bus_status =3D dcc_readl(drvdata, DCC_LL_BUS_ACCESS_STATU=
S(curr_list));
> +
> +               if (bus_status) {
> +                       dev_err(drvdata->dev,
> +                               "Read access error for list %d err: 0x%x.=
\n",
> +                               curr_list, bus_status);
> +
> +                       ll_cfg =3D dcc_readl(drvdata, DCC_LL_CFG(curr_lis=
t));
> +                       tmp_ll_cfg =3D ll_cfg & ~BIT(9);
> +                       dcc_writel(drvdata, tmp_ll_cfg, DCC_LL_CFG(curr_l=
ist));
> +                       dcc_writel(drvdata, 0x3,
> +                               DCC_LL_BUS_ACCESS_STATUS(curr_list));
> +                       dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list)=
);
> +                       return -ENODATA;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int dcc_sw_trigger(struct dcc_drvdata *drvdata)
> +{
> +       int ret =3D 0;
> +       int curr_list;
> +       u32 ll_cfg =3D 0;
> +       u32 tmp_ll_cfg =3D 0;

Drop assignments as they're overwritten.

> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list; curr_lis=
t++) {
> +               if (!drvdata->enable[curr_list])
> +                       continue;
> +               ll_cfg =3D dcc_readl(drvdata, DCC_LL_CFG(curr_list));
> +               tmp_ll_cfg =3D ll_cfg & ~BIT(9);
> +               dcc_writel(drvdata, tmp_ll_cfg, DCC_LL_CFG(curr_list));
> +               dcc_writel(drvdata, 1, DCC_LL_SW_TRIGGER(curr_list));
> +               dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list));
> +       }

Does the mutex need to be held while waiting for ready?

> +
> +       if (!dcc_ready(drvdata)) {
> +               dev_err(drvdata->dev,
> +                       "DCC is busy after receiving sw tigger.\n");
> +               ret =3D -EBUSY;
> +               goto err;
> +       }
> +
> +       ret =3D dcc_read_status(drvdata);
> +
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static void _dcc_ll_cfg_reset_link(struct dcc_cfg_attr *cfg)
> +{
> +       cfg->addr =3D 0x00;
> +       cfg->link =3D 0;
> +       cfg->prev_off =3D 0;
> +       cfg->prev_addr =3D cfg->addr;
> +}
> +
> +static int _dcc_ll_cfg_read_write(struct dcc_drvdata *drvdata,
> +                                 struct dcc_config_entry *entry,
> +                                 struct dcc_cfg_attr *cfg)
> +{
> +       int ret;
> +
> +       if (cfg->link) {
> +               /*
> +                * write new offset =3D 1 to continue
> +                * processing the list
> +                */
> +
> +               ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->sram_off=
set);
> +               if (ret)
> +                       return ret;
> +               cfg->sram_offset +=3D 4;
> +               /* Reset link and prev_off */
> +               _dcc_ll_cfg_reset_link(cfg);
> +       }
> +
> +       cfg->addr =3D DCC_RD_MOD_WR_DESCRIPTOR;
> +       ret =3D dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
> +       if (ret)
> +               return ret;
> +
> +       cfg->sram_offset +=3D 4;
> +       ret =3D dcc_sram_writel(drvdata, entry->mask, cfg->sram_offset);
> +       if (ret)
> +               return ret;
> +
> +       cfg->sram_offset +=3D 4;
> +       ret =3D dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offs=
et);
> +       if (ret)
> +               return ret;
> +
> +       cfg->sram_offset +=3D 4;
> +       cfg->addr =3D 0;
> +       return ret;
> +}
> +
> +static int _dcc_ll_cfg_loop(struct dcc_drvdata *drvdata, struct dcc_conf=
ig_entry *entry,
> +                           struct dcc_cfg_attr *cfg,
> +                           struct dcc_cfg_loop_attr *cfg_loop,
> +                           u32 *total_len)
> +{
> +
> +       int ret;
> +
> +       /* Check if we need to write link of prev entry */
> +       if (cfg->link) {
> +               ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->sram_off=
set);
> +               if (ret)
> +                       return ret;
> +               cfg->sram_offset +=3D 4;
> +       }
> +
> +       if (cfg_loop->loop_start) {
> +               cfg_loop->loop =3D (cfg->sram_offset - cfg_loop->loop_off=
) / 4;
> +               cfg_loop->loop |=3D (cfg_loop->loop_cnt << drvdata->loopo=
ff) &
> +               GENMASK(27, drvdata->loopoff);

What is 27? Can it be a define?

> +               cfg_loop->loop |=3D DCC_LOOP_DESCRIPTOR;
> +               *total_len +=3D (*total_len - cfg_loop->loop_len) * cfg_l=
oop->loop_cnt;
> +
> +               ret =3D dcc_sram_writel(drvdata, cfg_loop->loop, cfg->sra=
m_offset);
> +

Drop newline?

> +               if (ret)
> +                       return ret;
> +               cfg->sram_offset +=3D 4;
> +
> +               cfg_loop->loop_start =3D false;
> +               cfg_loop->loop_len =3D 0;
> +               cfg_loop->loop_off =3D 0;
> +       } else {
> +               cfg_loop->loop_start =3D true;
> +               cfg_loop->loop_cnt =3D entry->loop_cnt - 1;
> +               cfg_loop->loop_len =3D *total_len;
> +               cfg_loop->loop_off =3D cfg->sram_offset;
> +       }
> +
> +       /* Reset link and prev_off */
> +

Drop newline?

> +       _dcc_ll_cfg_reset_link(cfg);
> +
> +       return ret;
> +}
> +
> +static int _dcc_ll_cfg_write(struct dcc_drvdata *drvdata,
> +                            struct dcc_config_entry *entry,
> +                            struct dcc_cfg_attr *cfg,
> +                            u32 *total_len)
> +{
> +       u32 off;
> +       int ret;
> +
> +       if (cfg->link) {
> +               /*
> +                * write new offset =3D 1 to continue
> +                * processing the list
> +                */
> +               ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->sram_off=
set);
> +
> +               if (ret)
> +                       return ret;
> +
> +               cfg->sram_offset +=3D 4;
> +               /* Reset link and prev_off */
> +               cfg->addr =3D 0x00;
> +               cfg->prev_off =3D 0;
> +               cfg->prev_addr =3D cfg->addr;
> +       }
> +
> +       off =3D entry->offset/4;
> +       /* write new offset-length pair to correct position */
> +       cfg->link |=3D ((off & GENMASK(7, 0)) | BIT(15) | ((entry->len <<=
 8) & GENMASK(14, 8)));
> +       cfg->link |=3D DCC_LINK_DESCRIPTOR;
> +
> +       /* Address type */
> +       cfg->addr =3D (entry->base >> 4) & GENMASK(27, 0);
> +       if (entry->apb_bus)
> +               cfg->addr |=3D DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_=
APB_IND;
> +       else
> +               cfg->addr |=3D DCC_ADDR_DESCRIPTOR | DCC_WRITE_IND | DCC_=
AHB_IND;
> +       ret =3D dcc_sram_writel(drvdata, cfg->addr, cfg->sram_offset);
> +
> +       if (ret)
> +               return ret;
> +       cfg->sram_offset +=3D 4;
> +
> +       ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->sram_offset);
> +       if (ret)
> +               return ret;
> +       cfg->sram_offset +=3D 4;
> +
> +       ret =3D dcc_sram_writel(drvdata, entry->write_val, cfg->sram_offs=
et);
> +
> +       if (ret)
> +               return ret;
> +
> +       cfg->sram_offset +=3D 4;
> +       cfg->addr =3D 0x00;
> +       cfg->link =3D 0;
> +       return ret;
> +}
> +
> +static int _dcc_ll_cfg_default(struct dcc_drvdata *drvdata,
> +                              struct dcc_config_entry *entry,
> +                              struct dcc_cfg_attr *cfg,
> +                              u32 *pos, u32 *total_len)
> +{
> +       int ret;
> +       u32 off;
> +
> +       cfg->addr =3D (entry->base >> 4) & GENMASK(27, 0);

There's 27 again!

> +
> +       if (entry->apb_bus)
> +               cfg->addr |=3D DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_A=
PB_IND;
> +       else
> +               cfg->addr |=3D DCC_ADDR_DESCRIPTOR | DCC_READ_IND | DCC_A=
HB_IND;
> +
> +       off =3D entry->offset/4;
> +
> +       *total_len +=3D entry->len * 4;
> +
> +       if (!cfg->prev_addr || cfg->prev_addr !=3D cfg->addr || cfg->prev=
_off > off) {
> +               /* Check if we need to write prev link entry */
> +               if (cfg->link) {
> +                       ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->=
sram_offset);
> +                       if (ret)
> +                               return ret;
> +                       cfg->sram_offset +=3D 4;
> +               }
> +               dev_dbg(drvdata->dev, "DCC: sram address 0x%x\n", cfg->sr=
am_offset);
> +
> +               /* Write address */
> +               ret =3D dcc_sram_writel(drvdata, cfg->addr, cfg->sram_off=
set);
> +
> +               if (ret)
> +                       return ret;
> +
> +               cfg->sram_offset +=3D 4;
> +
> +               /* Reset link and prev_off */
> +               cfg->link =3D 0;
> +               cfg->prev_off =3D 0;
> +       }
> +
> +       if ((off - cfg->prev_off) > 0xFF || entry->len > MAX_DCC_LEN) {
> +               dev_err(drvdata->dev, "DCC: Programming error Base: 0x%x,=
 offset 0x%x\n",
> +               entry->base, entry->offset);
> +               ret =3D -EINVAL;
> +               return ret;
> +       }
> +
> +       if (cfg->link) {
> +               /*
> +                * link already has one offset-length so new
> +                * offset-length needs to be placed at
> +                * bits [29:15]
> +                */
> +               *pos =3D 15;
> +
> +               /* Clear bits [31:16] */
> +               cfg->link &=3D GENMASK(14, 0);
> +       } else {
> +               /*
> +                * link is empty, so new offset-length needs
> +                * to be placed at bits [15:0]
> +                */
> +               *pos =3D 0;
> +               cfg->link =3D 1 << 15;
> +       }
> +
> +       /* write new offset-length pair to correct position */
> +       cfg->link |=3D (((off-cfg->prev_off) & GENMASK(7, 0)) |
> +                    ((entry->len << 8) & GENMASK(14, 8))) << *pos;

Can this be split to multiple statements? It's crazy hard to read.

> +
> +       cfg->link |=3D DCC_LINK_DESCRIPTOR;
> +
> +       if (*pos) {
> +               ret =3D dcc_sram_writel(drvdata, cfg->link, cfg->sram_off=
set);
> +               if (ret)
> +                       return ret;
> +               cfg->sram_offset +=3D 4;
> +               cfg->link =3D 0;
> +       }
> +
> +       cfg->prev_off  =3D off + entry->len - 1;
> +       cfg->prev_addr =3D cfg->addr;
> +       return ret;
> +}
> +
> +static int __dcc_ll_cfg(struct dcc_drvdata *drvdata, int curr_list)
> +{
> +       int ret =3D 0;
> +       u32 total_len, pos;
> +       struct dcc_config_entry *entry;
> +       struct dcc_cfg_attr cfg;
> +       struct dcc_cfg_loop_attr cfg_loop;
> +
> +       memset(&cfg, 0, sizeof(cfg));
> +       memset(&cfg_loop, 0, sizeof(cfg_loop));
> +       cfg.sram_offset =3D drvdata->ram_cfg * 4;
> +       total_len =3D 0;
> +
> +       list_for_each_entry(entry, &drvdata->cfg_head[curr_list], list) {
> +               switch (entry->desc_type) {
> +               case DCC_READ_WRITE_TYPE:
> +                       ret =3D _dcc_ll_cfg_read_write(drvdata, entry, &c=
fg);
> +                       if (ret)
> +                               goto overstep;
> +                       break;
> +
> +               case DCC_LOOP_TYPE:
> +                       ret =3D _dcc_ll_cfg_loop(drvdata, entry, &cfg, &c=
fg_loop, &total_len);
> +                       if (ret)
> +                               goto overstep;
> +                       break;
> +
> +               case DCC_WRITE_TYPE:
> +                       ret =3D _dcc_ll_cfg_write(drvdata, entry, &cfg, &=
total_len);
> +                       if (ret)
> +                               goto overstep;
> +                       break;
> +
> +               default:
> +                       ret =3D _dcc_ll_cfg_default(drvdata, entry, &cfg,=
 &pos, &total_len);
> +                       if (ret)
> +                               goto overstep;
> +                       break;
> +               }
> +       }
> +
> +       if (cfg.link) {
> +               ret =3D dcc_sram_writel(drvdata, cfg.link, cfg.sram_offse=
t);
> +               if (ret)
> +                       goto overstep;
> +               cfg.sram_offset +=3D 4;
> +       }
> +
> +       if (cfg_loop.loop_start) {
> +               dev_err(drvdata->dev, "DCC: Programming error: Loop unter=
minated\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       /* Handling special case of list ending with a rd_mod_wr */
> +       if (cfg.addr =3D=3D DCC_RD_MOD_WR_DESCRIPTOR) {
> +               cfg.addr =3D (DCC_RD_MOD_WR_ADDR) & GENMASK(27, 0);
> +               cfg.addr |=3D DCC_ADDR_DESCRIPTOR;
> +               ret =3D dcc_sram_writel(drvdata, cfg.addr, cfg.sram_offse=
t);
> +               if (ret)
> +                       goto overstep;
> +               cfg.sram_offset +=3D 4;
> +       }
> +
> +       /* Setting zero to indicate end of the list */
> +       cfg.link =3D DCC_LINK_DESCRIPTOR;
> +       ret =3D dcc_sram_writel(drvdata, cfg.link, cfg.sram_offset);
> +       if (ret)
> +               goto overstep;
> +       cfg.sram_offset +=3D 4;
> +
> +       /* Update ram_cfg and check if the data will overstep */
> +
> +       drvdata->ram_cfg =3D (cfg.sram_offset + total_len) / 4;
> +
> +       if (cfg.sram_offset + total_len > drvdata->ram_size) {
> +               cfg.sram_offset +=3D total_len;
> +               goto overstep;
> +       }
> +
> +       drvdata->ram_start =3D cfg.sram_offset/4;
> +       return 0;
> +overstep:
> +       ret =3D -EINVAL;
> +       memset_io(drvdata->ram_base, 0, drvdata->ram_size);
> +       dev_err(drvdata->dev, "DCC SRAM oversteps, 0x%x (0x%x)\n",
> +       cfg.sram_offset, drvdata->ram_size);
> +
> +err:
> +       return ret;
> +}
> +
> +static int dcc_valid_list(struct dcc_drvdata *drvdata, int curr_list)
> +{
> +       u32 lock_reg;
> +
> +       if (list_empty(&drvdata->cfg_head[curr_list]))
> +               return -EINVAL;
> +
> +       if (drvdata->enable[curr_list]) {
> +               dev_err(drvdata->dev, "List %d is already enabled\n",
> +                               curr_list);
> +               return -EINVAL;
> +       }
> +
> +       lock_reg =3D dcc_readl(drvdata, DCC_LL_LOCK(curr_list));
> +       if (lock_reg & 0x1) {
> +               dev_err(drvdata->dev, "List %d is already locked\n",
> +                               curr_list);
> +               return -EINVAL;
> +       }
> +
> +       dev_err(drvdata->dev, "DCC list passed %d\n", curr_list);
> +       return 0;
> +}
> +
> +static bool is_dcc_enabled(struct dcc_drvdata *drvdata)
> +{
> +       bool dcc_enable =3D false;
> +       int list;
> +
> +       for (list =3D 0; list < DCC_MAX_LINK_LIST; list++) {
> +               if (drvdata->enable[list]) {
> +                       dcc_enable =3D true;
> +                       break;
> +               }
> +       }
> +
> +       return dcc_enable;
> +}
> +
> +static int dcc_enable(struct dcc_drvdata *drvdata)
> +{
> +       int ret =3D 0;
> +       int list;
> +       u32 ram_cfg_base;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (!is_dcc_enabled(drvdata)) {
> +               memset_io(drvdata->ram_base,
> +                       0xDE, drvdata->ram_size);
> +       }
> +
> +       for (list =3D 0; list < drvdata->nr_link_list; list++) {
> +
> +               if (dcc_valid_list(drvdata, list))
> +                       continue;
> +
> +               /* 1. Take ownership of the list */
> +               dcc_writel(drvdata, BIT(0), DCC_LL_LOCK(list));
> +
> +               /* 2. Program linked-list in the SRAM */
> +               ram_cfg_base =3D drvdata->ram_cfg;
> +               ret =3D __dcc_ll_cfg(drvdata, list);
> +               if (ret) {
> +                       dcc_writel(drvdata, 0, DCC_LL_LOCK(list));
> +                       dev_info(drvdata->dev, "DCC ram programming faile=
d\n");
> +                       goto err;
> +               }
> +
> +               /* 3. program DCC_RAM_CFG reg */
> +               dcc_writel(drvdata, ram_cfg_base +
> +                       drvdata->ram_offset/4, DCC_LL_BASE(list));
> +               dcc_writel(drvdata, drvdata->ram_start +
> +                       drvdata->ram_offset/4, DCC_FD_BASE(list));
> +               dcc_writel(drvdata, 0xFFF, DCC_LL_TIMEOUT(list));
> +
> +               /* 4. Clears interrupt status register */
> +               dcc_writel(drvdata, 0, DCC_LL_INT_ENABLE(list));
> +               dcc_writel(drvdata, (BIT(0) | BIT(1) | BIT(2)),
> +                                       DCC_LL_INT_STATUS(list));
> +
> +               dev_info(drvdata->dev, "All values written to enable.\n");

Debug print?

> +               /* Make sure all config is written in sram */
> +               mb();

This won't work as intended.

> +
> +               drvdata->enable[list] =3D true;
> +
> +               /* 5. Configure trigger */
> +               dcc_writel(drvdata, BIT(9), DCC_LL_CFG(list));
> +       }
> +
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static void dcc_disable(struct dcc_drvdata *drvdata)
> +{
> +       int curr_list;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (!dcc_ready(drvdata))
> +               dev_err(drvdata->dev, "DCC is not ready Disabling DCC...\=
n");

Is that two sentences? And a debug print?

> +
> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list; curr_lis=
t++) {
> +               if (!drvdata->enable[curr_list])
> +                       continue;
> +               dcc_writel(drvdata, 0, DCC_LL_CFG(curr_list));
> +               dcc_writel(drvdata, 0, DCC_LL_BASE(curr_list));
> +               dcc_writel(drvdata, 0, DCC_FD_BASE(curr_list));
> +               dcc_writel(drvdata, 0, DCC_LL_LOCK(curr_list));
> +               drvdata->enable[curr_list] =3D false;
> +       }
> +       memset_io(drvdata->ram_base, 0, drvdata->ram_size);
> +       drvdata->ram_cfg =3D 0;
> +       drvdata->ram_start =3D 0;
> +       mutex_unlock(&drvdata->mutex);
> +}
> +
> +static ssize_t curr_list_show(struct device *dev,
> +       struct device_attribute *attr, char *buf)
> +{
> +       int ret;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       mutex_lock(&drvdata->mutex);
> +       if (drvdata->curr_list =3D=3D DCC_INVALID_LINK_LIST) {
> +               dev_err(dev, "curr_list is not set.\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       ret =3D scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->curr_list);
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static ssize_t curr_list_store(struct device *dev,
> +                                               struct device_attribute *=
attr,
> +                                               const char *buf, size_t s=
ize)
> +{
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +       unsigned long val;
> +       u32 lock_reg;
> +       bool dcc_enable =3D false;
> +
> +       if (kstrtoul(buf, 16, &val))
> +               return -EINVAL;
> +
> +       if (val >=3D drvdata->nr_link_list)
> +               return -EINVAL;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       dcc_enable =3D is_dcc_enabled(drvdata);
> +       if (drvdata->curr_list !=3D DCC_INVALID_LINK_LIST && dcc_enable) {
> +               dev_err(drvdata->dev, "DCC is enabled, please disable it =
first.\n");
> +               mutex_unlock(&drvdata->mutex);
> +               return -EINVAL;
> +       }
> +
> +       lock_reg =3D dcc_readl(drvdata, DCC_LL_LOCK(val));
> +       if (lock_reg & 0x1) {
> +               dev_err(drvdata->dev, "DCC linked list is already configu=
red\n");
> +               mutex_unlock(&drvdata->mutex);
> +               return -EINVAL;
> +       }
> +       drvdata->curr_list =3D val;
> +       mutex_unlock(&drvdata->mutex);
> +
> +       return size;
> +}
> +
> +static DEVICE_ATTR_RW(curr_list);
> +
> +
> +static ssize_t trigger_store(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       const char *buf, size_t size)
> +{
> +       int ret =3D 0;
> +       unsigned long val;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       if (kstrtoul(buf, 16, &val))
> +               return -EINVAL;
> +       if (val !=3D 1)
> +               return -EINVAL;
> +
> +       ret =3D dcc_sw_trigger(drvdata);
> +       if (!ret)
> +               ret =3D size;
> +
> +       return ret;
> +}
> +static DEVICE_ATTR_WO(trigger);
> +
> +static ssize_t enable_show(struct device *dev,
> +       struct device_attribute *attr, char *buf)
> +{
> +       int ret;
> +       bool dcc_enable =3D false;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       mutex_lock(&drvdata->mutex);
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(dev, "Select link list to program using curr_list=
\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       dcc_enable =3D is_dcc_enabled(drvdata);
> +
> +       ret =3D scnprintf(buf, PAGE_SIZE, "%u\n",
> +                               (unsigned int)dcc_enable);
> +err:
> +       mutex_unlock(&drvdata->mutex);

What does the mutex being held serve here?

> +       return ret;
> +}
> +
> +static ssize_t enable_store(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t size)
> +{
> +       int ret =3D 0;
> +       unsigned long val;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       if (kstrtoul(buf, 16, &val))
> +               return -EINVAL;
> +
> +       if (val)
> +               ret =3D dcc_enable(drvdata);
> +       else
> +               dcc_disable(drvdata);
> +
> +       if (!ret)
> +               ret =3D size;
> +
> +       return ret;
> +
> +}
> +
> +static DEVICE_ATTR_RW(enable);
> +
> +static ssize_t config_show(struct device *dev,
> +       struct device_attribute *attr, char *buf)
> +{
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +       struct dcc_config_entry *entry;
> +       char local_buf[64];
> +       int len =3D 0, count =3D 0;
> +
> +       buf[0] =3D '\0';

Why?

> +
> +       mutex_lock(&drvdata->mutex);
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(dev, "Select link list to program using curr_list=
\n");
> +               count =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       list_for_each_entry(entry,
> +       &drvdata->cfg_head[drvdata->curr_list], list) {
> +               switch (entry->desc_type) {
> +               case DCC_READ_WRITE_TYPE:
> +                       len =3D snprintf(local_buf, 64, "Index: 0x%x, mas=
k: 0x%x, val: 0x%x\n",
> +                               entry->index, entry->mask, entry->write_v=
al);
> +                       break;
> +               case DCC_LOOP_TYPE:
> +                       len =3D snprintf(local_buf, 64, "Index: 0x%x, Loo=
p: %d\n",
> +                               entry->index, entry->loop_cnt);
> +                       break;
> +               case DCC_WRITE_TYPE:
> +                       len =3D snprintf(local_buf, 64,
> +                               "Write Index: 0x%x, Base: 0x%x, Offset: 0=
x%x, len: 0x%x APB: %d\n",
> +                               entry->index, entry->base, entry->offset,=
 entry->len,
> +                               entry->apb_bus);
> +                       break;
> +               default:
> +                       len =3D snprintf(local_buf, 64,
> +                               "Read Index: 0x%x, Base: 0x%x, Offset: 0x=
%x, len: 0x%x APB: %d\n",
> +                               entry->index, entry->base, entry->offset,
> +                               entry->len, entry->apb_bus);
> +               }
> +
> +               if ((count + len) > PAGE_SIZE) {
> +                       dev_err(dev, "DCC: Couldn't write complete config=
\n");
> +                       break;
> +               }
> +               strlcat(buf, local_buf, PAGE_SIZE);
> +               count +=3D len;
> +       }
> +
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return count;
> +}
> +
> +static int dcc_config_add(struct dcc_drvdata *drvdata, unsigned int addr,
> +                               unsigned int len, int apb_bus)
> +{
> +       int ret;
> +       struct dcc_config_entry *entry, *pentry;
> +       unsigned int base, offset;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(drvdata->dev, "Select link list to program using =
curr_list\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (!len || len > (drvdata->ram_size / 8)) {

What is 8?

> +               dev_err(drvdata->dev, "DCC: Invalid length\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       base =3D addr & GENMASK(31, 4);

Make a define for the GENMASK?

> +
> +       if (!list_empty(&drvdata->cfg_head[drvdata->curr_list])) {
> +               pentry =3D list_last_entry(&drvdata->cfg_head[drvdata->cu=
rr_list],
> +                       struct dcc_config_entry, list);
> +
> +               if (pentry->desc_type =3D=3D DCC_ADDR_TYPE &&
> +                               addr >=3D (pentry->base + pentry->offset)=
 &&
> +                               addr <=3D (pentry->base +
> +                                       pentry->offset + MAX_DCC_OFFSET))=
 {
> +
> +                       /* Re-use base address from last entry */
> +                       base =3D pentry->base;
> +
> +                       if ((pentry->len * 4 + pentry->base + pentry->off=
set)
> +                                       =3D=3D addr) {
> +                               len +=3D pentry->len;
> +
> +                               if (len > MAX_DCC_LEN)
> +                                       pentry->len =3D MAX_DCC_LEN;
> +                               else
> +                                       pentry->len =3D len;
> +
> +                               addr =3D pentry->base + pentry->offset +
> +                                       pentry->len * 4;
> +                               len -=3D pentry->len;
> +                       }
> +               }
> +       }
> +
> +       offset =3D addr - base;
> +
> +       while (len) {
> +               entry =3D devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_=
KERNEL);
> +               if (!entry) {
> +                       ret =3D -ENOMEM;
> +                       goto err;
> +               }
> +
> +               entry->base =3D base;
> +               entry->offset =3D offset;
> +               entry->len =3D min_t(u32, len, MAX_DCC_LEN);
> +               entry->index =3D drvdata->nr_config[drvdata->curr_list]++;
> +               entry->desc_type =3D DCC_ADDR_TYPE;
> +               entry->apb_bus =3D apb_bus;
> +               INIT_LIST_HEAD(&entry->list);
> +               list_add_tail(&entry->list,
> +                       &drvdata->cfg_head[drvdata->curr_list]);
> +
> +               len -=3D entry->len;
> +               offset +=3D MAX_DCC_LEN * 4;
> +       }
> +

err:

> +       mutex_unlock(&drvdata->mutex);
> +       return 0;

return ret;

> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;

Remove these three lines.

> +}
> +
> +static ssize_t config_store(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t size)
> +{
> +       int ret, len, apb_bus;
> +       unsigned int base;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +       int nval;
> +
> +       nval =3D sscanf(buf, "%x %i %d", &base, &len, &apb_bus);
> +       if (nval <=3D 0 || nval > 3)
> +               return -EINVAL;
> +
> +       if (nval =3D=3D 1) {
> +               len =3D 1;
> +               apb_bus =3D 0;
> +       } else if (nval =3D=3D 2) {
> +               apb_bus =3D 0;
> +       } else {
> +               apb_bus =3D 1;
> +       }
> +
> +       ret =3D dcc_config_add(drvdata, base, len, apb_bus);
> +       if (ret)
> +               return ret;
> +
> +       return size;
> +
> +}
> +
> +static DEVICE_ATTR_RW(config);
> +
> +static void dcc_config_reset(struct dcc_drvdata *drvdata)
> +{
> +       struct dcc_config_entry *entry, *temp;
> +       int curr_list;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list; curr_lis=
t++) {
> +               list_for_each_entry_safe(entry, temp,
> +                       &drvdata->cfg_head[curr_list], list) {
> +                       list_del(&entry->list);
> +                       devm_kfree(drvdata->dev, entry);
> +                       drvdata->nr_config[curr_list]--;
> +               }
> +       }
> +       drvdata->ram_start =3D 0;
> +       drvdata->ram_cfg =3D 0;
> +       mutex_unlock(&drvdata->mutex);
> +}
> +
> +
> +static ssize_t config_reset_store(struct device *dev,
> +       struct device_attribute *attr,
> +       const char *buf, size_t size)
> +{
> +       unsigned long val;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       if (kstrtoul(buf, 16, &val))
> +               return -EINVAL;
> +
> +       if (val)
> +               dcc_config_reset(drvdata);
> +
> +       return size;
> +}
> +
> +static DEVICE_ATTR_WO(config_reset);
> +
> +static ssize_t ready_show(struct device *dev,
> +       struct device_attribute *attr, char *buf)
> +{
> +       int ret;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(dev, "Select link list to program using curr_list=
\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (!drvdata->enable[drvdata->curr_list]) {
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       ret =3D scnprintf(buf, PAGE_SIZE, "%u\n",
> +                       (unsigned int)FIELD_GET(BIT(1), dcc_readl(drvdata=
, DCC_STATUS)));
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static DEVICE_ATTR_RO(ready);
> +
> +static ssize_t interrupt_disable_show(struct device *dev,
> +                                               struct device_attribute *=
attr,
> +                                               char *buf)
> +{
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       return scnprintf(buf, PAGE_SIZE, "%u\n",
> +                               (unsigned int)drvdata->interrupt_disable);
> +}
> +
> +static ssize_t interrupt_disable_store(struct device *dev,
> +       struct device_attribute *attr,
> +       const char *buf, size_t size)
> +{
> +       unsigned long val;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       if (kstrtoul(buf, 16, &val))
> +               return -EINVAL;
> +
> +       mutex_lock(&drvdata->mutex);
> +       drvdata->interrupt_disable =3D (val ? 1:0);
> +       mutex_unlock(&drvdata->mutex);
> +       return size;
> +}
> +
> +static DEVICE_ATTR_RW(interrupt_disable);
> +
> +static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_=
cnt)
> +{
> +       struct dcc_config_entry *entry;
> +
> +       entry =3D devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
> +       if (!entry)
> +               return -ENOMEM;
> +
> +       entry->loop_cnt =3D min_t(u32, loop_cnt, MAX_LOOP_CNT);
> +       entry->index =3D drvdata->nr_config[drvdata->curr_list]++;
> +       entry->desc_type =3D DCC_LOOP_TYPE;
> +       INIT_LIST_HEAD(&entry->list);
> +       list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list=
]);
> +
> +       return 0;
> +}
> +
> +static ssize_t loop_store(struct device *dev,
> +       struct device_attribute *attr,
> +       const char *buf, size_t size)
> +{
> +       int ret;
> +       unsigned long loop_cnt;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (kstrtoul(buf, 16, &loop_cnt)) {
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(dev, "Select link list to program using curr_list=
\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       ret =3D dcc_add_loop(drvdata, loop_cnt);
> +       if (ret)
> +               goto err;
> +
> +       mutex_unlock(&drvdata->mutex);
> +       return size;
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static DEVICE_ATTR_WO(loop);
> +
> +static int dcc_rd_mod_wr_add(struct dcc_drvdata *drvdata, unsigned int m=
ask,
> +                               unsigned int val)
> +{
> +       int ret =3D 0;
> +       struct dcc_config_entry *entry;
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(drvdata->dev, "Select link list to program using =
curr_list\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (list_empty(&drvdata->cfg_head[drvdata->curr_list])) {
> +               dev_err(drvdata->dev, "DCC: No read address programmed\n"=
);
> +               ret =3D -EPERM;
> +               goto err;
> +       }
> +
> +       entry =3D devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
> +       if (!entry) {
> +               ret =3D -ENOMEM;
> +               goto err;
> +       }
> +
> +       entry->desc_type =3D DCC_READ_WRITE_TYPE;
> +       entry->mask =3D mask;
> +       entry->write_val =3D val;
> +       entry->index =3D drvdata->nr_config[drvdata->curr_list]++;
> +       INIT_LIST_HEAD(&entry->list);
> +       list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list=
]);
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static ssize_t rd_mod_wr_store(struct device *dev,
> +       struct device_attribute *attr,
> +       const char *buf, size_t size)
> +{
> +       int ret;
> +       int nval;
> +       unsigned int mask, val;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       nval =3D sscanf(buf, "%x %x", &mask, &val);
> +
> +       if (nval <=3D 1 || nval > 2)
> +               return -EINVAL;
> +
> +       ret =3D dcc_rd_mod_wr_add(drvdata, mask, val);
> +       if (ret)
> +               return ret;
> +
> +       return size;
> +
> +}
> +
> +static DEVICE_ATTR_WO(rd_mod_wr);
> +
> +static int dcc_add_write(struct dcc_drvdata *drvdata, unsigned int addr,
> +                               unsigned int write_val, int apb_bus)
> +{
> +       struct dcc_config_entry *entry;
> +
> +       entry =3D devm_kzalloc(drvdata->dev, sizeof(*entry), GFP_KERNEL);
> +       if (!entry)
> +               return -ENOMEM;
> +
> +       entry->desc_type =3D DCC_WRITE_TYPE;
> +       entry->base =3D addr & GENMASK(31, 4);
> +       entry->offset =3D addr - entry->base;
> +       entry->write_val =3D write_val;
> +       entry->index =3D drvdata->nr_config[drvdata->curr_list]++;
> +       entry->len =3D 1;
> +       entry->apb_bus =3D apb_bus;
> +       INIT_LIST_HEAD(&entry->list);
> +       list_add_tail(&entry->list, &drvdata->cfg_head[drvdata->curr_list=
]);
> +
> +       return 0;
> +}
> +
> +static ssize_t config_write_store(struct device *dev,
> +                                               struct device_attribute *=
attr,
> +                                               const char *buf, size_t s=
ize)
> +{
> +       int ret;
> +       int nval;
> +       unsigned int addr, write_val;
> +       int apb_bus =3D 0;
> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> +
> +       mutex_lock(&drvdata->mutex);
> +
> +       nval =3D sscanf(buf, "%x %x %d", &addr, &write_val, &apb_bus);
> +
> +       if (nval <=3D 1 || nval > 3) {
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> +               dev_err(dev, "Select link list to program using curr_list=
\n");
> +               ret =3D -EINVAL;
> +               goto err;
> +       }
> +
> +       if (nval =3D=3D 3 && apb_bus !=3D 0)
> +               apb_bus =3D 1;
> +
> +       ret =3D dcc_add_write(drvdata, addr, write_val, apb_bus);
> +       if (ret)
> +               goto err;
> +
> +       mutex_unlock(&drvdata->mutex);
> +       return size;
> +err:
> +       mutex_unlock(&drvdata->mutex);
> +       return ret;
> +}
> +
> +static DEVICE_ATTR_WO(config_write);
> +
> +static const struct device_attribute *dcc_attrs[] =3D {
> +       &dev_attr_trigger,
> +       &dev_attr_enable,
> +       &dev_attr_config,
> +       &dev_attr_config_reset,
> +       &dev_attr_ready,
> +       &dev_attr_interrupt_disable,
> +       &dev_attr_loop,
> +       &dev_attr_rd_mod_wr,
> +       &dev_attr_curr_list,
> +       &dev_attr_config_write,
> +       NULL,
> +};
> +
> +static int dcc_create_files(struct device *dev,
> +                                       const struct device_attribute **a=
ttrs)
> +{
> +       int ret =3D 0, i;
> +
> +       for (i =3D 0; attrs[i] !=3D NULL; i++) {
> +               ret =3D device_create_file(dev, attrs[i]);
> +               if (ret) {
> +                       dev_err(dev, "DCC: Couldn't create sysfs attribut=
e: %s\n",
> +                               attrs[i]->attr.name);
> +                       break;
> +               }
> +       }
> +       return ret;
> +}
> +
> +static int dcc_sram_open(struct inode *inode, struct file *file)
> +{
> +       struct dcc_drvdata *drvdata =3D container_of(inode->i_cdev,
> +               struct dcc_drvdata,
> +               sram_dev);
> +       file->private_data =3D drvdata;
> +
> +       return  0;
> +}
> +
> +static ssize_t dcc_sram_read(struct file *file, char __user *data,
> +                                               size_t len, loff_t *ppos)
> +{
> +       unsigned char *buf;
> +       struct dcc_drvdata *drvdata =3D file->private_data;

const?

> +
> +       /* EOF check */
> +       if (drvdata->ram_size <=3D *ppos)
> +               return 0;
> +
> +       if ((*ppos + len) > drvdata->ram_size)
> +               len =3D (drvdata->ram_size - *ppos);
> +
> +       buf =3D kzalloc(len, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       memcpy_fromio(buf, drvdata->ram_base + *ppos, len);
> +
> +       if (copy_to_user(data, buf, len)) {

Is there any sort of memcpy_fromio_to_user() API? That would avoid the
extra buffer allocation by copying to userspace in the readl loop.

> +               dev_err(drvdata->dev, "DCC: Couldn't copy all data to use=
r\n");

I think we don't want this sort of error message in userspace
triggerable copy operations.

> +               kfree(buf);
> +               return -EFAULT;
> +       }
> +
> +       *ppos +=3D len;
> +
> +       kfree(buf);
> +
> +       return len;
> +}
> +
> +static const struct file_operations dcc_sram_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D dcc_sram_open,
> +       .read           =3D dcc_sram_read,
> +       .llseek         =3D no_llseek,
> +};
> +
> +static int dcc_sram_dev_register(struct dcc_drvdata *drvdata)
> +{
> +       int ret;
> +       struct device *device;
> +       dev_t dev;
> +
> +       ret =3D alloc_chrdev_region(&dev, 0, 1, drvdata->sram_node);
> +       if (ret)
> +               goto err_alloc;
> +
> +       cdev_init(&drvdata->sram_dev, &dcc_sram_fops);
> +
> +       drvdata->sram_dev.owner =3D THIS_MODULE;
> +       ret =3D cdev_add(&drvdata->sram_dev, dev, 1);
> +       if (ret)
> +               goto err_cdev_add;
> +
> +       drvdata->sram_class =3D class_create(THIS_MODULE, drvdata->sram_n=
ode);
> +       if (IS_ERR(drvdata->sram_class)) {
> +               ret =3D PTR_ERR(drvdata->sram_class);
> +               goto err_class_create;
> +       }
> +
> +       device =3D device_create(drvdata->sram_class, NULL,
> +                                               drvdata->sram_dev.dev, dr=
vdata,
> +                                               drvdata->sram_node);
> +       if (IS_ERR(device)) {
> +               ret =3D PTR_ERR(device);
> +               goto err_dev_create;
> +       }
> +
> +       return 0;
> +err_dev_create:
> +       class_destroy(drvdata->sram_class);
> +err_class_create:
> +       cdev_del(&drvdata->sram_dev);
> +err_cdev_add:
> +       unregister_chrdev_region(drvdata->sram_dev.dev, 1);
> +err_alloc:
> +       return ret;
> +}
> +
> +static void dcc_sram_dev_deregister(struct dcc_drvdata *drvdata)
> +{
> +       device_destroy(drvdata->sram_class, drvdata->sram_dev.dev);
> +       class_destroy(drvdata->sram_class);
> +       cdev_del(&drvdata->sram_dev);
> +       unregister_chrdev_region(drvdata->sram_dev.dev, 1);
> +}
> +
> +static int dcc_sram_dev_init(struct dcc_drvdata *drvdata)
> +{
> +       int ret =3D 0;
> +
> +       drvdata->sram_node =3D DCC_SRAM_NODE;
> +       if (!drvdata->sram_node)
> +               return -ENOMEM;
> +
> +       ret =3D dcc_sram_dev_register(drvdata);
> +       if (ret)
> +               dev_err(drvdata->dev, "DCC: sram node not registered.\n");
> +
> +       return ret;
> +}
> +
> +static void dcc_sram_dev_exit(struct dcc_drvdata *drvdata)
> +{
> +       dcc_sram_dev_deregister(drvdata);
> +}
> +
> +static int dcc_probe(struct platform_device *pdev)
> +{
> +       int ret =3D 0, i;
> +       struct device *dev =3D &pdev->dev;
> +       struct dcc_drvdata *dcc;
> +       struct resource *res;
> +       const struct qcom_dcc_config *cfg;
> +
> +       dcc =3D devm_kzalloc(dev, sizeof(*dcc), GFP_KERNEL);
> +       if (!dcc)
> +               return -ENOMEM;
> +
> +       dcc->dev =3D &pdev->dev;
> +       platform_set_drvdata(pdev, dcc);
> +
> +       dcc->base =3D devm_platform_ioremap_resource_byname(pdev, "dcc");
> +       if (!dcc->base)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dcc-r=
am");
> +       if (!res)
> +               return -EINVAL;
> +
> +       dcc->ram_size =3D resource_size(res);
> +
> +       dcc->ram_base =3D devm_ioremap(dev, res->start, resource_size(res=
));
> +       if (!dcc->ram_base)
> +               return -ENOMEM;

How about

	dcc->base =3D devm_platform_ioremap_resource(pdev, 0);
	if (IS_ERR(dcc->base))
		return PTR_ERR(dcc->base);

	dcc->ram_base =3D devm_platform_get_and_ioremap_resource(pdev, 1, &res);
	if (IS_ERR(dcc->ram_base))
		return PTR_ERR(dcc->ram_base);

	dcc->ram_size =3D resource_size(res);

> +
> +       cfg =3D of_device_get_match_data(&pdev->dev);

	if (!cfg)
		return -EINVAL;


> +       dcc->ram_offset =3D cfg->dcc_ram_offset;
> +
> +       if (FIELD_GET(BIT(DCC_VER_INFO_BIT), dcc_readl(dcc, DCC_HW_INFO))=
) {
> +               dcc->mem_map_ver =3D DCC_MEM_MAP_VER3;
> +               dcc->nr_link_list =3D dcc_readl(dcc, DCC_LL_NUM_INFO);
> +               if (dcc->nr_link_list =3D=3D 0)
> +                       return  -EINVAL;
> +       } else if ((dcc_readl(dcc, DCC_HW_INFO) & DCC_VER_MASK2) =3D=3D D=
CC_VER_MASK2) {

Can we u32 val =3D dcc_readl(dcc, DCC_HW_INFO) once instead of twice?

> +               dcc->mem_map_ver =3D DCC_MEM_MAP_VER2;
> +               dcc->nr_link_list =3D dcc_readl(dcc, DCC_LL_NUM_INFO);
> +               if (dcc->nr_link_list =3D=3D 0)
> +                       return  -EINVAL;
> +       } else {
> +               dcc->mem_map_ver =3D DCC_MEM_MAP_VER1;
> +               dcc->nr_link_list =3D DCC_MAX_LINK_LIST;
> +       }
> +
> +       if ((dcc_readl(dcc, DCC_HW_INFO) & BIT(6)) =3D=3D BIT(6))

Err thrice.

> +               dcc->loopoff =3D DCC_FIX_LOOP_OFFSET;
> +       else
> +               dcc->loopoff =3D get_bitmask_order((dcc->ram_size +
> +                               dcc->ram_offset) / 4 - 1);
> +
> +       mutex_init(&dcc->mutex);
> +       dcc->enable =3D devm_kcalloc(dev, dcc->nr_link_list,
> +                       sizeof(bool), GFP_KERNEL);
> +       if (!dcc->enable)
> +               return -ENOMEM;
> +
> +       dcc->configured =3D devm_kcalloc(dev, dcc->nr_link_list,
> +                       sizeof(bool), GFP_KERNEL);
> +       if (!dcc->configured)
> +               return -ENOMEM;
> +
> +       dcc->nr_config =3D devm_kcalloc(dev, dcc->nr_link_list,
> +                       sizeof(u32), GFP_KERNEL);
> +       if (!dcc->nr_config)
> +               return -ENOMEM;
> +
> +       dcc->cfg_head =3D devm_kcalloc(dev, dcc->nr_link_list,
> +                       sizeof(struct list_head), GFP_KERNEL);
> +       if (!dcc->cfg_head)
> +               return -ENOMEM;

These are a lot of allocations. Any chance we can do one instead of this
many?

> +
> +       for (i =3D 0; i < dcc->nr_link_list; i++)
> +               INIT_LIST_HEAD(&dcc->cfg_head[i]);
> +
> +

Drop double newline?

> +       memset_io(dcc->ram_base, 0, dcc->ram_size);
> +       dcc->curr_list =3D DCC_INVALID_LINK_LIST;
> +       ret =3D dcc_sram_dev_init(dcc);
> +       if (ret)
> +               goto out;

		return ret;

> +
> +       ret =3D dcc_create_files(dev, dcc_attrs);
> +       if (ret)
> +               goto out;
> +
> +out:
> +       return ret;

Just

	return dcc_create_files(...)

> +}
> +
> +static int dcc_remove(struct platform_device *pdev)
> +{
> +       struct dcc_drvdata *drvdata =3D platform_get_drvdata(pdev);
> +
> +       dcc_sram_dev_exit(drvdata);
> +
> +       dcc_config_reset(drvdata);
> +
> +       return 0;
> +}
> +
> +static const struct qcom_dcc_config sm8150_cfg =3D {
> +       .dcc_ram_offset =3D 0x5000,
> +};
> +
> +static const struct of_device_id dcc_match_table[] =3D {
> +       { .compatible =3D "qcom,sm8150-dcc", .data =3D &sm8150_cfg },

Missing a {} terminator.

> +};
> +MODULE_DEVICE_TABLE(of, dcc_match_table);
> +
> +static struct platform_driver dcc_driver =3D {
> +       .probe                                  =3D dcc_probe,
> +       .remove                                 =3D dcc_remove,
> +       .driver                                 =3D {

This tabbing is very odd. I'd expect

> +static struct platform_driver dcc_driver =3D {
> +       .probe   =3D dcc_probe,
> +       .remove  =3D dcc_remove,
> +       .driver  =3D {

that (ignoring spaces instead of tabs)

> +               .name           =3D "qcom-dcc",
> +               .of_match_table =3D dcc_match_table,
> +       },
> +};
> +
> +module_platform_driver(dcc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm Technologies Inc. DCC driver");
> +
