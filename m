Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE7F42AAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 19:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbhJLR0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Oct 2021 13:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhJLR0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Oct 2021 13:26:21 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19375C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:24:20 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so225528ote.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Oct 2021 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WtGUxGcFjuCHfdY5GXb0D0YOU0tDNV4fZPj+DPhXlYE=;
        b=Ygp4ifFUh4fnPgEXFZgBH9TuzFDWRciRle3R6C/OmN+Tc/gQLgSkXTXTbZRIdnddLR
         UlzAbrEJvydN+RLG9v95HhKmXtQ4EsNuUd3x32f2XMCsp23nzD6HWws72TAOktZCnwHl
         +N28WqLe+HezX9sOMCLZ84clVPeX8L0/dGnvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WtGUxGcFjuCHfdY5GXb0D0YOU0tDNV4fZPj+DPhXlYE=;
        b=C/VuXgrfG76CNoHnCR4P2mNHhmKrT9TvJB9QX6yigqvDf5pdT66Tv+qa8TTPABAz9O
         KO7c5yT9wKG/49441PQwrGOHya+favs+2rmb3ar1oqcmNgoNr9MY9E22iVKwonopdOYH
         M24j90xBOGtQvXoy1nNkWuh4qZk6YEj5VEhVBccUlVcalMXMNYz7W5S0GKiLiLrsgEws
         kgjKvvT5uH1PkC7/VZ5oa29YHOprEcpXHHHeXpWPKJyFGmIFuoYMQ33ZguQKSgySPPpg
         ZnmGCnRaY1RUWfjEr7yqeZI3yT6v8s4OqLaPs+Jpqw4OCirc8S3iFqRq7KdA52ihCxVG
         somQ==
X-Gm-Message-State: AOAM530dvjSvT6Phq9YcK2v0Emh89kqrg38mO7K9LhbC05LgbkVir+Ma
        VyxNbNllBZwQw+3Hv8rNJ64akD6VaN7jFlXmUNZ0rA==
X-Google-Smtp-Source: ABdhPJyyzBj7ga+1h/1rc7fPUC6+eHYYeexKxLGfIUioGQJOYFkovXPDVM16Ib6kWcg+ovb2j2roI86MtptDRyCsa0g=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr22637198otg.77.1634059459215;
 Tue, 12 Oct 2021 10:24:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:24:18 -0700
MIME-Version: 1.0
In-Reply-To: <1634043698-20256-1-git-send-email-bgodavar@codeaurora.org>
References: <1634043698-20256-1-git-send-email-bgodavar@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 12 Oct 2021 10:24:18 -0700
Message-ID: <CAE-0n52uUh5TrKpJq9-qkJTdWWU_EZFvoROWFeGEjuc1Ebc8xg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        bjorn.andersson@linaro.org, johan.hedberg@gmail.com,
        marcel@holtmann.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, pharish@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        saluvala@codeaurora.org, abhishekpandit@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Balakrishna Godavarthi (2021-10-12 06:01:38)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 272d5ca..09adc802 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -393,6 +393,23 @@
>                                 <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>         pinctrl-names = "default", "sleep";
>         pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +
> +       bluetooth: wcn6750-bt {

bluetooth: bluetooth {

Node names should be generic.

> +               compatible = "qcom,wcn6750-bt";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&bt_en_default>;
> +               enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +               swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;

Is there any pinctrl config for gpio 86?

> +               vddaon-supply = <&vreg_s7b_0p9>;
> +               vddbtcxmx-supply = <&vreg_s7b_0p9>;
> +               vddrfacmn-supply = <&vreg_s7b_0p9>;
> +               vddrfa0p8-supply = <&vreg_s7b_0p9>;
> +               vddrfa1p7-supply = <&vreg_s1b_1p8>;
> +               vddrfa1p2-supply = <&vreg_s8b_1p2>;
> +               vddrfa2p2-supply = <&vreg_s1c_2p2>;
> +               vddasd-supply = <&vreg_l11c_2p8>;
> +               max-speed = <3200000>;
> +       };
>  };
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> @@ -504,6 +521,14 @@
>                  */
>                 bias-pull-up;
>         };
> +
> +       bt_en_default: bt_en_default {

bt_en: bt-en {

Node names shouldn't have underscores and 'default' is redundant.

> +               pins = "gpio85";
> +               function = "gpio";
> +               drive-strength = <2>;
> +               output-low;
> +               bias-pull-down;

Why is there a pull down on an output gpio? Shouldn't this be
bias-disable?

> +       };
>  };
>
>  &sdc1_on {
