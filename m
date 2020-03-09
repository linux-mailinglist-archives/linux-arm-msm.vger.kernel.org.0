Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB517E905
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 20:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgCITq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 15:46:27 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38644 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgCITq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 15:46:27 -0400
Received: by mail-ed1-f66.google.com with SMTP id h5so3097811edn.5;
        Mon, 09 Mar 2020 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GafaQTIDxRtZR3QJp5M8zL8cHUHfz+w2mpxMr87DmTg=;
        b=NipBi1V16qvwZX2pVO1sMAKTqLsbamjVjq/UuqoLh8xcrWKfahPRDsLBiOa1e5Glxl
         McguFHQOwTen76/dIQiy4RcgWsmJVk19hW5c/7saOb1waZW5ra1llR07rbabm4SK/LB8
         /RwCo5davJdnPe6TMqVw54SeKH3uK25bZHhzNKd8nwwo0bXdhIMAgV6kcJ3vV1+BRWHl
         SmIW3E+GcHfpguQ12pTdWD8NanfeYEJkr4EXDrFu86QoXfPL+AyfwVfNhTpwoyKbAKma
         A/896W1JwUDNkBfDP2zMs6Ox9b3S8j/NO5QgnNMbxdJYpJw76Vp0dXiKtWmf2HpwllEQ
         5NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GafaQTIDxRtZR3QJp5M8zL8cHUHfz+w2mpxMr87DmTg=;
        b=NFctmpS5A6FVqLWHDuUug776n+jEcKBcFDuCoZMF860cLHwTT8bdDBSc3Td8RSanjp
         qCetXdGo66zraW9Weu/WV54ccVQnSjxyr/+wTOB4oBekR3llFKs2ei55M0aU7plk50qb
         U2Mtd7IjcExSh2nddCcDxwQc0lKWmMzXBKdHzcO/Ybq91Dg/ZUUZUYDpN+mCQaW6+knn
         3CamSEwcfOyYlD8e5vw7hS1CdIyraH42FrnqmxKBU7Noc8D9KwrqedtebNfbxlJnA7sc
         MWAr89Z3TtmnjGsgv8WgpXtQcads5tFzp/HC9Uk2ZKjMd/9VhezeJ526AxHdTs6kn7lA
         U5yQ==
X-Gm-Message-State: ANhLgQ0zjYiZ+NODPZM1VP8KZbgmy4c5mgMX7ghXnaf9cg8y3NZHoFUK
        TOB+x+s1eZ9QWUcaFKABhEaOCXCVN04EtQWDzuQ=
X-Google-Smtp-Source: ADFU+vvbISa28RamiS7n6MURDptCTjT0Zst1Jfc9dRpyv7SayoTii1YE6z/aAXF9dDlpcwYhprgM5y6LIsJbbz/whBE=
X-Received: by 2002:a17:906:3e1b:: with SMTP id k27mr8971822eji.258.1583783184196;
 Mon, 09 Mar 2020 12:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200309111804.188162-1-masneyb@onstation.org>
In-Reply-To: <20200309111804.188162-1-masneyb@onstation.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Mar 2020 12:46:11 -0700
Message-ID: <CAF6AEGu7NHVCjeTg94XzV19ByL4AZfYs07eBthw18E9HJ6JtsQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: msm: gmu: move sram property to gpu bindings
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 9, 2020 at 4:18 AM Brian Masney <masneyb@onstation.org> wrote:
>
> The sram property was incorrectly added to the GMU binding when it
> really belongs with the GPU binding instead. Let's go ahead and
> move it.
>
> While changes are being made here, let's update the sram property
> description to mention that this property is only valid for a3xx and
> a4xx GPUs. The a3xx/a4xx example in the GPU is replaced with what was
> in the GMU.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: 198a72c8f9ee ("dt-bindings: display: msm: gmu: add optional ocmem property")
> ---
> Background thread:
> https://lore.kernel.org/lkml/20200303170159.GA13109@jcrouse1-lnx.qualcomm.com/
>
> I started to look at what it would take to convert the GPU bindings to
> YAML, however I am unsure of the complete list of "qcom,adreno-XYZ.W"
> compatibles that are valid.

heh, I'm not sure anyone is ;-)

