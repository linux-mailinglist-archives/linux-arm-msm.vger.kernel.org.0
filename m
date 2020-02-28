Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE0F17414D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 22:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1VKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 16:10:39 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51803 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgB1VKj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 16:10:39 -0500
Received: by mail-pj1-f68.google.com with SMTP id fa20so1789879pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=9/DXG/Oi4JW2k6CGwME7FoSd15JdePoZbmRNBBM0ZR0=;
        b=kToKqaqeUAg+od/bA99qhTzEiV8vdlIaXeFAXzsPHr7UYSxa85r8GqlhhyAp1J5rm8
         v79xIzpLJGaJ75nbYVVg87LvXLKus5+ECLPURVuGfnBzMvPJ2zgyiNK5nywI6KV0I1Kx
         2zuZ9yxkp/m81N0V+Vy6gEEXXOxMbWpwmGrWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=9/DXG/Oi4JW2k6CGwME7FoSd15JdePoZbmRNBBM0ZR0=;
        b=P0YHmckZyU2rsdQizThLhNaQLnggrGTJWF1zamlcmHTSGOWw5rhZvoW/r1yxa/HaFC
         6Ul0gRm+ca/Wn5rMcRKnZqw4vd6gzkETkvPm1FSk/OMGVPYETgwM1auFXXT1thg12VUu
         BzoWBoP9O/yY5341cxoVZ6bjJTTLrUt38NjTrdQoLcYW7QywX+1NGG1XKTkZlD2Tpxuf
         GLWrHq8gujOOq9g1JrAwqkmsCb8Cyl1luSZRlthy02/PgI/aNZvnuQICW7G5ybFMLmBL
         3tNFpDVPs94xB/qsvDIA+13zwTk9dSiyjuA6texVt32t/Hqzlarsm+QZ6e/OhicubSpi
         vAdw==
X-Gm-Message-State: APjAAAXJlqMhZ+VZ59HzvTcuBYXOFrEDJic3JwChsRVpWwvjx+R8xQG9
        ALwWquMNv97jY7Bf2MqXdeIFAg==
X-Google-Smtp-Source: APXvYqzbNMZlBCKvNkU5M3AUouIqAZWj+fVwMSbNmEk+evC6yaVEF7xeAzgXvC0hg/zWe/oCT9rzlA==
X-Received: by 2002:a17:902:8f8e:: with SMTP id z14mr5931716plo.195.1582924237276;
        Fri, 28 Feb 2020 13:10:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x4sm12512198pff.143.2020.02.28.13.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 13:10:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1582274986-17490-3-git-send-email-mkshah@codeaurora.org>
References: <1582274986-17490-1-git-send-email-mkshah@codeaurora.org> <1582274986-17490-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v2 2/4] soc: qcom: Add SoC sleep stats driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Fri, 28 Feb 2020 13:10:34 -0800
Message-ID: <158292423432.4688.6964200779843496200@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-02-21 00:49:44)
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>=20
> Lets's add a driver to read the the stats from remote processor

Let's

> and export to debugfs.
>=20
> The driver creates "soc_sleep_stats" directory in debugfs and adds
> files for various low power mode available. Below is sample output
> with command
>=20
> cat /sys/kernel/debug/soc_sleep_stats/ddr
> count =3D 0
> Last Entered At =3D 0
> Last Exited At =3D 0
> Accumulated Duration =3D 0
>=20
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig           |  10 ++
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/soc_sleep_stats.c | 279 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 290 insertions(+)
>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>=20
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e7..4d36654 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -185,6 +185,16 @@ config QCOM_SOCINFO
>          Say yes here to support the Qualcomm socinfo driver, providing
>          information about the SoC to user space.
> =20
> +config QCOM_SOC_SLEEP_STATS
> +       tristate "Qualcomm Technologies, Inc. (QTI) SoC sleep stats drive=
r"
> +       depends on ARCH_QCOM

Can you add || COMPILE_TEST?

> +       depends on DEBUG_FS
> +       help
> +         Qualcomm Technologies, Inc. (QTI) SoC sleep stats driver to read
> +         the shared memory exported by the remote processor related to
> +         various SoC level low power modes statistics and export to debu=
gfs
> +         interface.
> +
>  config QCOM_WCNSS_CTRL
>         tristate "Qualcomm WCNSS control driver"
>         depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sl=
eep_stats.c
> new file mode 100644
> index 00000000..bf38bb5
> --- /dev/null
> +++ b/drivers/soc/qcom/soc_sleep_stats.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2011-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>

Why?

> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/stddef.h>

Why?

