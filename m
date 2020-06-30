Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B716420F37C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 13:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732933AbgF3LS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 07:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728534AbgF3LS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 07:18:28 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843D6C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 04:18:28 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u9so4743376pls.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2020 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LHh/mq3ow+xCsXk724CoAAWxx6QThTTgxukvsFRYnJE=;
        b=rIHmElLsi9YcvMd8jayIy9PWbf0IcN8bgFAL7oFI2jvpM9dYw32oQGIB9WtwqoD/ww
         Dl6xrXsvJWwl/2rV9O1Ijo06Rn4gsPRMfmUJjSZ+Tz7FqmusI6zFBQGSduArrSGefdsG
         8y4hnM6jE/pM7FJDV2pCVdgec2xt5jNHhjuOCbmcAJ6KbOrPS2Nah5g6HxmEIjyWJ1tE
         w1UrYenGzvODcwUxv+5Jv4zwH7W9ks4wc0Dmok+cogQBmJV0MPYyN04pb+45nTKfwRdD
         wkuJfnoDJHpS4aYnM9mdoBTd6jFhRfE/hb/2/RYYL+d7ql2+uG3TZ4b+4DRozi61UkVf
         OgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LHh/mq3ow+xCsXk724CoAAWxx6QThTTgxukvsFRYnJE=;
        b=VyAaPymk2AEVux8gt7WP24Wrlfcp9RQ2Pxd24K70ywdLuy0rsY4MARDGJYfFL4nwfZ
         ApjCVo1loRSmot8iIu7h0MEfhS5BUD8gap/hxqUOCiB+L/uHojBUuuJ0LEa+HVMuGC+X
         s+2hx9kOl4KCTZHYKvwbAnh6woBfNgrphQIIVvZeswVOZZchLKmhLmGnMYRi481x5GL6
         Q/XE11YGeoqtRnN0W3RUN612eZlIf6EG6tdu3Yx1lqRMRAfIUBwXrGT6edzQ+Gy2CiQM
         v+ZunfpUydzrRxdvU0CFrElLyjJa/cX+xvMY+v8KqWsFedaQMf5t7T4Y169TdRp3+ArJ
         pevw==
X-Gm-Message-State: AOAM531D05uIJ3J8uwhI7Uyc5Y1hoo+F7STjmxlcM2LzzaZwUQ+jPjQV
        AgpwgycdtA2KHwt/3B6zBsBzBf+LvqU=
X-Google-Smtp-Source: ABdhPJyaYSNucbiKWDKitlJ+4RuATFLrFB7x0b4LuXYGumiY0eMucAbeVT9Z3RiVU9JRanWj4oqExQ==
X-Received: by 2002:a17:902:b603:: with SMTP id b3mr17581792pls.1.1593515907869;
        Tue, 30 Jun 2020 04:18:27 -0700 (PDT)
Received: from dragon ([80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x10sm2534249pfp.80.2020.06.30.04.18.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 04:18:27 -0700 (PDT)
Date:   Tue, 30 Jun 2020 19:18:20 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] nvmem: qfprom: increase id to support multiple devices
Message-ID: <20200630111819.GE8343@dragon>
References: <20200629133204.23279-1-shawn.guo@linaro.org>
 <04022e2b-e028-b942-811d-a9c8ac836fcc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04022e2b-e028-b942-811d-a9c8ac836fcc@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srini,

On Tue, Jun 30, 2020 at 10:41:24AM +0100, Srinivas Kandagatla wrote:
> TBH, this functionality need to go into core driver which already has IDR to
> allocated ID's for nvmem providers.
> 
> Can you try this patch:

The patch doesn't apply to v5.8-rc, so I manually applied it for
testing. It works like a charm.

Tested-by: Shawn Guo <shawn.guo@linaro.org>

Please copy me when you post it, so that I can pick it up for my
project.  Thanks!

Shawn

> 
> ---------------------------->cut<---------------------------------diff --git
> a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 927eb5f6003f..aa87bd6415ab 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -629,12 +629,18 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
>         if (!config->no_of_node)
>                 nvmem->dev.of_node = config->dev->of_node;
> 
> -       if (config->id == -1 && config->name) {
> +       switch (config->id) {
> +       case NVMEM_DEVID_NONE:
>                 dev_set_name(&nvmem->dev, "%s", config->name);
> -       } else {
> +               break;
> +       case NVMEM_DEVID_AUTO:
> +               dev_set_name(&nvmem->dev, "%s%d", config->name, nvmem->id);
> +               break;
> +       default:
>                 dev_set_name(&nvmem->dev, "%s%d",
>                              config->name ? : "nvmem",
>                              config->name ? config->id : nvmem->id);
> +               break;
>         }
> 
>         nvmem->read_only = device_property_present(config->dev, "read-only")
> ||
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 8a91717600be..8b425f8d847d 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -31,6 +31,7 @@ static struct nvmem_config econfig = {
>         .name = "qfprom",
>         .stride = 1,
>         .word_size = 1,
> +       .id = NVMEM_DEVID_AUTO,
>         .reg_read = qfprom_reg_read,
>  };
> 
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
> index 6d6f8e5d24c9..06409a6c40bc 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -27,6 +27,9 @@ enum nvmem_type {
>         NVMEM_TYPE_BATTERY_BACKED,
>  };
> 
> +#define NVMEM_DEVID_NONE       (-1)
> +#define NVMEM_DEVID_AUTO       (-2)
> +
>  /**
>   * struct nvmem_config - NVMEM device configuration
>   *
> ---------------------------->cut<---------------------------------
