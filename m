Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E76166228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 17:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgBTQTf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 11:19:35 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45136 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727915AbgBTQTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 11:19:34 -0500
Received: by mail-ed1-f68.google.com with SMTP id v28so34375277edw.12;
        Thu, 20 Feb 2020 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h15SKSbIsbjB9/+rbkPhsWvg29qqUxsuiy1c0M5WxNg=;
        b=Nic5/cyKp1b1XxJNEvBgkFqaN7LM0wddKUE77hjob4fU8WKIz8tPUFwQ4u7UOwS9Re
         tVN0roIgDQekB9ofDVreQvDb20+SywQhCow6FyIhzwIbqmau9An/HU2XLgw+bBPx7LDl
         rM9N/b17oySYinhSW+9b/l84CZsazTncb7bW/h/3Kl4KGmxL+Br93UEfVdLq23v4G8RZ
         DbYInA2uY7d9dtRyvyarikR8Rl/IzhYqwvjuNErKH8hMS/I3xznl3X5PwBflv1nflmMF
         BhK3JXvVws38El52R147rwLZ2/G73XCeek8ipCDJ4HC5LYSvk3UdNbnXYPXm+822/tO/
         pX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h15SKSbIsbjB9/+rbkPhsWvg29qqUxsuiy1c0M5WxNg=;
        b=Xl/A3PmNeyDllsmjsB09ItUqufYk0sobmxY5xVBenr5oWiYWK9Sqmg9MyYRY8QE3j9
         XBQ3LtwDhTQinZsfFhFQdUz2VfwBKaulfAiVbp4ujuTfankZDsN/4F9mONPlgar9j2yS
         ltBNo5kGR6DS3dATYh7/TM+yrFnG1DwKi38CN0H4G3AABB95zEXULfIpp/EE+0bzDhkN
         xW0dgXalD1EtoM6kEyfbL+CDEMEfh3gW3fcKYMtK3CVu8ZjON3Yo5b/BEsNsc1NWMlRJ
         w9Q1BfkCLvlwze9mLW5XpYhXhfl92v0P1iJugS6XO73loBM72ivRO/bvI00lMqNQ2Nxb
         7iRw==
X-Gm-Message-State: APjAAAUnZa2We2ZEN62a7pPOsMCwRNeapDAt92ozqHKDwTZ3kt9YSE2S
        t406AYPy8+G/AWLJtoChXWbcJcw7jJTUb+7KWyw=
X-Google-Smtp-Source: APXvYqxBAaxRpzlIKrAK5EdDxMJ1r8wwi7LbaTLd+YpFxqS25/jNQQiIOgWDcPzaaKhVVzk937JXQff1zHby0XwpTM4=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr25435820edr.151.1582215571944;
 Thu, 20 Feb 2020 08:19:31 -0800 (PST)
MIME-Version: 1.0
References: <1581320465-15854-1-git-send-email-smasetty@codeaurora.org> <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1581320465-15854-2-git-send-email-smasetty@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 20 Feb 2020 08:19:20 -0800
Message-ID: <CAF6AEGuFfaYuYoXkGJHit4X0Hp2-i0yMkWCfoKtLwPyGkjpkVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v6] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Feb 9, 2020 at 11:41 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f3fcc5c..63fff15 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1043,6 +1043,108 @@
>                         };
>                 };
>
> +               gpu: gpu@5000000 {
> +                       compatible = "qcom,adreno-618.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x1000>,
> +                               <0 0x05061000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-800000000 {
> +                                       opp-hz = /bits/ 64 <800000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +                               };
> +
> +                               opp-650000000 {
> +                                       opp-hz = /bits/ 64 <650000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +                               };
> +
> +                               opp-565000000 {
> +                                       opp-hz = /bits/ 64 <565000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +                               };
> +
> +                               opp-430000000 {
> +                                       opp-hz = /bits/ 64 <430000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                               };
> +
> +                               opp-355000000 {
> +                                       opp-hz = /bits/ 64 <355000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                               };
> +
> +                               opp-267000000 {
> +                                       opp-hz = /bits/ 64 <267000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                               };
> +
> +                               opp-180000000 {
> +                                       opp-hz = /bits/ 64 <180000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
> +                       reg = <0 0x05040000 0 0x10000>;
> +                       #iommu-cells = <1>;
> +                       #global-interrupts = <2>;
> +                       interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                               <&gcc GCC_GPU_CFG_AHB_CLK>,
> +                               <&gcc GCC_DDRSS_GPU_AXI_CLK>;
> +
> +                       clock-names = "bus", "iface", "mem_iface_clk";
> +                       power-domains = <&gpucc CX_GDSC>;
> +               };
> +
> +               gmu: gmu@506a000 {
> +                       compatible="qcom,adreno-gmu-618.0", "qcom,adreno-gmu";
> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000 0 0x10000>,
> +                               <0 0x0b490000 0 0x10000>;
> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hfi", "gmu";
> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                              <&gpucc GPU_CC_CXO_CLK>,
> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;
> +                       power-domain-names = "cx", "gx";
> +                       iommus = <&adreno_smmu 5>;
> +                       operating-points-v2 = <&gmu_opp_table>;

jfyi, this will shortly require a dma-ranges property[1].. it might
simplify things, wrt. to which order patches land (this vs dma-ranges)
to go ahead and add the dma-ranges property now

BR,
-R


[1] https://lists.freedesktop.org/archives/freedreno/2020-February/006903.html

> +
> +                       gmu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-200000000 {
> +                                       opp-hz = /bits/ 64 <200000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
>                 gpucc: clock-controller@5090000 {
>                         compatible = "qcom,sc7180-gpucc";
>                         reg = <0 0x05090000 0 0x9000>;
> --
> 1.9.1
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
