Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39004128126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 18:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfLTRKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 12:10:41 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:41803 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbfLTRKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 12:10:40 -0500
Received: by mail-il1-f196.google.com with SMTP id f10so8539094ils.8;
        Fri, 20 Dec 2019 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8X6eM1UlBnu1fbAvRY6IWsP8KcIfeMjkcTRsCO9wP4c=;
        b=t/jr0aYxWh6MeSKmwbivLilTGBgvfG8/zZAXd8YogmsO209mMRZg4lNx6NJ5w7p6ie
         dxde5IZrrl7mId2EQZn42yyu6iq49KAh20xQgknDxv6F3e3Xk4+HzzeCuGli9vI6qiUl
         vA402D1ATJ7yoGq3BURx6dWHzilqKJFU3o4vkvwln89L1zC5mdIqBt+LEKEd/fDSDo4T
         ZBJKb26/BL9sWADUa8GDc4InvnJ/0qb43seyZb5qLZ2Lo4GIyTlNWz7K4aZoSv5522aR
         uLJfqbKyPwAwlzxxptOS7mU0YmNQG5FYmAd+xCbIrLiPv99qstoOtroQIKvO1W0ucali
         hm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8X6eM1UlBnu1fbAvRY6IWsP8KcIfeMjkcTRsCO9wP4c=;
        b=CliB6L3EeLBpzCMov5JsUdlzzwzcXXRq993S98YIGq8l62klRRVM6QHkUUOYXr141v
         pHahP3WSMzZr2cVCBHiHYq1dUcN+pooh/u/RHdLH5HuiugXl18f+Jsfef1mYY2SWpitk
         2kqO8yZyy5+5AVwQKVfft5zVQjWvz0WJNBHi51wO/54u1HbK3eeEiR98bn7AgdwTgmRp
         k31ZqPzdzuayRg9RiSNfgPNtncANsrlSJCzrmgiGbdjDS1kIdgi852JwwsCuCCxcOPVT
         PJfzsWshx55Q9Yzdf8Sjt/SHTDbaK1J4TF/uhevhUUWOG3nuQgVRyYIfFT13oGzt1SHz
         qbhw==
X-Gm-Message-State: APjAAAWBo1lDnqhRDaZxaoOQsbCRAC8LnKlYdV3Xj9ZTUZNS+ew5G3+Q
        QG4pNDvt8Agtk3OwlODmSAUDhz4fCxVOFtWHZqg=
X-Google-Smtp-Source: APXvYqyu9tLr/G7ErS7/iGO9X3KZio0XDZX6FLrGcTSUz2IN7SVLoJL859GU0jvYR0xH7tbLS+VYSi4hmrWn9iD0oTw=
X-Received: by 2002:a92:d34d:: with SMTP id a13mr2871094ilh.178.1576861839573;
 Fri, 20 Dec 2019 09:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20191218132217.28141-1-sibis@codeaurora.org> <20191218132217.28141-6-sibis@codeaurora.org>
 <20191220065954.GA1908628@ripper> <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
 <20191220170525.GC549437@yoga>
