Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D67256A6A9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 17:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbiGGPJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 11:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235828AbiGGPJr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 11:09:47 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A219C24F25
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 08:09:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id q9so26757169wrd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJQ8LuM6gYj1S1IcSaJqQwDBg8F4AVRYa9XRA2UBF9I=;
        b=JFYtHMJoIhBQDXtXxXBh2mW67e1EHY9qZN1yhkJm335/YMUO3fJJ+cvFZRYmzj2fMv
         q71FWmkvieFqxJZNkrEmKxApvfEJ3Z5okCaGNB+yY1GkSGKU9L/jlVeE4hmY5zEI6yfF
         lQE91nBJObTqiFfHsc03e8PbAdg+fhgzxido5gEsdqjo8jydbr+7a/EhUGtznY4sPo+O
         2F6K2RoUbeAgqSf1NuHYP7qDSoloQnbPj63xENiRySGzzq40aG7u4zaqRh/SNzFr/C40
         pG4h6cSEzRTcMXHRZfKDPXDlS0MDTlsfP7sgvBiWOrhRixH61UVl52z9SPaC6iFsKZEE
         OI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJQ8LuM6gYj1S1IcSaJqQwDBg8F4AVRYa9XRA2UBF9I=;
        b=NtIcDm5vmqAupGaQ51CWgoFSEuutzI2jbHlRH4JGvMPojrcRKkVkC0xon0PavdLVrC
         eZb8xA/lvOlpfFKtbdsvNEzvytDaqeg8ZzWgee12nMk2UuTWP0dYpHXKWRaHyPNhD69d
         1t2t4eMaacFNs5QlTc8vs0vHmYzATyhYHMDvvCfqETkH6aQHL97Pya81PdNGfoep8oPZ
         6vP/ErWnGqnZV3gyY3O4kjG5f15Sdr0fx1Co/vmDav88LDtY/GlOvXNM6Uxqrq20Krkz
         x3l/zWgGr0IyJVKAzMl3IwZtahPi3d8Jv8nUlgZvV1wg+4nHwjKQbTk8clkIG73Y7IjC
         uWxg==
X-Gm-Message-State: AJIora93ffEIxbmL3beq7Z1WDqjzMMQKBBXbUc1HO7o8gfoTgGoITW1Y
        jiDkadxtWb2skz7kszNRRudA+w==
X-Google-Smtp-Source: AGRyM1uN/8i4eHGnd+uhA2y6QQnwxJ3Y2ZudU9uaJ05HuGiqKzyCHRNNIGrg+lxhI3SEWNYf/vR1nw==
X-Received: by 2002:adf:f492:0:b0:21d:89d5:9443 with SMTP id l18-20020adff492000000b0021d89d59443mr2222700wro.201.1657206585084;
        Thu, 07 Jul 2022 08:09:45 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm29122235wmi.29.2022.07.07.08.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 08:09:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add clock-output-names
Date:   Thu,  7 Jul 2022 16:09:33 +0100
Message-Id: <20220707150933.1889371-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
References: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add clock-output-names as optional so that SoCs such as the msm8939 which
have multiple a53 PLLs can latch the appropriate output name in
drivers/clk/qcom/apcs-msm8916.c.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f504652fc0ea2..313efdfb0cafd 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -63,6 +63,12 @@ properties:
       - const: aux
       - const: ref
 
+  clock-output-names:
+    items:
+      - const: a53mux_c0
+      - const: a53mux_c1
+      - const: a53mux_cci
+
 required:
   - compatible
   - reg
-- 
2.36.1

