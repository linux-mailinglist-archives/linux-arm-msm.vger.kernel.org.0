Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE24DE9C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Mar 2022 18:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243810AbiCSRtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Mar 2022 13:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243788AbiCSRsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Mar 2022 13:48:46 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B5E2467D7
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Mar 2022 10:47:21 -0700 (PDT)
Received: from localhost.localdomain (abxi119.neoplus.adsl.tpnet.pl [83.9.2.119])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id B808E3F659;
        Sat, 19 Mar 2022 18:47:17 +0100 (CET)
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
Subject: [PATCH 13/15] arm64: dts: qcom: msm8994: Fix BLSP[12]_DMA channels count
Date:   Sat, 19 Mar 2022 18:46:43 +0100
Message-Id: <20220319174645.340379-14-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319174645.340379-1-konrad.dybcio@somainline.org>
References: <20220319174645.340379-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8994 actually features 24 DMA channels for each BLSP,
fix it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 2f531e93f3c6..b72be374bca3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -500,7 +500,7 @@ blsp1_dma: dma-controller@f9904000 {
 			#dma-cells = <1>;
 			qcom,ee = <0>;
 			qcom,controlled-remotely;
-			num-channels = <18>;
+			num-channels = <24>;
 			qcom,num-ees = <4>;
 		};
 
@@ -636,7 +636,7 @@ blsp2_dma: dma-controller@f9944000 {
 			#dma-cells = <1>;
 			qcom,ee = <0>;
 			qcom,controlled-remotely;
-			num-channels = <18>;
+			num-channels = <24>;
 			qcom,num-ees = <4>;
 		};
 
-- 
2.35.1

