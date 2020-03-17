Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F48B187EC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 11:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgCQKwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 06:52:21 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:35557 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgCQKwV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 06:52:21 -0400
Received: by mail-vs1-f65.google.com with SMTP id m9so13526071vso.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2h930L2nUaeWpN/VPq6cjVwd1EstsXRD+uH/UzVG50M=;
        b=yzFTv6PVIFzp+YEHgkfJktWrdnpr0NoIVVwCQtTNHKjE54+UQKGskUFPTQl0cH0/il
         RKsQaXITWE9Aad7OxxFsDCSM/te0ws0j4wJlKrjQ11NLx1XzXqZfaWd/KIcvJ3fATEis
         SfNhsN9gqE8M3VXyvbqgYvBO7hZgw8j3y22AVkkmU8lGijaqZmBSiAt7si9bHCZZ3wxG
         dxx/zRACvw2LuNBzWjNeTyJGjPcUiOLcjGQHhjPRyvW8oTzq65Gzx7vzk3i/xeQLb8q5
         ugpHD8GyX7kHvSsYaFdXcDnZ6crW1EGHwQdXEu1ZFFeJvvRNqBKrr/qZyP6udpCQAAAB
         kbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2h930L2nUaeWpN/VPq6cjVwd1EstsXRD+uH/UzVG50M=;
        b=QJ7ZzjmHdXX3nx24yN4jT3bcQvuxLodWvPxPt86rX3lMStX8OsJ0ZXOQN8Cc+aCNWX
         aMPQBuRvIO3cJLvqOBpglAk0fmskbs+POj6itIoldwBcHC9YusXweYtbY5v5FGYnzljR
         pbqhHJclA+AncnJTjC+m4JIAQu5cdXoLdMFTvugCPaQXUWF+TG/815WSBTaYNbFAZOdQ
         PHw9EU4D0svXWU8RtKMFprWlavgd89q0mnhSWNntzErEUhk/GO5jnwb7aornMJRcNiM9
         otQI4J8j2ToGRcKsX9L9A7nQItjU23Ucer7P43qnAsJfaYsGBmyr0uBUhTL1yaid+s6p
         BiFA==
X-Gm-Message-State: ANhLgQ39BfM2caRm6ob3QsgeT2rlC2twpc5Mh92wyUXWcMwhexCNld/K
        GTqJQBDCp4/wtHVn5AU7ntHqDsKRaywAbaNH1z06IA==
X-Google-Smtp-Source: ADFU+vuJwh4C02Y8CB3LnnNmExzyITUoR6WKl8q1aLb0YHzq2cRlxar6SO9ePlsiqr5C/u1I9OAB68nw+UZqVFt/2RM=
X-Received: by 2002:a67:eb81:: with SMTP id e1mr3171827vso.27.1584442337603;
 Tue, 17 Mar 2020 03:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1584430804-8343-1-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 17 Mar 2020 16:22:00 +0530
Message-ID: <CAHLCerOSz4aAkukPzRRwOgeiTnw1ATSp0gPd9ujqiv9uAfj2Mg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Changed polling-delay in
 Thermal-zones node
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 17, 2020 at 1:11 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Changed polling-delay and polling-delay-passive to zero as per
> the requirement.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 100 +++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 50 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index ca876ed..d81c4f1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1907,8 +1907,8 @@
>
>         thermal-zones {
>                 cpu0-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 1>;
>
> @@ -1955,8 +1955,8 @@
>                 };
>
>                 cpu1-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 2>;
>
> @@ -2003,8 +2003,8 @@
>                 };
>
>                 cpu2-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 3>;
>
> @@ -2051,8 +2051,8 @@
>                 };
>
>                 cpu3-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 4>;
>
> @@ -2099,8 +2099,8 @@
>                 };
>
>                 cpu4-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 5>;
>
> @@ -2147,8 +2147,8 @@
>                 };
>
>                 cpu5-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 6>;
>
> @@ -2195,8 +2195,8 @@
>                 };
>
>                 cpu6-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 9>;
>
> @@ -2235,8 +2235,8 @@
>                 };
>
>                 cpu7-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 10>;
>
> @@ -2275,8 +2275,8 @@
>                 };
>
>                 cpu8-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 11>;
>
> @@ -2315,8 +2315,8 @@
>                 };
>
>                 cpu9-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 12>;
>
> @@ -2355,8 +2355,8 @@
>                 };
>
>                 aoss0-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 0>;
>
> @@ -2376,8 +2376,8 @@
>                 };
>
>                 cpuss0-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 7>;
>
> @@ -2396,8 +2396,8 @@
>                 };
>
>                 cpuss1-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 8>;
>
> @@ -2416,8 +2416,8 @@
>                 };
>
>                 gpuss0-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 13>;
>
> @@ -2437,8 +2437,8 @@
>                 };
>
>                 gpuss1-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens0 14>;
>
> @@ -2458,8 +2458,8 @@
>                 };
>
>                 aoss1-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 0>;
>
> @@ -2479,8 +2479,8 @@
>                 };
>
>                 cwlan-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 1>;
>
> @@ -2500,8 +2500,8 @@
>                 };
>
>                 audio-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 2>;
>
> @@ -2521,8 +2521,8 @@
>                 };
>
>                 ddr-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 3>;
>
> @@ -2542,8 +2542,8 @@
>                 };
>
>                 q6-hvx-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 4>;
>
> @@ -2563,8 +2563,8 @@
>                 };
>
>                 camera-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 5>;
>
> @@ -2584,8 +2584,8 @@
>                 };
>
>                 mdm-core-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 6>;
>
> @@ -2605,8 +2605,8 @@
>                 };
>
>                 mdm-dsp-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 7>;
>
> @@ -2626,8 +2626,8 @@
>                 };
>
>                 npu-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 8>;
>
> @@ -2647,8 +2647,8 @@
>                 };
>
>                 video-thermal {
> -                       polling-delay-passive = <250>;
> -                       polling-delay = <1000>;
> +                       polling-delay-passive = <0>;
> +                       polling-delay = <0>;
>
>                         thermal-sensors = <&tsens1 9>;
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
