Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A72F654732
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 21:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiLVUgw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 15:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbiLVUgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 15:36:50 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D7423BFA;
        Thu, 22 Dec 2022 12:36:49 -0800 (PST)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 648A91F939;
        Thu, 22 Dec 2022 21:36:47 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: sm6125-seine: Provide regulators to SDHCI 1
Date:   Thu, 22 Dec 2022 21:36:34 +0100
Message-Id: <20221222203636.250190-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222203636.250190-1-marijn.suijten@somainline.org>
References: <20221222203636.250190-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While SDHCI 1 appears to work out of the box, we cannot rely on the
bootloader-enabled regulators nor expect them to remain enabled (e.g.
when finally dropping pd_ignore_unused).  Provide it the necessary l24
and l11 regulators now that PM6125 regulators have been made available
on this board.

As usual regulator voltages are decreased to the maximum voted by the
downstream driver for safety.  No other hardware feeds off of these
regulators anyway (except UFS, which isn't used on the seine board in
favour of a DV6DMB eMMC card connected to SDHCI 1).

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
index 15b43cff210b..eaddbe522695 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
@@ -348,7 +348,8 @@ pm6125_l10: l10 {
 
 		pm6125_l11: l11 {
 			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1952000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
 		};
 
 		pm6125_l12: l12 {
@@ -413,7 +414,8 @@ pm6125_l23: l23 {
 
 		pm6125_l24: l24 {
 			regulator-min-microvolt = <2944000>;
-			regulator-max-microvolt = <3304000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
 		};
 	};
 };
@@ -437,6 +439,8 @@ sd-cd-pins {
 };
 
 &sdhc_1 {
+	vmmc-supply = <&pm6125_l24>;
+	vqmmc-supply = <&pm6125_l11>;
 	status = "okay";
 };
 
-- 
2.39.0

