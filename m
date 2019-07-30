Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED48C7AE0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 18:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfG3Qgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 12:36:47 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41796 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbfG3Qgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 12:36:44 -0400
Received: by mail-ua1-f67.google.com with SMTP id 34so25695558uar.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPpY6iXpVNOVdNNDjKMx6dCGXJxEWfZojGOTzf3FdWY=;
        b=oDY5ke9PwkL257JUKkgXazFsLGgJmlj4x0iaMLZK3xcHaIG55pyvIL7QwHNhRkyTGv
         bP0PdBLJKfNuAsD7hiX7T7MianhYGkBIl7yqFAOhHexnzngWT/5AglpmlAgRcW6Gad+b
         TqC1zW6Rvi71MoElgVWaE0cW3qpQ0/79bgrA7Uew4vziooi5p91CyC7vX4YmCT5jYi/o
         kmCGOsEQY85fXeBfKrwQCzf/igDjjbmGyXFR+ospUZonygK/Ma21Jpsqk/e2xx6wfF0m
         vbJUjHeHdSpf9I3wyneEAM5onOtE5eROoy00guPti1drXYCJHW4TafgDO9rxchknnElB
         Vbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPpY6iXpVNOVdNNDjKMx6dCGXJxEWfZojGOTzf3FdWY=;
        b=SoTTe8FdirE4EPTslBdiigAO/FPYdFDxfWrA7BRmPEOFutcs/4ad5tR40ZwvuTHKkj
         SP43E+h6z+T/ri3upWdxCuJmMI7cR32w/UoyJpasoM+XZRCTdQTMouRm0RcBvA6uycNd
         l7h8qCPLmXAUiGoBOF/WFylFspT/dmomwjV51lr9UTcylUNZ3UnVJMYK8ZZxRA2b3xTe
         ds06/thitGGVjOtVPuSF2F7eBZ6w65KGdNW+LYeY3bfysImcsh+/yKx1j6jy03WauUvN
         CuLpNAEwRsYL0fHDDjkXxTIkKzR77zC53/lh6wwhU+QUo8gjbJsLJsNFDbZ40EStAkF6
         1H7g==
X-Gm-Message-State: APjAAAUScQq4RruUh+El2+sXtLcHPely4b3rPMSB0O2+M+zBqEtD9P9Z
        ma71n9dvShVgKxZcUMzUCTTHUkL7hjdy6/wHhiE=
X-Google-Smtp-Source: APXvYqwTsUMqC4orvj3Zk+Qc4RSf7PxeY7/iZixaU+2WN0pGIW0nZazC8I7XF17XM/SVSa8SPnU4HTk3jQk92IlSQ3s=
X-Received: by 2002:ab0:23ce:: with SMTP id c14mr5233303uan.77.1564504603307;
 Tue, 30 Jul 2019 09:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190725135150.9972-1-vkoul@kernel.org> <20190725135150.9972-4-vkoul@kernel.org>
In-Reply-To: <20190725135150.9972-4-vkoul@kernel.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 30 Jul 2019 22:06:32 +0530
Message-ID: <CAHLCerMLmZ1dWyCiJf=NZMq7i8=tT8fSr20SbnBTjASAZ0c1Mg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs404: remove unit name for
 thermal trip points
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
> The thermal trip points have unit name but no reg property, so we can
> remove them
>
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1080.31-1084.7: Warning (unit_address_vs_reg): /thermal-zones/aoss-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1095.33-1099.7: Warning (unit_address_vs_reg): /thermal-zones/q6-hvx-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1110.32-1114.7: Warning (unit_address_vs_reg): /thermal-zones/lpass-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1125.31-1129.7: Warning (unit_address_vs_reg): /thermal-zones/wlan-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1140.34-1144.7: Warning (unit_address_vs_reg): /thermal-zones/cluster-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1145.34-1149.7: Warning (unit_address_vs_reg): /thermal-zones/cluster-thermal/trips/trip-point@1: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1174.31-1178.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1179.31-1183.7: Warning (unit_address_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@1: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1208.31-1212.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1213.31-1217.7: Warning (unit_address_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@1: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1242.31-1246.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1247.31-1251.7: Warning (unit_address_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@1: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1276.31-1280.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@0: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1281.31-1285.7: Warning (unit_address_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@1: node has a unit name, but no reg property
> arch/arm64/boot/dts/qcom/qcs404.dtsi:1310.30-1314.7: Warning (unit_address_vs_reg): /thermal-zones/gpu-thermal/trips/trip-point@0: node has a unit name, but no reg property
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 30 ++++++++++++++--------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index 3d0789775009..6d91dae5aee0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -1077,7 +1077,7 @@
>                         thermal-sensors = <&tsens 0>;
>
>                         trips {
> -                               aoss_alert0: trip-point@0 {
> +                               aoss_alert0: trip-point0 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
> @@ -1092,7 +1092,7 @@
>                         thermal-sensors = <&tsens 1>;
>
>                         trips {
> -                               q6_hvx_alert0: trip-point@0 {
> +                               q6_hvx_alert0: trip-point0 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
> @@ -1107,7 +1107,7 @@
>                         thermal-sensors = <&tsens 2>;
>
>                         trips {
> -                               lpass_alert0: trip-point@0 {
> +                               lpass_alert0: trip-point0 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
> @@ -1122,7 +1122,7 @@
>                         thermal-sensors = <&tsens 3>;
>
>                         trips {
> -                               wlan_alert0: trip-point@0 {
> +                               wlan_alert0: trip-point0 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
> @@ -1137,12 +1137,12 @@
>                         thermal-sensors = <&tsens 4>;
>
>                         trips {
> -                               cluster_alert0: trip-point@0 {
> +                               cluster_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> -                               cluster_alert1: trip-point@1 {
> +                               cluster_alert1: trip-point1 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
> @@ -1171,12 +1171,12 @@
>                         thermal-sensors = <&tsens 5>;
>
>                         trips {
> -                               cpu0_alert0: trip-point@0 {
> +                               cpu0_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> -                               cpu0_alert1: trip-point@1 {
> +                               cpu0_alert1: trip-point1 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
> @@ -1205,12 +1205,12 @@
>                         thermal-sensors = <&tsens 6>;
>
>                         trips {
> -                               cpu1_alert0: trip-point@0 {
> +                               cpu1_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> -                               cpu1_alert1: trip-point@1 {
> +                               cpu1_alert1: trip-point1 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
> @@ -1239,12 +1239,12 @@
>                         thermal-sensors = <&tsens 7>;
>
>                         trips {
> -                               cpu2_alert0: trip-point@0 {
> +                               cpu2_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> -                               cpu2_alert1: trip-point@1 {
> +                               cpu2_alert1: trip-point1 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
> @@ -1273,12 +1273,12 @@
>                         thermal-sensors = <&tsens 8>;
>
>                         trips {
> -                               cpu3_alert0: trip-point@0 {
> +                               cpu3_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
>                                 };
> -                               cpu3_alert1: trip-point@1 {
> +                               cpu3_alert1: trip-point1 {
>                                         temperature = <105000>;
>                                         hysteresis = <2000>;
>                                         type = "passive";
> @@ -1307,7 +1307,7 @@
>                         thermal-sensors = <&tsens 9>;
>
>                         trips {
> -                               gpu_alert0: trip-point@0 {
> +                               gpu_alert0: trip-point0 {
>                                         temperature = <95000>;
>                                         hysteresis = <2000>;
>                                         type = "hot";
> --
> 2.20.1
>
