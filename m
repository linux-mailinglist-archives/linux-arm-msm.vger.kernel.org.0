Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDB8418AB0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 21:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhIZTIU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 15:08:20 -0400
Received: from mail-4318.protonmail.ch ([185.70.43.18]:18699 "EHLO
        mail-4318.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhIZTIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 15:08:20 -0400
Date:   Sun, 26 Sep 2021 19:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632683201;
        bh=VOvK+zw4WxW2VQY2O6xUBaEP2ZuDPG5wlMplcLzQD0I=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=axk8KETmOlJn4UQoCYissiIfV9MtzMCBMiLIhSYQY25/EPcOuFwJIFhg7c8owyTc2
         XvoUinvdPSMb/SoZciOYWYNqTdw1pHY56IFJhoFJuPtvQLpGvFptIIHY3jOIN5ZUsi
         kNZwNrtjGCZEYuTtT/e+2g9bLKJmXPbGRcHfGUTw=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: msm8996: Add MSS and SLPI
Message-ID: <20210926190555.278589-5-y.oudjana@protonmail.com>
In-Reply-To: <20210926190555.278589-1-y.oudjana@protonmail.com>
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for the MSS and SLPI remoteprocs.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 99 +++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 7710ca6f3374..1301ffcf588b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2103,6 +2103,105 @@ lpass_q6_smmu: iommu@1600000 {
 =09=09=09clock-names =3D "iface", "bus";
 =09=09};
=20
+=09=09slpi_pil: remoteproc@1c00000 {
+=09=09=09compatible =3D "qcom,msm8996-slpi-pil";
+=09=09=09reg =3D <0x01c00000 0x4000>;
+
+=09=09=09interrupts-extended =3D <&intc 0 390 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+=09=09=09interrupt-names =3D "wdog",
+=09=09=09=09=09  "fatal",
+=09=09=09=09=09  "ready",
+=09=09=09=09=09  "handover",
+=09=09=09=09=09  "stop-ack";
+
+=09=09=09clocks =3D <&xo_board>,
+=09=09=09=09 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+=09=09=09clock-names =3D "xo", "aggre2";
+
+=09=09=09memory-region =3D <&slpi_mem>;
+
+=09=09=09qcom,smem-states =3D <&slpi_smp2p_out 0>;
+=09=09=09qcom,smem-state-names =3D "stop";
+
+=09=09=09power-domains =3D <&rpmpd MSM8996_VDDSSCX>;
+=09=09=09power-domain-names =3D "ssc_cx";
+
+=09=09=09status =3D "disabled";
+
+=09=09=09smd-edge {
+=09=09=09=09interrupts =3D <GIC_SPI 176 IRQ_TYPE_EDGE_RISING>;
+
+=09=09=09=09label =3D "dsps";
+=09=09=09=09mboxes =3D <&apcs_glb 25>;
+=09=09=09=09qcom,smd-edge =3D <3>;
+=09=09=09=09qcom,remote-pid =3D <3>;
+=09=09=09};
+=09=09};
+
+=09=09mss_pil: remoteproc@2080000 {
+=09=09=09compatible =3D "qcom,msm8996-mss-pil";
+=09=09=09reg =3D <0x2080000 0x100>,
+=09=09=09      <0x2180000 0x020>;
+=09=09=09reg-names =3D "qdsp6", "rmb";
+
+=09=09=09interrupts-extended =3D <&intc 0 448 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+=09=09=09interrupt-names =3D "wdog", "fatal", "ready",
+=09=09=09=09=09  "handover", "stop-ack",
+=09=09=09=09=09  "shutdown-ack";
+
+=09=09=09clocks =3D <&gcc GCC_MSS_CFG_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+=09=09=09=09 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+=09=09=09=09 <&xo_board>,
+=09=09=09=09 <&gcc GCC_MSS_GPLL0_DIV_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+=09=09=09=09 <&rpmcc RPM_SMD_PCNOC_CLK>,
+=09=09=09=09 <&rpmcc RPM_SMD_QDSS_CLK>;
+=09=09=09clock-names =3D "iface", "bus", "mem", "xo", "gpll0_mss",
+=09=09=09=09      "snoc_axi", "mnoc_axi", "pnoc", "qdss";
+
+=09=09=09resets =3D <&gcc GCC_MSS_RESTART>;
+=09=09=09reset-names =3D "mss_restart";
+
+=09=09=09power-domains =3D <&rpmpd MSM8996_VDDCX>,
+=09=09=09=09=09<&rpmpd MSM8996_VDDMX>;
+=09=09=09power-domain-names =3D "cx", "mx";
+
+=09=09=09qcom,smem-states =3D <&mpss_smp2p_out 0>;
+=09=09=09qcom,smem-state-names =3D "stop";
+
+=09=09=09qcom,halt-regs =3D <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+
+=09=09=09status =3D "disabled";
+
+=09=09=09mba {
+=09=09=09=09memory-region =3D <&mba_mem>;
+=09=09=09};
+
+=09=09=09mpss {
+=09=09=09=09memory-region =3D <&mpss_mem>;
+=09=09=09};
+
+=09=09=09smd-edge {
+=09=09=09=09interrupts =3D <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+
+=09=09=09=09label =3D "mpss";
+=09=09=09=09mboxes =3D <&apcs_glb 12>;
+=09=09=09=09qcom,smd-edge =3D <0>;
+=09=09=09=09qcom,remote-pid =3D <1>;
+=09=09=09};
+=09=09};
+
 =09=09stm@3002000 {
 =09=09=09compatible =3D "arm,coresight-stm", "arm,primecell";
 =09=09=09reg =3D <0x3002000 0x1000>,
--=20
2.33.0


