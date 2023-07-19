Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 489E3759E88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 21:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjGST2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 15:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjGST2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 15:28:16 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDAD1FD2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 12:28:14 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-991ef0b464cso256039366b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689794893; x=1692386893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPoArgRK0ePPhHkMiGjMoj/J8C1a6a2nFfrrtKfK41Q=;
        b=w/i1U45+liuN+7k3F7LG/5hR+D6RXzrX3aWtCAoz6HbWRoQnApjOXh9G4ECBbOuSAP
         xJ1c4RWCvEbABPJzovFvL+1dF2LF2wAAshkdsc9kAwwJXo9vWlH6EUuSyAQFDAdqJX43
         8IE1o8ao7Py4uEqQ7KDGtckj7N3+u7b3Pj36n622LgxUA6zUv03h2aeRtNQQwbxramOt
         SDn3k4ooAul4JOH9pJ8+Hs9I9F+F9ug7cQsMTrtbz6ndqOEcS+nkkEoAa17/pr2cq9Ce
         8+bi5TJleHV4ujTNZLHC1B6oYWwsEtGp47grDydSldNhsZYvNcHfwuyAIl9tte5c5xhF
         i4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689794893; x=1692386893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPoArgRK0ePPhHkMiGjMoj/J8C1a6a2nFfrrtKfK41Q=;
        b=F1nR7jXLyY1E2K8pS+/hR8vWdlV27Xoc8sIHwKmqQiVHz1d5QrZ7cAbs6RvcCLre+g
         OFjQRSgHPKbb7SoeKhH5BonqIOdY+OrT060P56fOAIpe64xgpw0797YJp8gtZJR+bSUA
         g9HjNXe3PyfUT6g2nXq75W1pWNy+ZU0EIOiCtN6ORvplv7H+qVWfRGs4wZCtbAeXTBmN
         qDjl8V3OzuFDm4WUaOMsRmcD2L2bOdGOKHdvFisaqYwnq/R7a6K1MQ1kYRusHKR0ocM/
         0Hun052G1+12+Y8ciaZjUz+byuKubJ3PswcIz6Dd0xzAIisHzZs7IueVzoZ9ZI1WoZwn
         a64w==
X-Gm-Message-State: ABy/qLZAg6cGH5g2ToQ6yin35lV/8gUGL/sDwOC+LDdhsPFMyQw/ErF7
        RStdPP0hr9N2T0dMgMaOQnroXg==
X-Google-Smtp-Source: APBJJlF+y4nvtoJttbysvyj57guiGA5ZQiUlcaYu+GQGAVt0Qi34Mbnk7AeL9aUgHhtcHI6J6eKA7Q==
X-Received: by 2002:a17:906:77d9:b0:993:da87:1c81 with SMTP id m25-20020a17090677d900b00993da871c81mr3882864ejn.20.1689794893206;
        Wed, 19 Jul 2023 12:28:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906119a00b00991e2b5a27dsm2720966eja.37.2023.07.19.12.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:28:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8350-hdk: include PMK8350
Date:   Wed, 19 Jul 2023 21:28:07 +0200
Message-Id: <20230719192809.434709-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HDK8350 comes with PMK8350 PMIC, so include relevant DTSI.  This also
allows to use reboot reason.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add Rb
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index ad381d64d558..94e923962700 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "pmk8350.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8350 HDK";
-- 
2.34.1

