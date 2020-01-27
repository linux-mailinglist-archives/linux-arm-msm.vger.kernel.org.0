Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2203014AC05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 23:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgA0WaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 17:30:10 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36475 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgA0WaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 17:30:10 -0500
Received: by mail-vs1-f68.google.com with SMTP id e188so6593426vse.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 14:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OkNUIHe+JYKTBEW9K2q9Taed66d4fQFMxRvOrRh8Cd0=;
        b=NUqqrs7HXhFSJFsiNrXJm0ONYmionCm3iYaOyFIe4L6NBxV8KGLwKqmdNsdd1bizOG
         oXerz+XKVLKfxf0zbLskquZlA3QPICBEPW1gib9XIsd2nFErH3ZKV4v19aqguZuFqxH7
         8IHt1s2WYt5gtQA/uZLlFZcgGA+g8HyMRwbfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OkNUIHe+JYKTBEW9K2q9Taed66d4fQFMxRvOrRh8Cd0=;
        b=pOOa49wMJ1ET0YnhdnsQkATX55JmeXB1BJaIFeEa5+EPA7HCTmq1SJqJX3iSIg2F63
         DiZLXjYtcvi6bny+czXvZzJgi+xPv9MdGZW+WlicSIKhJKbALCBtoMleT6caJPMcebsn
         +bZAmLJIrEC8TmM00pfW1X5+Jnv5mS3vZUhTSwsHPrwXBW693UIBX2/+e5NNMi+x0qsr
         Kg/UNm9m5esBeO+MNd/IGWBY3hLNUl9Meca1GEC7LTIN7e04eS7JUbmM9jfcICVDDhyQ
         w+mXsW1nl+t8TRWQmKQVNjDHbySGvaytu9Ew33Qj+IgEdwH5evaRa/5HydkMZ6PPICSd
         EKNQ==
X-Gm-Message-State: APjAAAWunMidISdmglMxItl2q+rAjPN01QWlD0V7bH/nLEIhnS6SfPpg
        G7aMBd9WxWYZ3atRppRA0oyIZV4pWCs=
X-Google-Smtp-Source: APXvYqx9jjg6vKP4SEyUJgrkop2tS7XsPRG2kH3XzJIA0d94c/jsMUna/x+sBmpgsiIuL+DM12Rs1g==
X-Received: by 2002:a05:6102:241a:: with SMTP id j26mr5347244vsi.163.1580164206491;
        Mon, 27 Jan 2020 14:30:06 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id l193sm4693856vki.42.2020.01.27.14.30.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 14:30:05 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id v141so3172029vsv.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 14:30:04 -0800 (PST)
X-Received: by 2002:a67:1ec5:: with SMTP id e188mr5904944vse.169.1580164204376;
 Mon, 27 Jan 2020 14:30:04 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jan 2020 14:29:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
Message-ID: <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 1:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 103 +++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Note that +Matthias Kaehlcke commented on v1 your patch:

https://lore.kernel.org/r/20191204220033.GH228856@google.com/

...so he should have been CCed on v2.  I would also note that some of
the comments below are echos of what Matthias already said in the
previous version but just weren't addressed.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index b859431..277d84d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>

Header files should be sorted alphabetically.  ...or, even better,
base your patch atop mine:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid/

...which adds the gpucc header file so you don't have to.  ...and when
you do so, email out a Reviewed-by and/or Tested-by for my patch.  ;-)


>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interconnect/qcom,sc7180.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> @@ -1619,6 +1620,108 @@
>                         #interconnect-cells = <1>;
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
> +
> +               gpu: gpu@5000000 {
> +                       compatible = "qcom,adreno-618.0", "qcom,adreno";

Though it's not controversial, please send a patch to:

Documentation/devicetree/bindings/display/msm/gmu.txt

...to add 'qcom,adreno-618.0', like:

    for example:
      "qcom,adreno-gmu-618.0", "qcom,adreno-gmu"
      "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"

Probably as part of this you will be asked to convert this file to
yaml.  IMO we don't need to block landing this patch on the effort to
convert it to yaml, but you should still work on it.  ...or maybe
Jordan wants to work on it?


> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x1000>,
> +                               <0 0x05061000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;

Running:
$ git fetch git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
for-next
$ git grep gem_noc FETCH_HEAD
$ git fetch git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
arm64-for-5.7-to-be-rebased
$ git grep gem_noc FETCH_HEAD

...shows no hits.  That's because the interconnect patches haven't
landed in the tree that you're targeting.  In the very least you
should mention somewhere in your email that your patch depends on the
interconnect patches landing, perhaps pointing at:

https://lore.kernel.org/r/1577782737-32068-4-git-send-email-okukatla@codeaurora.org

...but even better would be to split your patch into two parts.  The
first patch would be exactly like your patch except without the
"interconnects" line.  The 2nd patch would add the interconnects line.
This would allow Bjorn/Andy to land the first patch now and then land
the second patch when the interconnect series is ready.  I can confirm
that you can still get basic GPU functionality even without the
interconnects bit so it would be worth landing earlier.


I will also note that by basing on a tree that has private patches to
the same file you're touching you make it very hard for a maintainer
to apply.  When I try this:

$ curl https://patchwork.kernel.org/patch/11352261/mbox/ | git am -3

I get:

error: sha1 information is lacking or useless
(arch/arm64/boot/dts/qcom/sc7180.dtsi).
error: could not build fake ancestor
Patch failed at 0001 arm64: dts: qcom: sc7180: Add A618 gpu dt blob

...yes, I can apply it with 'git am --show-current-patch | patch -p1'
but it's ugly (and it ends up making things sort in the wrong order).


> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";

Please send a patch to:

Documentation/devicetree/bindings/iommu/arm,smmu.yaml

...adding 'qcom,sc7180-smmu-v2'.  If you do this it will point out
that you've added a new clock: "mem_iface_clk".  Is this truly a new
clock in sc7180 compared to previous IOMMUs?  ...or is it not really
needed?


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

nit: keep clocks and clock-names next to each other (no blank line).
If you really feel like it needs more space add it between the
clock-names and power-domains.

> +                       power-domains = <&gpucc CX_GDSC>;

Similar to interconnects, gpucc hasn't landed yet.  Somewhere you
should point out this fact and ideally point to:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid/

...unlike interconnects, your patch can't land without gpucc, so you
should point this out as a hard dependency.


> +               };
> +
> +               gmu: gmu@506a000 {
> +                       compatible="qcom,adreno-gmu-618", "qcom,adreno-gmu";

As per the bindings, "qcom,adreno-gmu-618" should be
"qcom,adreno-gmu-618.0", right?

...and I bet you'd never have guessed that I'll request that you add
"qcom,adreno-gmu-618" to:

Documentation/devicetree/bindings/display/msm/gmu.txt

...and that you'll probably be asked to convert to yaml.  Again, maybe
Jordan wants to attempt this?


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
> +                       power-domains = <&gpucc CX_GDSC>;

Bindings claim that you need both CX and GC.  Is sc7180 somehow
different?  Bindings also claim that you should be providing
power-domain-names.



> +                       iommus = <&adreno_smmu 5>;
> +                       operating-points-v2 = <&gmu_opp_table>;
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
>         };
>
>         thermal-zones {

Using the "thermal-zones" as context, it looks as if you're asserting
that your new nodes belong at the very end of the pile of nodes with
addresses.  This is not true.  Looking at the branch
'arm64-for-5.7-to-be-rebased' on the Qualcomm tree, I see:

cpufreq_hw: cpufreq@18323000

...which has a larger address than your 0x0506a000.  Please sort your
nodes numerically.


-Doug
