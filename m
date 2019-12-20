Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8AB127D60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 15:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbfLTOdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 09:33:25 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:43243 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbfLTOdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 09:33:23 -0500
Received: by mail-il1-f196.google.com with SMTP id v69so8090558ili.10;
        Fri, 20 Dec 2019 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7zRI5HFZ9GdOv7/nuMrwlmDNkCl7lHHGMLGFpofT+E=;
        b=fB6Gur4QH9KukcvwvfXarOJODwF4Cj8kYhFYHj92mj89R38WMd+4D6+qXvS02ibmDN
         nmiCag1Iq36Y/OoVirpVXpYThuT4m1WeI3fIvUJNtbXp6XqO93+1PSgTyje9oIcsLd4w
         DPSftyDp7iy0EaPbhK56tb7K2XIa8yESSOhLrtByhcK5cxET6CQ5LOdesQyfB6rt4k+r
         Z8qrnko03b72rFxPMcff+vvdykOdSr3xbSb5A5EdXW0qDRZ9JQbWH+AZaoxXBWJnYWBn
         aPMhV1hz37HQm00sBnYfzZ8SOA8fUTOxu+0rBBKQspC2/nrqcdErlcsC7PT+f0rNmjCE
         vTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7zRI5HFZ9GdOv7/nuMrwlmDNkCl7lHHGMLGFpofT+E=;
        b=Oh4kAO7NtOGX3hn9m4sJ7aRc2MDr1Aj5LBhyw5DKo/xTtA3aa2DmBFRSeiD3NwfJFt
         bL8+nMGJJ8MWLEguP179aEz5f+UGkZ6dn3XJxF8IXPq58iyofP0MFBh3tAkxLuui4Q8a
         bw2DQwvP0K9H3qeDA6sp84c0EXoXjvrr+alFFzp/1+3Qxnd5rdmoASoTez5D3idsGmtH
         7rVuWJ+MoayDVcG7TThDC6HAbAgWhOEY7l3XVhmzCZfrZgBxoKAr3ksni3GxBC7+MFEd
         r8YnODr9vP8zCrw1pTsuESBs1cQZqZhjC9XBjDQQelGBKT+CQI/QToyZzRaTi/eWSdEo
         7oDg==
X-Gm-Message-State: APjAAAVYE3d3TpBcjqrmyCXBgUDex7VX+ZTnUo1YAp+q6s+ugfhllsc+
        5boiPa58wTkzxK3khlrwoRv+0hcRsJfyY6GBc1U=
X-Google-Smtp-Source: APXvYqziBD0NHeii8XJfTXHcWaB5cMulU0ZxJuLhN36rkOAlUk9SmN8ImVZQtX/lp8iQVt5ZG1U2Dd6RJLNTZHnrEqA=
X-Received: by 2002:a92:465c:: with SMTP id t89mr13064188ila.263.1576852402106;
 Fri, 20 Dec 2019 06:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20191218132217.28141-1-sibis@codeaurora.org> <20191218132217.28141-6-sibis@codeaurora.org>
 <20191220065954.GA1908628@ripper>
In-Reply-To: <20191220065954.GA1908628@ripper>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 20 Dec 2019 07:33:11 -0700
Message-ID: <CAOCk7NoaWw8Tor-P02SESztWEGpGMK6GbRNG45yMVYhMdDCEnQ@mail.gmail.com>
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

