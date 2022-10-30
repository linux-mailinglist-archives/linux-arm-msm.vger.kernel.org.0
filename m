Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAE86128B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 08:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiJ3Hct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 03:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ3Hcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 03:32:46 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C5E2DA;
        Sun, 30 Oct 2022 00:32:44 -0700 (PDT)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 240B41F948;
        Sun, 30 Oct 2022 08:32:42 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] arm64: dts: qcom: sm6350: Add resets for SDHCI 1/2
Date:   Sun, 30 Oct 2022 08:32:23 +0100
Message-Id: <20221030073232.22726-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221030073232.22726-1-marijn.suijten@somainline.org>
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make sure the SDHCI hardware is properly reset before interacting with
it, to protect against any possibly indeterminate state left by the
bootloader.

Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index c39de7d3ace0..a3ae765d9781 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -490,6 +490,7 @@ sdhc_1: mmc@7c4000 {
 				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC1_BCR>;
 			qcom,dll-config = <0x000f642c>;
 			qcom,ddr-config = <0x80040868>;
 			power-domains = <&rpmhpd SM6350_CX>;
@@ -1068,6 +1069,7 @@ sdhc_2: mmc@8804000 {
 				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface", "core", "xo";
+			resets = <&gcc GCC_SDCC2_BCR>;
 			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &clk_virt SLAVE_EBI_CH0 0>,
 					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_SDCC_2 0>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
-- 
2.38.1

