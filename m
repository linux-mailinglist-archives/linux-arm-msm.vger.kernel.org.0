Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECDD40EAA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 21:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347083AbhIPTIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 15:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347079AbhIPTIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 15:08:02 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BDEC06AA79
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 12:02:37 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id x10-20020a056830408a00b004f26cead745so9599914ott.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 12:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FWeWVI89CMKoqS12Pp2ofBTtl9f9+kDvHLEYyvtvj3Y=;
        b=Wt7OcJpNUxw12DAwblAXr10E60SnW77IXBLxYGtjl4MPd+CK4GnWnRs87pe+Uuu3c8
         ohI3BW3y/F/UIenD56eQVQ6KreefgJIrVNqutHJM0rSM4Fb/zmBfCpOGmXur9lqq2EyJ
         IzKs4ujCFIvkiccoa6fLoYT+/DDXEJgWTUK08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FWeWVI89CMKoqS12Pp2ofBTtl9f9+kDvHLEYyvtvj3Y=;
        b=4efRtYW9/JcnaTKa7Bqhaujkjqr32NNAoin/tezmf6bSxDG908msB5iE1vdT0d7XIn
         6q8UJnPcD6n4fx1bL/byJ21Iobkmy65EG5IvVGagugSXdmocOGgAwPUkJQ29a4bOEnVN
         XY3z7qC1jGI5pLbB7C4tb0ZDcs2pfCZNCQq2n1TdEaXW9et25BvtaR7ONglU34eVoR3Q
         5UomfqNvsMjdYLsTS7j0ky5jgHCHeSvMUAygpsxyZSSThWTurlLhj5iM5oEscdI7/JDY
         wrTiuQ/9aMhLNoAEO/olcZnw0TW7RFaYNtNJiTdZlFtVxgssh5nqDk+RkrBPQsErRlhM
         RSuw==
X-Gm-Message-State: AOAM5314K8tmO/zuAHLTtv1rscP7idoSyysHRK9Zb0IXKzq6BKpQzBIH
        ei4c1cxroqFABOmdllQkrkGyOhgtT//NM3lH6bvB7g==
X-Google-Smtp-Source: ABdhPJzEFLzP9i6NLH2BNZiamfhPoIiZWSUb5DRAGv784Z0t+KDMcv3d9XBq8O+KgpL10r2bUObyqJ+JYSPOsod0imQ=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr5777608otp.159.1631818956932;
 Thu, 16 Sep 2021 12:02:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 12:02:36 -0700
MIME-Version: 1.0
In-Reply-To: <1631798498-10864-3-git-send-email-skakit@codeaurora.org>
References: <1631798498-10864-1-git-send-email-skakit@codeaurora.org> <1631798498-10864-3-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 12:02:36 -0700
Message-ID: <CAE-0n53i4pU==W-dc=md_x+0Tqbd1gtwkPBFode+rtupSFi0WQ@mail.gmail.com>
Subject: Re: [PATCH V5 2/2] arm64: dts: sc7280: Add volume up support for sc7280-idp
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-09-16 06:21:38)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 371a2a9..cbbb0ee 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -12,6 +12,26 @@
>  #include "pm8350c.dtsi"
>  #include "pmk8350.dtsi"
>
> +/ {
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +               label = "gpio-keys";
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&key_vol_up_default>;
> +
> +               volume-up {
> +                       label = "volume_up";
> +                       gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
> +                       linux,input-type = <1>;
> +                       linux,code = <KEY_VOLUMEUP>;

Is there an include for this define? Looks like
<dt-bindings/input/input.h> should be added as well? Did you try
compiling?

> +                       gpio-key,wakeup;
> +                       debounce-interval = <15>;
> +                       linux,can-disable;
> +               };
> +       };
> +};
> +
>  &apps_rsc {
>         pm7325-regulators {
>                 compatible = "qcom,pm7325-rpmh-regulators";
> @@ -284,6 +304,17 @@
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
> +&pm7325_gpios {
> +       key_vol_up_default: key-vol-up-default {
> +               pins = "gpio6";
> +               function = "normal";
> +               input-enable;
> +               bias-pull-up;
> +               power-source = <0>;
> +               qcom,drive-strength = <3>;
> +       };
> +};
> +
>  &qup_uart5_default {
>         tx {
>                 pins = "gpio46";
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
