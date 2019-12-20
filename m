Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59E01281D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 19:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfLTSEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 13:04:30 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:40775 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfLTSEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 13:04:30 -0500
Received: by mail-il1-f194.google.com with SMTP id c4so8695833ilo.7;
        Fri, 20 Dec 2019 10:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Lw5vFzGqvb6DDUrLl3xEeRKC0V14TTTkqFUTIQ0nqc=;
        b=HANz/cioQL+WrqhMYGSbY7mOG5q/3eBhIjHxxZjUKlFa137C57fhHJgK7ef8cAQvHm
         Tp6MOw7YA2ozwxFpJpB162pMoryJZagj1N1oeu6SnHyc7kZodwnbT96rV4TBoLenUmjp
         Cyx5fvOQHnkmAsmZ/KXVqvMTismqKm5loaXN8eTnZE+drAOGR2WPwdlAutBO18+1/cNt
         LgAVqBLu2984I48NNNE8C5Ju6+iSyPXpQkeC7dWed7ndrotWfzcbQrV11KgGdcQa6Xhh
         yA3d6KyjKnThg20xnfTDQ9Bh1GAn07avXFhSasPCwhGD6obPSdABfbxpdwzw8ZM5DhkQ
         rEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Lw5vFzGqvb6DDUrLl3xEeRKC0V14TTTkqFUTIQ0nqc=;
        b=dEUVaffrASwmiwfGX4IC55azz/CB7EPrDnNQ1+UaKom+DdVGaawP6q65NfsYjtdNmy
         RbbrvMi1bt4L5+SGj0xL0vwt7pELY5ErwH3yE/MSrd9nbvp/Eu/wHxz69Zw5Wl0Y2K8s
         Oh9TyV/ym3Mezsuo+jXtolwYNaKhHdVdeCrCLN7zrRYNFKu7xX0iUACs5r5HFHxV6lJJ
         iAphD+3qAJJDsK4ddGdciiFRgEq6Etm4OYacvibCFMNfSTJ3QPgX6TkWry/RZ+VuunLv
         Ixej0ps7pEShPI9sP3FW1uTz6x8WmPjzK5a/GZMCJUepPyGXxum8rhEwB2MaFCEPFzq/
         8yHg==
X-Gm-Message-State: APjAAAX8NDzNiR7J7xmGutg795d5saLZhZW4QxpU2PxHxBiPe5LamjA1
        z0vTLdcydUYSt1ZJKlgzPgM6Jxf/+jglEdDmqFMc2w==
X-Google-Smtp-Source: APXvYqxgXdF36cE9/zW3GTgoh8c7w2Vzme6NLz97bVYDe8tHXqj8ksAKw9xi3KjIOTUcWYQkMV/nd+ZMqeku228WNKQ=
X-Received: by 2002:a92:4891:: with SMTP id j17mr12821116ilg.33.1576865068967;
 Fri, 20 Dec 2019 10:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20191218132217.28141-1-sibis@codeaurora.org> <20191218132217.28141-6-sibis@codeaurora.org>
 <20191220065954.GA1908628@ripper> <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
 <20191220170525.GC549437@yoga> <CAOCk7Nr3vMRpC6QQ21HCrd9B=PFo4D=-yQ196YnsP_0jBV3RCQ@mail.gmail.com>
 <20191220180217.GF3755841@builder>
In-Reply-To: <20191220180217.GF3755841@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 20 Dec 2019 11:04:17 -0700
Message-ID: <CAOCk7NqUgA6Cjk8ZFTscP3jTcN3y3_fuOEOe0K4YKg+urfeSCQ@mail.gmail.com>
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

