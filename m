Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D448319BD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 10:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhBLJZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 04:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhBLJZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 04:25:22 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABC8C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 01:24:42 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id b10so3654389ybn.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Feb 2021 01:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y0No0ONR6FUuFWuujJd79fK6HXBhAF9QPUsiKwkH7Y0=;
        b=J6MmOM83V9YJ2fLjJv6qw5ny8k7dfibZTrMS/tOukhD9W0VWt8JSMxchBBgC7Pmc2H
         m7Hx+sK/6q7adee0PvddBj7StxLuKl3xcdhQmIjKUkL0HFTLelUZgGXaCfT600GCsvql
         O/UVe84S0XiD45Eq6nygIpU+zrP/uEJP0YznVtQKM1N7XkZKS5J9gI9jAS3+BG00uWVO
         BOBOxOChC9bBL6PhR99bg245OFWat3E1fggoCQWac0OaWgSyCmliBJ1RhsjAikhQ6Ke8
         qykAHD6Nq1Ahjkr5akaCRyH0SPhju7X3Tmhs9GGeW0726BfcPpGNsqQy6SEEPP3ouQzR
         iOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y0No0ONR6FUuFWuujJd79fK6HXBhAF9QPUsiKwkH7Y0=;
        b=dxNnAFPdfh3LQa8CHuNo5h3NAgsxNifXSJR/1KXQ2bnjr82WPMxpMXnrtG11mNr4X1
         G2Yhs4ack4k/tVgPgvolCY7FPfI2e3bzyJMiY5BaR3bUo+sYo9qym4YSug9RhYEZUzC4
         soKHDl9sKxGVGLZD8LAVF3wTWSiJ5s43ZMSEM4kyNXq2KuYvlJoDHFc7k2bETRTMGCJ/
         wePNGz7tcsHn7vLsA+BENlB1q5dgfT8Ex3v1cgaxrpASKZtLbAI8JjdB542RZhpSfMkY
         siGzUNf9CzDB/niJQcKE9qJeRbh2I9QgUnqntK5vFyR5tZLHVAW9dd27Muii1APYoHQq
         qoHw==
X-Gm-Message-State: AOAM531IBUEoX8SOUbnruosbr43dWdkVcJiqlM1uajN4R2sEPF8Mjkq7
        ZhPTru3t+R4oXkWfgaiWZz0awguuzERxHTk9OakCWw==
X-Google-Smtp-Source: ABdhPJymHwa8TOcq3zW+VCNvmwG/+uOU+gPqVHU+h64ZngBdFfIYnujLXqJARPqLjFPIUYoanE9Stcqk2k7gtBmHdQE=
X-Received: by 2002:a25:ca42:: with SMTP id a63mr2856231ybg.318.1613121881114;
 Fri, 12 Feb 2021 01:24:41 -0800 (PST)
MIME-Version: 1.0
References: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org> <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
In-Reply-To: <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 12 Feb 2021 14:54:05 +0530
Message-ID: <CAMi1Hd3d8krtQHv-3LuiCcgCWSgL1L0UeSYWJp27KToyW338gw@mail.gmail.com>
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

On Thu, 11 Feb 2021 at 00:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 10/02/21 09:18, Amit Pundir ha scritto:
> > From: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > Enabling the Display panel for beryllium requires DSI
> > labibb regulators and panel dts nodes to be added.
> > It is also required to keep some of the regulators as
> > always-on.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
>
> Hello!
> Your patch looks good, however, I have a few concerns...
>
> > v3: Addressed Konrad's concerns. Configured labibb regulators
> >      explicitly based on downstream microvolt values. Display
> >      comes up fine with default discharge-resistor-kohms and
> >      soft-start-us properties, so didn't touch them.
> >      Smoke tested on next-20210209.
> > v2: Rebased to mainline (v5.11-rc6) and fixed build warnings.
> >
> >   .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts      | 64 ++++++++++++++++++++++
> >   1 file changed, 64 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> > index 86cbae63eaf7..5ac049a247e1 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> > @@ -157,6 +157,14 @@
> >                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >               };
> >
> > +             vreg_l14a_1p8: ldo14 {
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> > +                     regulator-always-on;
> > +             };
> > +
> >               vreg_l17a_1p3: ldo17 {
> >                       regulator-min-microvolt = <1304000>;
> >                       regulator-max-microvolt = <1304000>;
> > @@ -191,6 +199,7 @@
> >                       regulator-min-microvolt = <1200000>;
> >                       regulator-max-microvolt = <1200000>;
> >                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +                     regulator-boot-on;
> >               };
> >       };
> >   };
> > @@ -200,6 +209,43 @@
> >       firmware-name = "qcom/sdm845/cdsp.mdt";
> >   };
> >
> > +&dsi0 {
> > +     status = "okay";
> > +     vdda-supply = <&vreg_l26a_1p2>;
> > +
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +
> > +     panel@0 {
> > +             compatible = "tianma,fhd-video";
> > +             reg = <0>;
> > +             vddi0-supply = <&vreg_l14a_1p8>;
> > +             vddpos-supply = <&lab>;
> > +             vddneg-supply = <&ibb>;
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> > +
> > +             port {
> > +                     tianma_nt36672a_in_0: endpoint {
> > +                             remote-endpoint = <&dsi0_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&dsi0_out {
> > +     remote-endpoint = <&tianma_nt36672a_in_0>;
> > +     data-lanes = <0 1 2 3>;
> > +};
> > +
> > +&dsi0_phy {
> > +     status = "okay";
> > +     vdds-supply = <&vreg_l1a_0p875>;
> > +};
> > +
> >   &gcc {
> >       protected-clocks = <GCC_QSPI_CORE_CLK>,
> >                          <GCC_QSPI_CORE_CLK_SRC>,
> > @@ -215,6 +261,24 @@
> >       };
> >   };
> >
> > +&ibb {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> I think you want to also configure overvoltage and overcurrent
> protection values for both LAB and IBB, as these regulators may be a bit
> dangerous if used without.

Can you point me to the relevant DT properties please. I didn't find
any DT properties which set the over voltage/current protection
properties explicitly in upstream as well as in downstream kernel.
Plus I also do not see "regulator-min/max-microamp" values set
downstream, otherwise I'd have used that as well atleast.

Regards,
Amit Pundir

> Besides that, even if it wouldn't be that dangerous, since the
> protection features are present, it would be nice to configure them
> properly as in the rare event that something bad happens, you would be
> able to save the hardware (or at least have a chance to!).
>
> > +&lab {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> Same here.
>
> Yours,
> -- Angelo
>
> > +&mdss {
> > +     status = "okay";
> > +};
> > +
> > +&mdss_mdp {
> > +     status = "okay";
> > +};
> > +
> >   &mss_pil {
> >       status = "okay";
> >       firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mdt";
> >
>
