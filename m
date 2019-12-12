Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DF211CBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 12:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbfLLLAe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 06:00:34 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:44466 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728722AbfLLLAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 06:00:33 -0500
Received: by mail-ua1-f68.google.com with SMTP id d6so668724uam.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E/BDoN8LZUDxXyY/LOw9blBuAN4iCi1dNk0E5OnY49A=;
        b=0pngTayzWJ20KkIBh4tlHJX+QdVx/rkEkOMTPMMkhuqR7vgQNhYEqZ1NPP0dRkr4P+
         bDnwbbiSS91uoE+EW/6uHJpeB3oEPywSxie4sceXAxr79+DkZTxNo79cogGtfTDCoF65
         p5BhjUqxj68aDMfQvYOga54io5dJ8DtIxyc0AXJdszgIgn6likYDlp9hzDxMYedA/fy+
         JBF4uNj6AUsW3L1kiUdruc+lmWz9604Fy2MXvU1GId/o3xOwR6ef6ZfdCjo5RB48Oz/o
         AOgBtNJQuPYxR0xLGQoHZCvQ6I7teRQogxfgoExeNTKipB0JRJumEMP2I0J9Jty2rVo0
         BoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E/BDoN8LZUDxXyY/LOw9blBuAN4iCi1dNk0E5OnY49A=;
        b=OJkTIUx8WIVk8xc5iVUgnIEn3pLXW+1oNGpZWqM2PtHp9l1EGoOPsVF6KIqW+3SSmB
         83KA+/Ji+Qmi6fXNI/BTo6HsZWIf3+HC4kVwSuSb1X79/ClGAB282ZxT9FcIa5oX+308
         Gs95hoGo2GFn6fw4ooCLexvkvcW3FI84cTdow3h++EtzHmEf0hLz6YVtMxgxoedI6HQa
         Db5Ghi4B/pOTOMoB83BHTyqYKK3nq8JmA8UU4TMCHzAIouKDyUwL8VHsQCaaGaGGzxke
         ISGVhHAKSaaJzF13VaJnCBmeaE5B0vRkxcHPjVrYCKByBz1Y0H0kOTcAhNQ02VpE+kRW
         RA4Q==
X-Gm-Message-State: APjAAAWblrwngBpv6mQIMNljuxWR1TYxDkHrIMLNJD3lnnOpFBIS8EH1
        PpWjjKKzKkCTclx35YpuzQZt9RfdGHBF0Wc8um+xHQ==
X-Google-Smtp-Source: APXvYqwnaZfxUPkSEezGB5U9Be0aoIHy6gUvMu2tLslGzbrnWfKh9WtnN3GznE6iiy3DrBY9cJowKpnsSo9OqxIiHTM=
X-Received: by 2002:ab0:7352:: with SMTP id k18mr7377553uap.77.1576148432270;
 Thu, 12 Dec 2019 03:00:32 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org> <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 12 Dec 2019 16:30:20 +0530
Message-ID: <CAHLCerOVH1xLjMmDNFVx=YYYTA3MipaOhHZ-AYtxEnDFgRbSJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajeshwari,

On Thu, Nov 28, 2019 at 3:25 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Add TSENS node and user thermal zone for TSENS sensors in SC7180.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 527 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..6656ffc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -911,6 +911,26 @@
>                         status = "disabled";
>                 };
>
> +               tsens0: thermal-sensor@c263000 {
> +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> +                       reg = <0 0x0c263000 0 0x1ff>, /* TM */
> +                               <0 0x0c222000 0 0x1ff>; /* SROT */
> +                       #qcom,sensors = <15>;
> +                       interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow";
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
> +               tsens1: thermal-sensor@c265000 {
> +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";
> +                       reg = <0 0x0c265000 0 0x1ff>, /* TM */
> +                               <0 0x0c223000 0 0x1ff>; /* SROT */
> +                       #qcom,sensors = <10>;
> +                       interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "uplow";
> +                       #thermal-sensor-cells = <1>;
> +               };
> +
>                 spmi_bus: spmi@c440000 {
>                         compatible = "qcom,spmi-pmic-arb";
>                         reg = <0 0x0c440000 0 0x1100>,
> @@ -1121,6 +1141,513 @@
>                 };
>         };
>
> +       thermal-zones {
> +               cpu0-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 1>;
> +
> +                       trips {
> +                               cpu0_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu0_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu0_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };

Where are the cooling maps for all the cpu thermal zones? A passive
trip point w/o a cooling map is not of much use. If you are waiting
for cpufreq support to land before adding them, then remove the
passive trip points for now and add them along with the cooling maps
when you have cooling devices.

> +                       };
> +               };
> +
> +               cpu1-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 2>;
> +
> +                       trips {
> +                               cpu1_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu1_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu1_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu2-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 3>;
> +
> +                       trips {
> +                               cpu2_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu2_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu2_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu3-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 4>;
> +
> +                       trips {
> +                               cpu3_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu3_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu3_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu4-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 5>;
> +
> +                       trips {
> +                               cpu4_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu4_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu4_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu5-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 6>;
> +
> +                       trips {
> +                               cpu5_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu5_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu5_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu6-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 9>;
> +
> +                       trips {
> +                               cpu6_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu6_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu6_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu7-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 10>;
> +
> +                       trips {
> +                               cpu7_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu7_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu7_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu8-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 11>;
> +
> +                       trips {
> +                               cpu8_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu8_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu8_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               cpu9-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 12>;
> +
> +                       trips {
> +                               cpu9_alert0: trip-point0 {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu9_alert1: trip-point1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu9_crit: cpu_crit {
> +                                       temperature = <110000>;
> +                                       hysteresis = <1000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
