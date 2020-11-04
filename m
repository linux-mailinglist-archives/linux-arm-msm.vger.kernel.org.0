Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 228992A6575
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 14:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgKDNpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 08:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729309AbgKDNpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 08:45:09 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA12AC061A4C
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 05:45:08 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id u127so22175745oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjiKTafBvqhyHu+XrblZM0qTc82uTpcV2NnP3xiexks=;
        b=ZhgOwDzOMctQUKpELCF6xCfAiCAnFc6zk2q+FcTcjlWq5EpTui0t6wNd3SDZHPo4JJ
         0iwSfk3vA/4xK0orZjkWmbAMwsGd1nUmruRW6SkQy76kp2ucIb2ryFgooJoJTfnNUe34
         xZmTwa+9BGhk9B3aPPRVEIgf/CWx1PvcC7w/iDMLY7S/cKdLZ6oU+0ZvdlEV4ZbrEZPP
         H/TGzVLNfonL5tVkiBxsOUAe+5MjFgE+D+98gKxWPdCFifWjiqlzxj60SusVxKrBCLz0
         17fl02kiPFxXngNJ/mJr2pPrznCUcWuBgb1OBglhLjyWEfM8HlERCbKsbN7V8OA0WJjM
         u5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjiKTafBvqhyHu+XrblZM0qTc82uTpcV2NnP3xiexks=;
        b=EpjrW+RoyssbLgkU2qHaRRjZdhE5GiR+ou5FiDQDVnMMJFzpk0zE2paeMJxlKa7vzR
         3OhGq6utu42gLaTn6H032W0MLMNBqUQ+m4kG8SLH5G/BS7CEorCGDnsGSY7JLpxWOkU9
         e97A5NLu6oNNDJVoGC1QEqOe7yG3OpNZE5s9s9gYAqeqjkPg4ELVm0xLBJtrx68O7xfP
         sBgE3SyUBt7vH6+IcmfRsSeQXpazq2t7ZVnXV5WbsO8lDnj6ljaWYnxOQVUMLoJ0hF8t
         Qtk/3Wd10qoobi6HxI/c6l3+5T4FtA6zVd3EXVudTjGHsFZ0zvGKCqlKX/7R6AImrwcb
         N4Bg==
X-Gm-Message-State: AOAM530S+UEG2/TW4iw8PoRpemFDbM3H5uJIjPVO/BkFl6U6ufQwjD1X
        VbMFHNI+pFgWVeIr7OEV3JTk0U24y2QEC2lY9pnZSw==
X-Google-Smtp-Source: ABdhPJw/I69T9sXsTerkq96XXMF5qviBr0D4q8GyIjoyXXpCO8JCusvbseV9st/kEeUgyejwLokLFcam2B8RifsTGBQ=
X-Received: by 2002:aca:570d:: with SMTP id l13mr2651297oib.96.1604497508034;
 Wed, 04 Nov 2020 05:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20200909163831.1894142-1-robert.marko@sartura.hr>
In-Reply-To: <20200909163831.1894142-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 4 Nov 2020 14:44:57 +0100
Message-ID: <CA+HBbNFiF9KvQAbkjqy1Le8eGRLd7md8PKwOvRao1ah4dO1TJA@mail.gmail.com>
Subject: Re: [PATCH v8] ARM: dts: qcom: ipq4019: add USB devicetree nodes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 9, 2020 at 6:38 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Since we now have driver for the USB PHY, and USB controller is already supported by the DWC3 driver lets add the necessary nodes to DTSI.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes from v7 to v8:
> * Add labels for usb2 and usb3 nodes
> Changes from v6 to v7:
> * Remove changes to qcom-ipq4019-ap.dk01.1.dtsi
> It has slipped in unwanted, we only want to add
> nodes to the DTSI.
>
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 74 +++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 74d8e2c8e4b3..4a973253024a 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -605,5 +605,79 @@ ethphy4: ethernet-phy@4 {
>                                 reg = <4>;
>                         };
>                 };
> +
> +               usb3_ss_phy: ssphy@9a000 {
> +                       compatible = "qcom,usb-ss-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0x9a000 0x800>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB3_UNIPHY_PHY_ARES>;
> +                       reset-names = "por_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb3_hs_phy: hsphy@a6000 {
> +                       compatible = "qcom,usb-hs-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0xa6000 0x40>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB3_HSPHY_POR_ARES>, <&gcc USB3_HSPHY_S_ARES>;
> +                       reset-names = "por_rst", "srif_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb3: usb3@8af8800 {
> +                       compatible = "qcom,dwc3";
> +                       reg = <0x8af8800 0x100>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       clocks = <&gcc GCC_USB3_MASTER_CLK>,
> +                                <&gcc GCC_USB3_SLEEP_CLK>,
> +                                <&gcc GCC_USB3_MOCK_UTMI_CLK>;
> +                       clock-names = "master", "sleep", "mock_utmi";
> +                       ranges;
> +                       status = "disabled";
> +
> +                       dwc3@8a00000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x8a00000 0xf8000>;
> +                               interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               dr_mode = "host";
> +                       };
> +               };
> +
> +               usb2_hs_phy: hsphy@a8000 {
> +                       compatible = "qcom,usb-hs-ipq4019-phy";
> +                       #phy-cells = <0>;
> +                       reg = <0xa8000 0x40>;
> +                       reg-names = "phy_base";
> +                       resets = <&gcc USB2_HSPHY_POR_ARES>, <&gcc USB2_HSPHY_S_ARES>;
> +                       reset-names = "por_rst", "srif_rst";
> +                       status = "disabled";
> +               };
> +
> +               usb2: usb2@60f8800 {
> +                       compatible = "qcom,dwc3";
> +                       reg = <0x60f8800 0x100>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       clocks = <&gcc GCC_USB2_MASTER_CLK>,
> +                                <&gcc GCC_USB2_SLEEP_CLK>,
> +                                <&gcc GCC_USB2_MOCK_UTMI_CLK>;
> +                       clock-names = "master", "sleep", "mock_utmi";
> +                       ranges;
> +                       status = "disabled";
> +
> +                       dwc3@6000000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0x6000000 0xf8000>;
> +                               interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb2_hs_phy>;
> +                               phy-names = "usb2-phy";
> +                               dr_mode = "host";
> +                       };
> +               };
>         };
>  };
> --
> 2.26.2

Hi,
Any chance of reviewing this?

Regards,
Robert
>
