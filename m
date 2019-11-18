Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFE5100E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 23:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKRWHm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 17:07:42 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:34815 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfKRWHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 17:07:42 -0500
Received: by mail-il1-f196.google.com with SMTP id p6so17578586ilp.1;
        Mon, 18 Nov 2019 14:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2vW9EdXLQKAp86+GJ5aL6mkzdl6pw5VOu+wcc7bk+g=;
        b=otNs3IrlL1hNW2ttXl8Q3D4b01vgo3ImArlwnLHgHz6zbUwftwotfVtHtNtlyChyOu
         R/0tcVkNQav/qO4tnqHZV8/Dvy5ULMY4/OOO713YxKfasV91Y2LFopT7O9t1Knx2tcD4
         a2InYN/8GUBmM28uI3Mr3AwuZlckREuK+/p5BzTn2d0XLyLwrfVWhuLBFShbdbfuj0fT
         Gde1XeQ1jLOITJ2vwimt2guhhNr/ektAxL2RiShuL41nL6jCj9k3jmpOWIZTOJsIufXb
         Cm2mAtkcEM0qad61W0d61TeK/d4EOjyq78UE764/a/MEveABDA0qrAMytqeExmWtm9xH
         YHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2vW9EdXLQKAp86+GJ5aL6mkzdl6pw5VOu+wcc7bk+g=;
        b=SDLgNsdan3adz5dXL0wot0lG1O39e1R2NbW7RgYaRhrfzPJb8SiPCx2Itzs+tXxk3O
         OY1lubu0ZtLInB7lRB0d5j4DbwnzD6OSV4PMmdVpgF47kqDGL8OWFhYYK1wfXOYFNQ5I
         CT2RmqPgf6Tz8LZjDoCh2QmwNaXwkdodZcrED3+WKKKYQN467mgIdfVt2EahOUsZv8UB
         cjOaJN6FNpQELP2X5Nu6qJns3cNOenrHZvt9imdDQ4HBvEMjE6hlm13tGdCPpieJH/eO
         dcnxAH76HGfs3f7wpdXr2jFT3Mvdhuo6rLrZGCKVDym14HJzkaSmtTSH8bPXAnP35boT
         P0Og==
X-Gm-Message-State: APjAAAV3hQRwXXy8G7iQgLBEv4T+PCvXYPObWRJ5dc0D8Gy2z4f7IRZa
        AljrlwWqz18tE+T0Qjdj2aQdhxHBOA41rLAcU7o=
X-Google-Smtp-Source: APXvYqwCZhmjWDwb1dbWvR3+vgKx3DK9s7HemQxsysKao8W/a9fGZyeGR1iVwx88GGU89CaxmPcdBXLEUm+X1K/+jGc=
X-Received: by 2002:a92:1d51:: with SMTP id d78mr19083922ild.166.1574114861166;
 Mon, 18 Nov 2019 14:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20191118214250.14002-1-sibis@codeaurora.org> <0101016e807934fa-4da223fb-1854-4a1e-a8ee-e088129c4812-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e807934fa-4da223fb-1854-4a1e-a8ee-e088129c4812-000000@us-west-2.amazonses.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 18 Nov 2019 15:07:30 -0700
Message-ID: <CAOCk7Nr=Up1LP+-XB7tnoM=XwK+YysDMq8EqyhCLx=WA+eW9PA@mail.gmail.com>
Subject: Re: [PATCH 14/16] arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mark Rutland <mark.rutland@arm.com>, p.zabel@pengutronix.de,
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

