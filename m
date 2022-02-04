Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6834A979C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 11:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358241AbiBDKVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 05:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357801AbiBDKVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 05:21:05 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766C9C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 02:21:05 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id c3so4749787pls.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 02:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4RDz5O3fZHHN32oCDBeIkQmYIyN390lM6plHFr1msk8=;
        b=AfqCih11fO3HHY59axnCa+fAQb6uHg0TG9vuQLgow9mbwrIzj3bO3szpKHu8bK2N06
         oUcCJoAp1m+lrgY1CZ7J4SHMUsIOuI1VMc0N3MM9w9mD5EhkTS4yOTQG+4xSDrIbeiiZ
         1s49cTxycHd3h60lJAt2ckYMQVjQ7BzOUbHLYKdiBAu/V1k5yUi1XLToH99NJ4EHJNx5
         0qvD9j9qS5Dp7DlN9qPIIaSmc7PEnu3/N87IEbxBkyKX7arZ2xiApOMtG5vHg/W/3AGN
         3Fjt6VI41wwLW491csW/n2+E9ByB71t/QdSfy6dxnUqsX1Q3KSAjAoJXqlliUA5a4O2P
         +asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4RDz5O3fZHHN32oCDBeIkQmYIyN390lM6plHFr1msk8=;
        b=bxYl0AuAhvXlY8PZPTpGMEapaKtFIjwz+KjJfUYjy/bKSA7Nd3Vg2jXDg4NRrJLzo8
         xmHEP0UsIPsaZgcRC59Nz3n5GTFHZbQVVR2rjhmAmSJ3h8xjKQn/2nNUzceh6H7fAcq6
         548I4uN5nzMa2rs31TJ0DKrCoYRwgwAWLpHSJGgwKwtaY0CxeDP5WVzDa0CFm4Lr2ACx
         CjkeaqDrg6pxwAQkxmZ5Oh/bTSyWIb6hpg9wLND6NG01hMNWLeZNUZow2p8EgMp7wAd0
         ds1tryXmCZkaxKBC1RRLPRamPAf2fw25qwRxM7btpxaaBofo/t4UfO1lCUG021t5TIc5
         qS/Q==
X-Gm-Message-State: AOAM532OVBVxUZIyFih1xE0EoGqb4ENX8EVT9lNWPdBifr5GSiwukZ/A
        MKP8NsuhGwOCf4PtMC6M2yVzlBswDLfrumEIVDzw7w==
X-Google-Smtp-Source: ABdhPJyUJdyTvEsFHVqj4qdEHy7IAFNfuS9oE744mPtbUTiaL26GGgChwdJQTJ+j7E2yR0XpcPP7MeOJ/WBmtGteKW4=
X-Received: by 2002:a17:90b:3b46:: with SMTP id ot6mr2342212pjb.179.1643970064747;
 Fri, 04 Feb 2022 02:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164707.1712048-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164707.1712048-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 11:20:18 +0100
