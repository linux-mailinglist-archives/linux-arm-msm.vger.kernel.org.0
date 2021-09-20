Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E698412A69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhIUBlE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbhIUBjF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:05 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9377BC01AE47
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:37:04 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso25172929otu.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Zsrlsd+FYG22wak0fSNc9tYLdNOZQjnNOfw0BjN2gWI=;
        b=C6jBCxJuR5p9hjcAyOzJ10X1JxfuXVcVcIed41n30NVMz+CAEF+amueSIPWlVngxOl
         9/H0nsuAY/V1ne5wLyLYeM07rRsBvbMSjAHlZ2BlAsRXm5Sh+lyqKow+wvoAi6mdKfPA
         nqdkWbDDeVskdzARIrLtJOy+96E7DZdp2V570=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Zsrlsd+FYG22wak0fSNc9tYLdNOZQjnNOfw0BjN2gWI=;
        b=mk3U9IQkc/Xt1/yrTYsskCxP6fcI++lmneXVeLv5Glat6YYwp5U0e4zSAYdEx5QmCn
         JL3z1TotcfxsOtR1kFfcoLYQc8h0IqjQlLVuRrKYIBeI6Lzh82Vx0epyAToqjB0+JO79
         z9mE2usMqYAE/dJcS57k8JPDFIYLvoWXVlfW5QLrFG04KaMdullFf5rrRWBpfE7OZZWa
         nNYgiQsQq0RczXAJviosul7IL+iu34rZv/LPAe+YX5U5nWKDpXYCj4dBDvk3JV9hK05R
         CAwL/vKorQm5R2CYIY4zbBTZstEZxwvz+daLkUJjdRPzWXTeBVFgHpMSt2wxALjUZkZ9
         8WXA==
X-Gm-Message-State: AOAM531n+P4VS+G0Gc8jvUo+x430EZDbnAk8+4cx6BDj40vk5tQif3f1
        dBt3I1/8p3P3a3gMxDyMuK69kRNrD7tG69Tfr0hB0g==
X-Google-Smtp-Source: ABdhPJwnFR6SOnH84wihZZfbfEvXF/mSh/RHHBaMrdPVwNokuSmK/intbopTA06gDnMPTgyHG0pm8TCjSRegHDJP+l0=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr21352018otp.159.1632166623978;
 Mon, 20 Sep 2021 12:37:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:37:03 -0700
MIME-Version: 1.0
In-Reply-To: <1631875538-22473-5-git-send-email-skakit@codeaurora.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org> <1631875538-22473-5-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:37:03 -0700
Message-ID: <CAE-0n53rto=_+9qtc0RL0tkDwBkd9HJL26TQV-m6Q8myiNSCVA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7280: Add pm8008 regulators
 support for sc7280-idp
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-09-17 03:45:38)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 52638e2..3b3af49 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -207,6 +207,97 @@
>         };
>  };
>
> +&i2c1 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       pm8008_chip: pm8008@8 {
> +               compatible = "qcom,pm8008";
> +               reg = <0x8>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pm8008_active>;
> +       };
> +
> +       pm8008_ldo: pm8008@9 {
[...]
> +
> +                       pm8008_l7: regulator@4600 {
> +                               reg = <0x4600>;
> +                               regulator-name = "pm8008_l7";
> +                               regulator-min-microvolt = <3000000>;
> +                               regulator-max-microvolt = <3544000>;
> +                               qcom,min-dropout-voltage = <96000>;

Is this headroom? Is it actually configurable or is it merely a property
of the hardware? If it's the latter then it should be in the driver and
not in the DTS.

> +                       };
> +               };
> +       };
> +};
> +
>  &qfprom {
>         vcc-supply = <&vreg_l1c_1p8>;
>  };
> @@ -313,6 +404,18 @@
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
> +&pm8350c_gpios {
> +       pm8008_reset {

Is this a pinctrl node?

> +               pm8008_active: pm8008_active {

Please use dashes in node names wherever an underscore goes.

> +                       pins = "gpio4";
> +                       function = "normal";
> +                       bias-disable;
> +                       output-high;
> +                       power-source = <0>;
> +               };
> +       };
> +};
