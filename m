Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A05128115
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 18:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbfLTRFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 12:05:30 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40988 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfLTRFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 12:05:30 -0500
Received: by mail-pf1-f194.google.com with SMTP id w62so5520930pfw.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2019 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rvLTG4tbCCxJ9s9ad6CgN1ODgPuePNAO7RzeO6g7Xps=;
        b=fnmXFL+bmdPmgoYm0h96d0QPJufiF+4YmdARDmcMO6V3Fb8Htg7EJdwuWu07+De4Gz
         F615BGhaM0lrJxTtm/3ej3gT9PoXpVmYxjbJAuCYAEWzscbr8gc7GYk6Ht06G0Vofo30
         05K7nbLgy8fvUVwCdWb8jeQ2XG28mLeJWU9VeNpswACgLWKhR0QsLjwaw65LpFSVyVIi
         5lw4epuhkytNqDDwiI8zwKRGOQ7WPWayiNU4Q47UgWVcm9oy71on7mtV8V19BcQNfYU6
         wqR9RjZCFiVlV/1fdNAbpsqdI4KWLCiNSqMGvUOHhF38awZVWiCW7QDYg1LDHTZqX8mO
         v4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rvLTG4tbCCxJ9s9ad6CgN1ODgPuePNAO7RzeO6g7Xps=;
        b=kwfDB3SvJkVjWVg4Gw3H6lzsUWonkFTp2L+teqE0RYyu4EvjRqAI6is5yhVas9OmN7
         9vmA7P3EEe0KdohWdEZCc7JmbQ4lqng32sTkzKj7w1x82FZUgfK4Bk8vGASsWW75pVdN
         p09iFCap4Yk3EJ37keExVJnodcTwhaDbeUCgjN39QP/V7upGMrVUL/Bph+QuipDWcCmD
         LLMVX5FqG1GHWvPqPKb2cH35Tx+B1/epQlLxQba1GYC5SzIx4sNNkqdgY+yPOuAgN/IO
         IVBzVt4hUEEeeY4KJnINODE28yCiqkdF5u3IQ+5UAXf+6CMRzaWAIncRq2LiUtrRof2h
         WjiQ==
X-Gm-Message-State: APjAAAWdebaJfyRUpEknZMk/CFNPnwdzBJ8ZEs5nLs5z9xysdmTWni0w
        DROl9aRZl+Yzv33jfG10Kyd8iQ==
X-Google-Smtp-Source: APXvYqx4WDR9u/Y/nFTiBAyuGK1FyhMC9iOdbGEw3Y/QIjY+mL8QDp4rxIZC5zWxa60U+7vjN9cgdg==
X-Received: by 2002:a63:a34b:: with SMTP id v11mr15431324pgn.229.1576861528936;
        Fri, 20 Dec 2019 09:05:28 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f8sm11126141pjg.28.2019.12.20.09.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 09:05:28 -0800 (PST)
Date:   Fri, 20 Dec 2019 09:05:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: msm8998: Add ADSP, MPSS and
 SLPI nodes
Message-ID: <20191220170525.GC549437@yoga>
References: <20191218132217.28141-1-sibis@codeaurora.org>
 <20191218132217.28141-6-sibis@codeaurora.org>
 <20191220065954.GA1908628@ripper>
 <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Dec 06:33 PST 2019, Jeffrey Hugo wrote:

