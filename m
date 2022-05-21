Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD58152FDBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355365AbiEUPVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355386AbiEUPVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:21:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29CF9FE0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:00 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id u30so18789487lfm.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlRHmgPz4LKIxlJZY56dKqZYBftzR9zIcahl7t/spec=;
        b=FghNZdxGwghuxdTekvFwLm22ky0yXa05KEsrGVIdW1cuCDFtCfYShFQRfdpkkcIAbw
         6WdzuNgjXwIC+VooOLOWA7Hl11hS35V2PDQzutStB1LF2qSKbWzY1eshptWE4kOSoFRx
         iDIdemEGLAMEntHw+5ZjmUjKdE10ZqYcFllhUVjnNK/VbclFJWlsOgj63yzclAk38I8L
         g8/9OZI9C/mgfoYIyRBr6kN0vjevwKQy2j+AxtOzIJNe2Nar9AqmWUxegtzPUTgeb7fe
         PqeFloKoz25L+E6g6UhTuggsmkSw18RIChheI9RO1bwG0+XwYcPNae0jfpalwooFbhQH
         WfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlRHmgPz4LKIxlJZY56dKqZYBftzR9zIcahl7t/spec=;
        b=jBSWNvbpQdsHU/5vTP8yHrGYVHW/8vghCpxa7Aou+Yv4aXMPEOCmlglX9I2erKPLNO
         hPKNk+LE8Oudm0IJ1hIK8k4UmpW12h+RwGU77qpJbUzOPo6PIpn3pvV/WAnF9myGXAhS
         PES+BVV0c7uCC/9nhoc+ACxEwuWSHDAvCYdYKOJQ614WqPAYFNpQgA2I6/oRFLonQIki
         PLNBi7zAUjKbuwAxi9f2eUaH2+sscRUUJSciAMOfYxAihypTMHjD+iW7sE4aqM90ei7R
         1K1s+uwmmhhZ/St7Oh7PhPSB599rbYoHI2ip9LWmiyDkFMuu0eG+z3+No6NNqe7Hx5gy
         y/Hg==
X-Gm-Message-State: AOAM531tmCuGvFzbqJP4cEaLVJ6Z8IsIKtfRX9zoBzwnbnYS4NYNfoLc
        mj08QfzrpJmTKhUtt9Ob0j4jLQ==
X-Google-Smtp-Source: ABdhPJxgIL+Cc5c4uyhBq2/VSx9y557I8YpUCEoNJG7CRaAE++rInxZ8TNIZO+/0IIyErULLv8MVEA==
X-Received: by 2002:a05:6512:10cf:b0:473:b735:4fae with SMTP id k15-20020a05651210cf00b00473b7354faemr10518377lfg.93.1653146458991;
        Sat, 21 May 2022 08:20:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:20:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 05/11] arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
Date:   Sat, 21 May 2022 18:20:43 +0300
Message-Id: <20220521152049.1490220-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to adding second USB host/PHY pair, change first USB
PHY's label to qusb2phy0.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42af1fade461..00baacf28c63 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -224,7 +224,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEUP>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5be0ec06ed86..eb8504e5735c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1250,13 +1250,13 @@ usb3_dwc3: usb@a800000 {
 				 * haven't seen any devices making use of it.
 				 */
 				maximum-speed = "high-speed";
-				phys = <&qusb2phy>;
+				phys = <&qusb2phy0>;
 				phy-names = "usb2-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 			};
 		};
 
-		qusb2phy: phy@c012000 {
+		qusb2phy0: phy@c012000 {
 			compatible = "qcom,sdm660-qusb2-phy";
 			reg = <0x0c012000 0x180>;
 			#phy-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index dcbaacf18f66..9280c1f0c334 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -103,7 +103,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
-- 
2.35.1

