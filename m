Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FD6574DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 14:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239334AbiGNMeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 08:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239324AbiGNMeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 08:34:21 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D27D5C379
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 05:34:16 -0700 (PDT)
Received: from localhost.localdomain (abxj14.neoplus.adsl.tpnet.pl [83.9.3.14])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 6760140164;
        Thu, 14 Jul 2022 14:34:14 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm8450: Adjust memory map
Date:   Thu, 14 Jul 2022 14:34:04 +0200
Message-Id: <20220714123406.1919836-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220714123406.1919836-1-konrad.dybcio@somainline.org>
References: <20220714123406.1919836-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix up the camera region (cross-referenced different vendors' msm-5.10
drops, 9f500000 is the default location for SM8450) and reserve the
second chunk occupied by xbl_sc.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
No changes since v1

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7d08fad76371..09e7587de0de 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -436,11 +436,6 @@ cdsp_secure_heap: memory@80c00000 {
 			no-map;
 		};
 
-		camera_mem: memory@85200000 {
-			reg = <0x0 0x85200000 0x0 0x500000>;
-			no-map;
-		};
-
 		video_mem: memory@85700000 {
 			reg = <0x0 0x85700000 0x0 0x700000>;
 			no-map;
@@ -503,6 +498,11 @@ cvp_mem: memory@9ee00000 {
 			no-map;
 		};
 
+		camera_mem: memory@9f500000 {
+			reg = <0x0 0x9f500000 0x0 0x800000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@9fd00000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x9fd00000 0x0 0x280000>;
@@ -512,6 +512,11 @@ rmtfs_mem: memory@9fd00000 {
 			qcom,vmid = <15>;
 		};
 
+		xbl_sc_mem2: memory@a6e00000 {
+			reg = <0x0 0xa6e00000 0x0 0x40000>;
+			no-map;
+		};
+
 		global_sync_mem: memory@a6f00000 {
 			reg = <0x0 0xa6f00000 0x0 0x100000>;
 			no-map;
-- 
2.37.0