> On Fri, Dec 20, 2019 at 12:00 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:
> >
> > > This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> > >
> > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
> > >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
> > >  2 files changed, 132 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > index 6db3f9e0344d1..e87094665c52c 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > @@ -312,6 +312,14 @@
> > >       };
> > >  };
> > >
> > > +&remoteproc_adsp {
> > > +     status = "okay";
> > > +};
> > > +
> > > +&remoteproc_slpi {
> > > +     status = "okay";
> > > +};
> > > +
> > >  &tlmm {
> > >       gpio-reserved-ranges = <0 4>, <81 4>;
> > >  };
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > index 8d799e868a5d3..014127700afb0 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > @@ -1075,6 +1075,61 @@
> > >                       #interrupt-cells = <0x2>;
> > >               };
> > >
> > > +             remoteproc_mss: remoteproc@4080000 {
> > > +                     compatible = "qcom,msm8998-mss-pil";
> > > +                     reg = <0x04080000 0x100>, <0x04180000 0x20>;
> > > +                     reg-names = "qdsp6", "rmb";
> > > +
> > > +                     interrupts-extended =
> > > +                             <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > > +                             <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > +                             <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > +                             <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > +                             <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > > +                             <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > +                                       "handover", "stop-ack",
> > > +                                       "shutdown-ack";
> > > +
> > > +                     clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > > +                              <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> > > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > > +                              <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> > > +                              <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > > +                              <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> > > +                              <&rpmcc RPM_SMD_QDSS_CLK>,
> > > +                              <&rpmcc RPM_SMD_XO_CLK_SRC>;
> >
> > RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...
> >
> > I did pull in a patch from Jeff that defines it, but when I boot the
> > modem I see the following error repeatedly:
> 
> Yeah, we need to figure out a solution for rpmcc to actually provide
> this since the previous N solutions were not acceptable.  Its on my
> todo list to look into in Jan.  However, I really think the DT should
> be defined this way, since it replicates the hardware config.
> 

I presume you can't rely on parent_data due to issues before rpmcc has
probed properly?

Not sure what to do about that, perhaps we can stop-gap by adding the
new clock and setting up the DT, and then swing back to wiring it up
internally in gcc later?

> >
> > [  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own
> 
> Maybe the BIMC fix will address this?
> 

Just applying "clk: qcom: smd: Add missing bimc clock" did not change
things.

So just to be clear, I'm testing this with the following patches on top
of linux-next:

clk: qcom: smd: Add missing bimc clock
clk: qcom: smd: Add XO clock for MSM8998
arm64: dts: msm8998: Add xo clock to gcc node
arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
arm64: dts: qcom: msm8998: Update reserved memory map
remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
remoteproc: q6v5-mss: Remove mem clk from the active pool
phy: qcom-qmp: Add optional SW reset
phy: qcom-qmp: Increase the phy init timeout

Regards,
Bjorn

> >
> >
> >
> > All the qrtr services seems registered nicely, so the remote does come
> > up before it goes down.
> >
> > Also, adsp comes up nicely.
> >
> > Regards,
> > Bjorn
> >
> > > +                     clock-names = "iface", "bus", "mem", "gpll0_mss",
> > > +                                   "snoc_axi", "mnoc_axi", "qdss", "xo";
> > > +
> > > +                     qcom,smem-states = <&modem_smp2p_out 0>;
> > > +                     qcom,smem-state-names = "stop";
> > > +
> > > +                     resets = <&gcc GCC_MSS_RESTART>;
> > > +                     reset-names = "mss_restart";
> > > +
> > > +                     qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> > > +
> > > +                     power-domains = <&rpmpd MSM8998_VDDCX>,
> > > +                                     <&rpmpd MSM8998_VDDMX>;
> > > +                     power-domain-names = "cx", "mx";
> > > +
> > > +                     mba {
> > > +                             memory-region = <&mba_mem>;
> > > +                     };
> > > +
> > > +                     mpss {
> > > +                             memory-region = <&mpss_mem>;
> > > +                     };
> > > +
> > > +                     glink-edge {
> > > +                             interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> > > +                             label = "modem";
> > > +                             qcom,remote-pid = <1>;
> > > +                             mboxes = <&apcs_glb 15>;
> > > +                     };
> > > +             };
> > > +
> > >               gpucc: clock-controller@5065000 {
> > >                       compatible = "qcom,msm8998-gpucc";
> > >                       #clock-cells = <1>;
> > > @@ -1088,6 +1143,42 @@
> > >                                     "gpll0";
> > >               };
> > >
> > > +             remoteproc_slpi: remoteproc@5800000 {
> > > +                     compatible = "qcom,msm8998-slpi-pas";
> > > +                     reg = <0x05800000 0x4040>;
> > > +
> > > +                     interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > +                                       "handover", "stop-ack";
> > > +
> > > +                     px-supply = <&vreg_lvs2a_1p8>;
> > > +
> > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > > +                              <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> > > +                     clock-names = "xo", "aggre2";
> > > +
> > > +                     memory-region = <&slpi_mem>;
> > > +
> > > +                     qcom,smem-states = <&slpi_smp2p_out 0>;
> > > +                     qcom,smem-state-names = "stop";
> > > +
> > > +                     power-domains = <&rpmpd MSM8998_SSCCX>;
> > > +                     power-domain-names = "ssc_cx";
> > > +
> > > +                     status = "disabled";
> > > +
> > > +                     glink-edge {
> > > +                             interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> > > +                             label = "dsps";
> > > +                             qcom,remote-pid = <3>;
> > > +                             mboxes = <&apcs_glb 27>;
> > > +                     };
> > > +             };
> > > +
> > >               stm: stm@6002000 {
> > >                       compatible = "arm,coresight-stm", "arm,primecell";
> > >                       reg = <0x06002000 0x1000>,
> > > @@ -1880,6 +1971,39 @@
> > >                       #size-cells = <0>;
> > >               };
> > >
> > > +             remoteproc_adsp: remoteproc@17300000 {
> > > +                     compatible = "qcom,msm8998-adsp-pas";
> > > +                     reg = <0x17300000 0x4040>;
> > > +
> > > +                     interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > +                                           <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > +                                       "handover", "stop-ack";
> > > +
> > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > +                     clock-names = "xo";
> > > +
> > > +                     memory-region = <&adsp_mem>;
> > > +
> > > +                     qcom,smem-states = <&adsp_smp2p_out 0>;
> > > +                     qcom,smem-state-names = "stop";
> > > +
> > > +                     power-domains = <&rpmpd MSM8998_VDDCX>;
> > > +                     power-domain-names = "cx";
> > > +
> > > +                     status = "disabled";
> > > +
> > > +                     glink-edge {
> > > +                             interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> > > +                             label = "lpass";
> > > +                             qcom,remote-pid = <2>;
> > > +                             mboxes = <&apcs_glb 9>;
> > > +                     };
> > > +             };
> > > +
> > >               apcs_glb: mailbox@17911000 {
> > >                       compatible = "qcom,msm8998-apcs-hmss-global";
> > >                       reg = <0x17911000 0x1000>;
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
