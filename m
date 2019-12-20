Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EB81281CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 19:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbfLTSCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 13:02:22 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51816 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfLTSCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 13:02:22 -0500
Received: by mail-pj1-f68.google.com with SMTP id j11so4431742pjs.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2019 10:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=15PN4V+zSlwzXPA/wIz+83Cjw2lOO0ahfJ6vikM1dYA=;
        b=PNtYpA5uJqiOnEOFzl2qaca0PjL3paxpnCNqQF3tRb+UloPGpFPWHG8qhSHH/btBqc
         SvONhUW6QBPVXpkqZdFCbPZHUg73+hkb2gj8hXRbIWlLyFTmsmdxUo4PBgR6xDS9cf2o
         ZPLWrUf5hM4FpJM95ju0m1v2Sk+uoovXH/NN7bupJSvV6m0M5XKFfj6Odm1HGc5P4Yqx
         +CMulGZ0FKEEGZCmkYU5+QVahORmq6NqzI0ptTAnnckLLWvcb28UGtGN54KYiwEcrVrV
         CvHepGq/cYVUFJ8NocJ2NjGPjzBvk+qYkOE8UIHS4z16X6WpjpwhTSHzyFMFYZCcNJ6I
         catA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=15PN4V+zSlwzXPA/wIz+83Cjw2lOO0ahfJ6vikM1dYA=;
        b=B+0LJnqs4CgdAGwlCHoS3cPMYmhdtH0Ke0Kk34TqdjeXzwNLa1ITStywxH4ou5bB0v
         ZULP+kyAJUmIvFOcMCVnNkSU3ptJEhbTEcpHOyCtr+LgttGHfZ170/w5pqFYKdDTzsgs
         JVmgoYGofAwS1KBmcmgezZflI6aDyU3kum9awSjfwu6FISQNtS/U12BqByNtZ16GG2Tg
         7L9aoInxV32qAmXuvJfiL8sMv4YTNHnQz4GBOGEl2BSmzQOhNxkFMiCDWZOrygEnjQje
         1uFiYGerjUJXRsBmPSO+FLfiHY+GEI5rH1MyISxzHQNvhA+VxZRzERZrDB6WaXkhmhRa
         qE7g==
X-Gm-Message-State: APjAAAXOy9aci6JcOtCetJH955qvBQadYPcD6bnQTwdx0pbjMxJQGD9+
        eCl3p82q++ge+HltJLpjVrhr5g==
X-Google-Smtp-Source: APXvYqyvZeCeMQLi4pnx3i/2qKQTPUClIuNtr/g438GM/OLkjyf8Qr5KP3yzznXPUlBF6KZu4n6NMQ==
X-Received: by 2002:a17:902:7b8c:: with SMTP id w12mr7952531pll.30.1576864940848;
        Fri, 20 Dec 2019 10:02:20 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y6sm6062175pjy.1.2019.12.20.10.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 10:02:20 -0800 (PST)
Date:   Fri, 20 Dec 2019 10:02:17 -0800
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
Message-ID: <20191220180217.GF3755841@builder>
References: <20191218132217.28141-1-sibis@codeaurora.org>
 <20191218132217.28141-6-sibis@codeaurora.org>
 <20191220065954.GA1908628@ripper>
 <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
 <20191220170525.GC549437@yoga>
 <CAOCk7Nr3vMRpC6QQ21HCrd9B=PFo4D=-yQ196YnsP_0jBV3RCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nr3vMRpC6QQ21HCrd9B=PFo4D=-yQ196YnsP_0jBV3RCQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Dec 09:10 PST 2019, Jeffrey Hugo wrote:

