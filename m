Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA5D31917DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 18:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgCXRk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 13:40:26 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33007 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbgCXRkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 13:40:24 -0400
Received: by mail-lf1-f66.google.com with SMTP id c20so14000577lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHdHSXeaggEKXTuBPUsj+Dax4+iq/FMGBOOC34Ttl8I=;
        b=drSQstK+tdROKRR/LjOj0ucrd3VEKgjwndat96gIt+pKISyoD4RCEXpolqW2DSz887
         NXDT3WHFlNiBYqtYaJhxvGLK/i0ts8BKmntpzqOqXMEG3/nwDTJqCvmppkci0sgKx8aJ
         BZQn9m3oSQgMvJILG91fD7vdJijttO+lLvgeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHdHSXeaggEKXTuBPUsj+Dax4+iq/FMGBOOC34Ttl8I=;
        b=lg1DPNQYsXHvNV2O29DSr/0iLxJ+K2IQL7L3H129x5Z8riyiLaanB1c4WL/C7TgjQn
         ul+n/+KqPlYIUXNNQv/QrRKkLjjvk1ca3YbaAbdfWZflRZqXwCqBK+kJf4ALhdwuhc9G
         ccCJPzk5acBNpC6PSMH3ETnuQqYNPw4L95hXALNsqZ9+A6K+wfE1kotkzeEn78Ijk8fL
         OeS6iQbBrW3V2+mvwlZmuBr7/kY7pe8MESA6/ghvCGSj1rN4ZGQSSmJrhXhS8ARPAfDs
         EYr9HRKFCymJb9gC1DVNzh563Xf71zWURvuWvfNvshuKwQCOMgdlrsAQpbnBzpBNKco1
         ncTQ==
X-Gm-Message-State: ANhLgQ3ujMwevtYgkj1dqEQGXH8jA2Se4Jxc5ZC9Itc2kwqAEvXEmnGs
        JMux0r6+xnQBmdls50O+mVpSSyobEyI=
X-Google-Smtp-Source: ADFU+vs9tTa9BsLZs1SFtkCAG3S59wOOtTC8A5xi1zFlHSAMo6N2sEXXSD5TUbIW1n00Ypvr9V8gnQ==
X-Received: by 2002:ac2:48a7:: with SMTP id u7mr17702591lfg.7.1585071622058;
        Tue, 24 Mar 2020 10:40:22 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id r18sm10690244lji.16.2020.03.24.10.40.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 10:40:21 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id s13so19569981ljm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 10:40:20 -0700 (PDT)
X-Received: by 2002:a2e:a495:: with SMTP id h21mr6019658lji.123.1585071619722;
 Tue, 24 Mar 2020 10:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1580822300-4491-1-git-send-email-pillair@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 24 Mar 2020 10:39:43 -0700
X-Gmail-Original-Message-ID: <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
Message-ID: <CAE=gft7EOALEMUWzoR3+pjoxCUTYWbiXoXY=dXH1BDhS3KwBzg@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rakesh,

On Tue, Feb 4, 2020 at 5:21 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add device node for the ath10k SNOC platform driver probe
> and add resources required for WCN3990 on sc7180 soc.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>

What is the status of this? Looks like you have some feedback from
Sibi. Can you reply and spin this? Also a comment below:

> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27 +++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..167f68ac 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -287,6 +287,11 @@
>         vdda-pll-supply = <&vreg_l4a_0p8>;
>  };
>
> +&wifi {
> +       status = "okay";
> +       qcom,msa-fixed-perm;
> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
>
>  &qspi_clk {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 8011c5f..e3e8610 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -75,6 +75,11 @@
>                         reg = <0x0 0x80900000 0x0 0x200000>;
>                         no-map;
>                 };
> +
> +               wlan_fw_mem: memory@93900000 {
> +                       reg = <0 0x93900000 0 0x200000>;
> +                       no-map;
> +               };
>         };
>
>         cpus {
> @@ -1490,6 +1495,28 @@
>
>                         #freq-domain-cells = <1>;
>                 };
> +
> +               wifi: wifi@18800000 {
> +                       compatible = "qcom,wcn3990-wifi";
> +                       reg = <0 0x18800000 0 0x800000>;
> +                       reg-names = "membase";
> +                       iommus = <&apps_smmu 0xc0 0x1>;
> +                       interrupts =
> +                               <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH /* CE0 */ >,
> +                               <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH /* CE1 */ >,
> +                               <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH /* CE2 */ >,
> +                               <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH /* CE3 */ >,
> +                               <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH /* CE4 */ >,
> +                               <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH /* CE5 */ >,
> +                               <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH /* CE6 */ >,
> +                               <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH /* CE7 */ >,
> +                               <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH /* CE8 */ >,
> +                               <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH /* CE9 */ >,
> +                               <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH /* CE10 */>,
> +                               <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH /* CE11 */>;
> +                       memory-region = <&wlan_fw_mem>;

The clocks are missing:

clocks = <&rpmhcc RPMH_RF_CLK2>;
clock-names = "cxo_ref_clk_pin";

> +                       status = "disabled";
> +               };
>         };
>
>         thermal-zones {
> --
> 2.7.4
>
