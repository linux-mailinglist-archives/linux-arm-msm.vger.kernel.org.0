Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEF95F122D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiI3TLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbiI3TLM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:11:12 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57A410BB2F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:11:03 -0700 (PDT)
Received: from localhost.localdomain (95.49.31.201.neoplus.adsl.tpnet.pl [95.49.31.201])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 00E97200FE;
        Fri, 30 Sep 2022 21:11:00 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: qcom: sdm845-tama: Enable GPU
Date:   Fri, 30 Sep 2022 21:10:46 +0200
Message-Id: <20220930191049.123256-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930191049.123256-1-konrad.dybcio@somainline.org>
References: <20220930191049.123256-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the A630 GPU and its GMU.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index b78a93f52d96..ba949b0466dc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -386,6 +386,19 @@ &gcc {
 			<GCC_LPASS_SWAY_CLK>;
 };
 
+&gmu {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/Sony/tama/a630_zap.mbn";
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.37.3

