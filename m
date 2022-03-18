Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B474DE302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 21:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240901AbiCRU5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 16:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbiCRU5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 16:57:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3940751584
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:56:12 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bi12so19308682ejb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/rAQQW1B2/1DyUzPxS8vb3OPiqjwadCCTd1IWWZw2tI=;
        b=OoLPZrP0cbAWUR/aj2BfIlZVMNODxp9hHDXKclh06yw2MlBURO8slzW222w0tbYDrU
         Tiy/8C9cAsC2J7BlgMhz2yZmK3gbNc3JDqFLf/4R9d5X+9Mu5KmACRxYOWHCY1k8UFMM
         c7FeDMmh53vjjoFIcT4wwbXBL1y0RnulbXo5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rAQQW1B2/1DyUzPxS8vb3OPiqjwadCCTd1IWWZw2tI=;
        b=GQNAqX2Qe4hqRiHAu86R8hoAycABKzh7pdSo8ekyixQcOSwffUC1r6LECNApsoX+Cc
         OfQUoxbwoDkFNprnWwrxL/QMaNEz1E6J3eC9cSRdZcsWQBGqXv8KKrDgTGmyvp+nAAbs
         Xaj6v48jv+mQBK8unCHFvxpe01Uc9oJ6IDA6RZ+U0lg2PDQdkXV5rf8xuECwXn5q8qFD
         6x8BUxEiJbKwiHJBtxeVq3NZH/zh8gqoHiBjC1J4tPHyIP/ZUkD+55PbC7PL11Y/DoaF
         e8dxfsJXFxebkLA6JGPQ8rGbr0pK8t5uIt7qjOIG5D1CS3TJtrkZd4bRqh9PMqMeb3GA
         d3CA==
X-Gm-Message-State: AOAM532mX4BZJcswTzgnqs2XOMF0ZkH0s5GdXE8J+tLpBcrD3Qyely3h
        l3LBOKArZM7oh89Px8P9Am6AwUkSHOImTAer3R4=
X-Google-Smtp-Source: ABdhPJxfZgKamgztmQVx6DMX1K/Tt4IC812RWpZsVW7YJrH5bEOvF+VYRHpiZuBWPgg6HVYG0qM/5w==
X-Received: by 2002:a17:906:c151:b0:6db:2b7f:302f with SMTP id dp17-20020a170906c15100b006db2b7f302fmr10700207ejc.4.1647636970348;
        Fri, 18 Mar 2022 13:56:10 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709060f5400b006d6d54b9203sm4065795ejj.38.2022.03.18.13.56.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 13:56:09 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id b19so13184686wrh.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 13:56:09 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:203:ed96:8212 with SMTP id
 ay4-20020a5d6f04000000b00203ed968212mr6883263wrb.679.1647636968955; Fri, 18
 Mar 2022 13:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220317010640.2498502-1-swboyd@chromium.org> <20220317010640.2498502-3-swboyd@chromium.org>
In-Reply-To: <20220317010640.2498502-3-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Mar 2022 13:55:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WNqCdPpKdV4gHL4Y9aDpwGW+OE3AcxKrx-OXNfQSLFBQ@mail.gmail.com>
Message-ID: <CAD=FV=WNqCdPpKdV4gHL4Y9aDpwGW+OE3AcxKrx-OXNfQSLFBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Fully describe fingerprint node on Herobrine
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 16, 2022 at 6:06 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Update the fingerprint node on Herobrine to match the fingerprint DT
> binding. This will allow us to drive the reset and boot gpios from the
> driver when it is re-attached after flashing. We'll also be able to boot
> the fingerprint processor if the BIOS isn't doing it for us.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Depends on https://lore.kernel.org/r/20220317005814.2496302-1-swboyd@chromium.org
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 984a7faf0888..282dda78ba3f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -396,13 +396,16 @@ ap_spi_fp: &spi9 {
>         cs-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
>
>         cros_ec_fp: ec@0 {
> -               compatible = "google,cros-ec-spi";
> +               compatible = "google,cros-ec-fp";
>                 reg = <0>;
>                 interrupt-parent = <&tlmm>;
>                 interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&fp_to_ap_irq_l>, <&fp_rst_l>, <&fpmcu_boot0>;
> +               boot0-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
>                 spi-max-frequency = <3000000>;
> +               vdd-supply = <&pp3300_fp_mcu>;

IMO we shouldn't specify vdd-supply here when it's a bogus regulator
(doesn't actually control the relevant GPIO). Having device trees like
this will make it hard to transition to the kernel controlling this
GPIO in the future because the cros-ec-fp driver won't know whether
it's controlling the GPIO or not. So my vote would be either:

1. Go whole hog and have the kernel in charge of the regulator,
exposing regulator control to the userspace updater through some sort
of GPIO

- or -

2. Make the "vdd-supply" optional and don't specify it until we're
ready to go whole hog.


Also note: looking back at the note about the fingerprint regulator,
there's something I wonder if we tried. Did we try to have the
userspace "updater" try unbinding the fingerprint regulator so it
could get control of the GPIO? Then the regulator could normally have
control of it but if userspace wanted control it would unbind the
regulator driver.

-Doug
