Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B7E31C7BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 10:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBPJFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 04:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhBPJE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 04:04:56 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D0CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 01:03:58 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id r127so374317ybr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 01:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ad5fJQsjFqBClERhvuISieSOy+7o471fO8R0Iulcc0=;
        b=tI1AQ4QUYL9AKy2+hFDhM63f4PhTt6pzL4oPEXi8AP1xAAO7W6+34oR+1eZwLIvWKu
         q4SOZf8TqlpZVj9kV/08KQkoQDElVe18yoga8MerOz5ebDwvFeSHeRFeLdeub2RyC40V
         akatORZ3e+EvviH5abGtlz8jLWpNY0+WdvAxJ5RMUIyPU/Zu38Ik4rW8ryV4iySD3g7V
         0UzDEhP+4v28eMLMSvu+ROWAC7C6omAeytlQeqMx0i+uVo3blhgosYqb0BQ2/3eVgdFC
         eFpe9NFQZ9fEATlkNUxJBQWbeted93hWgvv5G8EEjuPCN2nsdiu6DsJ4KVnZ+nzu7bUJ
         qraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ad5fJQsjFqBClERhvuISieSOy+7o471fO8R0Iulcc0=;
        b=QgtbHegq19rDd42QPsueVCZILaLWEvNsDZHT6JYk/zQ4yIUyqI863vc/Dydsv9SKFC
         liDK8pwyRxa5T6YCTQycDQWjdn+IlassgkWsQZWwKsEtUT9pzQYzfRBx/dULPb0wzPnF
         gxhuHwR+Pc/ExLq9LUuJFxo7ykYiJ41J2nZuna8uS/sYP0ZYGDr6unxdJXb/X4SM91uO
         R+TWFytbN9YK1fmXAtixS/jz2S4YvY388AP+dM3V3vz3CuWJlzYLPKSXaV2Y/aBAsucH
         TIM17qlx+0nAbpyRqkQoFwg64YNr8T5fw3PGm7ZRta3IO5C7TTrmyBHSaBsDxD/Tttgm
         0Cwg==
X-Gm-Message-State: AOAM530LaLMjiAFDQlXLaLc2LXPnjdXZ/4rH2SHMglUEcD5d81P3qy9M
        +v90FPcZcTNMORLansoFYdcgpWXkBDP8w4UvZ5NgZ+fjNOsHsA==
X-Google-Smtp-Source: ABdhPJwammnRdHCaAXy66yT+gsk2paFjDZX3yE3axqzSh4Thxpdsqj+jmOe3mzLIcD9v1AUhX1gtYvtxzp3lPE+IObs=
X-Received: by 2002:a25:68cf:: with SMTP id d198mr29003255ybc.258.1613466237931;
 Tue, 16 Feb 2021 01:03:57 -0800 (PST)
MIME-Version: 1.0
References: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org>
 <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org> <CAMi1Hd3d8krtQHv-3LuiCcgCWSgL1L0UeSYWJp27KToyW338gw@mail.gmail.com>
 <b8618ac4-85aa-5f7f-8550-07f7eec6cc08@somainline.org>
