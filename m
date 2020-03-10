Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF97180923
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 21:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgCJU3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 16:29:08 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37730 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgCJU3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 16:29:05 -0400
Received: by mail-pj1-f68.google.com with SMTP id ca13so927571pjb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GMuYDMQptT1n1uJsZIzgAcIkITwsd6hqzDFmp4rEPRE=;
        b=JeYo3SmdY6UxY4FgcPu7B+OoZgo3hnnVSr6PZBMNBtFWHKglByULsKeeb/caAjP4jJ
         jLJRrzzJGRr6T4Yrlck9Obyx5RovU5Ncve8AeGBizYahB+RuF4+LwpC1MOREIrrM6a0J
         GTGGWzZX+8xImif3vrWHhXBsgG8uJ5oS7z4jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GMuYDMQptT1n1uJsZIzgAcIkITwsd6hqzDFmp4rEPRE=;
        b=Fg6QDVs/cvf7EAQ1GcJky9UL1X7OsT9lkTqDOtu9XQavdsrLWU4as86ImP4vDz4BQu
         HyowLWP1PaZAsEZkToL7/m/e6gzPtYYzUcf6hJfgt5PTW0h1I9NXr6/bJnPaauLcQBgn
         8vDFLTTdOL8bj10ZMbWFj2uRsYaJ5CXqlwftF2jPIcCH1ZX0zpEVuR9Uko2T17d4OVgi
         sHCI0v2Q4qHT03XqiCZPlaGZOh74OAR1gKqvWJyADEs7BC0EPC5f0Yvk9UIYaQNF8Jkh
         HXVKStKeO3+CqFsiaiwd/zlp4q924G9C97jT+/kMJj7YDjjC5LEGn1w3fgads93Tk90V
         ZuuA==
X-Gm-Message-State: ANhLgQ1TfN5Y0ONaI29YARs1tPepzzHKNqTy4hq7OQwb1R18FyggRLMo
        JK47/+o0lYGQoK0kjM0Dw5Rp1RZQ5T4=
X-Google-Smtp-Source: ADFU+vvgzyrWpYIB6gNvxgfP9/U5zEOx+2Aom36kZpRYU1vljRz8s4s5Xhy7AwVsaesd5IsjqhOf5A==
X-Received: by 2002:a17:902:eacb:: with SMTP id p11mr15990588pld.39.1583872144174;
        Tue, 10 Mar 2020 13:29:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z22sm27087928pgn.19.2020.03.10.13.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 13:29:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-3-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-3-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil info in IMEM
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 10 Mar 2020 13:29:02 -0700
Message-ID: <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2020-03-09 23:33:35)
> A region in IMEM is used to communicate load addresses of remoteproc to
> post mortem debug tools. Implement a driver that can be used to store
> this information in order to enable these tools to process collected
> ramdumps.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v3:
> - Don't carry shadow of all entries
> - Reworked indexing of entries in qcom_pil_info_store()
> - Marked global __read_mostly
>=20
> Stephen requested, in v3, that the driver should be turned into a library=
 that,
> in the context of the remoteproc drivers, would resolve the pil info regi=
on and
> update an appropriate entry, preferably a statically assigned one.
>=20
> Unfortunately the entries must be packed, so it's not possible to pre-ass=
ign
> entries for each remoteproc, in case some of them aren't booted. Further =
more,
> it turns out that the IMEM region must be zero-initialized in order to ha=
ve a
> reliable way to determining which entries are available.
>=20
> We therefor have the need for global mutual exclusion and a mechanism tha=
t is
> guaranteed to run before any clients attempt to update the content - so t=
he
> previously proposed design is maintained.

The library could have a static variable that tracks when it's been
called once, holds a lock to protect concurrent access and then zero
initializes on the first call.=20

> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom=
_pil_info.c
> new file mode 100644
> index 000000000000..0ddfb2639b7f
> --- /dev/null
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020 Linaro Ltd.
> + */
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
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

Why are these little endian? Isn't regmap doing endian swaps?

> +} __packed;

Is __packed necessary? It looks like things are naturally aligned
already.