Message-ID: <CAG3jFyuwMKm9d+xqf_bj-33R5HhmMT5qbJUS6838gKa_vev9jw@mail.gmail.com>
Subject: Re: [PATCH 6/9] i2c: qcom-cci: simplify probe by removing one loop
 over busses
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
> It's possible to slightly simplify cci_probe() function by merging
> a loop over I2C busses found on CCI controller with a loop which
> actually registers I2C adapters, the data per I2C bus collected early
> on probe is not used before calling i2c_add_adapter() since cci_reset()
> and cci_init() calls were moved to the end of probe.
>
> The change is intended to be non-functional.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 82 +++++++++++++++----------------
>  1 file changed, 39 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index eebf9603d3d1..cffc01b2285b 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -540,44 +540,6 @@ static int cci_probe(struct platform_device *pdev)
>         if (!cci->data)
>                 return -ENOENT;
>
> -       for_each_available_child_of_node(dev->of_node, child) {
> -               u32 idx;
> -
> -               ret = of_property_read_u32(child, "reg", &idx);
> -               if (ret) {
> -                       dev_err(dev, "%pOF invalid 'reg' property", child);
> -                       continue;
> -               }
> -
> -               if (idx >= cci->data->num_masters) {
> -                       dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
> -                               child, idx, cci->data->num_masters - 1);
> -                       continue;
> -               }
> -
> -               cci->master[idx].adap.quirks = &cci->data->quirks;
> -               cci->master[idx].adap.algo = &cci_algo;
> -               cci->master[idx].adap.dev.parent = dev;
> -               cci->master[idx].adap.dev.of_node = of_node_get(child);
> -               cci->master[idx].master = idx;
> -               cci->master[idx].cci = cci;
> -
> -               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> -               snprintf(cci->master[idx].adap.name,
> -                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
> -
> -               cci->master[idx].mode = I2C_MODE_STANDARD;
> -               ret = of_property_read_u32(child, "clock-frequency", &val);
> -               if (!ret) {
> -                       if (val == I2C_MAX_FAST_MODE_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST;
> -                       else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST_PLUS;
> -               }
> -
> -               init_completion(&cci->master[idx].irq_complete);
> -       }
> -
>         /* Memory */
>
>         r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -630,13 +592,47 @@ static int cci_probe(struct platform_device *pdev)
>         val = readl(cci->base + CCI_HW_VERSION);
>         dev_dbg(dev, "CCI HW version = 0x%08x", val);
>
> -       for (i = 0; i < cci->data->num_masters; i++) {
> -               if (!cci->master[i].cci)
> +       for_each_available_child_of_node(dev->of_node, child) {
> +               u32 idx;
> +
> +               ret = of_property_read_u32(child, "reg", &idx);
> +               if (ret) {
> +                       dev_err(dev, "%pOF invalid 'reg' property", child);
>                         continue;
> +               }
> +
> +               if (idx >= cci->data->num_masters) {
> +                       dev_err(dev, "%pOF invalid 'reg' value: %u (max is %u)",
> +                               child, idx, cci->data->num_masters - 1);
> +                       continue;
> +               }
> +
> +               cci->master[idx].adap.quirks = &cci->data->quirks;
> +               cci->master[idx].adap.algo = &cci_algo;
> +               cci->master[idx].adap.dev.parent = dev;
> +               cci->master[idx].adap.dev.of_node = of_node_get(child);
> +               cci->master[idx].master = idx;
> +               cci->master[idx].cci = cci;
> +
> +               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> +               snprintf(cci->master[idx].adap.name,
> +                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
>
> -               ret = i2c_add_adapter(&cci->master[i].adap);
> +               cci->master[idx].mode = I2C_MODE_STANDARD;
> +               ret = of_property_read_u32(child, "clock-frequency", &val);
> +               if (!ret) {
> +                       if (val == I2C_MAX_FAST_MODE_FREQ)
> +                               cci->master[idx].mode = I2C_MODE_FAST;
> +                       else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
> +                               cci->master[idx].mode = I2C_MODE_FAST_PLUS;
> +               }
> +
> +               init_completion(&cci->master[idx].irq_complete);
> +
> +               ret = i2c_add_adapter(&cci->master[idx].adap);
>                 if (ret < 0) {
> -                       of_node_put(cci->master[i].adap.dev.of_node);
> +                       of_node_put(child);
> +                       cci->master[idx].cci = NULL;
>                         goto error_i2c;
>                 }
>         }
> @@ -657,7 +653,7 @@ static int cci_probe(struct platform_device *pdev)
>         return 0;
>
>  error_i2c:
> -       for (--i ; i >= 0; i--) {
> +       for (i = 0; i < cci->data->num_masters; i++) {
>                 if (cci->master[i].cci) {
>                         i2c_del_adapter(&cci->master[i].adap);
>                         of_node_put(cci->master[i].adap.dev.of_node);
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
