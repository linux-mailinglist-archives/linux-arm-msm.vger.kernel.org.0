Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEE633A753
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 19:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234085AbhCNSMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 14:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbhCNSMF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 14:12:05 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B548C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 11:12:03 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 133so30944786ybd.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Mar 2021 11:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JiLjT7F7TLvwfttlWWQnjBXTcWSnJNejV4NEk/U2uNU=;
        b=Vs3SmhWd41w0G49v8KGBNDlaN1RnC6zNyvAS8my3/4CXGn34b4H6i44jK1dR6/LNCw
         0hG/4OwXHBerfP3TinAVCyAMcDV/7g3f3IcIhUpgW4Y6hYZ3azWf1ORfl5qKai2RUIIH
         /HvpBpBh84RsJWtCc1eQIGB3ttf7p2wXenf/MSi5QwyIhBQ9SWODlKO6SXCm0bJDIBE3
         u7rStFhPidZq8wB8K9PxTN15m+ul+yN+yn4gTtMKAxzk5s9aqtmh1wrTg/6fETuxwHw/
         Wt5kWqnSB9yvc4l7cCz6gJUkgW0btQu4OkyZxFElKPYNQSj/pdFQ711xc7zeL07nV9S+
         A80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiLjT7F7TLvwfttlWWQnjBXTcWSnJNejV4NEk/U2uNU=;
        b=eONDJnCiZnYaKqha5xV+hDQMnMZ0suEqfjlS88TJOOWDru4IhJsWEieOS8+tq/3ref
         UHmiqMXgn/dzBmZIXp49vKNk6YXpUen8ALNol1dF9WvLEeYcnwa8/c8LSglswjVSDGEH
         uGPrmdgCdhBJ0z2oOfrNZ9kPadkM1dID1WCTF9Am1RF3AyI74Q8Yd3gA/ywNX+495olR
         zr5frx/auPkB4/oQF6Uk4TP4pW4eiTegkfXxPmCb5rQMHlZqy4kzgdPlgSRUBZfl9Frm
         tobBnluWruz+AHhGUF62gJmISIGMSpB3LzI9wghdo03j/fM+nucjJtN73EmjjI9YtmeC
         n5mg==
X-Gm-Message-State: AOAM531VugJtBYhvAjhmfpJmXxWE9d7fn4gER7H2Q1X/eYwqyZoPxVwF
        I0Txis4irHWhH2ZkhBE59B7gTl8rvDCIQJoj+efUaw==
X-Google-Smtp-Source: ABdhPJyK7TD9OEpDYsns/BB949SqcXV5VtqVsGvY2LYwRN674CC8N0nqN8/Ap1rojQY0Qfa0XAEMFTgNBJ7+6szurDc=
X-Received: by 2002:a25:ca42:: with SMTP id a63mr32518347ybg.318.1615745522312;
 Sun, 14 Mar 2021 11:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <BN6PR2001MB1796C76ECAD9DE4807A72F43D96D9@BN6PR2001MB1796.namprd20.prod.outlook.com>
