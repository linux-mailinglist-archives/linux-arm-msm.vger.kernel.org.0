Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D99A94A979E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 11:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357801AbiBDKVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 05:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240125AbiBDKVR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 05:21:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC55C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 02:21:17 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so12647155pjj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 02:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2ylAUrVc3+KlkWmNdEOgKNWYITufm2tSr3RIPe+TNY=;
        b=BZRQye6AE5VRpoo/1xKzzjyZ4wUB/8OHaQOO2ET/an8CikTIhuQgqm2ByoRsBLWmyv
         cvmqy8nAcgH1jiTMHzBzaL3AG/CEyszbBRBEaku1w55LsoWxFLiFJeVJTFJFFFXc2H7a
         2PKO+WCSQ/NspxWb+625tBjQ06//t8NxeB4ZpNHnTjHNJDVcK63556rsq0y5LzRnHn6O
         vIB0COJdhFOJJ1sXfZWKSBD0LOnvJ/6sqo5Ar38quQc+/jelxxxo9uqCDIRWiWfLdw+5
         0flcxwrgjUMo2hUMdzHM3Dj1wXtd7PlUryrpLQv1pAfvctSvJvToEvuCEVDbbF8Gtx3F
         tRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2ylAUrVc3+KlkWmNdEOgKNWYITufm2tSr3RIPe+TNY=;
        b=HUVoIzuSh1mqPuCMkifEmioEMwm9XLBM6XUZRXRorbmib66sG1Fk1kWCQrvLG188rx
         OEEi1gxt4/skw3N2kTjYM2RJsXgJQRjRTAQSh0TWtuKfSmkNt9t7QJmTLL+rW8QeQfTa
         m8AXN3V0OywNFpgxtQJ6K+Kf3TLVZ4P5inXFWegc1OOa+SOfAxzMMUB91tjFSL4mzKZy
         BxB9/gayiduLzyw7wjy1ATI3FIYaCcnKE/R7PTMuiF3E4fuxD8zCi8ZmroUDQDeZ15Fh
         BkZf73iJa9lJhi68E4VLkhauSJuWEH3mtaCLkJ/XTUTarAh+7cHx4gyx3hm8sM5PUHHR
         r5Kg==
X-Gm-Message-State: AOAM5313mND3Yo8cOlZaC98+EjUMl+8vhWds1GdmsR2bjQeiLNTD4KHE
        bPCXrNDU9ae4hvc1f5FPUf2Yt7x08haDfRU6ZW9HNw==
X-Google-Smtp-Source: ABdhPJynwCFttcpGz2lLH89Uz7O/jS2iB2GbEDS+olkpWFcKNDcLgYNHlE/g0TBQnIjsurHCNAh6q03j10er3diQvj8=
X-Received: by 2002:a17:902:714a:: with SMTP id u10mr2301615plm.21.1643970076506;
 Fri, 04 Feb 2022 02:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164709.1712069-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164709.1712069-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 11:21:05 +0100
Message-ID: <CAG3jFythce8yMay1FsJwMwz9hB8b_GxkmV5jsghUtV-KE0qdZA@mail.gmail.com>
Subject: Re: [PATCH 7/9] i2c: qcom-cci: simplify access to bus data structure
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Trivial non-functional change, which adds an alias to a widely
> used data location.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 32 ++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index cffc01b2285b..775945f7b4cd 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -593,6 +593,7 @@ static int cci_probe(struct platform_device *pdev)
>         dev_dbg(dev, "CCI HW version = 0x%08x", val);
>
>         for_each_available_child_of_node(dev->of_node, child) {
> +               struct cci_master *master;
>                 u32 idx;
>
>                 ret = of_property_read_u32(child, "reg", &idx);
> @@ -607,32 +608,33 @@ static int cci_probe(struct platform_device *pdev)
>                         continue;
>                 }
>
> -               cci->master[idx].adap.quirks = &cci->data->quirks;
> -               cci->master[idx].adap.algo = &cci_algo;
> -               cci->master[idx].adap.dev.parent = dev;
> -               cci->master[idx].adap.dev.of_node = of_node_get(child);
> -               cci->master[idx].master = idx;
> -               cci->master[idx].cci = cci;
> +               master = &cci->master[idx];
> +               master->adap.quirks = &cci->data->quirks;
> +               master->adap.algo = &cci_algo;
> +               master->adap.dev.parent = dev;
> +               master->adap.dev.of_node = of_node_get(child);
> +               master->master = idx;
> +               master->cci = cci;
>
> -               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> -               snprintf(cci->master[idx].adap.name,
> -                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
> +               i2c_set_adapdata(&master->adap, master);
> +               snprintf(master->adap.name,
> +                        sizeof(master->adap.name), "Qualcomm-CCI");
>
> -               cci->master[idx].mode = I2C_MODE_STANDARD;
> +               master->mode = I2C_MODE_STANDARD;
>                 ret = of_property_read_u32(child, "clock-frequency", &val);
>                 if (!ret) {
>                         if (val == I2C_MAX_FAST_MODE_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST;
> +                               master->mode = I2C_MODE_FAST;
>                         else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST_PLUS;
> +                               master->mode = I2C_MODE_FAST_PLUS;
>                 }
>
> -               init_completion(&cci->master[idx].irq_complete);
> +               init_completion(&master->irq_complete);
>
> -               ret = i2c_add_adapter(&cci->master[idx].adap);
> +               ret = i2c_add_adapter(&master->adap);
>                 if (ret < 0) {
>                         of_node_put(child);
> -                       cci->master[idx].cci = NULL;
> +                       master->cci = NULL;
>                         goto error_i2c;
>                 }
>         }
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
