Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEBF6E8358
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjDSVTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbjDSVTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:12 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBE7618D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:10 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id c9so1776124ejz.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939150; x=1684531150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbjB7nNg2fivtclYxRNMULQiQZCAt+Dj4vs0IV9gBiw=;
        b=X7+k4JKLQ24aACDfO7O4HUc/jExbhVt9xzDU8JAuV+gxy+355v3VuJimmv0Zh1VkD3
         BU/dHPucFcJ2AlzizHRy5VeLgCM0yivWSXPVV0/tkxy0UtnJZKYCv5PjXfNEEaKC9vjE
         /Pi3vzdWb1ybFElEIhPo3STckQqJ3ZDQb0iu8yJIyj2VVSPScvFo8zhQ+g5kzMNupxFQ
         4tGsby4xbCaPqwLlw2YAGBJ2z664b6QDSbL248mTHTSUmRlOC5h0H7lciBKg984uwKJV
         fjnCcvHYUhEIAggAxcY1TaR0J42agUvyRNdfIsiW2+fDMW579m8jHL8XeuM5y1XgAiH2
         NwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939150; x=1684531150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbjB7nNg2fivtclYxRNMULQiQZCAt+Dj4vs0IV9gBiw=;
        b=Fv3Rz9VYFJmbIg5rZzGGa6usrD5OxQZ5kMR8ZjElmUhngqCOCouk6WtvYxMDOlK5+p
         VCXXg2ifJnlXjS2Mo3ha8U+3WgdOg/CjFha+Xdmztjx1xB+43vMj4HpBwZV1Cw5frXaO
         5BD2S3pM7wwx3if8vblSuTMTYQXDiEiQL0TmG+vKnwExIzobHC8b9R+5aqMEngK9ZjUA
         2O79YW65ewBFBef0aETuHXwfVl9D4QBUauLzZXaumCAGSlvKojVhEaAcOSNicRxooiGA
         2qThN2rbL+V5bkJ1NILlzsaRQgYkhI300GId8pvxbcAa31tx+G5oI5+ztYLgebomEj7m
         FIPA==
X-Gm-Message-State: AAQBX9fJHLYfpTPIbGctWPfcRyRYA5B3oA5TyL1HZh7ZSYfSs+5kmTnx
        E03WqALMF8UL6re3WJ8Yx2ON3w==
X-Google-Smtp-Source: AKy350Y4tcCAW3OxlWfP5OotfW+Kuokv348bNlCXZE3G6VutesGeO79/PMLWMSreeki0Yvivme6LDQ==
X-Received: by 2002:a17:906:2dda:b0:92b:f118:ef32 with SMTP id h26-20020a1709062dda00b0092bf118ef32mr18184354eji.48.1681939150295;
        Wed, 19 Apr 2023 14:19:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/18] arm64: dts: qcom: msm8976: correct MMC unit address
Date:   Wed, 19 Apr 2023 23:18:45 +0200
Message-Id: <20230419211856.79332-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc@0/mmc@7824000: simple-bus unit address format error, expected "7824900"
  Warning (simple_bus_reg): /soc@0/mmc@7864000: simple-bus unit address format error, expected "7864900"
  Warning (simple_bus_reg): /soc@0/mmc@7a24000: simple-bus unit address format error, expected "7a24900"

Fixes: 0484d3ce0902 ("arm64: dts: qcom: Add DTS for MSM8976 and MSM8956 SoCs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index f47fb8ea71e2..753b9a2105ed 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -822,7 +822,7 @@ spmi_bus: spmi@200f000 {
 			#interrupt-cells = <4>;
 		};
 
-		sdhc_1: mmc@7824000 {
+		sdhc_1: mmc@7824900 {
 			compatible = "qcom,msm8976-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07824900 0x500>, <0x07824000 0x800>;
 			reg-names = "hc", "core";
@@ -838,7 +838,7 @@ sdhc_1: mmc@7824000 {
 			status = "disabled";
 		};
 
-		sdhc_2: mmc@7864000 {
+		sdhc_2: mmc@7864900 {
 			compatible = "qcom,msm8976-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
 			reg-names = "hc", "core";
@@ -957,7 +957,7 @@ otg: usb@78db000 {
 			#reset-cells = <1>;
 		};
 
-		sdhc_3: mmc@7a24000 {
+		sdhc_3: mmc@7a24900 {
 			compatible = "qcom,msm8976-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0x07a24900 0x11c>, <0x07a24000 0x800>;
 			reg-names = "hc", "core";
-- 
2.34.1

