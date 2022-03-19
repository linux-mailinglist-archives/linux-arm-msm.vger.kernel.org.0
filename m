Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0884DE9DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Mar 2022 18:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243801AbiCSRtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Mar 2022 13:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243817AbiCSRsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Mar 2022 13:48:51 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A9247806
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Mar 2022 10:47:23 -0700 (PDT)
Received: from localhost.localdomain (abxi119.neoplus.adsl.tpnet.pl [83.9.2.119])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id AC3B53ED8B;
        Sat, 19 Mar 2022 18:47:20 +0100 (CET)
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
Subject: [PATCH 14/15] arm64: dts: qcom: msm8994: Add watchdog timer node
Date:   Sat, 19 Mar 2022 18:46:44 +0100
Message-Id: <20220319174645.340379-15-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319174645.340379-1-konrad.dybcio@somainline.org>
References: <20220319174645.340379-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add and configure the watchdog node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index b72be374bca3..7aab835fa2fe 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -356,6 +356,15 @@ apcs: mailbox@f900d000 {
 			#mbox-cells = <1>;
 		};
 
+		watchdog@f9017000 {
+			compatible = "qcom,apss-wdt-msm8994", "qcom,kpss-wdt";
+			reg = <0xf9017000 0x1000>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&sleep_clk>;
+			timeout-sec = <10>;
+		};
+
 		timer@f9020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.35.1