> +
> +#include <linux/soc/qcom/smem.h>
> +#include <clocksource/arm_arch_timer.h>
> +
> +#define NAME_LENGTH    5
> +
> +enum subsystem_item_id {
> +       MODEM =3D 605,
> +       ADSP,
> +       CDSP,
> +       SLPI,
> +       GPU,
> +       DISPLAY,
> +};
> +
> +enum subsystem_pid {
> +       PID_APSS =3D 0,
> +       PID_MODEM =3D 1,
> +       PID_ADSP =3D 2,
> +       PID_SLPI =3D 3,
> +       PID_CDSP =3D 5,
> +       PID_GPU =3D PID_APSS,
> +       PID_DISPLAY =3D PID_APSS,

I still don't understand this enums. Why not make them a #define set
with known values?

> +};
> +
> +struct subsystem_data {
> +       char *name;

Can it be const char *?

> +       enum subsystem_item_id item_id;
> +       enum subsystem_pid pid;
> +};
> +
> +static struct subsystem_data subsystems[] =3D {
> +       { "modem", MODEM, PID_MODEM },
> +       { "adsp", ADSP, PID_ADSP },
> +       { "cdsp", CDSP, PID_CDSP },
> +       { "slpi", SLPI, PID_SLPI },
> +       { "gpu", GPU, PID_GPU },
> +       { "display", DISPLAY, PID_DISPLAY },
> +};
> +
> +struct stats_config {
> +       u32 offset_addr;

Looks ok but probably can just be unsigned int?

> +       u32 num_records;

Why not size_t? Is 32-bit width important?

> +       bool appended_stats_avail;
> +};
> +
> +static const struct stats_config *config;

This shouldn't be necessary. Can the config be passed into the debugfs
file ops private data?

> +
> +struct soc_sleep_stats_data {

This struct is only used in probe. Why not just make probe have more
local variables?

> +       phys_addr_t stats_base;
> +       resource_size_t stats_size;
> +       void __iomem *reg;
> +       struct dentry *root;
> +};
> +
> +struct entry {
> +       __le32 stat_type;
> +       __le32 count;
> +       __le64 last_entered_at;
> +       __le64 last_exited_at;
> +       __le64 accumulated;

These should just be u32 and u64.

> +};
> +
> +struct appended_entry {
> +       __le32 client_votes;
> +       __le32 reserved[3];
> +};

Same, just u32.

> +
> +static u64 get_time_in_sec(u64 counter)
> +{
> +       do_div(counter, arch_timer_get_rate());

I don't think arch_timer_get_rate() is exported as a symbol. Why we need
to convert this to time? Is the counter not sufficient to understand
that so many ticks have passed since it entered and exited?

> +
> +       return counter;
> +}
> +
> +static void print_sleep_stats(struct seq_file *s, struct entry *e)
> +{
> +       e->last_entered_at =3D get_time_in_sec(e->last_entered_at);
> +       e->last_exited_at =3D get_time_in_sec(e->last_exited_at);
> +       e->accumulated =3D get_time_in_sec(e->accumulated);
> +
> +       seq_printf(s, "count =3D %u\n", e->count);
> +       seq_printf(s, "Last Entered At =3D %llu\n", e->last_entered_at);
> +       seq_printf(s, "Last Exited At =3D %llu\n", e->last_exited_at);
> +       seq_printf(s, "Accumulated Duration =3D %llu\n", e->accumulated);

Why is count not capitalized but everything else is?

> +}
> +
> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +       struct subsystem_data *subsystem =3D s->private;
> +       struct entry *e;
> +
> +       e =3D qcom_smem_get(subsystem->pid, subsystem->item_id, NULL);

Do we need to look this up each time we read the stats? Why can't we get
this once in probe or when we create the debugfs file?

> +       if (IS_ERR(e))
> +               return PTR_ERR(e);
> +
> +       /*
> +        * If a subsystem is in sleep when reading the sleep stats adjust
> +        * the accumulated sleep duration to show actual sleep time.
> +        */
> +       if (e->last_entered_at > e->last_exited_at)
> +               e->accumulated +=3D (arch_timer_read_counter()
> +                                  - e->last_entered_at);
> +
> +       print_sleep_stats(s, e);
> +
> +       return 0;
> +}
> +
> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +       void __iomem *reg =3D s->private;
> +       uint32_t offset;
> +       struct entry e;
> +
> +       offset =3D offsetof(struct entry, count);
> +       e.count =3D le32_to_cpu(readl_relaxed(reg + offset));

readl APIs already do endian conversions.

