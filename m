Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE8015CFFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 03:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgBNCfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 21:35:46 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33807 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgBNCfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 21:35:46 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so3144466plt.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 18:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=YkjZqM2zPCFdKSMVqrMU4uiZIPgukgPkLcBqtvrPxVw=;
        b=FTUtexd2G2VHH/wGsAlNuLW1UMTCHwjwtEcGyCzSAIdwYUx0MwYQQh7YEfLp6mz5TO
         G6+m7V3uJfynCvaujIsP79TJiVeOiOBrHdDLYBjzL/QMS9ILnbk3bf+NIfug96yWIb1u
         Ax872eNX8BTmhKr+43c+Ni6DHyQYLLjoZ3ThA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=YkjZqM2zPCFdKSMVqrMU4uiZIPgukgPkLcBqtvrPxVw=;
        b=hLuejbf6TzuElUgSshvN2whgVDHfD1kisgqUzhf+ugEDNwEL2kHy6poEYFLuQL+a0h
         hnbfTAQ4pCDomf++UpQpKT6K9exKUPTtl7bjjs1tuqAeeiFzbfickCeVciXRep13WTwe
         WTuQSfpT/USlRnvbB9cLlMThKLqr0A1TI5okaAhP3ZiQ1+K/ke4jklqxfFQwpai/Z7Vp
         aSvi6esLsTuZEQULgimU/BmsyxPycfgAuCGyafXPoECM91uez4nsXEAD7Hqq9vTNXUuQ
         4izdQzwxbbXxQ4Y6yWk7MN0ZIs2bALnR1PRNn8RdVaguiHerKpfE/31fMZweipZDlQ66
         OHAw==
X-Gm-Message-State: APjAAAX4yR9IzRRpyiVLyNKhqrRw8mhOivFxeR37mRxoL75RyG62V55/
        kV83nXRd4Sc+cxmE5S9VZy5YzQ==
X-Google-Smtp-Source: APXvYqz+frcEpLkDDduD7VqVeAnG3UyaJQ5vUoawp2Myt5QLIObQ1IKXnsNhi0zfzWbG0GWDuDlP8Q==
X-Received: by 2002:a17:902:d216:: with SMTP id t22mr1019808ply.150.1581647745421;
        Thu, 13 Feb 2020 18:35:45 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y10sm4612216pfq.110.2020.02.13.18.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:35:45 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200211005059.1377279-3-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org> <20200211005059.1377279-3-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/8] remoteproc: qcom: Introduce driver to store pil info in IMEM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Date:   Thu, 13 Feb 2020 18:35:44 -0800
Message-ID: <158164774404.184098.8855626264878132058@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-02-10 16:50:53)
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom=
_pil_info.c
> new file mode 100644
> index 000000000000..398aeb957f3c
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020 Linaro Ltd.
> + */
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define PIL_RELOC_NAME_LEN     8
> +
> +struct pil_reloc_entry {
> +       char name[PIL_RELOC_NAME_LEN];
> +       __le64 base;
> +       __le32 size;
> +} __packed;

Does this need __packed? Isn't it naturally aligned?

> +
> +struct pil_reloc {
> +       struct device *dev;
> +       struct regmap *map;
> +       size_t offset;
> +       size_t num_entries;
> +       int val_bytes;

unsigned int?

> +
> +       struct pil_reloc_entry entries[];
> +};
> +
> +static struct pil_reloc *_reloc;

Can this be const? Or marked __read_mostly?

> +static DEFINE_MUTEX(reloc_mutex);
> +
> +/**
> + * qcom_pil_info_store() - store PIL information of image in IMEM
> + * @image:     name of the image
> + * @base:      base address of the loaded image
> + * @size:      size of the loaded image
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
> +{
> +       struct pil_reloc_entry *entry;
> +       int idx =3D -1;
> +       int ret;
> +       int i;
> +
> +       mutex_lock(&reloc_mutex);
> +       for (i =3D 0; i < _reloc->num_entries; i++) {
> +               if (!_reloc->entries[i].name[0]) {
> +                       if (idx =3D=3D -1)
> +                               idx =3D i;
> +                       continue;
> +               }
> +
> +               if (!strncmp(_reloc->entries[i].name, image, 8)) {
> +                       idx =3D i;
> +                       goto found;
> +               }
> +       }
> +
> +       if (idx =3D=3D -1) {

Maybe it would be better to use a pointer and set it to NULL when it
isn't found. Then do some pointer math on the 'entry' to find the
address to regmap_bulk_write() below.

> +               dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> +               ret =3D -ENOMEM;
> +               goto unlock;
> +       }
> +
> +found:
> +       entry =3D &_reloc->entries[idx];
> +       strscpy(entry->name, image, ARRAY_SIZE(entry->name));
> +       entry->base =3D base;
> +       entry->size =3D size;
> +
> +       ret =3D regmap_bulk_write(_reloc->map,
> +                               _reloc->offset + idx * sizeof(*entry),
> +                               entry, sizeof(*entry) / _reloc->val_bytes=
);
> +unlock:
> +       mutex_unlock(&reloc_mutex);

Does the mutex need to be held until here? Why can't we release it once
we find the entry?

> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
> +
> +/**
> + * qcom_pil_info_available() - query if the pil info is probed
> + *
> + * Return: boolean indicating if the pil info device is probed
> + */
> +bool qcom_pil_info_available(void)
> +{
> +       return !!_reloc;
> +}
> +EXPORT_SYMBOL_GPL(qcom_pil_info_available);
> +
> +static int pil_reloc_probe(struct platform_device *pdev)
> +{
> +       unsigned int num_entries;
> +       struct pil_reloc *reloc;
> +       struct resource *res;
> +       int ret;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       num_entries =3D resource_size(res) / sizeof(struct pil_reloc_entr=
y);
> +
> +       reloc =3D devm_kzalloc(&pdev->dev,
> +                            struct_size(reloc, entries, num_entries),
> +                            GFP_KERNEL);
> +       if (!reloc)
> +               return -ENOMEM;
> +
> +       reloc->dev =3D &pdev->dev;
> +       reloc->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> +       if (IS_ERR(reloc->map))
> +               return PTR_ERR(reloc->map);
> +
> +       reloc->offset =3D res->start;
> +       reloc->num_entries =3D num_entries;
> +
> +       reloc->val_bytes =3D regmap_get_val_bytes(reloc->map);
> +       if (reloc->val_bytes < 0)
> +               return -EINVAL;
> +
> +       ret =3D regmap_bulk_write(reloc->map, reloc->offset, reloc->entri=
es,
> +                               reloc->num_entries *
> +                               sizeof(struct pil_reloc_entry) /
> +                               reloc->val_bytes);
> +       if (ret < 0)
> +               return ret;
> +
> +       mutex_lock(&reloc_mutex);
> +       _reloc =3D reloc;
> +       mutex_unlock(&reloc_mutex);

Ah ok, I see that mutex is protecting the pointer used for everything.
Ignore the comment above. But also, why not have every remoteproc device
point at some imem and then search through the imem for the name? Then
we don't need this driver or a lock that synchronizes these things.
Ideally we could dedicate a place in imem for each remoteproc and not
even have to search it for the string to update. Is that possible? Then
it becomes even simpler because the DT binding can point directly at the
address to write. It's not like the various images are changing that
much to the point where this location in imem is actually changing,
right?

> +
> +       return 0;
> +}