In-Reply-To: <b8618ac4-85aa-5f7f-8550-07f7eec6cc08@somainline.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 16 Feb 2021 14:33:22 +0530
Message-ID: <CAMi1Hd0jb_BrXzZp=L_qZ39wBYc7iFHQbzPa_nQaQ44SohvcQg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, 12 Feb 2021 at 23:11, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 12/02/21 10:24, Amit Pundir ha scritto:
> > Hi,
> >
> > On Thu, 11 Feb 2021 at 00:25, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> >>
> >> Il 10/02/21 09:18, Amit Pundir ha scritto:
> >>> From: Sumit Semwal <sumit.semwal@linaro.org>
> >>>
> >>> Enabling the Display panel for beryllium requires DSI
> >>> labibb regulators and panel dts nodes to be added.
> >>> It is also required to keep some of the regulators as
> >>> always-on.
> >>>
> >>> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> >>> ---
> >>
> >> Hello!
> >> Your patch looks good, however, I have a few concerns...
> >>
> >>> v3: Addressed Konrad's concerns. Configured labibb regulators
> >>>       explicitly based on downstream microvolt values. Display
> >>>       comes up fine with default discharge-resistor-kohms and
> >>>       soft-start-us properties, so didn't touch them.
> >>>       Smoke tested on next-20210209.
> >>> v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.
> >>>
> >>>    .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 64 ++++++++++++++++++++++
> >>>    1 file changed, 64 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> >>> index 86cbae63eaf7..5ac049a247e1 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> >>> @@ -157,6 +157,14 @@
> >>>                        regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>>                };
> >>>
> >>> +             vreg_l14a_1p8: ldo14 {
> >>> +                     regulator-min-microvolt = <1800000>;
> >>> +                     regulator-max-microvolt = <1800000>;
> >>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +                     regulator-boot-on;
> >>> +                     regulator-always-on;
> >>> +             };
> >>> +
> >>>                vreg_l17a_1p3: ldo17 {
> >>>                        regulator-min-microvolt = <1304000>;
> >>>                        regulator-max-microvolt = <1304000>;
> >>> @@ -191,6 +199,7 @@
> >>>                        regulator-min-microvolt = <1200000>;
> >>>                        regulator-max-microvolt = <1200000>;
> >>>                        regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +                     regulator-boot-on;
> >>>                };
> >>>        };
> >>>    };
> >>> @@ -200,6 +209,43 @@
> >>>        firmware-name = "qcom/sdm845/cdsp.mdt";
> >>>    };
> >>>
> >>> +&dsi0 {
> >>> +     status = "okay";
> >>> +     vdda-supply = <&vreg_l26a_1p2>;
> >>> +
> >>> +     #address-cells = <1>;
> >>> +     #size-cells = <0>;
> >>> +
> >>> +     panel@0 {
> >>> +             compatible = "tianma,fhd-video";
> >>> +             reg = <0>;
> >>> +             vddi0-supply = <&vreg_l14a_1p8>;
> >>> +             vddpos-supply = <&lab>;
> >>> +             vddneg-supply = <&ibb>;
> >>> +
> >>> +             #address-cells = <1>;
> >>> +             #size-cells = <0>;
> >>> +
> >>> +             reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> >>> +
> >>> +             port {
> >>> +                     tianma_nt36672a_in_0: endpoint {
> >>> +                             remote-endpoint = <&dsi0_out>;
> >>> +                     };
> >>> +             };
> >>> +     };
> >>> +};
> >>> +
> >>> +&dsi0_out {
> >>> +     remote-endpoint = <&tianma_nt36672a_in_0>;
> >>> +     data-lanes = <0 1 2 3>;
> >>> +};
> >>> +
> >>> +&dsi0_phy {
> >>> +     status = "okay";
> >>> +     vdds-supply = <&vreg_l1a_0p875>;
> >>> +};
> >>> +
> >>>    &gcc {
> >>>        protected-clocks = <GCC_QSPI_CORE_CLK>,
> >>>                           <GCC_QSPI_CORE_CLK_SRC>,
> >>> @@ -215,6 +261,24 @@
> >>>        };
> >>>    };
> >>>
> >>> +&ibb {
> >>> +     regulator-min-microvolt = <4600000>;
> >>> +     regulator-max-microvolt = <6000000>;
> >>> +};
> >>> +
> >>
> >> I think you want to also configure overvoltage and overcurrent
> >> protection values for both LAB and IBB, as these regulators may be a bit
> >> dangerous if used without.
> >
> > Can you point me to the relevant DT properties please. I didn't find
> > any DT properties which set the over voltage/current protection
> > properties explicitly in upstream as well as in downstream kernel.
> > Plus I also do not see "regulator-min/max-microamp" values set
> > downstream, otherwise I'd have used that as well atleast.
> >
>
> The regulator-{min/max}-microamp is the equivalent of the downstream
> "qcom,qpnp-lab-limit-maximum-current" and
> "qcom,qpnp-ibb-limit-maximum-current.

Thank you for the information.

>
> I am sorry if we haven't sent our patch series that will introduce the
> Sony MSM8998 Yoshino and SDM630/636 Nile and Ganges platforms, which
> are actually using the driver that I've sent fully, as these would have
> been a nice reference for you.
>
> In any case, I can point you at our public repositories and their
> downstream equivalents...
>
> Here you find the downstream configuration for LAB/IBB:
> https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.7.1.r1/arch/arm64/boot/dts/qcom/msm8998-yoshino-common.dtsi#L3158
>
> ...And here you find the SoMainline upstream stuff for the same:
> https://github.com/SoMainline/linux/blob/SoMainline/v5.11-rc4/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi#L332
>
> https://github.com/SoMainline/linux/blob/SoMainline/v5.11-rc4/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dts#L50
>
> I hope that clears out your doubts and difficulties about implementing
> the protections on labibb.

Exactly what I was looking for. Thanks again.

>
> Yours,
> -- Angelo
>
> > Regards,
> > Amit Pundir
> >
> >> Besides that, even if it wouldn't be that dangerous, since the
> >> protection features are present, it would be nice to configure them
> >> properly as in the rare event that something bad happens, you would be
> >> able to save the hardware (or at least have a chance to!).
> >>
> >>> +&lab {
> >>> +     regulator-min-microvolt = <4600000>;
> >>> +     regulator-max-microvolt = <6000000>;
> >>> +};
> >>> +
> >>
> >> Same here.
> >>
> >> Yours,
> >> -- Angelo
> >>
> >>> +&mdss {
> >>> +     status = "okay";
> >>> +};
> >>> +
> >>> +&mdss_mdp {
> >>> +     status = "okay";
> >>> +};
> >>> +
> >>>    &mss_pil {
> >>>        status = "okay";
> >>>        firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
> >>>
> >>
>
