Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE0B3145BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 02:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhBIBk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 20:40:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:54544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230296AbhBIBj5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 20:39:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E87E64EB7;
        Tue,  9 Feb 2021 01:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612834756;
        bh=Yssry1rGrff/ixMW7HC9O2cGPS/DZCi9ONOYOLrfEEU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NHOjjP7VU7qiBkVJj4mWLok+NVAtg70PVb12cY+ZH/wR2uSOGXElEDoaKtwH4TSHb
         w9IvajANNwDF6Kv+NYfdLVx34pQnctxxO51LdF+gO2RXCD9AGniGpsDOQXUjGwrz3p
         J63W+wX2sI1ja5xDAJ4EHVfulKcOFydNCPdtbAWtVH6VZglUr31x8p8BQYEeTmFkts
         50Goym9lFRV6jgcaEIgCroDzphHc8Xw8jz11zsp3Ii7Im2J4lnobX7MnDV4TJxhyfa
         FjL+yaUk1pbQd1EZoAJERV23YrRWcdMxJX+0By0IGV0bXKr61IGYqHwS6CPTdvh8ao
         MCZlOZnOzVE+Q==
Received: by mail-ed1-f49.google.com with SMTP id s3so21551452edi.7;
        Mon, 08 Feb 2021 17:39:16 -0800 (PST)
X-Gm-Message-State: AOAM532Amj8WNZcxfHDw9q8XD7JvVlz7CN1O/wX4Sl0PtW2z7MaBwcc0
        5SnRCPOiOt74Lmgl68rlVY1F8bbdeHXeq+qhzQ==
X-Google-Smtp-Source: ABdhPJwNIL+IgeMPg0JT77GupHlMMWVPBldkV7z70Fsk6uAKAPgZpHyk7Ce2OSyYBpUjYbFtwOwmo9pncZ1VFo9FiAI=
X-Received: by 2002:a05:6402:6c7:: with SMTP id n7mr20413803edy.289.1612834755034;
 Mon, 08 Feb 2021 17:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20210203113914.1072380-1-bryan.odonoghue@linaro.org>
 <20210203113914.1072380-2-bryan.odonoghue@linaro.org> <20210204233905.GA1334487@robh.at.kernel.org>
In-Reply-To: <20210204233905.GA1334487@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 8 Feb 2021 19:39:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLE91CqOOjqmvDs-xbtbjp_T1ux7Gd375gHF8pJapUyCQ@mail.gmail.com>
Message-ID: <CAL_JsqLE91CqOOjqmvDs-xbtbjp_T1ux7Gd375gHF8pJapUyCQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: venus: Add sm8250 dt schema
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     vgarodia@qti.qualcomm.com, "Gross, Andy" <agross@kernel.org>,
        dikshita@qti.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 4, 2021 at 5:39 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 03 Feb 2021 11:39:14 +0000, Bryan O'Donoghue wrote:
> > Add a schema description for the venus video encoder/decoder on the sm8250.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../bindings/media/qcom,sm8250-venus.yaml     | 153 ++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
> >
>
> Applied, thanks!

And now dropped. The example has lots of errors and I got tired of
fixing them and didn't know if the undocumented properties should be
removed or documented. Here's what I fixed so far:

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 1d4b1ab63297..fe66de5d91ea 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -116,10 +116,13 @@ examples:
   - |
         #include <dt-bindings/interrupt-controller/arm-gic.h>
         #include <dt-bindings/clock/qcom,videocc-sm8250.h>
+        #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+        #include <dt-bindings/power/qcom-rpmpd.h>
+        #include <dt-bindings/interconnect/qcom,sm8250.h>

         venus: video-codec@aa00000 {
             compatible = "qcom,sm8250-venus";
-            reg = <0 0x0aa00000 0 0xff000>;
+            reg = <0x0aa00000 0xff000>;
             interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
             power-domains = <&videocc MVS0C_GDSC>,
                             <&videocc MVS0_GDSC>,
@@ -129,12 +132,12 @@ examples:

             clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
                      <&videocc VIDEO_CC_MVS0C_CLK>,
-                     <&videocc VIDEO_CC_MVS0_CLK>;
+                     <&videocc VIDEO_CC_MVS0_CLK_SRC>;
             clock-names = "iface", "core", "vcodec0_core";

             interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc
SLAVE_VENUS_CFG>,
                             <&mmss_noc MASTER_VIDEO_P0 &mc_virt SLAVE_EBI_CH0>;
-            interconnect-names = "cpu-cfg", "video-mem";
+            interconnect-names = "video-mem", "cpu-cfg";

             iommus = <&apps_smmu 0x2100 0x0400>;
             memory-region = <&video_mem>;
diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
index 05ae893d1b2e..312c076379e1 100644
--- a/arch/arm64/boot/dts/arm/foundation-v8.dtsi
+++ b/arch/arm64/boot/dts/arm/foundation-v8.dtsi
@@ -36,6 +36,7 @@ cpu0: cpu@0 {
                        compatible = "arm,armv8";
                        reg = <0x0 0x0>;
                        next-level-cache = <&L2_0>;
+                       next-level-cache {};
                };
                cpu1: cpu@1 {
                        device_type = "cpu";
