Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16967ADDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 18:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfG3QfW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 12:35:22 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43354 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfG3QfV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 12:35:21 -0400
Received: by mail-vk1-f193.google.com with SMTP id b200so12893324vkf.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 09:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bd218zoMUJsn4aIQS2BNDS+uQZePQhIcqq2z5vcOhic=;
        b=DbmAT97hG2aiN+XhQQTZB5GAaDDkGfUifEkCoJoVfvRfLFdTChp80EEGUEuP4IyxWq
         Q/ySXZL+bKgz4ffKvibIoxHldoiPWbnpTa/r6tE4KxSgvZtu0gLHPDyEGBtSgWP0QcFT
         hkGBj+Ls+hedLeqNzH1rnyadXMkhfGe4vLnzajogJ4YOOkASv0fErAMon/Z22+4LAQPK
         i0YSUcsMX7a8F11PHu+wK4lc8t9+BSwbiE29SE9KVOB0t31NEQBRym30FJ2N3OPfqY2j
         MN8E4ILhiu16fE9WVkVCnNEt+w6NmsDhYYO78AGunBVuRQ2lRf2aVLUImSTylou57g8E
         UF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bd218zoMUJsn4aIQS2BNDS+uQZePQhIcqq2z5vcOhic=;
        b=LYTw1BYfR5L4bf8p32YET0uY7i3LgzY+lVJnPplYNVZmOf56mALT1hpRmQPe4FqdZ5
         0sQ2VqgJ7qDNb+ozffXsybYVihE/qFxlaJ64o9emo0tP9E3Vi6feNK5p9enqBh36/p3u
         HmCZN6rJg+MfDf/WsF/caMjes0v9HYYDrRk6TTqwehITHStHUbIvSsQy0RwFd3EZFNR5
         AgRYCbNkS0zYgK7rvJGDnFLVNI9EeqpT8pqxVXmgKZshurJniijaL3FPTi2hTuDtyxM4
         Oda5ic3RugEQClbHVCUJ2/8GLoq7dGG2DxhwusxXAkiLssKSgGbqDDeacFGPZ8J/lGW3
         YQeQ==
X-Gm-Message-State: APjAAAXjqWjnCshbVidOJj40K7HsCk50qwv+quSCyjdPhadBfspPFSa6
        JufRFuN3nRJSVV0kZX/wrKDFgwwv/PaT5WdsV74=
X-Google-Smtp-Source: APXvYqys0WpkMk5B9ROnp16nbLIVY7ZU3prgqc+nvtWnwOpbR9j0jCxIbSSadoW3uD0BTg4p7Q/DEd1I5uOt47w3sfA=
X-Received: by 2002:a1f:1d58:: with SMTP id d85mr44781885vkd.13.1564504520182;
 Tue, 30 Jul 2019 09:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190725135150.9972-1-vkoul@kernel.org> <20190725135150.9972-2-vkoul@kernel.org>
In-Reply-To: <20190725135150.9972-2-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 30 Jul 2019 22:05:09 +0530
Message-ID: <CAHLCerNsAX4raauTjogOpwqAjEWfd+jpaZYsFnC10tcmvnD5cg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: pms405: add unit name adc nodes
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 25, 2019 at 7:23 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> The adc nodes have reg property but were missing the unit name, so add
> that to fix these warnings:
>
> arch/arm64/boot/dts/qcom/pms405.dtsi:91.12-94.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/ref_gnd: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:96.14-99.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vref_1p25: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:101.19-104.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/vph_pwr: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:106.13-109.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/die_temp: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:111.27-116.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor1: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:118.27-123.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/thermistor3: node has a reg or ranges property, but no unit name
> arch/arm64/boot/dts/qcom/pms405.dtsi:125.22-130.6: Warning (unit_address_vs_reg): /soc@0/spmi@200f000/pms405@0/adc@3100/xo_temp: node has a reg or ranges property, but no unit name
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pms405.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
> index 14240fedd916..3c10cf04d26e 100644
> --- a/arch/arm64/boot/dts/qcom/pms405.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
> @@ -88,41 +88,41 @@
>                         #size-cells = <0>;
>                         #io-channel-cells = <1>;
>
> -                       ref_gnd {
> +                       ref_gnd@0 {
>                                 reg = <ADC5_REF_GND>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       vref_1p25 {
> +                       vref_1p25@1 {
>                                 reg = <ADC5_1P25VREF>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pon_1: vph_pwr {
> +                       pon_1: vph_pwr@131 {
>                                 reg = <ADC5_VPH_PWR>;
>                                 qcom,pre-scaling = <1 3>;
>                         };
>
> -                       die_temp {
> +                       die_temp@6 {
>                                 reg = <ADC5_DIE_TEMP>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pa_therm1: thermistor1 {
> +                       pa_therm1: thermistor1@115 {

s/115/77 ?

>                                 reg = <ADC5_AMUX_THM1_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       pa_therm3: thermistor3 {
> +                       pa_therm3: thermistor3@117 {

s/117/79 ?

>                                 reg = <ADC5_AMUX_THM3_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
>                                 qcom,pre-scaling = <1 1>;
>                         };
>
> -                       xo_therm: xo_temp {
> +                       xo_therm: xo_temp@114 {

s/114/76 ?

>                                 reg = <ADC5_XO_THERM_100K_PU>;
>                                 qcom,ratiometric;
>                                 qcom,hw-settle-time = <200>;
> --
> 2.20.1
>
