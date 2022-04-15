Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB187501F75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243117AbiDOANJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 20:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbiDOAMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 20:12:34 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7C727B17
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:10:05 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id k10so7143015oia.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6sga8ftndk8vtvx+W3R7gg8jxRC7DJXugsbes7nhBXQ=;
        b=l/OJaJEMJuIxkKbI41XC1yk4B5atKv9xuBaVDrSQnmUa6ApdnPZGbgsFNWWtl0Y32t
         2uhDHpzRAob1wqAGSp0LCZssCCEFpOJe5c2b7fe27oHplkIrQRJWfLIj7ZEUrS8Sq5p9
         sTOcFmiBXl5Y+uJx2arJt+cZEZAUuELFanK1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6sga8ftndk8vtvx+W3R7gg8jxRC7DJXugsbes7nhBXQ=;
        b=Kglpds6zwjgVhb5Tsok9kqqHg1loMwTHWy8GxjWHlhSlGkYs8n9dNvyUwR6js7vxXN
         CY1nty2XPcGRGX19uFX7rIxC4eTOBMF0oHrN2H6twchZg/40JYW9iBxx1gLqOfIpnRUJ
         XulvC8s0CFldXLVXHlSoW7ihHslp3JXKlXyfMorGJo3cdOLQj1iygeFPlneS1G/QerNt
         QsrYVSAjSJBecsNKbigB/MiWLIBy7Dmlawwo4XMS0+aV8LUkAVjbMlNFf5/Bc8wd1jhq
         nAggiJykomnJ9PDnG+ZNW7R9D82wfuQQs5GNogRGlNkGnlMHDwflZoxTs4T1tTmtt4Yv
         UMow==
X-Gm-Message-State: AOAM5339zv9wTLfA9n1JGpLVCuy6dnWg+5C/ozHNZfbuhM+rYD1bWMzx
        FpahL83izxPQbf9nerUUjP58wgd5hvpz3VK/Mc2kQw==
X-Google-Smtp-Source: ABdhPJymbaf6NLHP66wW8lvpB5W/WVW2uTuj/EQkoXXOwQgytb/AicoR9wghg6OFqgUtOg1YyKgB2vugeV27/mYgqVE=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr515213oif.63.1649981404878; Thu, 14 Apr
 2022 17:10:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 17:10:04 -0700
MIME-Version: 1.0
In-Reply-To: <1649939418-19861-5-git-send-email-quic_c_skakit@quicinc.com>
References: <1649939418-19861-1-git-send-email-quic_c_skakit@quicinc.com> <1649939418-19861-5-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 14 Apr 2022 17:10:04 -0700
Message-ID: <CAE-0n50HR6w-v3ub8HR_K2PsqqTTrVAaQa0pZ7QjY39WmkDyQQ@mail.gmail.com>
Subject: Re: [PATCH V10 4/9] mfd: pm8008: Add reset-gpios
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

Quoting Satya Priya (2022-04-14 05:30:13)
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index c472d7f..97a72da 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -239,6 +241,13 @@ static int pm8008_probe(struct i2c_client *client)
>                         dev_err(chip->dev, "Failed to probe irq periphs: %d\n", rc);
>         }
>
> +       chip->reset_gpio = devm_gpiod_get(chip->dev, "reset", GPIOD_OUT_HIGH);
> +       if (IS_ERR(chip->reset_gpio)) {
> +               dev_err(chip->dev, "failed to acquire reset gpio\n");

The API looks to print debug messages. This print doesn't look required.

> +               return PTR_ERR(chip->reset_gpio);
> +       }
> +       gpiod_set_value(chip->reset_gpio, 1);

Does this do anything? Does this work just as well?

	reset_gpio = devm_gpiod_get(chip->dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(reset_gpio))
		return PTR_ERR(reset_gpio);

Note that there's no point to store the reset gpio in the structure if
it won't be used outside of probe. This should work fine? I used
GPIOD_OUT_LOW to indicate that the reset should be returned to this
function deasserted, i.e. taking the PMIC out of reset.

> +
>         return devm_of_platform_populate(chip->dev);
