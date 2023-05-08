Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2EF96FB288
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbjEHOX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbjEHOX1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3A01FF6
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:23 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f19afc4fd8so29099325e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555802; x=1686147802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=I/27knbkC+8cyh09EvxDxcYg5VSh/Z9C+EWY4oze5Ute3pGEkX3M3nUXzBHTai6xSg
         uqh1XOzpMZCyY2ugyTa/BjUExjJdYlG9wiD9knGziGZmfmuF3aCBaQ8BC2/dUWhJq6MJ
         GwAnRuB5SQ/Ie8b3aRSvG8ZwB2t1n2p9khF7fTsk+6EHl3tOst7Mx0YW+wEQ/VeJ/t5A
         zeyDM/hsXwfWErXKnsMvdhT9yisEIXExqDXh9N1EPbjn0d7LhGBU3LYWJU2AqpywJCHy
         4Ly6HiXtXoB5xao/fIUkX6kj7GsJZXosyPEq3HWxJLc9tr9Gfi62f6IC8xzXd2AFi+/u
         mPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555802; x=1686147802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lSyNZ2HtWZEUWBo+n5QAmOJQC6AAMQbbNN6fuawseI=;
        b=lv4IOboOi+8dRICDjxqrS4spQWsEds0pfR9AqT+p0Z++eWk4mwotJcYYpJL878DC8y
         1oOj9qF0aQTNimHqqGkeflYuBtNfO8POs5ILhIWpTgPU+MxBa1SvRcRXF1/JM0r1W1O9
         27u9vUfQxqCZ7hf8S70ad+G/bbUjw/YY5m4iiTQpTpsikU0vUI83xHJpaxF6x50oTIy3
         5P9s3PBwMj/5NR33UOvJgsmSw9OtbUcDVBqrxVcghk5Rg5nl37F9nxZzuBJhDGZ1tbw4
         gI+g5tmrlpjmCEk92RFymQrqtbenvyg01JZApkWqpYKQGKYJq9o8OCgfkF+9oEdsyHMy
         9OqA==
X-Gm-Message-State: AC+VfDxfQefVB6f5rZBHwjnQ+15M4O8zQDeRNrxz4nkQlwWFfLnmgb5y
        7cL/tGGS0kPoMBauduiNh8crDQ==
X-Google-Smtp-Source: ACHHUZ6u4+NYFZLp7vzZNTbrYZeZr+T2vFz6juAgBQ97Y4NJ320G2xqBHa/usyck+Pz+8zOSPnyByw==
X-Received: by 2002:a1c:7519:0:b0:3f4:2452:9666 with SMTP id o25-20020a1c7519000000b003f424529666mr2554114wmc.40.1683555801905;
        Mon, 08 May 2023 07:23:21 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:21 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 03/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add orientation-switch as optional
Date:   Mon,  8 May 2023 15:22:58 +0100
Message-Id: <20230508142308.1656410-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
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

orientation-switch it the standard declaration to inform the Type-C mux
layer that a remote-endpoint is capable of processing orientation change
messages.

Add as an optional since not all versions of the dp-phy currently support
the orientation-switch.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 0ef2c9b9d4669..d307343388888 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -61,6 +61,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
   resets:
     items:
       - description: reset of phy block.
@@ -251,6 +255,8 @@ examples:
         vdda-phy-supply = <&vdda_usb2_ss_1p2>;
         vdda-pll-supply = <&vdda_usb2_ss_core>;
 
+        orientation-switch;
+
         usb3-phy@200 {
             reg = <0x200 0x128>,
                   <0x400 0x200>,
-- 
2.39.2

