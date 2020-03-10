Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49970180A66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 22:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgCJV1d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 17:27:33 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42487 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgCJV1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 17:27:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id t3so31081plz.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h7A39cdP8wHwobxG4QsqPiE0DuC7FJfk9grPNWuOyYI=;
        b=Li4mssKaARBBeiY/B/w2uBgSooTFjQMY8NGMI02pNycVbFYRMMXpcYLdQdZXki9kJj
         fGiuyT2V4ySPeK53Oe4P5BiR31HQnBN0cLoCcKUF+018krIdGteq+tnyilDE7lhkXeVS
         baIWPARul/qn33dv5GvrkESVHgoduqMi4M3eY7CJeL7xHa8aKh6wXeIoqp6624ZIPZim
         bYm5Hs4Gi0oMnFF1hdnLglBlYD+XMXR+1R3KRSJ4NoIquDddrHvoba5Un+huvncpPmK1
         j5HTWlGtf1eIAL7GNtkqn4jZopUtg/qm+mc8RbLPW5pcZwr+RXLDvukdlR22uSNs9TWV
         VLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h7A39cdP8wHwobxG4QsqPiE0DuC7FJfk9grPNWuOyYI=;
        b=AnBxixSyXcl5UHWL+ByVE1xDHRBnbpweO0RWSkMA64cBa9V6LTqzcT9v7vsD4tPLa6
         tz0hpR9ZlHdgpmQkKE06yCGEsCo8myMxHEjXZtS+5a7oJDL0nCdkJpv/gYrARdXjmrjS
         suaGSEGl2RrjD3khoIhkC7QT89ZpaKY/LNKHaZ1kYLJ5YxYnIkA3y31UntsquYIrggJA
         YD9bRa3JkzsJO1zNknK/lPL3izeb8o/il+gAVB6a7V7jgT0INp9OTnyLTvsYB4K1yImn
         LM1kusJBZbc2/t7s7q+pyu7p+VELsWE0AXAkRrRnh/1OVhFrcZr+7B26r2JnEwjACPJ9
         4Gjw==
X-Gm-Message-State: ANhLgQ2KzRwW+yJjBM9mmhwDFYCa7+lXbKnXmzKU8aGqrnDVDD06DLPn
        iRR2X7aF5iu2VvpH0nO0zEmBgA==
X-Google-Smtp-Source: ADFU+vtUDFiPEyat4nLB8R1wxu/EnF6BxxVcx/C2dC2CA/rCo+Z9EmDPY6e8LPzKml8J4QRHO2nVKA==
X-Received: by 2002:a17:902:694b:: with SMTP id k11mr22373161plt.334.1583875651534;
        Tue, 10 Mar 2020 14:27:31 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v67sm4451462pfc.120.2020.03.10.14.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:27:30 -0700 (PDT)
Date:   Tue, 10 Mar 2020 14:27:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200310212728.GQ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
 <20200310063338.3344582-3-bjorn.andersson@linaro.org>
 <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Mar 13:29 PDT 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-03-09 23:33:35)
> > A region in IMEM is used to communicate load addresses of remoteproc to
> > post mortem debug tools. Implement a driver that can be used to store
> > this information in order to enable these tools to process collected
> > ramdumps.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v3:
> > - Don't carry shadow of all entries
> > - Reworked indexing of entries in qcom_pil_info_store()
> > - Marked global __read_mostly
> > 
> > Stephen requested, in v3, that the driver should be turned into a library that,
> > in the context of the remoteproc drivers, would resolve the pil info region and
> > update an appropriate entry, preferably a statically assigned one.
> > 
> > Unfortunately the entries must be packed, so it's not possible to pre-assign
> > entries for each remoteproc, in case some of them aren't booted. Further more,
> > it turns out that the IMEM region must be zero-initialized in order to have a
> > reliable way to determining which entries are available.
> > 
> > We therefor have the need for global mutual exclusion and a mechanism that is
> > guaranteed to run before any clients attempt to update the content - so the
> > previously proposed design is maintained.
> 
> The library could have a static variable that tracks when it's been
> called once, holds a lock to protect concurrent access and then zero
> initializes on the first call. 
> 

For the benefit of not having the is_available call then? I presume we
still want the compatible on the node, so the core will still allocate a
struct platform_device for us...

