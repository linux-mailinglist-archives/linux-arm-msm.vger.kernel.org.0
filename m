Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 806535F66A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiJFMs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiJFMsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:48:23 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1F8A285C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r22so781032ljn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=88CQD2qxJDDsWpeM6Y7JxzJKMImZlbT1MdksUVYxP2A=;
        b=V7zg5QHpWKlE9wXfwPu2avj2419UD9qm+TcOgp9xXcK5kbjy5hU8Sm94eduSVlO9yn
         DOXoflnOGRHOZ37JimoPoIjpv4SHNV90Znj64o+Yvbmq8/cWBlv4bPol7Bhrp4mzNn1A
         WTXiVZ2PTiyf+GluRwsYKFUjPQVUnCvVg5/dI/aP0iFieFK+2J9KU4QA1mVEI+sqYRHw
         n+WnZZd8z1re0vPYao1gw9tOR46+3y/TfQsnOcusGQObgOtlK2NaQ7J7tM4WtI9izYwK
         hr0Crgowr27LLVVTZpH+k/kFXi+ogBp8q26YhJk4aYSHJ21ZKaIoZ4n8qejjceRfzDGg
         ZZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=88CQD2qxJDDsWpeM6Y7JxzJKMImZlbT1MdksUVYxP2A=;
        b=zkjgttW9ACU6zkXHXzDMg07RlzKX0hFgSDcyBNwKDLD2La5SjBdYFMdqo5EnKbOLmn
         FSG3GYyn9/A4CmFJg8zY4U9aZlY5wIeXTw0ROoSEKMMvTAdUlny98PwjUCvL5Cpc+lMQ
         JfzzQJqnfTRhgLGpR4QxaQMOD1BVygD2JSnvGeEY/qtnLnlbKRVdoW8YeJ9WsMuAR+2p
         3T+mfjoLn9zlBBPXMKiy6iEdFRfCaqSx6dTNZtEp3WCEbHv/6jR1tJzF2nzyk8M7mSCg
         IJMU2iBtAejh0fmAZjIA1EiDmycwTqIgtuu/8gNv76KxTJ2DwlfQAppIQalbAjIyRf6T
         c0Zg==
X-Gm-Message-State: ACrzQf2XcE7VtToFdAvUcw7s4UYZFc7yWtT4WdecBKdKD8YtdaplQslH
        9U4gdF9Z2/MmejZSjhJhap/8rA==
X-Google-Smtp-Source: AMsMyM5pvoXzZmKqUa3poS84MpbFKxgCgqu3cHMgLKAEALayqcNQPa+8+01ZJCzdZDBor4hmNBiu8Q==
X-Received: by 2002:a2e:780d:0:b0:26d:fd38:9649 with SMTP id t13-20020a2e780d000000b0026dfd389649mr1842550ljc.77.1665060452093;
        Thu, 06 Oct 2022 05:47:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 26/34] dt-bindings: pinctrl: qcom,qcm2290: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:51 +0200
Message-Id: <20221006124659.217540-27-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,qcm2290-pinctrl.yaml           | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 3f4f1c0360b5..5324b61eb4f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -50,8 +50,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-qcm2290-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-qcm2290-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-qcm2290-tlmm-state:
@@ -146,19 +147,19 @@ examples:
         gpio-ranges = <&tlmm 0 0 127>;
 
         sdc2_on_state: sdc2-on-state {
-            clk {
+            clk-pins {
                 pins = "sdc2_clk";
                 bias-disable;
                 drive-strength = <16>;
             };
 
-            cmd {
+            cmd-pins {
                 pins = "sdc2_cmd";
                 bias-pull-up;
                 drive-strength = <10>;
             };
 
-            data {
+            data-pins {
                 pins = "sdc2_data";
                 bias-pull-up;
                 drive-strength = <10>;
-- 
2.34.1

