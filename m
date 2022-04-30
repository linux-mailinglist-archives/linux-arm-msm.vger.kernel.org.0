Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9087E515F34
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382988AbiD3QaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376506AbiD3QaN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:30:13 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D50F2D1D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:26:51 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 0DFBC3F6AE;
        Sat, 30 Apr 2022 18:26:49 +0200 (CEST)
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
Subject: [PATCH] arm64: dts: qcom: msm8996: Add SDHCI resets
Date:   Sat, 30 Apr 2022 18:26:42 +0200
Message-Id: <20220430162642.608106-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996, the default bootloader configuration leaves the hosts in some
weird state that never allows them to function properly under Linux.
Add the hardware resets so that we can start clean and get them actually
working.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Depends on [1], fixes eMMC on at least SONY Tone.

[1] https://patchwork.kernel.org/project/linux-mmc/patch/1650816153-23797-1-git-send-email-quic_c_sbhanu@quicinc.com/

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b9a48cfd760f..dc56830f9e00 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2707,6 +2707,7 @@ sdhc1: sdhci@7464900 {
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				<&gcc GCC_SDCC1_APPS_CLK>,
 				<&rpmcc RPM_SMD_BB_CLK1>;
+			resets = <&gcc GCC_SDCC1_BCR>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc1_state_on>;
@@ -2730,6 +2731,7 @@ sdhc2: sdhci@74a4900 {
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
 				<&gcc GCC_SDCC2_APPS_CLK>,
 				<&rpmcc RPM_SMD_BB_CLK1>;
+			resets = <&gcc GCC_SDCC2_BCR>;
 
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc2_state_on>;
-- 
2.35.2

