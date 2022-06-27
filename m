Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFDC55D8B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbiF0OBR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 10:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbiF0OBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 10:01:16 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BC0DEB0;
        Mon, 27 Jun 2022 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vAjMALe0QzZbtIhy7o4JtnqIha+kmJ5693T6l0K4LhI=; b=CNkmecZh8q6YomIURCE40o6THk
        B/svTvBN5mzewrQXQVqd3Lbw1uPODBWZv88hLRqAwHYcbQqT5YMo8rNyTfUVlc8GfoQDcGxXVQSCj
        /Cs+eAhpMx0lbF9lXuy0VHSlWGSIumZZLCoXrFz9piq6ImmWJtfjiRlqpb8P5vEjWbatuMbd8R0Q8
        VHKgDaZ+AGlY+t8JUZ5+1s1niBauEvpR64qu8MLTvKMEw3zgMnDU3/c2PnD/dMSuBC59UK3UwU7Bx
        Z+HjHDErZWi7g++xIPb0F5Lc/WvLcSy1Uu5gfvjtQNHKleTl3yFLI0WQdiIhJnYCQxEbn+SVO6y2t
        rxeF3XVg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o5pId-006DHr-Lt; Mon, 27 Jun 2022 16:01:11 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
Date:   Mon, 27 Jun 2022 15:59:38 +0200
Message-Id: <20220627135938.2901871-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"make dtbs_check" complains about the missing "-supply" suffix for
vdd_lvs1_2 which is clearly a typo, originally introduced in the
msm8994-smd-rpm.dtsi file and apparently later copied to
msm8992-xiaomi-libra.dts:

msm8992-lg-bullhead-rev-10/101.dtb: pm8994-regulators: 'vdd_lvs1_2'
does not match any of the regexes:
  '.*-supply$', '^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$', 'pinctrl-[0-9]+'
From schema: regulator/qcom,smd-rpm-regulator.yaml

msm8992-xiaomi-libra.dtb: pm8994-regulators: 'vdd_lvs1_2'
does not match any of the regexes:
  '.*-supply$', '^((s|l|lvs|5vs)[0-9]*)|(boost-bypass)|(bob)$', 'pinctrl-[0-9]+'
From schema: regulator/qcom,smd-rpm-regulator.yaml

Reported-by: Rob Herring <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Fixes: f3b2c99e73be ("arm64: dts: Enable onboard SDHCI on msm8992")
Fixes: 0f5cdb31e850 ("arm64: dts: qcom: Add Xiaomi Libra (Mi 4C) device tree")
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
This fixes the dtbs_check failure reported by Rob in my unrelated patch:
https://lore.kernel.org/linux-arm-msm/1656091594.427255.146351.nullmailer@robh.at.kernel.org/
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 3b0cc85d6674..71e373b11de9 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -74,7 +74,7 @@ pm8994_regulators: pm8994-regulators {
 		vdd_l17_29-supply = <&vph_pwr>;
 		vdd_l20_21-supply = <&vph_pwr>;
 		vdd_l25-supply = <&pm8994_s5>;
-		vdd_lvs1_2 = <&pm8994_s4>;
+		vdd_lvs1_2-supply = <&pm8994_s4>;
 
 		/* S1, S2, S6 and S12 are managed by RPMPD */
 
diff --git a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
index 7748b745a5df..afa91ca9a3dc 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts
@@ -171,7 +171,7 @@ pm8994-regulators {
 		vdd_l17_29-supply = <&vph_pwr>;
 		vdd_l20_21-supply = <&vph_pwr>;
 		vdd_l25-supply = <&pm8994_s5>;
-		vdd_lvs1_2 = <&pm8994_s4>;
+		vdd_lvs1_2-supply = <&pm8994_s4>;
 
 		/* S1, S2, S6 and S12 are managed by RPMPD */
 
-- 
2.30.2

