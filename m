Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC5E651DAC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 16:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442303AbiEFOnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 10:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356066AbiEFOnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 10:43:33 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A808D6AA71
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 07:39:42 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id w194so6456767oie.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=rkullnoh6aK6jamDpYjXLjMZk1dUWZfgZ875csKbluo=;
        b=IN4zgzHle+hXB7BGanv/vQTXPOvBs+ia2fNjRPLLlTA8lfReLXYKmIRL59/BWAaSKd
         0gXCxI0UkzP3rLCkET1AIVlIPPtO/WgD8YirWktooiW+psfotN6BLYW1wz1HaFSn7cQS
         +BaG6KQOuXXvJ+oBeXqkfGeH+QG3Ecv5b3ea0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=rkullnoh6aK6jamDpYjXLjMZk1dUWZfgZ875csKbluo=;
        b=GMS9vEtKzfA/XGxlG1PS+//KOAFQw56RvpoBlYgXK6cLelG52ChgWxqncrPEydxo8S
         2C65inVVKVYpWFU8gYCpgUyHVHO08TAmCS2/2iCdreFPKpQbZZ8KjlTSZVOjjZx1xjr7
         DSowIYOqvB/Z3sXiV+1t/HjwcS14LlnOVWYuF1FgIp7kF4kOQ4zhK7u0k+0ERLAqIUlN
         Nqd/P+7zUTnbLBYR+91UlhxSkCQPGKbygYzcCYmBap9HC8e8RjuPS6haA48DKnVB5IqT
         IiozsIij0+4mxhrBhlnfg2HzuhZXFbbV0iBwz1ghLvNlV+p6ztjXydU1JZIwK4XT/CCJ
         SCQA==
X-Gm-Message-State: AOAM530kZoTKfnTI+lSqCqCyLuBiSDrgbey3Zj4NEYKAHx/ZlfF+ajBW
        XyzWkUAUJLa8zpDEmDWIRLbTokDmoD3LXdEq2JvS2Q==
X-Google-Smtp-Source: ABdhPJwr01xnKEIPE5g0WQM4Rmbg1iJzBRBG8GBddSouMrgehMT25DSRJnu/kAB+WU4H9h4XG0Z7WYmUVK1KBhzCfcA=
X-Received: by 2002:a05:6808:23ce:b0:326:6698:c271 with SMTP id
 bq14-20020a05680823ce00b003266698c271mr1548321oib.193.1651847982054; Fri, 06
 May 2022 07:39:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 10:39:41 -0400
MIME-Version: 1.0
In-Reply-To: <1651742739-12338-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1651742739-12338-1-git-send-email-quic_c_skakit@quicinc.com> <1651742739-12338-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 10:39:41 -0400
Message-ID: <CAE-0n51c8H6XnP+6uDmWt6PtiiEAYWSR4DMsZ2CYn-YPuYkqPw@mail.gmail.com>
Subject: Re: [PATCH V11 4/9] mfd: pm8008: Add reset-gpios
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-05-05 02:25:34)
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index c472d7f..e7c3b32 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/bitops.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -221,6 +222,7 @@ static int pm8008_probe(struct i2c_client *client)
>  {
>         int rc;
>         struct pm8008_data *chip;
> +       struct gpio_desc *reset_gpio;
>
>         chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
> @@ -239,6 +241,10 @@ static int pm8008_probe(struct i2c_client *client)
>                         dev_err(chip->dev, "Failed to probe irq periphs: %d\n", rc);
>         }
>
> +       reset_gpio = devm_gpiod_get(chip->dev, "reset", GPIOD_OUT_LOW);

Actually, this needs to come before probing irq chip right? Otherwise
irq chip could try to read/write from the pmic but it would fail.