> +
> +struct pil_reloc {
> +       struct device *dev;
> +       struct regmap *map;
> +       size_t offset;
> +       size_t num_entries;
> +       size_t entry_size;
> +};
> +
> +static struct pil_reloc *_reloc __read_mostly;
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
> +       struct pil_reloc_entry entry;
> +       unsigned int offset;
> +       int selected =3D -1;
> +       int ret;
> +       int i;
> +
> +       offset =3D _reloc->offset;
> +
> +       mutex_lock(&reloc_mutex);
> +       for (i =3D 0; i < _reloc->num_entries; i++) {
> +               ret =3D regmap_bulk_read(_reloc->map, offset, &entry, _re=
loc->entry_size);
> +               if (ret < 0)
> +                       continue;
> +
> +               if (!entry.name[0]) {
> +                       if (selected =3D=3D -1)
> +                               selected =3D offset;
> +                       continue;

Why not goto found?

> +               }
> +
> +               if (!strncmp(entry.name, image, sizeof(entry.name))) {
> +                       selected =3D offset;
> +                       goto found;

Why not goto found_again? And then jump over the strscpy() in this case?

> +               }
> +
> +               offset +=3D sizeof(entry);
> +       }
> +
> +       if (selected =3D=3D -1) {

Do we need this check? It should have been jumped over if it found it?

> +               dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> +               ret =3D -ENOMEM;
> +               goto unlock;
> +       }
> +
> +found:
> +       strscpy(entry.name, image, ARRAY_SIZE(entry.name));
> +       entry.base =3D base;
> +       entry.size =3D size;

Sparse should complain here.

> +
> +       ret =3D regmap_bulk_write(_reloc->map, selected, &entry, _reloc->=
entry_size);

It would make a lot more sense to me if this was written with plain
readl/writel logic. Then I don't have to think about structs being
stored in I/O memory regions, and instead I can concentrate on there
being two 64-bit registers for name and base and one 32-bit register for
the size.

> +unlock:
> +       mutex_unlock(&reloc_mutex);
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
> +       struct pil_reloc_entry entry =3D {0};
> +       struct pil_reloc *reloc;
> +       struct resource *res;
> +       struct resource imem;
> +       unsigned int offset;
> +       int ret;
> +       int i;
> +
> +       reloc =3D devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> +       if (!reloc)
> +               return -ENOMEM;
> +
> +       reloc->dev =3D &pdev->dev;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       /* reloc->offset is relative to parent (IMEM) base address */
> +       ret =3D of_address_to_resource(pdev->dev.of_node->parent, 0, &ime=
m);
> +       if (ret < 0)
> +               return ret;
> +
> +       reloc->offset =3D res->start - imem.start;
> +       reloc->num_entries =3D resource_size(res) / sizeof(entry);
> +
> +       reloc->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> +       if (IS_ERR(reloc->map))
> +               return PTR_ERR(reloc->map);
> +
> +       ret =3D regmap_get_val_bytes(reloc->map);
> +       if (ret < 0)
> +               return -EINVAL;
> +       reloc->entry_size =3D sizeof(entry) / ret;
> +
> +       offset =3D reloc->offset;
> +       for (i =3D 0; i < reloc->num_entries; i++, offset +=3D sizeof(ent=
ry)) {
> +               ret =3D regmap_bulk_write(reloc->map, offset, &entry,
> +                                       reloc->entry_size);
> +               if (ret < 0)
> +                       return ret;
> +       }

This would be a lot easier to read with a memset_io().

> +
> +       mutex_lock(&reloc_mutex);
> +       _reloc =3D reloc;
> +       mutex_unlock(&reloc_mutex);
> +
> +       return 0;
> +}
> +
> +static int pil_reloc_remove(struct platform_device *pdev)
> +{
> +       mutex_lock(&reloc_mutex);
> +       _reloc =3D NULL;
> +       mutex_unlock(&reloc_mutex);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id pil_reloc_of_match[] =3D {
> +       { .compatible =3D "qcom,pil-reloc-info" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
> +
> +static struct platform_driver pil_reloc_driver =3D {

I still don't understand the need for a platform device driver and probe
ordering. It's not a device in the usual ways, it's just some memory
that's lying around and always there! Why can't we search in DT for the
imem node and then find the pil reloc info compatible string on the
first call to this library? Then we don't need an API to see if the
device has probed yet (qcom_pil_info_available) and we can just ioremap
some region of memory that's carved out for this reason. Forcing
everything through the regmap is mostly adding pain.

> +       .probe =3D pil_reloc_probe,
