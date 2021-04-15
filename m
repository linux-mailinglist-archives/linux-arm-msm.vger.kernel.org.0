Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB4C73607D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 12:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhDOK7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 06:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbhDOK7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 06:59:09 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851F1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 03:58:46 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c6so17805466qtc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 03:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+d9HFc94ltGAlPVSfde/kdeaYtvJS+g0RLMLuqGJbY=;
        b=G6IG3TeMOaOF0PRpqnn0Yar4LCB75oyYTKiqBx1dYsV1fv49Q0/pYk1+rMRjxZM0ee
         FtRMBVV9642unL9peKzUJeBQzMnn1akbBp9+DLGeIWgqggocbBnpHWgt9ALdyGkTcCnB
         Jvt3Z0wJ+t0KPoWPBwETXVeyG88kfcl0IZ15LhdaO/R/2ksW/rpVeyvjL+8Hy0lLSBiC
         QbcpWMzNVaGkQPJwFjA8XUjaFqBSQbQNlWzsigjb1FH1X+l6GOWWwVRn6pZatSBre8aJ
         BLts2WeG0eObpm5RsNH2/00VOVHr+YhPSufpTS40Gp4Io079vPP1fjGTM3U6sbzF3gVu
         GhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+d9HFc94ltGAlPVSfde/kdeaYtvJS+g0RLMLuqGJbY=;
        b=IH3YfG5SeYRPZx2pOZvnv3iqRWKH6aPMZ8NxPm1Ib3Tb27CeBbhQGfh7bq7SjEIHAa
         OL8T7PoXh9U8+nnV5+uZW55YyrBm9ZuIG7VyYKybPde6BSr5dX7sdCs66Ft0uZUYmj3h
         TIJgyu++IzfPoVZT5eMnbu5aTxpK8tHHEU5bXh4MytDLJEGHqLFl1OGdDHpdwYgasFpo
         2euAmLBU0I6Rhc84hc0pzE7zf5wbQM4U5SqTErKP1yiMzah9iRPZXomzsmMjTG2xvZBd
         Vzt+TLGRFDkgLbcpY3nDf9OzlZXXxThWTe2Mp695q4w5IEoZyaJSsU0hmnaaLx2srpWF
         Cb7Q==
X-Gm-Message-State: AOAM531TWtxzq9zobbt0NpUugMbpy0yHFzuyCQMeAkdVUyEr+6dOXPkh
        q6ECWK+pa4FnjqkV3+iV/NLp1oF7NQ1/ezFfh04i/g==
X-Google-Smtp-Source: ABdhPJwCoZLDb91ODYAylBLymel0AKowHWD4pXEqTVrbtzNhz/EVa6ufH6W5nzx5l5/RA0LySDD2ODx79353I7U2lLw=
X-Received: by 2002:ac8:e09:: with SMTP id a9mr2388182qti.238.1618484325732;
 Thu, 15 Apr 2021 03:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210415103854.1810788-1-balbi@kernel.org>
In-Reply-To: <20210415103854.1810788-1-balbi@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 15 Apr 2021 13:58:34 +0300
Message-ID: <CAA8EJpqT-yJwd7D-zzOem5Zj--LbiyjbXB5zt23F7RLfeZhAag@mail.gmail.com>
Subject: Re: [PATCH] arm64: boot: dts: qcom: sm8150: add SPI nodes
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, 15 Apr 2021 at 13:39, Felipe Balbi <balbi@kernel.org> wrote:
>
> From: Felipe Balbi <felipe.balbi@microsoft.com>
>
> Add missing SPI nodes for SM8150.
>
> Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>

I'd suggest switching to gpio-cs as implemented for sc7180 and sm8250.
At least I'd propose to split the pinctrl into data+clock and CS
configurations, so that the CS implementation can be easily selected
on the board level.

> ---
>
> Tested on Microsoft Surface Duo (DTS will be sent after -rc1). This
> patch also depends on i2c nodes patch by Caleb Connolly
>
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 601 ++++++++++++++++++++++++++-
>  1 file changed, 599 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 7207a3689d9d..97007e1a6533 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -602,6 +602,21 @@ i2c0: i2c@880000 {
>                                 status = "disabled";
>                         };
>
> +                       spi0: spi@880000 {
> +                               compatible = "qcom,spi-geni";
> +                               reg = <0 0x880000 0 0x4000>;
> +                               reg-names = "se";
> +                               clock-names = "se";
> +                               clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&qup_spi0_default>;
> +                               interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +                               spi-max-frequency = <50000000>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               status = "disabled";
> +                       };
> +
>                         i2c1: i2c@884000 {
>                                 compatible = "qcom,geni-i2c";
>                                 reg = <0 0x00884000 0 0x4000>;

[skipped

> @@ -1222,6 +1521,19 @@ config {
>                                 };
>                         };
>
> +                       qup_spi0_default: qup-spi0-default {
> +                               mux {
> +                                       pins = "gpio0", "gpio1", "gpio2", "gpio3";
> +                                       function = "qup0";
> +                               };
> +
> +                               config {
> +                                       pins = "gpio0", "gpio1", "gpio2", "gpio3";
> +                                       drive-strength = <6>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
>                         qup_i2c1_default: qup-i2c1-default {
>                                 mux {
>                                         pins = "gpio114", "gpio115";



-- 
With best wishes
Dmitry
