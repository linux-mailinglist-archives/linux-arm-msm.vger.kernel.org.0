Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3FA1571A51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbiGLMqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbiGLMqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:07 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA23AEF71;
        Tue, 12 Jul 2022 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+7dkK/pDud7VFmBz87gdVKEZhqtJamWBLWakUNW4Tso=; b=UuclXiH6qfp1RGZZGUx9NWxyMW
        pRHkY8+bmzXSoMMJDeiidmW0/U8x7ytqDKdzUFCJjjgTy2ndWs5YfUvyIfRk+nFplBYGKN4946pZE
        JMST5jSGqEkCJKNqPiIoYV3VzBIDBjMS0e2ia9MYy5yMJkRQoLaY3iP5aNJlqFIPIPCYZ/ARQMZ3Z
        Ucz0pqzljrvkYcTNFGNGTPehQxosbOzZJeDPyhxItdaC1/dJBjEwwDRbFGb7RUw1e7OBhEHmw5es/
        Cj6++On3tDK22hqnGy1UHPaA+DSYoEJevzpk+YTIAOBFWhrEoJpIETA4JoL2AT9vpVC4uZTArW/Od
        TRUzVsxQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFH2-0087Gb-Ab; Tue, 12 Jul 2022 14:45:56 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by default
Date:   Tue, 12 Jul 2022 14:44:18 +0200
Message-Id: <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
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

The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
it lacks the regulator supplies that should be added in the board DT
files. Some of the msm8974 boards are currently missing the regulator
supplies and should have the remoteprocs disabled to avoid making use
of the incomplete configuration.

This also fixes dtbs_check warnings after moving "qcom,msm8974-mss-pil"
to DT schema, which rightfully complains that the -supply properties
are missing for some boards:

qcom-apq8074-dragonboard.dtb:
remoteproc@fc880000: 'pll-supply' is a required property
        From schema: remoteproc/qcom,msm8916-mss-pil.yaml
remoteproc@fc880000: 'mss-supply' is a required property
        From schema: remoteproc/qcom,msm8916-mss-pil.yaml
remoteproc@fc880000: 'oneOf' conditional failed, one must be fixed:
        'power-domains' is a required property
        'power-domain-names' is a required property, or
        'cx-supply' is a required property
        'mx-supply' is a required property

Cc: Luca Weiss <luca@z3ntu.xyz>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Fixes: f300826d27be ("ARM: dts: qcom-msm8974: Sort and clean up nodes")
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi                 | 4 ++++
 arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts | 2 ++
 arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts  | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 814ad0b46232..35246bd02132 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1172,6 +1172,8 @@ remoteproc_mss: remoteproc@fc880000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			status = "disabled";
+
 			mba {
 				memory-region = <&mba_region>;
 			};
@@ -1639,6 +1641,8 @@ remoteproc_adsp: remoteproc@fe200000 {
 			qcom,smem-states = <&adsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			status = "disabled";
+
 			smd-edge {
 				interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
 
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
index 58cb2ce1e4df..8a6b8e4de887 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-fairphone-fp2.dts
@@ -147,10 +147,12 @@ wcnss {
 };
 
 &remoteproc_adsp {
+	status = "okay";
 	cx-supply = <&pm8841_s2>;
 };
 
 &remoteproc_mss {
+	status = "okay";
 	cx-supply = <&pm8841_s2>;
 	mss-supply = <&pm8841_s3>;
 	mx-supply = <&pm8841_s1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
index d6b2300a8223..577cbffad010 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
@@ -457,10 +457,12 @@ fuelgauge_pin: fuelgauge-int-pin {
 };
 
 &remoteproc_adsp {
+	status = "okay";
 	cx-supply = <&pma8084_s2>;
 };
 
 &remoteproc_mss {
+	status = "okay";
 	cx-supply = <&pma8084_s2>;
 	mss-supply = <&pma8084_s6>;
 	mx-supply = <&pma8084_s1>;
-- 
2.30.2