In-Reply-To: <BN6PR2001MB1796C76ECAD9DE4807A72F43D96D9@BN6PR2001MB1796.namprd20.prod.outlook.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Sun, 14 Mar 2021 23:41:26 +0530
Message-ID: <CAMi1Hd3pP8BL7T5XHkh5e3a8c9X5aTdY4hES5-Zc9x5Uu7fNqA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 14 Mar 2021 at 22:32, Joel Selvaraj <jo@jsfamily.in> wrote:
>
> This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
> Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
> and WCD9340 codec.
>

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index 86cbae63eaf7..5b5786595cdb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -5,6 +5,8 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include "sdm845.dtsi"
>  #include "pm8998.dtsi"
>  #include "pmi8998.dtsi"
> @@ -240,6 +242,28 @@ resin {
>         };
>  };
>
> +/* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
> +&q6afedai {
> +       qi2s@22 {
> +               reg = <22>;
> +               qcom,sd-lines = <0>;
> +       };
> +};
> +
> +&q6asmdai {
> +       dai@0 {
> +               reg = <0>;
> +       };
> +
> +       dai@1 {
> +               reg = <1>;
> +       };
> +
> +       dai@2 {
> +               reg = <2>;
> +       };
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> @@ -257,6 +281,73 @@ &sdhc_2 {
>         cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>  };
>
> +&sound {
> +       compatible = "qcom,db845c-sndcard";
> +       pinctrl-0 = <&quat_mi2s_active
> +                       &quat_mi2s_sd0_active>;
> +       pinctrl-names = "default";
> +       model = "Xiaomi Poco F1";
> +       audio-routing =
> +               "RX_BIAS", "MCLK",
> +               "AMIC1", "MIC BIAS1",
> +               "AMIC2", "MIC BIAS2",
> +               "AMIC3", "MIC BIAS3",
> +               "MM_DL1",  "MultiMedia1 Playback",
> +               "MM_DL2",  "MultiMedia2 Playback",
> +               "MultiMedia3 Capture", "MM_UL3";
> +
> +       mm1-dai-link {
> +               link-name = "MultiMedia1";
> +               cpu {
> +                       sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +               };
> +       };
> +
> +       mm2-dai-link {
> +               link-name = "MultiMedia2";
> +               cpu {
> +                       sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +               };
> +       };
> +
> +       mm3-dai-link {
> +               link-name = "MultiMedia3";
> +               cpu {
> +                       sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +               };
> +       };
> +
> +       slim-dai-link {
> +               link-name = "SLIM Playback";
> +               cpu {
> +                       sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +               };
> +
> +               platform {
> +                       sound-dai = <&q6routing>;
> +               };
> +
> +               codec {
> +                       sound-dai =  <&wcd9340 0>;
> +               };
> +       };
> +
> +       slimcap-dai-link {
> +               link-name = "SLIM Capture";
> +               cpu {
> +                       sound-dai = <&q6afedai SLIMBUS_0_TX>;
> +               };
> +
> +               platform {
> +                       sound-dai = <&q6routing>;
> +               };
> +
> +               codec {
> +                       sound-dai = <&wcd9340 1>;
> +               };
> +       };
> +};
> +
>  &tlmm {
>         gpio-reserved-ranges = <0 4>, <81 4>;
>
> @@ -285,6 +376,15 @@ sdc2_card_det_n: sd-card-det-n {
>                 function = "gpio";
>                 bias-pull-up;
>         };
> +
> +       wcd_intr_default: wcd_intr_default {
> +               pins = <54>;
> +               function = "gpio";
> +
> +               input-enable;
> +               bias-pull-down;
> +               drive-strength = <2>;
> +       };
>  };
>
>  &uart6 {
> @@ -345,6 +445,23 @@ &usb_1_qmpphy {
>         vdda-pll-supply = <&vreg_l1a_0p875>;
>  };
>
> +&wcd9340{
> +       pinctrl-0 = <&wcd_intr_default>;
> +       pinctrl-names = "default";
> +       clock-names = "extclk";
> +       clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> +       reset-gpios = <&tlmm 64 0>;
> +       vdd-buck-supply = <&vreg_s4a_1p8>;
> +       vdd-buck-sido-supply = <&vreg_s4a_1p8>;
> +       vdd-tx-supply = <&vreg_s4a_1p8>;
> +       vdd-rx-supply = <&vreg_s4a_1p8>;
> +       vdd-io-supply = <&vreg_s4a_1p8>;
> +       qcom,micbias1-microvolt = <2700000>;
> +       qcom,micbias2-microvolt = <1800000>;
> +       qcom,micbias3-microvolt = <2700000>;
> +       qcom,micbias4-microvolt = <2700000>;
> +};
> +
>  &wifi {
>         status = "okay";
>
> --
> 2.25.1
>
