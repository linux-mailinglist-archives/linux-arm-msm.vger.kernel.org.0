Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A5A3D985E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhG1WZz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhG1WZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:25:54 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D810DC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 15:25:52 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 4F37E1FAEC;
        Thu, 29 Jul 2021 00:25:50 +0200 (CEST)
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
Subject: [PATCH 01/39] arm64: dts: qcom: sdm630: Rewrite memory map
Date:   Thu, 29 Jul 2021 00:25:04 +0200
Message-Id: <20210728222542.54269-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The memory map was wrong. Fix it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 41 ++++++++++++----------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index f91a928466c3..5ea3884b3ccb 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -343,10 +343,19 @@ wlan_msa_mem: wlan-msa-mem@85700000 {
 		};
 
 		qhee_code: qhee-code@85800000 {
-			reg = <0x0 0x85800000 0x0 0x3700000>;
+			reg = <0x0 0x85800000 0x0 0x600000>;
 			no-map;
 		};
 
+		rmtfs_mem: memory@85e00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0x85e00000 0x0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
 		smem_region: smem-mem@86000000 {
 			reg = <0 0x86000000 0 0x200000>;
 			no-map;
@@ -357,58 +366,44 @@ tz_mem: memory@86200000 {
 			no-map;
 		};
 
-		modem_fw_mem: modem-fw-region@8ac00000 {
+		mpss_region: mpss@8ac00000 {
 			reg = <0x0 0x8ac00000 0x0 0x7e00000>;
 			no-map;
 		};
 
-		adsp_fw_mem: adsp-fw-region@92a00000 {
+		adsp_region: adsp@92a00000 {
 			reg = <0x0 0x92a00000 0x0 0x1e00000>;
 			no-map;
 		};
 
-		pil_mba_mem: pil-mba-region@94800000 {
+		mba_region: mba@94800000 {
 			reg = <0x0 0x94800000 0x0 0x200000>;
 			no-map;
 		};
 
-		buffer_mem: buffer-region@94a00000 {
+		buffer_mem: tzbuffer@94a00000 {
 			reg = <0x0 0x94a00000 0x0 0x100000>;
 			no-map;
 		};
 
-		venus_fw_mem: venus-fw-region@9f800000 {
+		venus_region: venus@9f800000 {
 			reg = <0x0 0x9f800000 0x0 0x800000>;
 			no-map;
 		};
 
-		secure_region2: secure-region2@f7c00000 {
-			reg = <0x0 0xf7c00000 0x0 0x5c00000>;
-			no-map;
-		};
-
 		adsp_mem: adsp-region@f6000000 {
 			reg = <0x0 0xf6000000 0x0 0x800000>;
 			no-map;
 		};
 
-		qseecom_ta_mem: qseecom-ta-region@fec00000 {
-			reg = <0x0 0xfec00000 0x0 0x1000000>;
-			no-map;
-		};
-
 		qseecom_mem: qseecom-region@f6800000 {
 			reg = <0x0 0xf6800000 0x0 0x1400000>;
 			no-map;
 		};
 
-		secure_display_memory: secure-region@f5c00000 {
-			reg = <0x0 0xf5c00000 0x0 0x5c00000>;
-			no-map;
-		};
-
-		cont_splash_mem: cont-splash-region@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x23ff000>;
+		zap_shader_region: gpu@fed00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xfed00000 0x0 0xa00000>;
 			no-map;
 		};
 	};
-- 
2.32.0

