Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69B721798A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 20:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388237AbgCDTIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 14:08:23 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41487 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387706AbgCDTIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 14:08:23 -0500
Received: by mail-oi1-f196.google.com with SMTP id i1so3222252oie.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 11:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oUVw4pl4jaRpJYRbA/EvDWUSDmofrJ+lujzoGcjxLH8=;
        b=RihIbKShC/75NJE9NQ+8TYGsSwuRLAjq19ZGQ/oV3riY2dQSFKcoFuhatV6/uPdj9c
         s1r66XppMDC55h+KCOhXI9OVuVc3VH13rBaBR6QJLM/CfZcEArZMfy7ZrVQfg58Dxtn3
         8348qaYQGClzapu/mTsEWBcVFUZwMJVmW3m/k202d+Wn3Y6YJLn/P0DX1RPtDI1ArhMf
         DMp4WJVkc/SSPgIjG+IeTZGTh3E21K2ze8NH4a3lRHzEsaeSs7wwmQLEZidYGEABCz14
         MaiLfABP0rh3Kmf4yYmPSFeYAxpeyFKWMsN/HLgboLQXQKRcAksDHgDUK1nHTLTA49Ln
         yB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUVw4pl4jaRpJYRbA/EvDWUSDmofrJ+lujzoGcjxLH8=;
        b=AB+W7Zb3uI+FJ2ogBgQupxdso8dUbRIdx2HR3WwCdb4RqItsLYF+ot4XRkk+YJBDQx
         lFDL8uvjAb5NUOtMlFPecg0etAVIPkiESinpJayEVoXNhfe6Z5XZQkOAMsXaLysR1ioD
         LfUI4AWoFfYk061G6jjY/ry/u1J4i4Eq+Mm8dNNGgWgUNglZABvLyLFxaRomVBJv74vI
         KjZN3A/7jyTdrcoHpf2LkSSMntTdeC1Y6a1xSbXp9qLG78gpCwVZ2xLSpLjj+7T4JBt5
         WK+OkwvUwLtQ2DAzysNIOcOYi3ncUa/DEOYSuiDP5KmbBsZkNaXrXsGAaojoUPbHrbvm
         M0qg==
X-Gm-Message-State: ANhLgQ23wfDx2lNpmbCBuqvBIpfpd9Joo1EVRNBs0XiDc3Cwu8aEjuBe
        4KpJrePVwYT1H1Vi2epRnIG66oNP6lz4io0XdV5E6A==
X-Google-Smtp-Source: ADFU+vtYsEeYGoKLEWnGGNIx/HyI5zQ5DyfN5WP7hGsUBLZxycKAblVZiC1e/06KihbwYbyNZYdnRIrg0xOkMAOrWi0=
X-Received: by 2002:aca:fcd8:: with SMTP id a207mr2941851oii.56.1583348902467;
 Wed, 04 Mar 2020 11:08:22 -0800 (PST)
MIME-Version: 1.0
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org> <1583340776-27865-3-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1583340776-27865-3-git-send-email-loic.poulain@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 4 Mar 2020 20:08:11 +0100
Message-ID: <CAG3jFys_2zwsZw_khUP2Vp4rPF42=Ammd+0UPpAo8T7FCqm0tw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: msm8916: Add CCI node
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Due to lack of suitable hardware, I currently can't test the msm8916,
but I have written similar DT nodes for the sdm845, which indeed work properly.

Signed-off-by: Robert Foss <robert.foss@linaro.org>

On Wed, 4 Mar 2020 at 17:49, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> The msm8916 CCI controller provides one CCI/I2C bus.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: add this patch in the series
>  v3: add only cci node for now
>
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8686e10..985cb5f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1451,6 +1451,33 @@
>                         };
>                 };
>
> +               cci@1b0c000 {
> +                       compatible = "qcom,msm8916-cci";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x1b0c000 0x1000>;
> +                       interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +                       clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                               <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +                               <&gcc GCC_CAMSS_CCI_CLK>,
> +                               <&gcc GCC_CAMSS_AHB_CLK>;
> +                       clock-names = "camss_top_ahb", "cci_ahb",
> +                                     "cci", "camss_ahb";
> +                       assigned-clocks = <&gcc GCC_CAMSS_CCI_AHB_CLK>,
> +                                         <&gcc GCC_CAMSS_CCI_CLK>;
> +                       assigned-clock-rates = <80000000>, <19200000>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&cci0_default>;
> +                       status = "disabled";
> +
> +                       cci0: i2c-bus@0 {
> +                               reg = <0>;
> +                               clock-frequency = <400000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                       };
> +               };
> +
>                 camss: camss@1b00000 {
>                         compatible = "qcom,msm8916-camss";
>                         reg = <0x1b0ac00 0x200>,
> --
> 2.7.4
>
