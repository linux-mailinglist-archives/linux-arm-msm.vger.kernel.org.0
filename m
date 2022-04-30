Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A9E515F05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243175AbiD3Q0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243147AbiD3Q0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:26:52 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E641B5F8D0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:23:30 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id A908E3F722;
        Sat, 30 Apr 2022 18:23:23 +0200 (CEST)
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
Subject: [PATCH] arm64: dts: qcom: msm8996-tone: Drop cont_splash_mem region
Date:   Sat, 30 Apr 2022 18:23:19 +0200
Message-Id: <20220430162319.607629-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tone does not have a functioning bootloader framebuffer and Linux allocates
the DRM framebuffer dynamically. Free up 36 MiB of precious RAM by removing
this reservation.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index fe57c0c35c5e..ce434c11c059 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -33,11 +33,6 @@ ramoops@a7f00000 {
 			ecc-size = <16>;
 		};
 
-		cont_splash_mem: memory@83401000 {
-			reg = <0 0x83401000 0 0x23ff000>;
-			no-map;
-		};
-
 		zap_shader_region: gpu@90400000 {
 			compatible = "shared-dma-pool";
 			reg = <0x0 0x90400000 0x0 0x2000>;
-- 
2.35.2

