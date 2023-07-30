Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5DC7687DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 22:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjG3UT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 16:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjG3UT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 16:19:56 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F821BC7
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 13:19:17 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-522294c0d5bso5036188a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690748356; x=1691353156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zrugs3kVf4xOu8W4xu4wSVCnJNjPw4eUQaC+kFB3F8o=;
        b=lxhWc8iPXVlN8WEZg+145fUGzpQyvDHGonAG9AntKtNUcAlQ4PgIhK7oa/GSBVnf+g
         n4uY3A+sJmshd+c31CODXdvOaqbRnMFRXIhM8BU0fm3YBgDusuz9zgNs12FjEjl+SKj2
         FwDZXNkmTxqkxdn4D+YKvVIXM1RB93PPpaN4z8pkwO0bu2p9h5sV8iOEIzB7q9VJhrCG
         l4VslssD+VW2jDCUpA8yvhCbs3k6pP8lfv1EQRlutWRh97Cn+cfyoIi/CC7eEuTftp7l
         ipD9pih3NKIImpoj9fMJr1At9VoaMg8JQGLZb35o4y29xQjyquVPsfYfJK+Lmx0yKKUq
         aozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690748356; x=1691353156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrugs3kVf4xOu8W4xu4wSVCnJNjPw4eUQaC+kFB3F8o=;
        b=ZOOB7hwapm0L4Dus4K79aH5W+79kOePYIuiOUKNdVuSmCDoBBDSmgfbxqS5xPzxL2g
         fRrGyywdeCmGYi8nZHxVSOUPqwMlaLGujQMzd51JqdUibbLWp6mo5oTKs+fgJmdQW+jV
         dfWd4tkFA18yzFHIKUlEE1HA3nu7hXFZi2BcEZMmvrOsrDd+Ifo7FGRKm1NLXB3q4GqW
         eeXv+7EssxcOlSYgOQ9zx9AoMmlDdel1glr0Srw8njLI986bxjz8PLqhOoGeRsk+5CJk
         x4hiZAsP3Ex4NK9c5bg00LqXG0Bnr5sJAIsQCk0649VYLsWx6f/OAAoJX/SeQlE9USHB
         Fh8g==
X-Gm-Message-State: ABy/qLalWSqCRuqe+srpaYZRCnwIZf7aqpCsRBuKsAyVDE1Nwj+NWccw
        f23MChYtWsDIUmJpm26fpSYzBA==
X-Google-Smtp-Source: APBJJlFLuxauzh5VSmt+2+WBOf40rHSiOntFhb/dxnkUHzj2qDxBfOO9kgv0nx5AeOldQAcWvy9dyQ==
X-Received: by 2002:a17:906:8462:b0:99b:e3a9:79a1 with SMTP id hx2-20020a170906846200b0099be3a979a1mr4765383ejc.54.1690748355912;
        Sun, 30 Jul 2023 13:19:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id gq15-20020a170906e24f00b00992b510089asm5066885ejb.84.2023.07.30.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 13:19:15 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: qcom: msm8953-tissot: use 0 as speaker DAI cells
Date:   Sun, 30 Jul 2023 22:19:12 +0200
Message-Id: <20230730201913.70667-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MAX98927 speaker amplifier has only one DAI, so DAI cells can be just 0
(as expected by bindings).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index 831d3a42b583..61ff629c9bf3 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -96,7 +96,7 @@ max98927_codec: audio-codec@3a {
 		vmon-slot-no = <1>;
 		imon-slot-no = <1>;
 
-		#sound-dai-cells = <1>;
+		#sound-dai-cells = <0>;
 	};
 
 	led-controller@45 {
-- 
2.34.1

