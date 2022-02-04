Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161CD4A9791
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 11:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236921AbiBDKRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 05:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357817AbiBDKRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 05:17:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB99C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 02:17:31 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id o64so5072371pjo.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 02:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fwS7qFx6y78vbyiPVnisHyORc4HvjfZxrGxT7B4rcI=;
        b=gkbHzN9bD+gb2uQtZYRFy8Xfx5zMX9XuK+U3gQUKWU4HjGHzC/XYsmDVzlYZ/ccAB5
         moq8Hf+MchkoJ75WCR03py8rewbTmkrQKlQW2LUzKPFSqIUaDtlINRvF+5MCGu5MpHKu
         qH+sGOODCgcacEk7DDVoQ5mofCHAIBstAlPGR2OP9nfrFYqfRA3O8rhG1PZQdOgbi87F
         RdI79yd25Q/cuEw1cJQeJWZnZJPSeEz/yDoVID9koNpGQysNQupCwdRxA7zT/F+nv4Ng
         Vc+J6z2KtVabehD5XwLOl5thIlUnlwwwFuj/E1sUEd2rUozCW551iKzx4UloXgGhrKBL
         ZmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fwS7qFx6y78vbyiPVnisHyORc4HvjfZxrGxT7B4rcI=;
        b=5fNS++/I/2Xs73JKwrVUFKA20atbIVZ8nX32O5U1a/aZToDZ8S4XjBohUvAs1qZ05d
         B677hlfuZPaj29tgWFjN7OXbxxA1itcJSdI+1kI13Txdey59z5qdEU0odXyA3Vq2XsCB
         920aW3qU/ycD9e3g3wiyMIWNFIW6okEbQd+38Ctbv77Zvc7dm+LJ5YL+IUZYQCo/1ieZ
         Yrq6k4CYr52Avb0PEFDRXhkRHZYvfMttFCQujTX9xkvqmo1i1SihCxxLgIi0axYatxLL
         YeT0MDJBaZTwl0fiZGGYVooCnMS/d3pNKu+YEaNud3yHu5eUCtorLKWkH9oQedvavolk
         jXfQ==
X-Gm-Message-State: AOAM530MVtVff6unGRtq+bPbNAqzgLrQqoaKa0jTekoHbovmK1SFLTk3
        nq4qY2z/C9t3Mlqc9iDBvCraHnz2VljCe6Ogl5HqoA==
X-Google-Smtp-Source: ABdhPJwoggzyoAlIFZxHiBwPYB8230LV/06SuAaM05cysaO2/TpIWfrbb6++auKQDutm0dcGiFNMCXptznsf0ym57PU=
X-Received: by 2002:a17:90b:1802:: with SMTP id lw2mr2313561pjb.232.1643969850623;
 Fri, 04 Feb 2022 02:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org> <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220203164703.1712006-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 4 Feb 2022 11:17:19 +0100
Message-ID: <CAG3jFystRaetfUYwr3zJr69u-m7uqm435pC-73pvH4tSCGhGoA@mail.gmail.com>
Subject: Re: [PATCH 4/9] i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
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
> There is a minor chance for a race, if a pointer to an i2c-bus subnode
> is stored and then reused after releasing its reference, and it would
> be sufficient to get one more reference under a loop over children
> subnodes.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index fd4260d18577..cf54f1cb4c57 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -558,7 +558,7 @@ static int cci_probe(struct platform_device *pdev)
>                 cci->master[idx].adap.quirks = &cci->data->quirks;
>                 cci->master[idx].adap.algo = &cci_algo;
>                 cci->master[idx].adap.dev.parent = dev;
> -               cci->master[idx].adap.dev.of_node = child;
> +               cci->master[idx].adap.dev.of_node = of_node_get(child);
>                 cci->master[idx].master = idx;
>                 cci->master[idx].cci = cci;
>
> @@ -643,8 +643,10 @@ static int cci_probe(struct platform_device *pdev)
>                         continue;
>
>                 ret = i2c_add_adapter(&cci->master[i].adap);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       of_node_put(cci->master[i].adap.dev.of_node);
>                         goto error_i2c;
> +               }
>         }
>
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> @@ -656,8 +658,10 @@ static int cci_probe(struct platform_device *pdev)
>
>  error_i2c:
>         for (--i ; i >= 0; i--) {
> -               if (cci->master[i].cci)
> +               if (cci->master[i].cci) {
>                         i2c_del_adapter(&cci->master[i].adap);
> +                       of_node_put(cci->master[i].adap.dev.of_node);
> +               }
>         }
>  error:
>         disable_irq(cci->irq);
> @@ -673,8 +677,10 @@ static int cci_remove(struct platform_device *pdev)
>         int i;
>
>         for (i = 0; i < cci->data->num_masters; i++) {
> -               if (cci->master[i].cci)
> +               if (cci->master[i].cci) {
>                         i2c_del_adapter(&cci->master[i].adap);
> +                       of_node_put(cci->master[i].adap.dev.of_node);
> +               }
>                 cci_halt(cci, i);
>         }
>
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
