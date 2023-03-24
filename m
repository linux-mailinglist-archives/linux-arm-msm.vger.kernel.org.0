Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15D76C75AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231300AbjCXCZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjCXCZr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:47 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AB329E21
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s8so395915lfr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWgHA+6kWwPqerA/eQ1n+tcpvRHpkDNe2/li/0GuXcA=;
        b=SJDsnqXVatsqt9wz5/dk3a4JqzBj0sgBbS0b+VPfmYOLIoy6C0ent3EuzcMww/Lyg4
         mr5w4Zzy/mCffFmXKCbIslyJSl+FP3xfLw0hj+MV3MaIl6xyJ5UcQ1cY0B1Fqm3yj6WO
         GJG8SuNtTYL+zI8ElgJnOni4y8yNuoj3gAACAypwmc4FACoHiwGnkglJeABEQTH+QXOZ
         6BxDUW6+M3crJL3yOzPasaCJSp3ANyh26PgzPTEg0UUKueyfQAeYbc2w2mgxFqz0pGQ5
         P1r9ikea9ginlNeM83pf1KSy0wDAmSAskqFxU+/dp0cBXOL7h5D9SChOAeVTqK+jwapH
         HZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWgHA+6kWwPqerA/eQ1n+tcpvRHpkDNe2/li/0GuXcA=;
        b=Oi1zxD2GRocvscyVbVdVCya5i0P81DhtAgTuGSXqJDLBJ01GTA19iNAPh5DJ3j69gB
         WTmIwSLzgsMPPm9Nvk4bb0nuGbRCiWmSpzRY4squi7CQifDls2TcYdhHKCrdikYJ40FM
         a9oKmz0ikeOHVY40Bmr11x4rcyQpzmEEtCRALc0qBMp0Vg55QylaX7rr22jweUh+5W48
         dMDm5ymAcyWQ3wzy04nSAQDyXRP7ewOplCBl+00eW5Iuk+pgLNwbahSVh19nyJauP/jf
         isVxYTfnGn9+wJUu2pykWwqIM8rlDOQaIVbp4kl501EDaifWbaNUhCIFgNjxyflVO5SJ
         0rdA==
X-Gm-Message-State: AAQBX9cHvFapVFCu7lFnM2zRaarKlqghsbDgSEwfxv0H2gKREx+z7wsB
        niDA9T6gneTMrnpoDNCCGrjnkw==
X-Google-Smtp-Source: AKy350bkNBQkQVASiM0Bh9X6nL6IZZWcLSeY1rr677DzHNRkhbRACEJrW9kF329c1O0rY9yuMhXUyQ==
X-Received: by 2002:ac2:5ec3:0:b0:4ea:4793:fad0 with SMTP id d3-20020ac25ec3000000b004ea4793fad0mr322378lfq.5.1679624741185;
        Thu, 23 Mar 2023 19:25:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 23/41] arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:56 +0300
Message-Id: <20230324022514.1800382-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2ccf28d8e223..11e7d5b6f6d6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -980,7 +980,7 @@ ufshc: ufshc@1da4000 {
 			compatible = "qcom,msm8998-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x01da4000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufsphy_lanes>;
+			phys = <&ufsphy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
@@ -1021,11 +1021,8 @@ ufshc: ufshc@1da4000 {
 
 		ufsphy: phy@1da7000 {
 			compatible = "qcom,msm8998-qmp-ufs-phy";
-			reg = <0x01da7000 0x18c>;
-			#address-cells = <1>;
-			#size-cells = <1>;
+			reg = <0x01da7000 0x1000>;
 			status = "disabled";
-			ranges;
 
 			clock-names =
 				"ref",
@@ -1037,14 +1034,7 @@ ufsphy: phy@1da7000 {
 			reset-names = "ufsphy";
 			resets = <&ufshc 0>;
 
-			ufsphy_lanes: phy@1da7400 {
-				reg = <0x01da7400 0x128>,
-				      <0x01da7600 0x1fc>,
-				      <0x01da7c00 0x1dc>,
-				      <0x01da7800 0x128>,
-				      <0x01da7a00 0x1fc>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.30.2