> On Fri, Dec 20, 2019 at 10:05 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 20 Dec 06:33 PST 2019, Jeffrey Hugo wrote:
> >
> > > On Fri, Dec 20, 2019 at 12:00 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:
> > > >
> > > > > This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> > > > >
> > > > > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
> > > > >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
> > > > >  2 files changed, 132 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > index 6db3f9e0344d1..e87094665c52c 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > > > @@ -312,6 +312,14 @@
> > > > >       };
> > > > >  };
> > > > >
> > > > > +&remoteproc_adsp {
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&remoteproc_slpi {
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > >  &tlmm {
> > > > >       gpio-reserved-ranges = <0 4>, <81 4>;
> > > > >  };
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > index 8d799e868a5d3..014127700afb0 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > > > > @@ -1075,6 +1075,61 @@
> > > > >                       #interrupt-cells = <0x2>;
> > > > >               };
> > > > >
> > > > > +             remoteproc_mss: remoteproc@4080000 {
> > > > > +                     compatible = "qcom,msm8998-mss-pil";
> > > > > +                     reg = <0x04080000 0x100>, <0x04180000 0x20>;
> > > > > +                     reg-names = "qdsp6", "rmb";
> > > > > +
> > > > > +                     interrupts-extended =
> > > > > +                             <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > > > > +                             <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > +                             <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > +                             <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > +                             <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > > > > +                             <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > +                                       "handover", "stop-ack",
> > > > > +                                       "shutdown-ack";
> > > > > +
> > > > > +                     clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > > > > +                              <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> > > > > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > > > > +                              <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> > > > > +                              <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > > > > +                              <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> > > > > +                              <&rpmcc RPM_SMD_QDSS_CLK>,
> > > > > +                              <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > >
> > > > RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...
> > > >
> > > > I did pull in a patch from Jeff that defines it, but when I boot the
> > > > modem I see the following error repeatedly:
> > >
> > > Yeah, we need to figure out a solution for rpmcc to actually provide
> > > this since the previous N solutions were not acceptable.  Its on my
> > > todo list to look into in Jan.  However, I really think the DT should
> > > be defined this way, since it replicates the hardware config.
> > >
> >
> > I presume you can't rely on parent_data due to issues before rpmcc has
> > probed properly?
> 
> I don't think so, but I need to circle back on that.
> 
> >
> > Not sure what to do about that, perhaps we can stop-gap by adding the
> > new clock and setting up the DT, and then swing back to wiring it up
> > internally in gcc later?
> 
> The define should be there.  The DT should compile.  The issue will be
> that the driver will not get the clock at runtime, which is
> functionally equivalent to what we have now (in the end, modem doesnt
> boot with or without this change, will boot with an out of tree
> patch).  Adding the clock to rpmcc without coordinating with gcc will
> cause issues in the clock framework with multiple defines of the same
> clock.
> 

Yeah, it compiles and boots. I just wasn't able to conclude that the
patches where working properly.

But, I found another email from Sibi regarding the starvation reported,
it turns out that this version of the modem firmware requires diag to be
present. So after launching diag-router the modem is up and running.


As such, I've merged the series. Let's try to figure out the clock
situation to make it functional out of the box.

Regards,
Bjorn

> >
> > > >
> > > > [  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own
> > >
> > > Maybe the BIMC fix will address this?
> > >
> >
> > Just applying "clk: qcom: smd: Add missing bimc clock" did not change
> > things.
> >
> > So just to be clear, I'm testing this with the following patches on top
> > of linux-next:
> >
> > clk: qcom: smd: Add missing bimc clock
> > clk: qcom: smd: Add XO clock for MSM8998
> > arm64: dts: msm8998: Add xo clock to gcc node
> > arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
> > arm64: dts: qcom: msm8998: Update reserved memory map
> > remoteproc: qcom: pas: Add MSM8998 ADSP and SLPI support
> > dt-bindings: remoteproc: qcom: Add ADSP and SLPI support for MSM8998 SoC
> > remoteproc: q6v5-mss: Remove mem clk from the active pool
> > phy: qcom-qmp: Add optional SW reset
> > phy: qcom-qmp: Increase the phy init timeout
> >
> > Regards,
> > Bjorn
> >
> > > >
> > > >
> > > >
> > > > All the qrtr services seems registered nicely, so the remote does come
> > > > up before it goes down.
> > > >
> > > > Also, adsp comes up nicely.
> > > >
> > > > Regards,
> > > > Bjorn
> > > >
> > > > > +                     clock-names = "iface", "bus", "mem", "gpll0_mss",
> > > > > +                                   "snoc_axi", "mnoc_axi", "qdss", "xo";
> > > > > +
> > > > > +                     qcom,smem-states = <&modem_smp2p_out 0>;
> > > > > +                     qcom,smem-state-names = "stop";
> > > > > +
> > > > > +                     resets = <&gcc GCC_MSS_RESTART>;
> > > > > +                     reset-names = "mss_restart";
> > > > > +
> > > > > +                     qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> > > > > +
> > > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>,
> > > > > +                                     <&rpmpd MSM8998_VDDMX>;
> > > > > +                     power-domain-names = "cx", "mx";
> > > > > +
> > > > > +                     mba {
> > > > > +                             memory-region = <&mba_mem>;
> > > > > +                     };
> > > > > +
> > > > > +                     mpss {
> > > > > +                             memory-region = <&mpss_mem>;
> > > > > +                     };
> > > > > +
> > > > > +                     glink-edge {
> > > > > +                             interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> > > > > +                             label = "modem";
> > > > > +                             qcom,remote-pid = <1>;
> > > > > +                             mboxes = <&apcs_glb 15>;
> > > > > +                     };
> > > > > +             };
> > > > > +
> > > > >               gpucc: clock-controller@5065000 {
> > > > >                       compatible = "qcom,msm8998-gpucc";
> > > > >                       #clock-cells = <1>;
> > > > > @@ -1088,6 +1143,42 @@
> > > > >                                     "gpll0";
> > > > >               };
> > > > >
> > > > > +             remoteproc_slpi: remoteproc@5800000 {
> > > > > +                     compatible = "qcom,msm8998-slpi-pas";
> > > > > +                     reg = <0x05800000 0x4040>;
> > > > > +
> > > > > +                     interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > +                                       "handover", "stop-ack";
> > > > > +
> > > > > +                     px-supply = <&vreg_lvs2a_1p8>;
> > > > > +
> > > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > > > > +                              <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> > > > > +                     clock-names = "xo", "aggre2";
> > > > > +
> > > > > +                     memory-region = <&slpi_mem>;
> > > > > +
> > > > > +                     qcom,smem-states = <&slpi_smp2p_out 0>;
> > > > > +                     qcom,smem-state-names = "stop";
> > > > > +
> > > > > +                     power-domains = <&rpmpd MSM8998_SSCCX>;
> > > > > +                     power-domain-names = "ssc_cx";
> > > > > +
> > > > > +                     status = "disabled";
> > > > > +
> > > > > +                     glink-edge {
> > > > > +                             interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> > > > > +                             label = "dsps";
> > > > > +                             qcom,remote-pid = <3>;
> > > > > +                             mboxes = <&apcs_glb 27>;
> > > > > +                     };
> > > > > +             };
> > > > > +
> > > > >               stm: stm@6002000 {
> > > > >                       compatible = "arm,coresight-stm", "arm,primecell";
> > > > >                       reg = <0x06002000 0x1000>,
> > > > > @@ -1880,6 +1971,39 @@
> > > > >                       #size-cells = <0>;
> > > > >               };
> > > > >
> > > > > +             remoteproc_adsp: remoteproc@17300000 {
> > > > > +                     compatible = "qcom,msm8998-adsp-pas";
> > > > > +                     reg = <0x17300000 0x4040>;
> > > > > +
> > > > > +                     interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > > > > +                                           <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > > > > +                     interrupt-names = "wdog", "fatal", "ready",
> > > > > +                                       "handover", "stop-ack";
> > > > > +
> > > > > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > > > > +                     clock-names = "xo";
> > > > > +
> > > > > +                     memory-region = <&adsp_mem>;
> > > > > +
> > > > > +                     qcom,smem-states = <&adsp_smp2p_out 0>;
> > > > > +                     qcom,smem-state-names = "stop";
> > > > > +
> > > > > +                     power-domains = <&rpmpd MSM8998_VDDCX>;
> > > > > +                     power-domain-names = "cx";
> > > > > +
> > > > > +                     status = "disabled";
> > > > > +
> > > > > +                     glink-edge {
> > > > > +                             interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> > > > > +                             label = "lpass";
> > > > > +                             qcom,remote-pid = <2>;
> > > > > +                             mboxes = <&apcs_glb 9>;
> > > > > +                     };
> > > > > +             };
> > > > > +
> > > > >               apcs_glb: mailbox@17911000 {
> > > > >                       compatible = "qcom,msm8998-apcs-hmss-global";
> > > > >                       reg = <0x17911000 0x1000>;
> > > > > --
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > > a Linux Foundation Collaborative Project