On Fri, Dec 20, 2019 at 11:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 20 Dec 09:10 PST 2019, Jeffrey Hugo wrote:
>
> > On Fri, Dec 20, 2019 at 10:05 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Fri 20 Dec 06:33 PST 2019, Jeffrey Hugo wrote:
> > >
> > > > On Fri, Dec 20, 2019 at 12:00 AM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > >
> > > > > On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:
> > > > >
> > > > > > This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> > > > > >
> > > > > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
> > > > > >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
> > > > > >  2 files changed, 132 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > > index 6db3f9e0344d1..e87094665c52c 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > > @@ -312,6 +312,14 @@
> > > > > >       };
> > > > > >  };
> > > > > >
> > > > > > +&remoteproc_adsp {
> > > > > > +     status = "okay";
> > > > > > +};
> > > > > > +
> > > > > > +&remoteproc_slpi {
> > > > > > +     status = "okay";
> > > > > > +};
> > > > > > +
> > > > > >  &tlmm {
> > > > > >       gpio-reserved-ranges = <0 4>, <81 4>;
> > > > > >  };
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > > index 8d799e868a5d3..014127700afb0 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > > @@ -1075,6 +1075,61 @@
> > > > > >                       #interrupt-cells = <0x2>;
> > > > > >               };
> > > > > >
> > > > > > +             remoteproc_mss: remoteproc@4080000 {
> > > > > > +                     compatible = "qcom,msm8998-mss-pil";
> > > > > > +                     reg = <0x04080000 0x100>, <0x04180000 0x20>;
> > > > > > +                     reg-names = "qdsp6", "rmb";
> > > > > > +
> > > > > > +                     interrupts-extended =
> > > > > > +                             <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                             <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                             <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                             <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                             <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                             <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > > +                                       "handover", "stop-ack",
> > > > > > +                                       "shutdown-ack";
> > > > > > +
> > > > > > +                     clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > > > > > +                              <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> > > > > > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > > > > > +                              <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> > > > > > +                              <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > > > > > +                              <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> > > > > > +                              <&rpmcc RPM_SMD_QDSS_CLK>,
> > > > > > +                              <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > > >
> > > > > RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...
> > > > >
> > > > > I did pull in a patch from Jeff that defines it, but when I boot the
> > > > > modem I see the following error repeatedly:
> > > >
> > > > Yeah, we need to figure out a solution for rpmcc to actually provide
> > > > this since the previous N solutions were not acceptable.  Its on my
> > > > todo list to look into in Jan.  However, I really think the DT should
> > > > be defined this way, since it replicates the hardware config.
> > > >
> > >
> > > I presume you can't rely on parent_data due to issues before rpmcc has
> > > probed properly?
> >
> > I don't think so, but I need to circle back on that.
> >
> > >
> > > Not sure what to do about that, perhaps we can stop-gap by adding the
> > > new clock and setting up the DT, and then swing back to wiring it up
> > > internally in gcc later?
> >
> > The define should be there.  The DT should compile.  The issue will be
> > that the driver will not get the clock at runtime, which is
> > functionally equivalent to what we have now (in the end, modem doesnt
> > boot with or without this change, will boot with an out of tree
> > patch).  Adding the clock to rpmcc without coordinating with gcc will
> > cause issues in the clock framework with multiple defines of the same
> > clock.
> >
>
> Yeah, it compiles and boots. I just wasn't able to conclude that the
> patches where working properly.

Ah, I see.

>
> But, I found another email from Sibi regarding the starvation reported,
> it turns out that this version of the modem firmware requires diag to be
> present. So after launching diag-router the modem is up and running.

Excellent.

>
>
> As such, I've merged the series. Let's try to figure out the clock
> situation to make it functional out of the box.

Yep, the clock situation is high on my priority list.  I very much
want things functional out of the box.

>
> Regards,
> Bjorn
>
> > >
> > > > >
> > > > > [  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own
> > > >
> > > > Maybe the BIMC fix will address this?
> > > >
> > >
> > > Just applying "clk: qcom: smd: Add missing bimc clock" did not change
> > > things.
> > >
> > > So just to be clear, I'm testing this with the following patches on top
> > > of linux-next:
> > >
> > > clk: qcom: smd: Add missing bimc clock
> > > clk: qcom: smd: Add XO clock for MSM8998
> > > arm64: dts: msm8998: Add xo clock to gcc node
> > > arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
> > > arm64: dts: qcom: msm8998: Update reserved memory map
> > > remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
> > > dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
> > > remoteproc: q6v5-mss: Remove mem clk from the active pool
> > > phy: qcom-qmp: Add optional SW reset
> > > phy: qcom-qmp: Increase the phy init timeout
> > >
> > > Regards,
> > > Bjorn
> > >
> > > > >
> > > > >
> > > > >
> > > > > All the qrtr services seems registered nicely, so the remote does come
> > > > > up before it goes down.
> > > > >
> > > > > Also, adsp comes up nicely.
> > > > >
> > > > > Regards,
> > > > > Bjorn
> > > > >
> > > > > > +                     clock-names = "iface", "bus", "mem", "gpll0_mss",
> > > > > > +                                   "snoc_axi", "mnoc_axi", "qdss", "xo";
> > > > > > +
> > > > > > +                     qcom,smem-states = <&modem_smp2p_out 0>;
> > > > > > +                     qcom,smem-state-names = "stop";
> > > > > > +
> > > > > > +                     resets = <&gcc GCC_MSS_RESTART>;
> > > > > > +                     reset-names = "mss_restart";
> > > > > > +
> > > > > > +                     qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> > > > > > +
> > > > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>,
> > > > > > +                                     <&rpmpd MSM8998_VDDMX>;
> > > > > > +                     power-domain-names = "cx", "mx";
> > > > > > +
> > > > > > +                     mba {
> > > > > > +                             memory-region = <&mba_mem>;
> > > > > > +                     };
> > > > > > +
> > > > > > +                     mpss {
> > > > > > +                             memory-region = <&mpss_mem>;
> > > > > > +                     };
> > > > > > +
> > > > > > +                     glink-edge {
> > > > > > +                             interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                             label = "modem";
> > > > > > +                             qcom,remote-pid = <1>;
> > > > > > +                             mboxes = <&apcs_glb 15>;
> > > > > > +                     };
> > > > > > +             };
> > > > > > +
> > > > > >               gpucc: clock-controller@5065000 {
> > > > > >                       compatible = "qcom,msm8998-gpucc";
> > > > > >                       #clock-cells = <1>;
> > > > > > @@ -1088,6 +1143,42 @@
> > > > > >                                     "gpll0";
> > > > > >               };
> > > > > >
> > > > > > +             remoteproc_slpi: remoteproc@5800000 {
> > > > > > +                     compatible = "qcom,msm8998-slpi-pas";
> > > > > > +                     reg = <0x05800000 0x4040>;
> > > > > > +
> > > > > > +                     interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > > +                                       "handover", "stop-ack";
> > > > > > +
> > > > > > +                     px-supply = <&vreg_lvs2a_1p8>;
> > > > > > +
> > > > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > > > > > +                              <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> > > > > > +                     clock-names = "xo", "aggre2";
> > > > > > +
> > > > > > +                     memory-region = <&slpi_mem>;
> > > > > > +
> > > > > > +                     qcom,smem-states = <&slpi_smp2p_out 0>;
> > > > > > +                     qcom,smem-state-names = "stop";
> > > > > > +
> > > > > > +                     power-domains = <&rpmpd MSM8998_SSCCX>;
> > > > > > +                     power-domain-names = "ssc_cx";
> > > > > > +
> > > > > > +                     status = "disabled";
> > > > > > +
> > > > > > +                     glink-edge {
> > > > > > +                             interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                             label = "dsps";
> > > > > > +                             qcom,remote-pid = <3>;
> > > > > > +                             mboxes = <&apcs_glb 27>;
> > > > > > +                     };
> > > > > > +             };
> > > > > > +
> > > > > >               stm: stm@6002000 {
> > > > > >                       compatible = "arm,coresight-stm", "arm,primecell";
> > > > > >                       reg = <0x06002000 0x1000>,
> > > > > > @@ -1880,6 +1971,39 @@
> > > > > >                       #size-cells = <0>;
> > > > > >               };
> > > > > >
> > > > > > +             remoteproc_adsp: remoteproc@17300000 {
> > > > > > +                     compatible = "qcom,msm8998-adsp-pas";
> > > > > > +                     reg = <0x17300000 0x4040>;
> > > > > > +
> > > > > > +                     interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > > +                                           <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > > +                                       "handover", "stop-ack";
> > > > > > +
> > > > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > > > > +                     clock-names = "xo";
> > > > > > +
> > > > > > +                     memory-region = <&adsp_mem>;
> > > > > > +
> > > > > > +                     qcom,smem-states = <&adsp_smp2p_out 0>;
> > > > > > +                     qcom,smem-state-names = "stop";
> > > > > > +
> > > > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>;
> > > > > > +                     power-domain-names = "cx";
> > > > > > +
> > > > > > +                     status = "disabled";
> > > > > > +
> > > > > > +                     glink-edge {
> > > > > > +                             interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> > > > > > +                             label = "lpass";
> > > > > > +                             qcom,remote-pid = <2>;
> > > > > > +                             mboxes = <&apcs_glb 9>;
> > > > > > +                     };
> > > > > > +             };
> > > > > > +
> > > > > >               apcs_glb: mailbox@17911000 {
> > > > > >                       compatible = "qcom,msm8998-apcs-hmss-global";
> > > > > >                       reg = <0x17911000 0x1000>;
> > > > > > --
> > > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > > > a Linux Foundation Collaborative Project
