Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729946F30AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232496AbjEAML0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbjEAMLY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:11:24 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6834310E9
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:11:22 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so13428045e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682943081; x=1685535081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=ndmGS2zTX6/UrLRGvttVZN/6N0dPUnIOAIABIbwZO1djcJ6YLp0UlJm/ruGw8VpY0e
         6tDU3ocf1151nkqesHTEkxxi9WWUO9yDDeR63HO5CEaLsW0tA9OkGNDgkKZzAR0JupTa
         O3/TMCvgcH7uK38BjAPk7guPSsDcdT2i5lcIUI+PQ+BPIqZBtW9WjrSJIeQrKNw0y45M
         AAiYeJwS2AWAUgqM+RNhXer0A5Gv1bAKxgaXtugH+oAHTVs8UxfwRL9c4jBNs3/5P1/Q
         TBHcAG6mTdBEjSAjeCzm86IG/4ZeDXiu9gk/aa9/si1CdjIC4P+8fbStobfwIYmA4lRY
         9/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682943081; x=1685535081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ic2PzyBJMTnrdn9lavuhttp1+67QyuBjwBrtru82DN8=;
        b=bvZEm1gtWze2q3UBbv69A/9SCxKo01ZOkcwuPY8PLYrlb4cvZ3lQXeLXC6mu5al2qw
         yiRRVWOLMwhyLIGrVYUtqNQzPsQTym7Da8freU7WiDH67N0v1HetGKNVr/iHMfZl1yv7
         S2KRqmElU9WmZqr3LtetlquW14uj6x7TtxlE3xoMfhTxQISHkKNS8Ih64hHaNo5puPKG
         D96hcmtGTYCmVH1cFPS/HT7qKH+u4VuaPQ5KR6g23jeXlLD6dBBLQo5fA2qzSWodHqGc
         wTMmVFEoWtSIM/diw+yGPzn20B6Jg1A7XkCx1uu3OCzWLKpdfwdPB0GeAgq8ubMO3sry
         mo1w==
X-Gm-Message-State: AC+VfDwd+iDN4b3KhtrdfMgzxStjBmCrPsDpCulwI5ZXJc+5H9TYdO2h
        pw/4g3cXWWAdpk9HXjkw+xd2ug==
X-Google-Smtp-Source: ACHHUZ7BPK/Tow2sk6HXe1GLumdhZGr99gDu0ADtovEd7X7a9BFlcwwADln2hVANB78SHU2mz1Bnzw==
X-Received: by 2002:a1c:7317:0:b0:3f1:89a2:e705 with SMTP id d23-20020a1c7317000000b003f189a2e705mr9595113wmb.0.1682943080977;
        Mon, 01 May 2023 05:11:20 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b003ee443bf0c7sm35856634wms.16.2023.05.01.05.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 05:11:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 06/13] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Mon,  1 May 2023 13:11:04 +0100
Message-Id: <20230501121111.1058190-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
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

Add the PMIC Type-C port driver to the list of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 36de335a33aa8..6e6f562a915be 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -158,6 +158,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^typec@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-- 
2.39.2