On Fri, Dec 20, 2019 at 12:00 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 18 Dec 05:22 PST 2019, Sibi Sankar wrote:
>
> > This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
> >
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
> >  2 files changed, 132 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > index 6db3f9e0344d1..e87094665c52c 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > @@ -312,6 +312,14 @@
> >       };
> >  };
> >
> > +&remoteproc_adsp {
> > +     status = "okay";
> > +};
> > +
> > +&remoteproc_slpi {
> > +     status = "okay";
> > +};
> > +
> >  &tlmm {
> >       gpio-reserved-ranges = <0 4>, <81 4>;
> >  };
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > index 8d799e868a5d3..014127700afb0 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> > @@ -1075,6 +1075,61 @@
> >                       #interrupt-cells = <0x2>;
> >               };
> >
> > +             remoteproc_mss: remoteproc@4080000 {
> > +                     compatible = "qcom,msm8998-mss-pil";
> > +                     reg = <0x04080000 0x100>, <0x04180000 0x20>;
> > +                     reg-names = "qdsp6", "rmb";
> > +
> > +                     interrupts-extended =
> > +                             <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> > +                             <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +                             <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +                             <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +                             <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > +                             <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> > +                     interrupt-names = "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack",
> > +                                       "shutdown-ack";
> > +
> > +                     clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
> > +                              <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> > +                              <&gcc GCC_BOOT_ROM_AHB_CLK>,
> > +                              <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> > +                              <&gcc GCC_MSS_SNOC_AXI_CLK>,
> > +                              <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> > +                              <&rpmcc RPM_SMD_QDSS_CLK>,
> > +                              <&rpmcc RPM_SMD_XO_CLK_SRC>;
>
> RPM_SMD_XO_CLK_SRC doesn't seem to be implemented...
>
> I did pull in a patch from Jeff that defines it, but when I boot the
> modem I see the following error repeatedly:

Yeah, we need to figure out a solution for rpmcc to actually provide
this since the previous N solutions were not acceptable.  Its on my
todo list to look into in Jan.  However, I really think the DT should
be defined this way, since it replicates the hardware config.

>
> [  616.632227] qcom-q6v5-mss 4080000.remoteproc: fatal error received: dog_hb.c:266:DOG_HB detects starvation of task 0xda172640, triage with its own

Maybe the BIMC fix will address this?

>
>
>
> All the qrtr services seems registered nicely, so the remote does come
> up before it goes down.
>
> Also, adsp comes up nicely.
>
> Regards,
> Bjorn
>
> > +                     clock-names = "iface", "bus", "mem", "gpll0_mss",
> > +                                   "snoc_axi", "mnoc_axi", "qdss", "xo";
> > +
> > +                     qcom,smem-states = <&modem_smp2p_out 0>;
> > +                     qcom,smem-state-names = "stop";
> > +
> > +                     resets = <&gcc GCC_MSS_RESTART>;
> > +                     reset-names = "mss_restart";
> > +
> > +                     qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> > +
> > +                     power-domains = <&rpmpd MSM8998_VDDCX>,
> > +                                     <&rpmpd MSM8998_VDDMX>;
> > +                     power-domain-names = "cx", "mx";
> > +
> > +                     mba {
> > +                             memory-region = <&mba_mem>;
> > +                     };
> > +
> > +                     mpss {
> > +                             memory-region = <&mpss_mem>;
> > +                     };
> > +
> > +                     glink-edge {
> > +                             interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> > +                             label = "modem";
> > +                             qcom,remote-pid = <1>;
> > +                             mboxes = <&apcs_glb 15>;
> > +                     };
> > +             };
> > +
> >               gpucc: clock-controller@5065000 {
> >                       compatible = "qcom,msm8998-gpucc";
> >                       #clock-cells = <1>;
> > @@ -1088,6 +1143,42 @@
> >                                     "gpll0";
> >               };
> >
> > +             remoteproc_slpi: remoteproc@5800000 {
> > +                     compatible = "qcom,msm8998-slpi-pas";
> > +                     reg = <0x05800000 0x4040>;
> > +
> > +                     interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > +                     interrupt-names = "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack";
> > +
> > +                     px-supply = <&vreg_lvs2a_1p8>;
> > +
> > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> > +                              <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> > +                     clock-names = "xo", "aggre2";
> > +
> > +                     memory-region = <&slpi_mem>;
> > +
> > +                     qcom,smem-states = <&slpi_smp2p_out 0>;
> > +                     qcom,smem-state-names = "stop";
> > +
> > +                     power-domains = <&rpmpd MSM8998_SSCCX>;
> > +                     power-domain-names = "ssc_cx";
> > +
> > +                     status = "disabled";
> > +
> > +                     glink-edge {
> > +                             interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> > +                             label = "dsps";
> > +                             qcom,remote-pid = <3>;
> > +                             mboxes = <&apcs_glb 27>;
> > +                     };
> > +             };
> > +
> >               stm: stm@6002000 {
> >                       compatible = "arm,coresight-stm", "arm,primecell";
> >                       reg = <0x06002000 0x1000>,
> > @@ -1880,6 +1971,39 @@
> >                       #size-cells = <0>;
> >               };
> >
> > +             remoteproc_adsp: remoteproc@17300000 {
> > +                     compatible = "qcom,msm8998-adsp-pas";
> > +                     reg = <0x17300000 0x4040>;
> > +
> > +                     interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > +                                           <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> > +                     interrupt-names = "wdog", "fatal", "ready",
> > +                                       "handover", "stop-ack";
> > +
> > +                     clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > +                     clock-names = "xo";
> > +
> > +                     memory-region = <&adsp_mem>;
> > +
> > +                     qcom,smem-states = <&adsp_smp2p_out 0>;
> > +                     qcom,smem-state-names = "stop";
> > +
> > +                     power-domains = <&rpmpd MSM8998_VDDCX>;
> > +                     power-domain-names = "cx";
> > +
> > +                     status = "disabled";
> > +
> > +                     glink-edge {
> > +                             interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> > +                             label = "lpass";
> > +                             qcom,remote-pid = <2>;
> > +                             mboxes = <&apcs_glb 9>;
> > +                     };
> > +             };
> > +
> >               apcs_glb: mailbox@17911000 {
> >                       compatible = "qcom,msm8998-apcs-hmss-global";
> >                       reg = <0x17911000 0x1000>;
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
