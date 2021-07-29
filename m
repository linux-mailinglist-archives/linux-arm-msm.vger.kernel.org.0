Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102853DAA37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 19:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbhG2Rba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 13:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhG2Rba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 13:31:30 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B0BC061765;
        Thu, 29 Jul 2021 10:31:25 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j2so7856246wrx.9;
        Thu, 29 Jul 2021 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pnVzhT/kHdPgZUP65cfJqBoONaapfo5r8e0MrAlb984=;
        b=jaC3QwjjviykfCntbsWoFJDNF21xu8yghmN2KvvaAwVUR4mtfATAQuHMPuqadbtwUo
         enKV2slTVRgfCP9UgZzJYDTlQzdrKjzXg40LcjUTktctC59CEkWGBuKgJOqn3kcVELDN
         Gqxm5cr4MEyeN4XO3INSQNXopzzpjPCRuzeAqoaougPd45yqEiG0QSflJ4YmoIPr+AG2
         C19SzpImiBO3ayVtb+QZgtJZkr/k/yLA40n2jxJGvVR/esMJm87HNs/Zm41DwU8GfwaN
         egcbUqeuxrXgU6aRr8UnTTrN6e03v1GHu4m4OBgMNOkR0Q8S9CR9s+XfGM23/WP7MRAM
         7eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pnVzhT/kHdPgZUP65cfJqBoONaapfo5r8e0MrAlb984=;
        b=LtaCzrn8Uas1y2LurY07RxsIL9eXbafMdZexY8GSER3/kBRXZyjsCOTMqHMvl+7x2s
         HoCyXwM0N/7JFGv0Tr0ABHtM3DZrk/tanwNW4RKkxmwEMumq/I415bQDjdePnnl04YIy
         yEtO0oNP2/hkovrT6mfXQ2ZdycR+eqye9nT5OFR1iirTO7GSNRhrDlMNuCbmfiRaYoNj
         ioZ8pjcsH+3rz8e8pMiVGBpLTLoFxMz3FAng8ZVP+uLCAx/gd40x9iRPJa4TAUFjpFe3
         flNhhTxAVUAUReTuixV64UtyBNFyCjf/aW23FeCydB4vPIYPWvKIyNslW+E4+9m6EdLO
         z8cQ==
X-Gm-Message-State: AOAM531D9FkAhVaEpRNKgk8RTO037oulgBKaZYM+lHmX7hV2GVF6AGkc
        vBpcDA9aade/OIZn3SPnhHxJqum3nKz35mUlo+I=
X-Google-Smtp-Source: ABdhPJzB3zZoxPwWPnZQvco4cbgtwKh7tKLWjYB2qIguBecvjgdSw2VQJQ94SIm5agk39ycqx5XjveJvKou3TG92Cro=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr6400529wrr.28.1627579884127;
 Thu, 29 Jul 2021 10:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org> <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
In-Reply-To: <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 29 Jul 2021 10:35:32 -0700
Message-ID: <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 29, 2021 at 10:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Akhil P Oommen (2021-07-28 04:54:01)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 029723a..c88f366 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -592,6 +593,85 @@
> >                         qcom,bcm-voters = <&apps_bcm_voter>;
> >                 };
> >
> > +               gpu@3d00000 {
> > +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> > +                       #stream-id-cells = <16>;
> > +                       reg = <0 0x03d00000 0 0x40000>,
> > +                             <0 0x03d9e000 0 0x1000>,
> > +                             <0 0x03d61000 0 0x800>;
> > +                       reg-names = "kgsl_3d0_reg_memory",
> > +                                   "cx_mem",
> > +                                   "cx_dbgc";
> > +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > +                       iommus = <&adreno_smmu 0 0x401>;
> > +                       operating-points-v2 = <&gpu_opp_table>;
> > +                       qcom,gmu = <&gmu>;
> > +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> > +                       interconnect-names = "gfx-mem";
> > +
> > +                       gpu_opp_table: opp-table {
> > +                               compatible = "operating-points-v2";
> > +
> > +                               opp-550000000 {
> > +                                       opp-hz = /bits/ 64 <550000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +                                       opp-peak-kBps = <6832000>;
> > +                               };
> > +
> > +                               opp-450000000 {
>
> Why is 450000000 after 550000000? Is it on purpose? If not intended
> please sort by frequency.

We've used descending order, at least for gpu opp table, on other
gens, fwiw.. not sure if that just means we were doing it wrong
previously

BR,
-R

>
> > +                                       opp-hz = /bits/ 64 <450000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> > +                                       opp-peak-kBps = <4068000>;
> > +                               };
> > +
> > +                               opp-315000000 {
> > +                                       opp-hz = /bits/ 64 <315000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> > +                                       opp-peak-kBps = <1804000>;
> > +                               };
> > +                       };
> > +               };
> > +
