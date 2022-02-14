Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F424B5D2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 22:47:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiBNVr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 16:47:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiBNVr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 16:47:27 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4EE18C595
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 13:47:18 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id q8so18888999oiw.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 13:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KZ8Tp8JYnqcpdvEmr+9vUKPtUjGKxrOWPg9ikND1TsQ=;
        b=kEDFFQ9AnhAiPYpTrzxVGENiaHYM4WNo0h7IYAhmBWdtr2Nehv4FPMpQzGIGBTTSdT
         V2UaMvUYGZkYk57yH9eb+iYHLKrErwgOdY4eUHXzNN6zGjZ4AEMBjYejLDsaYiKpifNI
         ow94ZcKv1MDiVK1Cw9O4RE9jJAmxCrV45JbGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KZ8Tp8JYnqcpdvEmr+9vUKPtUjGKxrOWPg9ikND1TsQ=;
        b=XNx1jUoKazLX/A4OckRpcpB9Pv6zc8ruXcCPdz329CQIrcRvIBdmJTMA3qQZYfnDNO
         5fkRFM1GZIJONNpObrrHhrcsDQBSCHJg+mjIGRxTbiF7MMLZDvuk0hbdp1IGMtXsEsrQ
         QW2x0BqRA/C80FQARp2DjsaRWQbAUJ6R+w5hLLpW7EH/MUxiQpf5RFTJ3zDQ74rePG8i
         mgYP++YFCdzJntnEd8Vgtei+dUKkwKHzTa1QUa7pBSYv7ZRiIfmmgN3ds3WEnoumIton
         rZy3pq6Oh2FurJZLlto2vH3dTmb3OFVWBZxkr6A4OVfS/nL40KBfet3RvPV+47LlTWQv
         cfnQ==
X-Gm-Message-State: AOAM532BG6MTC5gwtzuYyc1ONBhRO9Yhm4MOBr3G5BQ6Flb6y8559flT
        0oFAccC828sj6lElwXmKcxKg6Heqtj7icmy+EWfvJw==
X-Google-Smtp-Source: ABdhPJy6QtgovTMrBoMRA7cWoi8cXunIMQ3hmVjFFwyt7eXnabvshXHxsyp6QmnTk4CMzG+koej6x98aKMZeKBq0p4E=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr412149oig.40.1644875238208; Mon, 14 Feb
 2022 13:47:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Feb 2022 13:47:17 -0800
MIME-Version: 1.0
In-Reply-To: <1644668672-29790-2-git-send-email-quic_srivasam@quicinc.com>
References: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com> <1644668672-29790-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 14 Feb 2022 13:47:17 -0800
Message-ID: <CAE-0n52uBY7GzjtFwV67y5mfqZRoK9ooW-kT3=4sH=8NtVK7FQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codec: wcd938x: Add switch control for
 selecting CTIA/OMTP Headset
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-12 04:24:31)
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index eff200a..08d16a9 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -194,6 +194,7 @@ struct wcd938x_priv {
>         int ear_rx_path;
>         int variant;
>         int reset_gpio;
> +       int us_euro_gpio;
>         u32 micb1_mv;
>         u32 micb2_mv;
>         u32 micb3_mv;
> @@ -4196,6 +4197,33 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>                 dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>  }
>
> +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
> +{
> +       int value;
> +
> +       struct wcd938x_priv *wcd938x;
> +
> +       if (!component) {

So component is NULL

> +               dev_err(component->dev, "%s component is NULL\n", __func__);

And now we deref component. Great NULL pointer exception Batman! Please
test your code and remove useless checks. It makes the code harder to
read and slows things down.

> +               return false;
> +       }
> +
> +       wcd938x = snd_soc_component_get_drvdata(component);
> +       if (!wcd938x) {
> +               dev_err(component->dev, "%s private data is NULL\n", __func__);

Is this possible? I doubt it so can we just remove it?

> +               return false;
> +       }
> +
> +       value = gpio_get_value(wcd938x->us_euro_gpio);
> +
> +       gpio_set_value(wcd938x->us_euro_gpio, !value);
> +       /* 20us sleep required after changing the gpio state*/

Add a space before ending comment with */

> +       usleep_range(20, 30);
> +
> +       return true;
> +}
> +
> +
>  static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device *dev)
>  {
>         struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
> @@ -4208,6 +4236,16 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>                 return wcd938x->reset_gpio;
>         }
>
> +       wcd938x->us_euro_gpio = of_get_named_gpio(dev->of_node, "us-euro-gpios", 0);

Why do we need to use of GPIO APIs here? Can this driver be converted to
use GPIO descriptors via the gpiod APIs?

> +       if (wcd938x->us_euro_gpio < 0) {
> +               dev_err(dev, "Failed to get us-euro-gpios gpio: err = %d\n", wcd938x->us_euro_gpio);
> +       } else {
> +               cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
> +               gpio_direction_output(wcd938x->us_euro_gpio, 0);
> +               /* 20us sleep required after pulling the reset gpio to LOW */
> +               usleep_range(20, 30);
> +       }
> +
