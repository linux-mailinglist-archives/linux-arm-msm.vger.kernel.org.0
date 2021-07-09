Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5EC3C27F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhGIRFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:05:55 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:36257 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhGIRFz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:05:55 -0400
Date:   Fri, 09 Jul 2021 17:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625850189;
        bh=pM2PKT/PbaxmWjmMxhZ5VF+n4/9qOl4fVvs8JqcxLNI=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=MQeEbcX7XlqdZ9F6IklejNXtZ/LvUmo2seCu2c5O2Ur/k2QvgeCyFpjmK/lvyP4Ko
         qr7SJERyJbmaHg+U+RBiDZnxKY78dSUi1JwIfVgY/iA8jhnSznMgVOhrdy5awtWHKI
         PaJ7gBrzCVSXBDnHr28dyXtq8/Te/g/BB67cXex0=
To:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "Dr. Git" <drgitx@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 3/5] arm64: dts: qcom: msm8996: Add modem remoteproc
Message-ID: <EaCaxScbZV0QP9eAoBNVGHLlIUwZrwfzBiHxNf6qw@cp4-web-031.plabs.ch>
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

From: "Dr. Git" <drgitx@gmail.com>

[Yassine: Change label from modem to mss_pil, change smp2p and reserved mem=
 handles, and
change smd-edge label to mpss.]
Original patch:
https://gitlab.com/msm8996-mainline/linux-msm8996/-/commit/ac73ebff6b74a75d=
1f3237342c2af8e0dc642353
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 559612a3ddeb..bb6bfd24256f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1285,6 +1285,63 @@ lpass_q6_smmu: iommu@1600000 {
 =09=09=09clock-names =3D "iface", "bus";
 =09=09};
=20
+=09=09mss_pil: remoteproc@2080000 {
+=09=09=09compatible =3D "qcom,msm8996-mss-pil";
+
+=09=09=09reg =3D <0x02080000 0x100>,
+=09=09=09      <0x02180000 0x040>;
+=09=09=09reg-names =3D "qdsp6", "rmb";
+
+=09=09=09interrupts-extended =3D <&intc 0 448 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+=09=09=09=09=09      <&mpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+=09=09=09interrupt-names =3D "wdog", "fatal", "ready",
+=09=09=09=09=09  "handover", "stop-ack";
+
+=09=09=09clocks =3D <&xo_board>,
+=09=09=09=09 <&gcc GCC_MSS_CFG_AHB_CLK>,
+=09=09=09=09 <&rpmcc RPM_SMD_PCNOC_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+=09=09=09=09 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_GPLL0_DIV_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+=09=09=09=09 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+=09=09=09=09 <&rpmcc RPM_SMD_QDSS_CLK>;
+
+=09=09=09clock-names =3D "xo", "iface", "pnoc", "bus",
+=09=09=09=09      "mem", "gpll0_mss", "snoc_axi",
+=09=09=09=09      "mnoc_axi", "qdss";
+
+=09=09=09resets =3D <&gcc GCC_MSS_RESTART>;
+=09=09=09reset-names =3D "mss_restart";
+
+=09=09=09qcom,halt-regs =3D <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+
+=09=09=09qcom,smem-states =3D <&mpss_smp2p_out 0>;
+=09=09=09qcom,smem-state-names =3D "stop";
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
+=09=09=09=09interrupts =3D <0 449 IRQ_TYPE_EDGE_RISING>;
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
2.32.0