In-Reply-To: <20191220170525.GC549437@yoga>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 20 Dec 2019 10:10:28 -0700
Message-ID: <CAOCk7Nr3vMRpC6QQ21HCrd9B=PFo4D=-yQ196YnsP_0jBV3RCQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 20, 2019 at 10:05 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 20 Dec 06:33 PST 2019, Jeffrey Hugo wrote:
>
> > On Fri, Dec 20, 2019 at 12:00 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:
> > >
> > > > This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> > > >
> > > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
> > > >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
> > > >  2 files changed, 132 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > index 6db3f9e0344d1..e87094665c52c 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > @@ -312,6 +312,14 @@
> > > >       };
> > > >  };
> > > >
> > > > +&remoteproc_adsp {
> > > > +     status = "okay";
> > > > +};
> > > > +
> > > > +&remoteproc_slpi {
> > > > +     status = "okay";
> > > > +};
> > > > +
> > > >  &tlmm {
> > > >       gpio-reserved-ranges = <0 4>, <81 4>;
> > > >  };
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > index 8d799e868a5d3..014127700afb0 100644
> > > > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > @@ -1075,6 +1075,61 @@
> > > >                       #interrupt-cells = <0x2>;
> > > >               };
> > > >
> > > > +             remoteproc_mss: remoteproc@4080000 {
> > > > +                     compatible = "qcom,msm8998-mss-pil";
> > > > +                     reg = <0x04080000 0x100>, <0x04180000 0x20>;
> > > > +                     reg-names = "qdsp6", "rmb";
> > > > +
> > > > +                     interrupts-extended =
> > > > +                             <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > > > +                             <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > +                             <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > +                             <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > +                             <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > > > +                             <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > +                                       "handover", "stop-ack",
> > > > +                                       "shutdown-ack";
> > > > +
> > > > +                     clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > > > +                              <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> > > > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > > > +                              <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> > > > +                              <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > > > +                              <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> > > > +                              <&rpmcc RPM_SMD_QDSS_CLK>,
> > > > +                              <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > >
> > > RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...
> > >
> > > I did pull in a patch from Jeff that defines it, but when I boot the
> > > modem I see the following error repeatedly:
> >
> > Yeah, we need to figure out a solution for rpmcc to actually provide
> > this since the previous N solutions were not acceptable.  Its on my
> > todo list to look into in Jan.  However, I really think the DT should
> > be defined this way, since it replicates the hardware config.
> >
>
> I presume you can't rely on parent_data due to issues before rpmcc has
> probed properly?

I don't think so, but I need to circle back on that.

>
> Not sure what to do about that, perhaps we can stop-gap by adding the
> new clock and setting up the DT, and then swing back to wiring it up
> internally in gcc later?

The define should be there.  The DT should compile.  The issue will be
that the driver will not get the clock at runtime, which is
functionally equivalent to what we have now (in the end, modem doesnt
boot with or without this change, will boot with an out of tree
patch).  Adding the clock to rpmcc without coordinating with gcc will
cause issues in the clock framework with multiple defines of the same
clock.

>
> > >
> > > [  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own
> >
> > Maybe the BIMC fix will address this?
> >
>
> Just applying "clk: qcom: smd: Add missing bimc clock" did not change
> things.
>
> So just to be clear, I'm testing this with the following patches on top
> of linux-next:
>
> clk: qcom: smd: Add missing bimc clock
> clk: qcom: smd: Add XO clock for MSM8998
> arm64: dts: msm8998: Add xo clock to gcc node
> arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
> arm64: dts: qcom: msm8998: Update reserved memory map
> remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
> dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
> remoteproc: q6v5-mss: Remove mem clk from the active pool
> phy: qcom-qmp: Add optional SW reset
> phy: qcom-qmp: Increase the phy init timeout
>
> Regards,
> Bjorn
>
> > >
> > >
> > >
> > > All the qrtr services seems registered nicely, so the remote does come
> > > up before it goes down.
> > >
> > > Also, adsp comes up nicely.
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > +                     clock-names = "iface", "bus", "mem", "gpll0_mss",
> > > > +                                   "snoc_axi", "mnoc_axi", "qdss", "xo";
> > > > +
> > > > +                     qcom,smem-states = <&modem_smp2p_out 0>;
> > > > +                     qcom,smem-state-names = "stop";
> > > > +
> > > > +                     resets = <&gcc GCC_MSS_RESTART>;
> > > > +                     reset-names = "mss_restart";
> > > > +
> > > > +                     qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> > > > +
> > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>,
> > > > +                                     <&rpmpd MSM8998_VDDMX>;
> > > > +                     power-domain-names = "cx", "mx";
> > > > +
> > > > +                     mba {
> > > > +                             memory-region = <&mba_mem>;
> > > > +                     };
> > > > +
> > > > +                     mpss {
> > > > +                             memory-region = <&mpss_mem>;
> > > > +                     };
> > > > +
> > > > +                     glink-edge {
> > > > +                             interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> > > > +                             label = "modem";
> > > > +                             qcom,remote-pid = <1>;
> > > > +                             mboxes = <&apcs_glb 15>;
> > > > +                     };
> > > > +             };
> > > > +
> > > >               gpucc: clock-controller@5065000 {
> > > >                       compatible = "qcom,msm8998-gpucc";
> > > >                       #clock-cells = <1>;
> > > > @@ -1088,6 +1143,42 @@
> > > >                                     "gpll0";
> > > >               };
> > > >
> > > > +             remoteproc_slpi: remoteproc@5800000 {
> > > > +                     compatible = "qcom,msm8998-slpi-pas";
> > > > +                     reg = <0x05800000 0x4040>;
> > > > +
> > > > +                     interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > +                                       "handover", "stop-ack";
> > > > +
> > > > +                     px-supply = <&vreg_lvs2a_1p8>;
> > > > +
> > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > > > +                              <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> > > > +                     clock-names = "xo", "aggre2";
> > > > +
> > > > +                     memory-region = <&slpi_mem>;
> > > > +
> > > > +                     qcom,smem-states = <&slpi_smp2p_out 0>;
> > > > +                     qcom,smem-state-names = "stop";
> > > > +
> > > > +                     power-domains = <&rpmpd MSM8998_SSCCX>;
> > > > +                     power-domain-names = "ssc_cx";
> > > > +
> > > > +                     status = "disabled";
> > > > +
> > > > +                     glink-edge {
> > > > +                             interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> > > > +                             label = "dsps";
> > > > +                             qcom,remote-pid = <3>;
> > > > +                             mboxes = <&apcs_glb 27>;
> > > > +                     };
> > > > +             };
> > > > +
> > > >               stm: stm@6002000 {
> > > >                       compatible = "arm,coresight-stm", "arm,primecell";
> > > >                       reg = <0x06002000 0x1000>,
> > > > @@ -1880,6 +1971,39 @@
> > > >                       #size-cells = <0>;
> > > >               };
> > > >
> > > > +             remoteproc_adsp: remoteproc@17300000 {
> > > > +                     compatible = "qcom,msm8998-adsp-pas";
> > > > +                     reg = <0x17300000 0x4040>;
> > > > +
> > > > +                     interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > +                                           <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > +                                       "handover", "stop-ack";
> > > > +
> > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > > +                     clock-names = "xo";
> > > > +
> > > > +                     memory-region = <&adsp_mem>;
> > > > +
> > > > +                     qcom,smem-states = <&adsp_smp2p_out 0>;
> > > > +                     qcom,smem-state-names = "stop";
> > > > +
> > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>;
> > > > +                     power-domain-names = "cx";
> > > > +
> > > > +                     status = "disabled";
> > > > +
> > > > +                     glink-edge {
> > > > +                             interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> > > > +                             label = "lpass";
> > > > +                             qcom,remote-pid = <2>;
> > > > +                             mboxes = <&apcs_glb 9>;
> > > > +                     };
> > > > +             };
> > > > +
> > > >               apcs_glb: mailbox@17911000 {
> > > >                       compatible = "qcom,msm8998-apcs-hmss-global";
> > > >                       reg = <0x17911000 0x1000>;
> > > > --
> > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > a Linux Foundation Collaborative Project
