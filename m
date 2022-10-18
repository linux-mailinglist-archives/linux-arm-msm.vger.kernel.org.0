Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C78560281B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 11:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbiJRJSJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 05:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbiJRJSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 05:18:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59C4A98E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 02:18:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id q9so30803528ejd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 02:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oOQqs65wtvxD4dXO4tAoUmo7evjc4ehlCZeveSnwvf0=;
        b=zb081iMh7QlIU5PcMmIu9rydRddiZCl3sflOebBzziP8ApqyWutpxbxkgnFN7y5pcb
         kCK5FoPIfZfefyH1k8Hyr5lmpyaQER8R+F6PMP7bIaUR4Qd0uS3iba3OTCi3fZ/Z73R4
         ow+MCscbaCzzjne6e6dEL7NVLBIS6gIK/rwdHGvt/NPXc3FXM6uaaRHkoo3ydCByNva8
         i1QZztSRnKv46EYpVK8nPe7M1yPpdA3mA+6nQkB7IfcY5FC3GkfVPYcqZ//dReL5pHSQ
         j4ZooHa94RjthJqm6dWyhVqylE+VB01KtYEbBIStj/b1WmzhHJUXYryVveINpQiWU0F1
         gRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOQqs65wtvxD4dXO4tAoUmo7evjc4ehlCZeveSnwvf0=;
        b=Xs9T4rHuNDY7eT9PlumE5gqkW833TdVH3ScbvpTprkmO5+A2tpF8Y2koEledQQOCvc
         ZpEIxBLNhFL+dSLvNm4MuO0to+OwuAonv6bsKIeUkLJcCjeeH21XfJfDEeRftyCQQ6KT
         DCSLtiUeLzrKqEwNnWQ9LTnDFB0seBMem+j3HWSsLOcyQTeIZvYbpsqSD4dDjoeYrkj+
         pQyH8WVyuWhJxeBEOZCPrJkCYCbv8O1rgO/EoodYJM33N892iJX1UqwTtl++0t+8f3B9
         Nq018LsKJ1sj06QlNmONIFLuiHUfGFGpFQdZqQTPQWLseDY8tSJ6r9Ssj3+sgAc55tk1
         04oQ==
X-Gm-Message-State: ACrzQf176hy4tNJreRs8dhrqbpDZ60ILGnqxma9CSSb+QZQ2oIPJdjYa
        0BPSKQeZM5XsrlWVVv7ulyVWME+UmDl0rws/GcYlxA==
X-Google-Smtp-Source: AMsMyM6lZ2+Xt+1NEg2JK7nPwMIv3ssbgjEp/zROqPCRH200jqaALy3oAke4WBt/IhCcXtUVaXfHcVFtSi5ZhtdOnxs=
X-Received: by 2002:a17:907:7805:b0:780:24fd:c4e8 with SMTP id
 la5-20020a170907780500b0078024fdc4e8mr1602811ejc.78.1666084684420; Tue, 18
 Oct 2022 02:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221018021920.3747344-1-bryan.odonoghue@linaro.org> <20221018021920.3747344-2-bryan.odonoghue@linaro.org>
In-Reply-To: <20221018021920.3747344-2-bryan.odonoghue@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 18 Oct 2022 11:17:53 +0200
Message-ID: <CAG3jFyuoJGNGHmQFfNsBJfnYbUw+jMCiP5uiLcYspYapYKydpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     loic.poulain@linaro.org, wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Oct 2022 at 04:19, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> When we compile-in the CCI along with the imx412 driver and run on the RB5
> we see that i2c_add_adapter() causes the probe of the imx412 driver to
> happen.
>
> This probe tries to perform an i2c xfer() and the xfer() in i2c-qcom-cci.c
> fails on pm_runtime_get() because the i2c-qcom-cci.c::probe() function has
> not completed to pm_runtime_enable(dev).
>
> Fix this sequence by ensuring pm_runtime_xxx() calls happen prior to adding
> the i2c adapter.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 87739fb4388b..a4b97fe3c3a5 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -639,6 +639,11 @@ static int cci_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 goto error;
>
> +       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +
>         for (i = 0; i < cci->data->num_masters; i++) {
>                 if (!cci->master[i].cci)
>                         continue;
> @@ -650,14 +655,12 @@ static int cci_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> -       pm_runtime_use_autosuspend(dev);
> -       pm_runtime_set_active(dev);
> -       pm_runtime_enable(dev);
> -
>         return 0;
>
>  error_i2c:
> +       pm_runtime_disable(dev);
> +       pm_runtime_dont_use_autosuspend(dev);
> +
>         for (--i ; i >= 0; i--) {
>                 if (cci->master[i].cci) {
>                         i2c_del_adapter(&cci->master[i].adap);
> --
> 2.34.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