That said, adreno_device.c should give a complete list of XYZ (and
*usually* the .W doesn't matter too much)

BR,
-R

>
>  .../devicetree/bindings/display/msm/gmu.txt   | 51 -----------------
>  .../devicetree/bindings/display/msm/gpu.txt   | 55 ++++++++++++++-----
>  2 files changed, 42 insertions(+), 64 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index bf9c7a2a495c..90af5b0a56a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,10 +31,6 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>
> -Optional properties:
> -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> -
>  Example:
>
>  / {
> @@ -67,50 +63,3 @@ Example:
>                 operating-points-v2 = <&gmu_opp_table>;
>         };
>  };
> -
> -a3xx example with OCMEM support:
> -
> -/ {
> -       ...
> -
> -       gpu: adreno@fdb00000 {
> -               compatible = "qcom,adreno-330.2",
> -                            "qcom,adreno";
> -               reg = <0xfdb00000 0x10000>;
> -               reg-names = "kgsl_3d0_reg_memory";
> -               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -               interrupt-names = "kgsl_3d0_irq";
> -               clock-names = "core",
> -                             "iface",
> -                             "mem_iface";
> -               clocks = <&mmcc OXILI_GFX3D_CLK>,
> -                        <&mmcc OXILICX_AHB_CLK>,
> -                        <&mmcc OXILICX_AXI_CLK>;
> -               sram = <&gmu_sram>;
> -               power-domains = <&mmcc OXILICX_GDSC>;
> -               operating-points-v2 = <&gpu_opp_table>;
> -               iommus = <&gpu_iommu 0>;
> -       };
> -
> -       ocmem@fdd00000 {
> -               compatible = "qcom,msm8974-ocmem";
> -
> -               reg = <0xfdd00000 0x2000>,
> -                     <0xfec00000 0x180000>;
> -               reg-names = "ctrl",
> -                            "mem";
> -
> -               clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> -                        <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> -               clock-names = "core",
> -                             "iface";
> -
> -               #address-cells = <1>;
> -               #size-cells = <1>;
> -
> -               gmu_sram: gmu-sram@0 {
> -                       reg = <0x0 0x100000>;
> -                       ranges = <0 0 0xfec00000 0x100000>;
> -               };
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> index 7edc298a15f2..fd779cd6994d 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
> @@ -35,25 +35,54 @@ Required properties:
>    bring the GPU out of secure mode.
>  - firmware-name: optional property of the 'zap-shader' node, listing the
>    relative path of the device specific zap firmware.
> +- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
> +        a4xx Snapdragon SoCs. See
> +        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
>
> -Example 3xx/4xx/a5xx:
> +Example 3xx/4xx:
>
>  / {
>         ...
>
> -       gpu: qcom,kgsl-3d0@4300000 {
> -               compatible = "qcom,adreno-320.2", "qcom,adreno";
> -               reg = <0x04300000 0x20000>;
> +       gpu: adreno@fdb00000 {
> +               compatible = "qcom,adreno-330.2",
> +                            "qcom,adreno";
> +               reg = <0xfdb00000 0x10000>;
>                 reg-names = "kgsl_3d0_reg_memory";
> -               interrupts = <GIC_SPI 80 0>;
> -               clock-names =
> -                   "core",
> -                   "iface",
> -                   "mem_iface";
> -               clocks =
> -                   <&mmcc GFX3D_CLK>,
> -                   <&mmcc GFX3D_AHB_CLK>,
> -                   <&mmcc MMSS_IMEM_AHB_CLK>;
> +               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "kgsl_3d0_irq";
> +               clock-names = "core",
> +                             "iface",
> +                             "mem_iface";
> +               clocks = <&mmcc OXILI_GFX3D_CLK>,
> +                        <&mmcc OXILICX_AHB_CLK>,
> +                        <&mmcc OXILICX_AXI_CLK>;
> +               sram = <&gpu_sram>;
> +               power-domains = <&mmcc OXILICX_GDSC>;
> +               operating-points-v2 = <&gpu_opp_table>;
> +               iommus = <&gpu_iommu 0>;
> +       };
> +
> +       gpu_sram: ocmem@fdd00000 {
> +               compatible = "qcom,msm8974-ocmem";
> +
> +               reg = <0xfdd00000 0x2000>,
> +                     <0xfec00000 0x180000>;
> +               reg-names = "ctrl",
> +                           "mem";
> +
> +               clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                        <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +               clock-names = "core",
> +                             "iface";
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               gpu_sram: gpu-sram@0 {
> +                       reg = <0x0 0x100000>;
> +                       ranges = <0 0 0xfec00000 0x100000>;
> +               };
>         };
>  };
>
> --
> 2.24.1
>