(I'm okay with reworking it that way)

> > diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> > new file mode 100644
> > index 000000000000..0ddfb2639b7f
> > --- /dev/null
> > +++ b/drivers/remoteproc/qcom_pil_info.c
> > @@ -0,0 +1,180 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2019-2020 Linaro Ltd.
> > + */
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +
> > +#define PIL_RELOC_NAME_LEN     8
> > +
> > +struct pil_reloc_entry {
> > +       char name[PIL_RELOC_NAME_LEN];
> > +       __le64 base;
> > +       __le32 size;
> 
> Why are these little endian? Isn't regmap doing endian swaps?
> 

Ugh, you're right. The regmap is created with "default" endian and
32-bit word size by syscon. So presumably this won't work and I must
have missed it when I dumped imem to check the end result.

> > +} __packed;
> 
> Is __packed necessary? It looks like things are naturally aligned
> already.
> 

No, it should be fine.

> > +
> > +struct pil_reloc {
> > +       struct device *dev;
> > +       struct regmap *map;
> > +       size_t offset;
> > +       size_t num_entries;
> > +       size_t entry_size;
> > +};
> > +
> > +static struct pil_reloc *_reloc __read_mostly;
> > +static DEFINE_MUTEX(reloc_mutex);
> > +
> > +/**
> > + * qcom_pil_info_store() - store PIL information of image in IMEM
> > + * @image:     name of the image
> > + * @base:      base address of the loaded image
> > + * @size:      size of the loaded image
> > + *
> > + * Return: 0 on success, negative errno on failure
> > + */
> > +int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
> > +{
> > +       struct pil_reloc_entry entry;
> > +       unsigned int offset;
> > +       int selected = -1;
> > +       int ret;
> > +       int i;
> > +
> > +       offset = _reloc->offset;
> > +
> > +       mutex_lock(&reloc_mutex);
> > +       for (i = 0; i < _reloc->num_entries; i++) {
> > +               ret = regmap_bulk_read(_reloc->map, offset, &entry, _reloc->entry_size);
> > +               if (ret < 0)
> > +                       continue;
> > +
> > +               if (!entry.name[0]) {
> > +                       if (selected == -1)
> > +                               selected = offset;
> > +                       continue;
> 
> Why not goto found?
> 

Didn't think hard enough about it, but you're right - per the need for
packing of entries, if we hit a !name[0] that means there won't be any
matches further down the list.

> > +               }
> > +
> > +               if (!strncmp(entry.name, image, sizeof(entry.name))) {
> > +                       selected = offset;
> > +                       goto found;
> 
> Why not goto found_again? And then jump over the strscpy() in this case?
> 

+1

> > +               }
> > +
> > +               offset += sizeof(entry);
> > +       }
> > +
> > +       if (selected == -1) {
> 
> Do we need this check? It should have been jumped over if it found it?
> 

Per above reasoning this can now go.

> > +               dev_warn(_reloc->dev, "insufficient PIL info slots\n");
> > +               ret = -ENOMEM;
> > +               goto unlock;
> > +       }
> > +
> > +found:
> > +       strscpy(entry.name, image, ARRAY_SIZE(entry.name));
> > +       entry.base = base;
> > +       entry.size = size;
> 
> Sparse should complain here.
> 

You're right.

> > +
> > +       ret = regmap_bulk_write(_reloc->map, selected, &entry, _reloc->entry_size);
> 
> It would make a lot more sense to me if this was written with plain
> readl/writel logic. Then I don't have to think about structs being
> stored in I/O memory regions, and instead I can concentrate on there
> being two 64-bit registers for name and base and one 32-bit register for
> the size.
> 

Seems like this has to change, based on the per-"register" endian
handling in the regmap.

> > +unlock:
> > +       mutex_unlock(&reloc_mutex);
> > +
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pil_info_store);
> > +
> > +/**
> > + * qcom_pil_info_available() - query if the pil info is probed
> > + *
> > + * Return: boolean indicating if the pil info device is probed
> > + */
> > +bool qcom_pil_info_available(void)
> > +{
> > +       return !!_reloc;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pil_info_available);
> > +
> > +static int pil_reloc_probe(struct platform_device *pdev)
> > +{
> > +       struct pil_reloc_entry entry = {0};
> > +       struct pil_reloc *reloc;
> > +       struct resource *res;
> > +       struct resource imem;
> > +       unsigned int offset;
> > +       int ret;
> > +       int i;
> > +
> > +       reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> > +       if (!reloc)
> > +               return -ENOMEM;
> > +
> > +       reloc->dev = &pdev->dev;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (!res)
> > +               return -EINVAL;
> > +
> > +       /* reloc->offset is relative to parent (IMEM) base address */
> > +       ret = of_address_to_resource(pdev->dev.of_node->parent, 0, &imem);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       reloc->offset = res->start - imem.start;
> > +       reloc->num_entries = resource_size(res) / sizeof(entry);
> > +
> > +       reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> > +       if (IS_ERR(reloc->map))
> > +               return PTR_ERR(reloc->map);
> > +
> > +       ret = regmap_get_val_bytes(reloc->map);
> > +       if (ret < 0)
> > +               return -EINVAL;
> > +       reloc->entry_size = sizeof(entry) / ret;
> > +
> > +       offset = reloc->offset;
> > +       for (i = 0; i < reloc->num_entries; i++, offset += sizeof(entry)) {
> > +               ret = regmap_bulk_write(reloc->map, offset, &entry,
> > +                                       reloc->entry_size);
> > +               if (ret < 0)
> > +                       return ret;
> > +       }
> 
> This would be a lot easier to read with a memset_io().
> 

Yes, indeed.

> > +
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = reloc;
> > +       mutex_unlock(&reloc_mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static int pil_reloc_remove(struct platform_device *pdev)
> > +{
> > +       mutex_lock(&reloc_mutex);
> > +       _reloc = NULL;
> > +       mutex_unlock(&reloc_mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id pil_reloc_of_match[] = {
> > +       { .compatible = "qcom,pil-reloc-info" },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(of, pil_reloc_of_match);
> > +
> > +static struct platform_driver pil_reloc_driver = {
> 
> I still don't understand the need for a platform device driver and probe
> ordering. It's not a device in the usual ways, it's just some memory
> that's lying around and always there!

I agree, but the device will be created regardless of us attaching to it
or not - following the fact that it's used to deal with reboot reasons
on some platforms.

> Why can't we search in DT for the
> imem node and then find the pil reloc info compatible string on the
> first call to this library? Then we don't need an API to see if the
> device has probed yet (qcom_pil_info_available)

I think this sounds reasonable.

> and we can just ioremap
> some region of memory that's carved out for this reason. Forcing
> everything through the regmap is mostly adding pain.
> 

My concern here was simply that we'll end up ioremapping various small
chunks of the imem region 10 (or so) times. But I agree that things
would be cleaner here.

Regards,
Bjorn

> > +       .probe = pil_reloc_probe,
