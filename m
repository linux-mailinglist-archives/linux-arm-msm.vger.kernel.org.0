Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4146C501F90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347972AbiDOAZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 20:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244211AbiDOAZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 20:25:53 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683069D4D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:23:27 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id e4so7139701oif.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LgN5l2Xdx7OlBBeA1J/pb9IoAsBqHSLchNOgVp9URc8=;
        b=JhQOw6oD+ENJofQYOLmf/dXxLR51Monrg2ii08EtiIk0tqB+Wrvo6ZN4CHqwwzg7np
         QSW6PHqcD2DAEWg+pmJeB1n9lmWO+WViXAftfNEZBoVi9PUOvY0on98FZLfAfIPvgrT0
         WL7Kl9Hp0USpO5b8pnNgDKSsTAHMr35EOaNOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LgN5l2Xdx7OlBBeA1J/pb9IoAsBqHSLchNOgVp9URc8=;
        b=FVHgqSYf2v3OOJgOZigXW2jiiSBpmNcE0BerxEsJbcMUCCWxLYXMs3JbmH4VJtZ9C6
         bFqFxzKM6acW/JZqYp2y/h1UpKv1f7KM33fA+vzS9vYnsoLUrCa1zzW/L58NQnV6tX3W
         tM0AER6pfdO0exVc1nqsTAuxRr+T2lR8G+SE8/MATTpeEj3D95gASWrh7uI/o8M6Pm25
         oHQeRMG4UtrIrCzfmhEZRkwJx6VGQjjTzmFD/ONJxE0E7wefGtGOLXAKCoi3lzjuWRHv
         53J/RKvotI+WN+H+/B3tahari9hI4hhWH4RUHrPaSV4IVmQSPij3u7WrQFDOiyIohGBM
         H8bg==
X-Gm-Message-State: AOAM531jr4iozQsmUZj2BRexxnh2VZQo0kVmNWRuqK6e1ddOz0rSYSiz
        k2sl2MZzlKyl7/pjssUi5fUJj+VJMq5IZiiex74p8w==
X-Google-Smtp-Source: ABdhPJy0PYdJjWm1QwIxeQBt2wSPs1eCYhYHJlnzymEclleon6HTtYOjLdLkmeO1kwgGHVmzvE+1djojfpCp8u55eHQ=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr535616oif.63.1649982206848; Thu, 14 Apr
 2022 17:23:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:23:26 -0700
MIME-Version: 1.0
In-Reply-To: <1649939418-19861-7-git-send-email-quic_c_skakit@quicinc.com>
References: <1649939418-19861-1-git-send-email-quic_c_skakit@quicinc.com> <1649939418-19861-7-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 17:23:26 -0700
Message-ID: <CAE-0n51oHKdoLi9vgUN1qZv9UU3ipY8aNEtze=maTF8bT4NqpQ@mail.gmail.com>
Subject: Re: [PATCH V10 6/9] mfd: pm8008: Add mfd_cell struct to register LDOs
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-04-14 05:30:15)
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index ca5240d..ab4ba55 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -282,6 +287,14 @@ static int pm8008_probe(struct i2c_client *client)
>         }
>         gpiod_set_value(chip->reset_gpio, 1);
>
> +       rc = devm_mfd_add_devices(&chip->clients[PM8008_REGULATORS_SID]->dev,
> +                       0, pm8008_regulator_devs, ARRAY_SIZE(pm8008_regulator_devs),
> +                       NULL, 0, NULL);
> +       if (rc) {
> +               dev_err(chip->dev, "Failed to add regulators: %d\n", rc);
> +               return rc;
> +       }
> +
>         return devm_of_platform_populate(chip->dev);

Can we just use devm_of_platform_populate()? Then have a compatible =
"qcom,pm8008-regulators" that binds with the regulator platform driver
and searches for the named regmap for the second i2c client.
