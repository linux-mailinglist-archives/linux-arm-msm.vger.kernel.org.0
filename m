Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE08677BF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbjAWM45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbjAWM45 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:56:57 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CE33A97
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:55 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id q5so6058740wrv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=js7pRMwDu5EHvl9HWw9Bq4dZ98JUEwC6xMOJGefUs4c=;
        b=Ys42QZ5dtuZOUeAQTUOjMBFK0hkF/MLkR/buS6vrt86FjjWFLgxDrB5rliYR+0V5hY
         fMjObsKLzT23m3cFP18ftCuer7iOLA/rzG5KZN1q013GJXJBH5a9g7o4+qXCiszR3AP+
         MT96ahDnPpvewb9K2Nve6fiudnxgwK32HdJKWjMZDGDdzxGtjsDsK/aDaZWJ4H82mHYM
         o3Yuk61/q6HfyaIa+G17u0ZNxXukM9dPAUQYtfsyHpyFp+c3/IRMbF1Jku/tLve09Q37
         ktoPS3KPPHmEgV4deAuIotzpKpr+sOtQdIL2NfnAwa7lX/DwL3RyeXW1p55pnCkLvBQ3
         QZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=js7pRMwDu5EHvl9HWw9Bq4dZ98JUEwC6xMOJGefUs4c=;
        b=iNEIjzRiOSHe9YP0sPYSNMPtC592R38oRmr/KoflNzGOqDi5T8HLDvbVSK9lc29bL9
         rsAcNCS4VOvBmNwci0GFwiXP2omMPkEte9Eqzu9oAwAKJcozZuL3mvvYJ0cZHFtWERyK
         tD8/d8KV8AOA6dJZGRkhS+QwWhOxZw9em9vo0fUnk5oLxeLyLfQLiVmGp0BxOmdBbK++
         dMS9y7bsnR8kiPivuZxFZrqhKcaruESwiO4aaN1+JwYWWTe9nhgiLQqiKhnbzMCGdcQP
         qoNrHFlEmvcAi17LPJxdFWlZDtDCAaUIYjrZGBusk4X3uwtlxRs/4c/b3Cye9Gf/EQms
         ZphA==
X-Gm-Message-State: AFqh2krh37tVI8Q0rfPWn4cFYdnxtUCQtDsrQPE9w/b6FEh+YeARkyvB
        GXfYzOvt7IBHS6NHdyEyxy+ukA==
X-Google-Smtp-Source: AMrXdXuhxWIrD+fGm7Plj36KzNqMsxCxdjpVHFjf4tsbuHxXogOtxsAmSXdiyz/4r2/PxOtH3ojOPw==
X-Received: by 2002:a05:6000:a03:b0:244:48b3:d138 with SMTP id co3-20020a0560000a0300b0024448b3d138mr24564949wrb.54.1674478613920;
        Mon, 23 Jan 2023 04:56:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a10-20020a056000100a00b00297dcfdc90fsm4569616wrx.24.2023.01.23.04.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:56:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: use generic node name for Bluetooth
Date:   Mon, 23 Jan 2023 13:56:09 +0100
Message-Id: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Node names should be generic (as Devicetree spec mandates), so use
"bluetooth" for BT node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Fix also msm8996-xiaomi-common
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 5b47b8de69da..2acfed28e3cb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -229,7 +229,7 @@ &blsp1_uart2 {
 	status = "okay";
 	label = "QCA_UART";
 
-	bluetooth: qca6174a {
+	bluetooth: bluetooth {
 		compatible = "qcom,qca6174-bt";
 
 		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 774f9d45f051..6ea8dd7d3e01 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -430,7 +430,7 @@ &uart3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-1 = <&qup_uart3_sleep>;
 
-	bluetooth: wcn3990-bt {
+	bluetooth: bluetooth {
 		compatible = "qcom,wcn3990-bt";
 		vddio-supply = <&vreg_l10a_1p8>;
 		vddxo-supply = <&vreg_l1c_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index a78075155310..e19178c1ec44 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -862,7 +862,7 @@ &uart6 {
 
 	pinctrl-0 = <&qup_uart6_4pin>;
 
-	bluetooth: wcn3990-bt {
+	bluetooth: bluetooth {
 		compatible = "qcom,wcn3990-bt";
 		vddio-supply = <&src_pp1800_s4a>;
 		vddxo-supply = <&pp1800_l7a_wcn3990>;
-- 
2.34.1