On Mon, Nov 18, 2019 at 2:45 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 122 ++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> index 5f101a20a20a2..29e0c2e988e4b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> @@ -23,6 +23,14 @@
>         };
>  };
>
> +&adsp_pas {
> +       status = "okay";
> +};
> +
> +&slpi_pas {

"b" comes before "s", no?

> +       status = "okay";
> +};
> +
>  &blsp1_uart3 {
>         status = "okay";
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 707673e3cf28a..dd1dc35e87b63 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -337,6 +337,73 @@
>                 };
>         };
>
> +       adsp_pas: remoteproc-adsp {
> +               compatible = "qcom,msm8998-adsp-pas";
> +
> +               interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> +                                     <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                                     <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                                     <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                                     <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +               interrupt-names = "wdog", "fatal", "ready",
> +                                 "handover", "stop-ack";
> +
> +               clocks = <&xo>;
> +               clock-names = "xo";
> +
> +               memory-region = <&adsp_mem>;
> +
> +               qcom,smem-states = <&adsp_smp2p_out 0>;
> +               qcom,smem-state-names = "stop";
> +
> +               power-domains = <&rpmpd MSM8998_VDDCX>;
> +               power-domain-names = "cx";
> +
> +               status = "disabled";
> +
> +               glink-edge {
> +                       interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
> +                       label = "lpass";
> +                       qcom,remote-pid = <2>;
> +                       mboxes = <&apcs_glb 9>;
> +               };
> +       };
> +
> +       slpi_pas: remoteproc-slpi {
> +               compatible = "qcom,msm8998-slpi-pas";
> +
> +               interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
> +                                     <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                                     <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                                     <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                                     <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +               interrupt-names = "wdog", "fatal", "ready",
> +                                 "handover", "stop-ack";
> +
> +               px-supply = <&vreg_lvs2a_1p8>;
> +
> +               clocks = <&xo>,
> +                        <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
> +               clock-names = "xo", "aggre2";
> +
> +               memory-region = <&slpi_mem>;
> +
> +               qcom,smem-states = <&slpi_smp2p_out 0>;
> +               qcom,smem-state-names = "stop";
> +
> +               power-domains = <&rpmpd MSM8998_SSCCX>;
> +               power-domain-names = "ssc_cx";
> +
> +               status = "disabled";
> +
> +               glink-edge {
> +                       interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +                       label = "dsps";
> +                       qcom,remote-pid = <3>;
> +                       mboxes = <&apcs_glb 27>;
> +               };
> +       };
> +
>         tcsr_mutex: hwlock {
>                 compatible = "qcom,tcsr-mutex";
>                 syscon = <&tcsr_mutex_regs 0 0x1000>;
> @@ -1048,6 +1115,61 @@
>                         #interrupt-cells = <0x2>;
>                 };
>
> +               mss_pil: remoteproc@4080000 {
> +                       compatible = "qcom,msm8998-mss-pil";
> +                       reg = <0x04080000 0x100>, <0x04180000 0x20>;
> +                       reg-names = "qdsp6", "rmb";
> +
> +                       interrupts-extended =
> +                               <&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                               <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names = "wdog", "fatal", "ready",
> +                                         "handover", "stop-ack",
> +                                         "shutdown-ack";
> +
> +                       clocks = <&xo>,
> +                                <&gcc GCC_MSS_CFG_AHB_CLK>,
> +                                <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
> +                                <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +                                <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
> +                                <&gcc GCC_MSS_SNOC_AXI_CLK>,
> +                                <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
> +                                <&rpmcc RPM_SMD_QDSS_CLK>;
> +                       clock-names = "xo", "iface", "bus", "mem", "gpll0_mss",
> +                                     "snoc_axi", "mnoc_axi", "qdss";
> +
> +                       qcom,smem-states = <&modem_smp2p_out 0>;
> +                       qcom,smem-state-names = "stop";
> +
> +                       resets = <&gcc GCC_MSS_RESTART>;
> +                       reset-names = "mss_restart";
> +
> +                       qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
> +
> +                       power-domains = <&rpmpd MSM8998_VDDCX>,
> +                                       <&rpmpd MSM8998_VDDMX>;
> +                       power-domain-names = "cx", "mx";
> +
> +                       mba {
> +                               memory-region = <&mba_mem>;
> +                       };
> +
> +                       mpss {
> +                               memory-region = <&mpss_mem>;
> +                       };
> +
> +                       glink-edge {
> +                               interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
> +                               label = "modem";
> +                               qcom,remote-pid = <1>;
> +                               mboxes = <&apcs_glb 15>;
> +                       };
> +               };
> +
>                 stm: stm@6002000 {
>                         compatible = "arm,coresight-stm", "arm,primecell";
>                         reg = <0x06002000 0x1000>,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