> +
> +       offset =3D offsetof(struct entry, last_entered_at);
> +       e.last_entered_at =3D le64_to_cpu(readq_relaxed(reg + offset));
> +
> +       offset =3D offsetof(struct entry, last_exited_at);
> +       e.last_exited_at =3D le64_to_cpu(readq_relaxed(reg + offset));
> +
> +       offset =3D offsetof(struct entry, accumulated);
> +       e.accumulated =3D le64_to_cpu(readq_relaxed(reg + offset));
> +
> +       print_sleep_stats(s, &e);
> +
> +       if (config->appended_stats_avail) {
> +               struct appended_entry ae;
> +
> +               offset =3D offsetof(struct appended_entry, client_votes) +
> +                        sizeof(struct entry);
> +               ae.client_votes =3D le32_to_cpu(readl_relaxed(reg + offse=
t));
> +               seq_printf(s, "Client_votes =3D 0x%x\n", ae.client_votes);

Use %#x to avoid having to add 0x prefix. Also, can we replace '=3D' with
':' so that readability is a bit nicer?

> +       }
> +
> +       return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
> +
> +static const struct stats_config rpm_data =3D {
> +       .offset_addr =3D 0x14,
> +       .num_records =3D 2,
> +       .appended_stats_avail =3D true,
> +};
> +
> +static const struct stats_config rpmh_data =3D {
> +       .offset_addr =3D 0x4,
> +       .num_records =3D 3,
> +       .appended_stats_avail =3D false,
> +};
> +
> +static const struct of_device_id soc_sleep_stats_table[] =3D {
> +       { .compatible =3D "qcom,rpm-sleep-stats", .data =3D &rpm_data},
> +       { .compatible =3D "qcom,rpmh-sleep-stats", .data =3D &rpmh_data},
> +       { },

Please drop comma after sentinel. It makes a compiler error appear if
anything comes after.

> +};

Move this table next to the driver structure please.

> +
> +static int create_debugfs_entries(struct soc_sleep_stats_data *drv)
> +{
> +       struct entry *e;
> +       char stat_type[NAME_LENGTH] =3D {0};

Is it a string? Otherwise, seems pretty useless to initialize this to 0
on the stack.

> +       uint32_t offset, type;

Just use u32 instead of uint32_t in any kernel code.

> +       int i;
> +
> +       drv->root =3D debugfs_create_dir("soc_sleep_stats", NULL);
> +       if (IS_ERR_OR_NULL(drv->root))
> +               return PTR_ERR(drv->root);

This is wrong. Debugfs checks have generally been removed because it's
not a problem if debugfs fails. When it fails, drv->root will be NULL
and any debugfs_create() function will ignore it. Since this driver
depends on DEBUGFS being enabled, -ENODEV won't be returned as an error
pointer.

> +
> +       for (i =3D 0; i < config->num_records; i++) {
> +               offset =3D offsetof(struct entry, stat_type) +
> +                        (i * sizeof(struct entry));

This offset of stuff is sort of complicated. I'd prefer to treat it like
how we treat most registers with #defines and base + #define sort of
logic. That is easier to read. It also let's us decide to completely
reorder struct members and not have to worry that the struct doesn't
match how memory is laid out. Instead we have macros that define the
offset from some base __iomem pointer.

> +
> +               if (config->appended_stats_avail)
> +                       offset +=3D i * sizeof(struct appended_entry);
> +
> +               type =3D le32_to_cpu(readl_relaxed(drv->reg + offset));
> +               memcpy(stat_type, &type, sizeof(uint32_t));
> +               debugfs_create_file(stat_type, 0444, drv->root,
> +                                   drv->reg + offset,
> +                                   &soc_sleep_stats_fops);
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(subsystems); i++) {
> +               e =3D qcom_smem_get(subsystems[i].pid, subsystems[i].item=
_id,
> +                                 NULL);
> +
> +               if (IS_ERR(e))
> +                       continue;
> +
> +               debugfs_create_file(subsystems[i].name, 0444, drv->root,
> +                                   &subsystems[i],
> +                                   &subsystem_sleep_stats_fops);
> +       }
> +
> +       return 0;
> +}
> +
> +static int soc_sleep_stats_probe(struct platform_device *pdev)
> +{
> +       struct soc_sleep_stats_data *drv;
> +       struct resource *res;
> +       void __iomem *offset_addr;
> +
> +       drv =3D devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> +       if (!drv)
> +               return -ENOMEM;
> +
> +       config =3D of_device_get_match_data(&pdev->dev);

Use device_get_match_data() to make this be less DT specific.

> +       if (!config)
> +               return -ENODEV;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return PTR_ERR(res);
> +
> +       offset_addr =3D ioremap_nocache(res->start + config->offset_addr,

Why do we need ioremap_nocache()? Can ioremap() work?

> +                                     sizeof(u32));
> +       if (IS_ERR(offset_addr))
> +               return PTR_ERR(offset_addr);
> +
> +       drv->stats_base =3D res->start | readl_relaxed(offset_addr);

Why | vs. +?

> +       drv->stats_size =3D resource_size(res);
> +       iounmap(offset_addr);
> +
> +       drv->reg =3D devm_ioremap(&pdev->dev, drv->stats_base, drv->stats=
_size);
> +       if (!drv->reg)
> +               return -ENOMEM;
> +
> +       if (create_debugfs_entries(drv))
> +               return -ENODEV;
> +
> +       platform_set_drvdata(pdev, drv);
> +
> +       return 0;
> +}
