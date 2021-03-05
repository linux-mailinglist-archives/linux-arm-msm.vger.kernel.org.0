Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0378732F2D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 19:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhCEShW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 13:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230252AbhCEShF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 13:37:05 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A00DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 10:37:05 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id b130so2932197qkc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tAzU/ER1YTxKVrtAuXzIX1YVd5lSI8a7UASsaMYtGqY=;
        b=F6v+gi5njFo02gEo0z1Nd6777zf+xCNjxdwa0X7VeLeXPMrOu1HTtE8AEdqXdq/MBZ
         v3VsLDdlwbKBVJPztcbzun5R+lehMx0t5bH9SrbuuXC2HAXbGKoeLlQXamfNJCHa13+P
         R509ASsFL8WM9LRpe9/eBWPPLKwj+LSpaWjv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tAzU/ER1YTxKVrtAuXzIX1YVd5lSI8a7UASsaMYtGqY=;
        b=immMvKujYD5blAOfKbI/Nx559xvy2XtNjYHHJNIDQQjJ+Wnoc1f/2Z7R63s2NhfUbn
         V8BYu0hbWNAA5m7fCE3PnpH2Q/OUtxZwYLqqiKK1xVnVwCW/oigxoAPtw8sZFpJ1TVZK
         hBoDVnnyFom8s1HsAcKRkDJpq3zKQ8spn3iBcocfwt2NMtLthINR/3vZyTAnmzPHTUqs
         OKdNpqX1YI7lQF/iF/41vJt8PbCvJfAC4iQ08Gflr2Vbl0HMNNuf8ZfcwmBr13ObhVjQ
         1kvMUdfx50jVb0NIgzteFeOp0slSJiYuD43aw2ORiDOYk/7M5DVB7yHAIClJspT/B8F2
         jboQ==
X-Gm-Message-State: AOAM53164At8eFPPMeDQ14pJdZLvO1Nmt4BUMbuQMiIxIv3HLRFoevbG
        xTKC8KYEs5EJBfLWqkYZ73c1kz3PbxvnrA==
X-Google-Smtp-Source: ABdhPJzQqiUEgL8aDhuB+xmq55OJ5dobwClci2f8br8DDwOQQHguFCNI2hsr/5deo4keuK5L/N07EQ==
X-Received: by 2002:a37:a8cc:: with SMTP id r195mr10023277qke.86.1614969423662;
        Fri, 05 Mar 2021 10:37:03 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id p12sm2390385qtw.27.2021.03.05.10.37.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 10:37:02 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id 133so2956317ybd.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:37:02 -0800 (PST)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr16373727ybi.276.1614969422178;
 Fri, 05 Mar 2021 10:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20210304180415.1531430-1-mka@chromium.org> <20210304100341.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
In-Reply-To: <20210304100341.1.I6d587e7ae72a5a47253bb95dfdc3158f8cc8a157@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Mar 2021 10:36:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XKpzSq2GqvoDieuZVZFrwmO0Q2prPaKeJRKXJmxPGWpg@mail.gmail.com>
Message-ID: <CAD=FV=XKpzSq2GqvoDieuZVZFrwmO0Q2prPaKeJRKXJmxPGWpg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sc7180: lazor: Simplify disabling
 of charger thermal zone
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 4, 2021 at 10:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Commit f73558cc83d1 ("arm64: dts: qcom: sc7180: Disable charger
> thermal zone for lazor") disables the charger thermal zone for
> specific lazor revisions due to an unsupported thermistor type.
> The initial idea was to disable the thermal zone for older
> revisions and leave it enabled for newer ones that use a
> supported thermistor. Finally the thermistor won't be changed
> on newer revisions, hence the thermal zone should be disabled
> for all lazor (and limozeen) revisions. Instead of disabling
> it per revision do it once in the shared .dtsi for lazor.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts | 9 ---------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts | 9 ---------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts | 9 ---------
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi   | 9 +++++++++
>  4 files changed, 9 insertions(+), 27 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> index 5c997cd90069..30e3e769d2b4 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dts
> @@ -14,15 +14,6 @@ / {
>         compatible = "google,lazor-rev0", "qcom,sc7180";
>  };
>
> -/*
> - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> - * to avoid using bogus temperature values.
> - */
> -&charger_thermal {
> -       status = "disabled";
> -};
> -
>  &pp3300_hub {
>         /* pp3300_l7c is used to power the USB hub */
>         /delete-property/regulator-always-on;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> index d9fbcc7bc5bd..c2ef06367baf 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
> @@ -14,15 +14,6 @@ / {
>         compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
>  };
>
> -/*
> - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> - * to avoid using bogus temperature values.
> - */
> -&charger_thermal {
> -       status = "disabled";
> -};
> -
>  &pp3300_hub {
>         /* pp3300_l7c is used to power the USB hub */
>         /delete-property/regulator-always-on;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> index 19e69adb9e04..1b9d2f46359e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
> @@ -13,12 +13,3 @@ / {
>         model = "Google Lazor (rev3+)";
>         compatible = "google,lazor", "qcom,sc7180";
>  };
> -
> -/*
> - * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> - * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> - * to avoid using bogus temperature values.
> - */
> -&charger_thermal {
> -       status = "disabled";
> -};
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> index 89e5cd29ec09..aa2c4a9098db 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
> @@ -58,6 +58,15 @@ ap_ts: touchscreen@10 {
>         };
>  };
>
> +/*
> + * Lazor is stuffed with a 47k NTC as charger thermistor which currently is
> + * not supported by the PM6150 ADC driver. Disable the charger thermal zone
> + * to avoid using bogus temperature values.
> + */
> +&charger_thermal {
> +       status = "disabled";
> +};
> +
>  /* PINCTRL - modifications to sc7180-trogdor.dtsi */
>
>  &ts_reset_l {

The idea is right, but I'm having a hard time figuring out what tree
you posted your patch against. You said you did it atop my "v2" series
[1], right?  ...but the "sc7180-trogdor-lazor.dtsi" really doesn't
match. In my tree, for instance, right above the PINCTRL comment
should be:

&wifi {
  qcom,ath10k-calibration-variant = "GO_LAZOR";
};

...but that's definitely not what's there in whatever your patch was
written against... It seems like you're also missing the panel and
trackpad nodes...

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=440315


-Doug
