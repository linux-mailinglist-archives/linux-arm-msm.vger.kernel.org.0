Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0413B647803
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 22:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiLHVdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 16:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiLHVdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 16:33:36 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369F831DE8
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 13:33:35 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id n63so1054309iod.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 13:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udCwkO8StA61yER1zDj2O8kMSYGesvjzVzZN5NG0PbI=;
        b=pIJz44bg8gbS5XQfSjtXD9HXcgnfHmFHyw/W5ROamLy6ahYZtrJwCpIhX0Z4vbSTdF
         HgVs6KyZp5I4ZiHAPgK2M/g18aEN3VuolIkm01Hhe+HQtwzQ9n18KI3hD37FB9/cYYmg
         rxXfNSdvmb6WJ3Zol7Q6CKbydrRU51NyGOpQpruUrtaVev1clhJye1rGKGmBnTxH7XK3
         sa0s0fK5h//grGjh29YfY3DfsCQEh/RDuXHieIk31LtXPaf50VWUsmL/hoGNyXKUSIEt
         F8De6wyNglBXqu1HcNaheSsoE8bLP7DUzEBAA4idlTYG20CV2zLZQfkSm8pdUYgJLnJw
         NCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udCwkO8StA61yER1zDj2O8kMSYGesvjzVzZN5NG0PbI=;
        b=urnJFIyhRD4joebXPl5AatdBT2wnj44p9R9B2LG1J2Yp0mQT3+zASEXYujX+FvE+vG
         8Pjz8/EIK6yWcf4/Zz/JOrm2wQfV/wcVRh3bLB4Yn/FxLsSBENUqHfwPYI9PhYWbxKs/
         6lAiMrhHLSEX8aBgjB/UQf2wccKWCC4kN9Yle5YlakwWr0tud+Lc1rIS1bU09l+PVl1V
         IkIPPrArQh03qt1VYkKOQQwFm3LhLPWyn+861yzFaWh8V5/SVSj8QVM827+vK3HFd9iM
         hLdIdHxStOj6TqdX2P92QMj3cZZHpYEklfr7boiKv3ikk0g7jjJSlR63Zlqk9j5eGyNW
         JpHQ==
X-Gm-Message-State: ANoB5pk2ny6oo7ndvYLtds+B2jBi1BvuC2vz2kMtcieSMLsNfhQ8gyIw
        34Wt0OiitkK1L0PUL70eF/G8Mg==
X-Google-Smtp-Source: AA0mqf4yTl76ihYQPyhCijNX4zoOca/AKUlujS/q02e4i7PPKNcywjQgm8pd/wX0FHKyrCiHc5I0wg==
X-Received: by 2002:a5d:9657:0:b0:6bc:d71a:2b52 with SMTP id d23-20020a5d9657000000b006bcd71a2b52mr1894808ios.19.1670535214481;
        Thu, 08 Dec 2022 13:33:34 -0800 (PST)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id a8-20020a021608000000b003755aa71fffsm9237846jaa.105.2022.12.08.13.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 13:33:34 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     Luca Weiss <luca.weiss@fairphone.com>, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm6350: add IPA node
Date:   Thu,  8 Dec 2022 15:33:29 -0600
Message-Id: <20221208213330.937714-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208213330.937714-1-elder@linaro.org>
References: <20221208213330.937714-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Luca Weiss <luca.weiss@fairphone.com>

IPA is used for mobile data. Add a node describing it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Alex Elder <elder@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 43324bf291c30..f622d870bc827 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -432,7 +432,17 @@ modem_smp2p_out: master-kernel {
 
 		modem_smp2p_in: slave-kernel {
 			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 
+		ipa_smp2p_out: ipa-ap-to-modem {
+			qcom,entry-name = "ipa";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		ipa_smp2p_in: ipa-modem-to-ap {
+			qcom,entry-name = "ipa";
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
@@ -847,6 +857,43 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
+		ipa: ipa@1e40000 {
+			compatible = "qcom,sm6350-ipa";
+
+			iommus = <&apps_smmu 0x440 0x0>,
+				 <&apps_smmu 0x442 0x0>;
+			reg = <0 0x01e40000 0 0x8000>,
+			      <0 0x01e50000 0 0x3000>,
+			      <0 0x01e04000 0 0x23000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA 0 &clk_virt SLAVE_EBI_CH0 0>,
+					<&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_OCIMEM 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_IPA_CFG 0>;
+			interconnect-names = "memory", "imem", "config";
+
+			qcom,smem-states = <&ipa_smp2p_out 0>,
+					   <&ipa_smp2p_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.34.1

