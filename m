Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B53F06BF9CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCRMSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjCRMSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:38 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0303644B
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id bh21-20020a05600c3d1500b003ed1ff06fb0so4826513wmb.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7eN/63SDc85+UDeFHAOu9kRyf47mzqSNvdnHmym3mg=;
        b=O6NJ+FHTsFOHo2N86vNinRnKFtCnLuu07DOCmyb7qpo0E8fESPaId+UmT8irlzjCt6
         xE7lT21LgzkoZNGzdKAyb/EEjhb3nX6w/rLCzzpBM7IHlJbb2rKwpgiol91/5FI/BR06
         hQ+nXmT7AgAr+lFITpgielq1KeYSrsDKrDlDJmG12MgeFO3nScXotHvYiuKWvirsCaJU
         tBZQWSyyCa8ubwYtxikCPDk3iZdQrmwt8oR+v9GPNBt3XFEnf/SMCz3fbqNM+H7vxRxF
         88RDuIr8dU7rvdFVmFui9KdP0nAL81ivg0D2k0QxKDvG/fTP0opHCZJAc7vLWUPXIQwK
         K8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7eN/63SDc85+UDeFHAOu9kRyf47mzqSNvdnHmym3mg=;
        b=Mv4klpRXz4A19tpfcOPIvUxRhPkOjq5p9GOKMM/2T9o5fuREGTHGyn4GKf0+w6MCi4
         1dPycLVYGGDCK+lfmycEAMXBntqxCv3PZ/Qrb7wD3pebgLRsZIlVx4UtXW49HWO5jkm8
         n19ZCeAOyw0xfjkslJJnbB78T5ZcSMI1YaoIo6YaCGTeUq9WK++wJ90gI7PB8B7esXHh
         t41M+/X4qXCY7JXkzwt+n1trLmBzIccdxwbqI+poungA/ynQgchrbWfXsuccg6jjtkQY
         Lm13epsSyHthrfSdxyhi4HGFYGSJO043u6YgiItqh+cuTKkmPr1gj/Y7IFeMQsT5f9xt
         Nvgg==
X-Gm-Message-State: AO0yUKXgmExcy98RrDWrkPCfmIB2R0YAVTaTiOe1tY3lQHqZj7YUvw41
        uT54WXmjP3noLZtqG8WJQz5R2A==
X-Google-Smtp-Source: AK7set8FL0lyXvLO5HO6MR+AkdXI5usib5t+BFb/4ye23swp2uLzequk1OFqv/MMmv4p1VBv0HfIDQ==
X-Received: by 2002:a05:600c:3d95:b0:3eb:5990:aea4 with SMTP id bi21-20020a05600c3d9500b003eb5990aea4mr4767347wmb.12.1679141914422;
        Sat, 18 Mar 2023 05:18:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 02/18] dt-bindings: regulator: qcom,usb-vbus-regulator: Mark regulator-*-microamp required
Date:   Sat, 18 Mar 2023 12:18:12 +0000
Message-Id: <20230318121828.739424-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The VBUS driver needs to know the regulator-min-microamp and
regulator-max-microamp so they should both be marked as required.

regulator.yaml defines those two dependencies so include regulator.yaml.

We need to change from additionalProperties: false to
unevaluatedProperties: false.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/regulator/qcom,usb-vbus-regulator.yaml      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index 7a3b59f836092..f6ecb0f72ad9a 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,6 +14,9 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
+allOf:
+  - $ref: "regulator.yaml#"
+
 properties:
   compatible:
     enum:
@@ -26,8 +29,10 @@ properties:
 required:
   - compatible
   - reg
+  - regulator-min-microamp
+  - regulator-max-microamp
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -37,6 +42,8 @@ examples:
         pm8150b_vbus: usb-vbus-regulator@1100 {
             compatible = "qcom,pm8150b-vbus-reg";
             reg = <0x1100>;
+            regulator-min-microamp = <500000>;
+            regulator-max-microamp = <3000000>;
         };
      };
 ...
-- 
2.39.2

