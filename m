Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A88115062
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 13:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfLFMZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 07:25:35 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:37465 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfLFMZf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 07:25:35 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so7152617ioc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 04:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQbiMMJE8zlEQh6DwgZn6s76A3bT/QzQpsrN16dIp70=;
        b=KRnCRFPTnjxqLiK5A6xLNqlh/5sC1ibeWR446TjHu4ztvog+DzCxEGvDuSJxXwVx6H
         HYF+nNok8+hHYVd1qh6X6b6KnYPoEggHX9uC4Re4XQmkgD37I/5ZD4n2xlA6hCXbm21K
         6f2UXAlpzsWPPqJ+JPtpcacjJktLBaF5y/wzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQbiMMJE8zlEQh6DwgZn6s76A3bT/QzQpsrN16dIp70=;
        b=FD8YKqGDyYFi6kMuT7byr0a4aehUj1DW9q2TIahjdtk29GsXU004uv4QTCsUTosNgE
         6M2ZfF0RB80olczbVSCwzD9L38M8Aj8D1R/zl0z1bSEJIXTCaPmBN73Q8AR73OJyBF+U
         bY5e/MiMOnY42Kzv5dbU6WgSeVjE8qB4YbFc9fHSA67cFeHpZjRgGaa634fCjrk8Ref8
         Hw3thLD8AcV0aZOFT1Jewdd4ISrUgh6Bl4d6V7v33xdlPmkrVhE2W5iMQAMospcVYadG
         t3ttiyhUMVygArk0LuWr+PXQjU/DAbeHSLbTJGzQ6r179bJLVlMYcjf2/amn+Vs9+8vc
         Bgsg==
X-Gm-Message-State: APjAAAWcvGJMpECGAF8zln+h0egTvgCcfGdWpitoNH/vXCRkG8gEAn53
        /8SO+PhY3TbjjiBPfC6IkVmSmUGJ2I5wSQ==
X-Google-Smtp-Source: APXvYqxo8QLI6+YF1VKo0/tKdF5+6BB3AYGSFxbL/CSIHcJA4rqG1dHg5t/N/ca78qH/XQI7L2LWjA==
X-Received: by 2002:a05:6602:2541:: with SMTP id j1mr10309783ioe.239.1575635133938;
        Fri, 06 Dec 2019 04:25:33 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id v4sm3805044ile.60.2019.12.06.04.25.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 04:25:32 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id b15so6112697iln.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 04:25:32 -0800 (PST)
X-Received: by 2002:a92:46c8:: with SMTP id d69mr14733574ilk.168.1575635132283;
 Fri, 06 Dec 2019 04:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20191108092824.9773-1-rnayak@codeaurora.org> <20191108092824.9773-14-rnayak@codeaurora.org>
In-Reply-To: <20191108092824.9773-14-rnayak@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 6 Dec 2019 20:25:20 +0800
X-Gmail-Original-Message-ID: <CAD=FV=VUoj1egZqw9koNHDPBCCEh_XZ5nZAPNKcnya2UACG8hw@mail.gmail.com>
Message-ID: <CAD=FV=VUoj1egZqw9koNHDPBCCEh_XZ5nZAPNKcnya2UACG8hw@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Nov 8, 2019 at 5:29 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>
> Add QUP SE instances configuration for sc7180.
>
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 146 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 675 ++++++++++++++++++++++++
>  2 files changed, 821 insertions(+)

Comments below could be done in a follow-up patch if it makes more sense.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index e1d6278d85f7..666e9b92c7ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi

At the top of this file, please add aliases for all i2c and spi
devices (like sdm845 did).  Right now trying to use command line i2c
tools is super confusing because busses are super jumbled.


> +                       i2c2: i2c@888000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00888000 0 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_i2c2_default>;
> +                               interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };

Where is spi2?


> +                       i2c4: i2c@890000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00890000 0 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_i2c4_default>;
> +                               interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };

Where is spi4?


> +                       i2c7: i2c@a84000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a84000 0 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_i2c7_default>;
> +                               interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };

Where is spi7?


> +                       i2c9: i2c@a8c000 {
> +                               compatible = "qcom,geni-i2c";
> +                               reg = <0 0x00a8c000 0 0x4000>;
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_i2c9_default>;
> +                               interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };

Where is spi9?


> +                       qup_spi1_default: qup-spi1-default {
> +                               pinmux {
> +                                       pins = "gpio0", "gpio1",
> +                                              "gpio2", "gpio3",
> +                                              "gpio12", "gpio94";

Please just mux one of the chip selects by default.  It seems like it
would be _much_ more common to have a single SPI device on the bus and
then every board doesn't have to override this.


> +                       qup_spi6_default: qup-spi6-default {
> +                               pinmux {
> +                                       pins = "gpio59", "gpio60",
> +                                              "gpio61", "gpio62",
> +                                              "gpio68", "gpio72";

Please just mux one of the chip selects by default.  It seems like it
would be _much_ more common to have a single SPI device on the bus and
then every board doesn't have to override this.


> +                       qup_spi10_default: qup-spi10-default {
> +                               pinmux {
> +                                       pins = "gpio86", "gpio87",
> +                                              "gpio88", "gpio89",
> +                                              "gpio90", "gpio91";

Please just mux one of the chip selects by default.  It seems like it
would be _much_ more common to have a single SPI device on the bus and
then every board doesn't have to override this.


-Doug
