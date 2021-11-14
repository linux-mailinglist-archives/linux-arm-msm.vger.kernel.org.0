Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE0B44F60A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236146AbhKNBbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:16 -0500
Received: from relay08.th.seeweb.it ([5.144.164.169]:42775 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbhKNBbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:09 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id D26B93EE52;
        Sun, 14 Nov 2021 02:28:14 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] arm64: dts: qcom: sm8350: Assign iommus property to QUP WRAPs
Date:   Sun, 14 Nov 2021 02:27:51 +0100
Message-Id: <20211114012755.112226-12-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Assign the iommus property to allow access to QUP hosts that were not set up by
the bootloader.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 944ad864f73e..0ea735d0df49 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -663,6 +663,7 @@ qupv3_id_2: geniqup@8c0000 {
 			clock-names = "m-ahb", "s-ahb";
 			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+			iommus = <&apps_smmu 0x5e3 0x0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -833,6 +834,7 @@ qupv3_id_0: geniqup@9c0000 {
 			clock-names = "m-ahb", "s-ahb";
 			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+			iommus = <&apps_smmu 0x5a3 0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -1070,6 +1072,7 @@ qupv3_id_1: geniqup@ac0000 {
 			clock-names = "m-ahb", "s-ahb";
 			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
 				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			iommus = <&apps_smmu 0x43 0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.33.1

