Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15A8314508
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 01:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhBIAnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 19:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhBIAnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 19:43:08 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD1CC06178C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Feb 2021 16:42:27 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id r38so11338682pgk.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Feb 2021 16:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=nVPN4UxPEU4aVrwT1YdaPeb+eZCqj8n8X5pzdQWiYkg=;
        b=EVLgGSo8IwfM7scBBkA54yw1YCtCvUbpvVg7vYDVb8DwJd0AHv8AuCwtQ/pAnVvtUD
         Xcx5W128HYWUJQMURWir6029LF6tr1hb3xOKCw4hh8XPcOA/+r4ljXCmE1fprVCktne4
         irO7FrL0IHJcf/rhbuuyv6JzJftoTDqk2sNdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=nVPN4UxPEU4aVrwT1YdaPeb+eZCqj8n8X5pzdQWiYkg=;
        b=e0esbwKsbXLEKXfpI1hCyoA7tRpOcnuLd546R75klwNza02M7SSBZ5szww9nsMkhg0
         2b1zM4otW8nSXVkQjzPfOrjW5c7AfymT9PsHi8XGPLyl2K8LuJd0ecXvzouz6gFPmfj2
         KG0ge+yf6Jg+77DmAU2fpnAPYxGVVNLkfMDazastm7A3vy8KzHW8tzNfVttbpqHKzJFq
         K0lLl82LelCGLmH3xtparn2aN1DEscX1snInKV4ITgF6vXhjEn6eruqCLGPc5YMQOn70
         /IvJa2KOriwDp0yehpZ5m80aMNo5jsZjAK6Kyw5SSLETR04KuGtyOmt7fL62kurdcuLM
         Y98w==
X-Gm-Message-State: AOAM533Edp23rlrZRpy2IEdwdfCvA4ucAQu94Xqax1kfmZWcOh0MuVWb
        NgteAdYopQahSA0RriVN4F644AG6JePf+g==
X-Google-Smtp-Source: ABdhPJyD8IQTuK+U/Bizax/F0z25etXnsB1iM0MSbg8O1PSDuVayIwuE0rzc47b4PO3WGhCBC1u8Ag==
X-Received: by 2002:a65:46c6:: with SMTP id n6mr19634580pgr.110.1612831346848;
        Mon, 08 Feb 2021 16:42:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:751a:ba0b:8918:c305])
        by smtp.gmail.com with ESMTPSA id s21sm19511044pga.12.2021.02.08.16.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 16:42:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1612448508-9179-3-git-send-email-mkshah@codeaurora.org>
References: <1612448508-9179-1-git-send-email-mkshah@codeaurora.org> <1612448508-9179-3-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH v6 2/4] soc: qcom: Add SoC sleep stats driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Mon, 08 Feb 2021 16:42:24 -0800
Message-ID: <161283134463.76967.4872263092725341078@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2021-02-04 06:21:46)
> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>=20
> Let's add a driver to read the stats from remote processor and
> export to debugfs.
>=20
> The driver creates "qcom_sleep_stats" directory in debugfs and
> adds files for various low power mode available. Below is sample
> output with command
>=20
> cat /sys/kernel/debug/qcom_sleep_stats/ddr

The ddr subsystem isn't listed below in subsystems though. Can the
example be updated to reflect what is supported? Or can we gain the ddr
subsystem?

> count =3D 0
> Last Entered At =3D 0
> Last Exited At =3D 0
> Accumulated Duration =3D 0
>=20
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> [mkshah: add subsystem sleep stats, create one file for each stat]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig           |  10 ++
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/soc_sleep_stats.c | 258 +++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 269 insertions(+)
>  create mode 100644 drivers/soc/qcom/soc_sleep_stats.c
>=20
> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sl=
eep_stats.c
> new file mode 100644
> index 0000000..66df638
> --- /dev/null
> +++ b/drivers/soc/qcom/soc_sleep_stats.c
> @@ -0,0 +1,258 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/debugfs.h>

Any chance to get off of debugfs and expose this in sysfs instead?

> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +
> +#include <linux/soc/qcom/smem.h>
> +#include <clocksource/arm_arch_timer.h>
> +
> +#define STAT_TYPE_ADDR         0x0
> +#define COUNT_ADDR             0x4
> +#define LAST_ENTERED_AT_ADDR   0x8
> +#define LAST_EXITED_AT_ADDR    0x10
> +#define ACCUMULATED_ADDR       0x18
> +#define CLIENT_VOTES_ADDR      0x1c
> +
> +#define STAT_OFFSET(record_no, type) (((record_no)*(sizeof(struct sleep_=
stats))) + (type))
> +#define APPENDED_STAT_OFFSET(record_no) ((record_no)*(sizeof(struct appe=
nded_stats)))
> +
> +struct subsystem_data {
> +       const char *name;
> +       u32 smem_item;
> +       u32 pid;
> +};
> +
> +static const struct subsystem_data subsystems[] =3D {
> +       { "modem", 605, 1 },
> +       { "adsp", 606, 2 },
> +       { "cdsp", 607, 5 },
> +       { "slpi", 608, 3 },
> +       { "gpu", 609, 0 },
> +       { "display", 610, 0 },
> +       { "adsp_island", 613, 2 },
> +       { "slpi_island", 613, 3 },
> +};
> +
> +struct stats_config {
> +       u32 offset_addr;
> +       u32 num_records;

size_t?

> +       bool appended_stats_avail;
> +};
> +
> +struct stats_prv_data {
> +       bool appended_stats_avail;
> +       void __iomem *reg;
> +};
> +
> +struct sleep_stats {
> +       u32 stat_type;
> +       u32 count;
> +       u64 last_entered_at;
> +       u64 last_exited_at;
> +       u64 accumulated;
> +};
> +
> +struct appended_stats {
> +       u32 client_votes;
> +       u32 reserved[3];
> +};
> +
> +static void print_sleep_stats(struct seq_file *s, const struct sleep_sta=
ts *stat)
> +{
> +       u64 accumulated =3D stat->accumulated;
> +       /*
> +        * If a subsystem is in sleep when reading the sleep stats adjust
> +        * the accumulated sleep duration to show actual sleep time.
> +        */
> +       if (stat->last_entered_at > stat->last_exited_at)
> +               accumulated +=3D arch_timer_read_counter()
> +                              - stat->last_entered_at;
> +
> +       seq_printf(s, "Count =3D %u\n", stat->count);
> +       seq_printf(s, "Last Entered At =3D %llu\n", stat->last_entered_at=
);
> +       seq_printf(s, "Last Exited At =3D %llu\n", stat->last_exited_at);
> +       seq_printf(s, "Accumulated Duration =3D %llu\n", accumulated);
> +}
> +
> +static int subsystem_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +       struct subsystem_data *subsystem =3D s->private;
> +       struct sleep_stats *stat;
> +
> +       /*
> +        * Saving this pointer during probe may not help in cases like
> +        * subsystem restart, beside not each subsystem is a remote proce=
ssor

s/beside/besides/
s/each/every/

> +        * for e.g display for which we can get start and stop notificati=
on

for example
s/notification/notification./

> +        *
> +        * Lookup smem pointer each time to keep it simple.
> +        */
> +       stat =3D qcom_smem_get(subsystem->pid, subsystem->smem_item, NULL=
);
> +       if (IS_ERR(stat))
> +               return PTR_ERR(stat);
> +
> +       print_sleep_stats(s, stat);
> +
> +       return 0;
> +}
> +
> +static int soc_sleep_stats_show(struct seq_file *s, void *d)
> +{
> +       struct stats_prv_data *prv_data =3D s->private;
> +       void __iomem *reg =3D prv_data->reg;
> +       struct sleep_stats stat;
> +
> +       stat.count =3D readl(reg + COUNT_ADDR);
> +       stat.last_entered_at =3D readq(reg + LAST_ENTERED_AT_ADDR);
> +       stat.last_exited_at =3D readq(reg + LAST_EXITED_AT_ADDR);
> +       stat.accumulated =3D readq(reg + ACCUMULATED_ADDR);
> +
> +       print_sleep_stats(s, &stat);
> +
> +       if (prv_data->appended_stats_avail) {
> +               struct appended_stats app_stat;
> +
> +               app_stat.client_votes =3D readl(reg + CLIENT_VOTES_ADDR);
> +               seq_printf(s, "Client_votes =3D %#x\n", app_stat.client_v=
otes);
> +       }
> +
> +       return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(soc_sleep_stats);
> +DEFINE_SHOW_ATTRIBUTE(subsystem_sleep_stats);
> +
> +static struct dentry *create_debugfs_entries(void __iomem *reg,

Can this be soc_sleep_stats_*()? Or inlined at the call site?
create_debugfs_entries() is too generic.

> +                                            struct stats_prv_data *prv_d=
ata,
> +                                            u32 num_records)
> +{
> +       struct dentry *root;
> +       struct sleep_stats *stat;
> +       char stat_type[sizeof(u32)] =3D {0};
> +       u32 offset, type;
> +       int i;
> +
> +       root =3D debugfs_create_dir("qcom_sleep_stats", NULL);
> +
> +       for (i =3D 0; i < num_records; i++) {
> +               offset =3D STAT_OFFSET(i, STAT_TYPE_ADDR);
> +
> +               if (prv_data[i].appended_stats_avail)
> +                       offset +=3D APPENDED_STAT_OFFSET(i);
> +
> +               prv_data[i].reg =3D reg + offset;
> +
> +               type =3D readl(prv_data[i].reg);
> +               memcpy_fromio(stat_type, &type, sizeof(u32));

type isn't an __iomem pointer though. Did you compile this with sparse?
Use 'make C=3D2'

Also, this is really bad design. The mmio register contains a physical
address of where to read from? It's not an offset from the register or
something like that? If an IOMMU is rewriting physical addresses this
driver is screwed and will try to map some other physical address that
could be completely different based on what the IOMMU decides that
IPA maps to physically.

> +               strim(stat_type);
> +               debugfs_create_file(stat_type, 0400, root,
> +                                   &prv_data[i],
> +                                   &soc_sleep_stats_fops);
> +       }
> +
> +       for (i =3D 0; i < ARRAY_SIZE(subsystems); i++) {
> +               stat =3D qcom_smem_get(subsystems[i].pid, subsystems[i].s=
mem_item,
> +                                    NULL);
> +               if (IS_ERR(stat))
> +                       continue;
> +
> +               debugfs_create_file(subsystems[i].name, 0400, root,
> +                                   (void *)&subsystems[i],

cast to void shouldn't be needed. Please drop it.

> +                                   &subsystem_sleep_stats_fops);
> +       }
> +
> +       return root;
> +}
> +
> +static int soc_sleep_stats_probe(struct platform_device *pdev)
> +{
> +       struct resource *res;
> +       void __iomem *reg;
> +       void __iomem *offset_addr;
> +       phys_addr_t stats_base;
> +       resource_size_t stats_size;
> +       struct dentry *root;
> +       const struct stats_config *config;
> +       struct stats_prv_data *prv_data;
> +       int i;
> +
> +       config =3D device_get_match_data(&pdev->dev);
> +       if (!config)
> +               return -ENODEV;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return PTR_ERR(res);
> +
> +       offset_addr =3D ioremap(res->start + config->offset_addr, sizeof(=
u32));
> +       if (IS_ERR(offset_addr))
> +               return PTR_ERR(offset_addr);
> +
> +       stats_base =3D res->start | readl_relaxed(offset_addr);
> +       stats_size =3D resource_size(res);
> +       iounmap(offset_addr);
> +
> +       reg =3D devm_ioremap(&pdev->dev, stats_base, stats_size);
> +       if (!reg)
> +               return -ENOMEM;
> +
> +       prv_data =3D devm_kcalloc(&pdev->dev, config->num_records,
> +                               sizeof(struct stats_prv_data), GFP_KERNEL=
);

sizeof(*prv_data) please so we don't have to think about the type
matching the pointer storage.

> +       if (!prv_data)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < config->num_records; i++)
> +               prv_data[i].appended_stats_avail =3D config->appended_sta=
ts_avail;
> +
> +       root =3D create_debugfs_entries(reg, prv_data, config->num_record=
s);
> +       platform_set_drvdata(pdev, root);
> +
> +       return 0;
> +}
> +
> +static int soc_sleep_stats_remove(struct platform_device *pdev)
> +{
> +       struct dentry *root =3D platform_get_drvdata(pdev);
> +
> +       debugfs_remove_recursive(root);
> +
> +       return 0;
> +}
> +
