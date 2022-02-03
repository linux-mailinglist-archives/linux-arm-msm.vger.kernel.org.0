Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6FB4A8F97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 22:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243285AbiBCVJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 16:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbiBCVJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 16:09:10 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1EFC061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 13:09:10 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id y23so6021128oia.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 13:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WlXSPyshRFclLsUmWCIEz+XunV5G/A4UJamN2kRUK+g=;
        b=X10F6y8TbRqadN5k1/ebOR1L6hzUOz+4NBW3NBUqzfF5y7j48+BuhY3eUBSX2VBVIy
         7WI8cG2Y1RAqMhtzmZzhCuguH+1m8C2mFBXjdjOcj2wMlzZoWQb3f3cfjas0MBjtNc7A
         6QqDEzXwtS9S2q1X0kGhEAkRL1GcLV3usIW10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WlXSPyshRFclLsUmWCIEz+XunV5G/A4UJamN2kRUK+g=;
        b=qKyQ3rfl4lbOWgM5Y44DERRiCvTWFU0NJ260K0Kb0mLATLcZRiK6wI7Tp/5SpL0ocV
         bq6TTH5BdvTbSV1LQvRvQjUGgmV83yQ2VApmbsojJiN33seuHzhQhWoCRjrrZDXrKkF1
         9uEL+2+1Cu6HQ/GnP2JPh64ITxlD81Q3czHgeJ65Y50iTIn9guC2omZ+4Gii1mS9N41y
         8yrKm6i84uLF1qllIldH/o7/raAsjnM8TleOyCjhCPiSnVAYkAVQ9909jqQh55bwzhoI
         M3Knu4mZYKDhKpRQU9++MloW0ARSIB7wr+D9CJtew8RTQ2z3guiJQtDIHUeAMyt0VxvR
         saPQ==
X-Gm-Message-State: AOAM531OGV520Fdb0e4ZBXGXp62e3Z0gRimTvFqDO1+d3/+QER38aYb6
        ni0hrzXkXFJdFUlrjAVkWMs7ykTREmzWTTQgQUto4Q==
X-Google-Smtp-Source: ABdhPJzARb38uT6d2OBJyBS0AdfLQIqHnLim6tiJz+2O+5mqhm1zInOUAPKcCGzaQbZSldxLSHXHOX6MP9vYUwTXbZ0=
X-Received: by 2002:a05:6808:190f:: with SMTP id bf15mr8666309oib.40.1643922550025;
 Thu, 03 Feb 2022 13:09:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Feb 2022 21:09:09 +0000
MIME-Version: 1.0
In-Reply-To: <1643790082-18417-1-git-send-email-quic_pmaliset@quicinc.com>
References: <1643790082-18417-1-git-send-email-quic_pmaliset@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Feb 2022 21:09:09 +0000
Message-ID: <CAE-0n51+-+-NRAFbnvZnGH_nq+P7cxyUuSgSD992G=joumMA1A@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Fix pcie gpio entries
To:     Prasad Malisetty <quic_pmaliset@quicinc.com>, agross@kernel.org,
        bhelgaas@google.com, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, kw@linux.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, lorenzo.pieralisi@arm.com,
        robh@kernel.org
Cc:     quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
        manivannan.sadhasivam@linaro.org, dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Prasad Malisetty (2022-02-02 00:21:22)
> Current gpio's in IDP file are not mapping properly,
> seeing device timedout failures.

What's the problem exactly?

>
> Corrected pcie gpio entries in dtsi files.
>
> Fixes: 4e24d227aa77 ("arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board")
>
> Signed-off-by: Prasad Malisetty <quic_pmaliset@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 35 ++++++++++++++------------------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 10 ++++++++-
>  2 files changed, 24 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 78da9ac..84bf9d2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -243,9 +243,6 @@
>         perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>
>         vddpe-3v3-supply = <&nvme_3v3_regulator>;
> -
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>;
>  };
>
>  &pcie1_phy {
> @@ -360,6 +357,21 @@
>
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
> +&pcie1_reset_n {
> +       pins = "gpio2";
> +
> +       drive-strength = <16>;

Is drive-strength of 16 actually necessary?

> +       output-low;
> +       bias-disable;
> +};
> +
> +&pcie1_wake_n {
> +       pins = "gpio3";
> +
> +       drive-strength = <2>;
> +       bias-pull-up;
> +};
> +
>  &pm7325_gpios {
>         key_vol_up_default: key-vol-up-default {
>                 pins = "gpio6";
> @@ -436,23 +448,6 @@
>                 function = "gpio";
>         };
>
> -       pcie1_reset_n: pcie1-reset-n {
> -               pins = "gpio2";
> -               function = "gpio";
> -
> -               drive-strength = <16>;
> -               output-low;
> -               bias-disable;
> -       };
> -
> -       pcie1_wake_n: pcie1-wake-n {
> -               pins = "gpio3";
> -               function = "gpio";
> -
> -               drive-strength = <2>;
> -               bias-pull-up;
> -       };
> -
>         qup_uart7_sleep_cts: qup-uart7-sleep-cts {
>                 pins = "gpio28";
>                 function = "gpio";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index d4009cc..2e14c37 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1640,7 +1640,7 @@
>                         phy-names = "pciephy";
>
>                         pinctrl-names = "default";
> -                       pinctrl-0 = <&pcie1_clkreq_n>;
> +                       pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
>
>                         iommus = <&apps_smmu 0x1c80 0x1>;
>
> @@ -3272,6 +3272,14 @@
>                                 bias-pull-up;
>                         };
>
> +                       pcie1_reset_n: pcie1-reset-n {
> +                               function = "gpio";
> +                       };
> +
> +                       pcie1_wake_n: pcie1-wake-n {
> +                               function = "gpio";
> +                       };
> +
>                         dp_hot_plug_det: dp-hot-plug-det {
>                                 pins = "gpio47";
>                                 function = "dp_hot";
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
