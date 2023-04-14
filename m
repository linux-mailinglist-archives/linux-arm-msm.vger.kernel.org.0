Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD72C6E2255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 13:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjDNLh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 07:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjDNLhY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 07:37:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8D47D94
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 04:37:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id q26so10772619lfe.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681472241; x=1684064241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjBdsofLs3+4G8st7nvJWY7fIQpctrGr3PE8MEm6BzQ=;
        b=hzBrlhIvvN0RTsEhtWNx+QObaZS+HtMR7hvASL5X7M4Cka95Zh5IcSJ9AHEeqWuTbe
         gahQC08KkM7RGtu2FyPu7TZ4/XJLl6+ts3mraEf2g9mqKvavi2z46+eRA7LG/N8T+ByF
         41uiuEFyGE4bNjJyHXfhDOBJOe1DZWbpYzNU/+0aoopz0KpwplaUi3dwqcGst/Js8/cy
         uVPM9GToWGAiElnqsuQtjY3o+Bgbc7qB4R/5fsODUttHg2WrduNW5+6XZGzEJG32a3WN
         bskJFl6oIsh9sh6MCnEJPmA1dbJToIIvmuQXv/JaCG7wZCKGI5ewvQLygaI9CKq8L6Lt
         XBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681472241; x=1684064241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pjBdsofLs3+4G8st7nvJWY7fIQpctrGr3PE8MEm6BzQ=;
        b=AId10CQnRFM9hO9XhL+Zp9yojQvOyhd25c0lT948VyffriRD8SHQ625tbwcKt7SMcU
         sNpowVirYBty75/tlxiiMBAifYtebwGU+ee6TSgr8YgNcuubw+1vIilfGKpimlbEXjyZ
         z0szO5bwRSnb8RVR+IyxwyHKEENSGY4Ef0FEC3//9oCGKEd5qepmvN9VC6f9NNWzUqe9
         Bjxebn2WzcdG5pY6vuYSXvHNIAy5YOm0+3NmEjoqz5BB0p8OrzSjO+wHrzra/rE1JVfq
         Y10Y3VROooLPzZ0AtTHHfF1mJhQXjEebtHEnjtwjFAycKa6/MNj4qeZUGgQeKYati1Ml
         plYA==
X-Gm-Message-State: AAQBX9ewDzJuhbi5b4BkX4SjN6imvNIujVZFajfcVPgEln/NWTcv42Wa
        kKuINjX6lkXR1mtde6liEml7BA==
X-Google-Smtp-Source: AKy350a8UFvi0ALlRJcb1lA0q+2SLkQixgXy3apO9rO+ZLS1exRSo+TH5mffAezgjNgDDuSuLyrTFg==
X-Received: by 2002:a05:6512:511:b0:4eb:4160:7ca9 with SMTP id o17-20020a056512051100b004eb41607ca9mr1500868lfb.16.1681472240817;
        Fri, 14 Apr 2023 04:37:20 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id y5-20020ac24e65000000b004ec83bc3e43sm756946lfs.192.2023.04.14.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:37:20 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 14 Apr 2023 13:37:17 +0200
Subject: [PATCH v3 1/2] dt-bindings: soc: qcom: Add RPM Master stats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230405-topic-master_stats-v3-1-2cb2ba4f2092@linaro.org>
References: <20230405-topic-master_stats-v3-0-2cb2ba4f2092@linaro.org>
In-Reply-To: <20230405-topic-master_stats-v3-0-2cb2ba4f2092@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681472238; l=2174;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TH1zgnCa8zRbU3KMG+EVZMt/V85Or/9zrfIZNwaDzLA=;
 b=P45AxPiiNgpI9Zd/uzJUdSIwikCqiN0AsWEGmaeP0EgoKO/c4S8+MZiWRWa8DXYOruEbYAFvNtT5
 cM+ZFzqOBJNDIeUrg17h1Su9k8HVu9S1lnBNSncGlZSV9zxlPY/t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPM MSG RAM contains per-RPM-master (e.g. APPS, ADSP etc.) sleep
statistics. They let one assess which core is actively preventing the
system from entering a true low-power mode.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/soc/qcom/qcom,rpm-master-stats.yaml   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml
new file mode 100644
index 000000000000..d7e58cbd3344
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,rpm-master-stats.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,rpm-master-stats.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. (QTI) RPM Master Stats
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+description:
+  Per-RPM-Master (e.g. APSS, ADSP, etc.) sleep statistics.
+
+properties:
+  compatible:
+    const: qcom,rpm-master-stats
+
+  qcom,rpm-msg-ram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to an RPM MSG RAM slice containing the master stats
+    minItems: 1
+    maxItems: 5
+
+  qcom,master-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: RPM Master name
+    minItems: 1
+    maxItems: 5
+
+required:
+  - compatible
+  - qcom,rpm-msg-ram
+  - qcom,master-names
+
+additionalProperties: false
+
+examples:
+  - |
+    stats {
+      compatible = "qcom,rpm-master-stats";
+      qcom,rpm-msg-ram = <&apss_master_stats>,
+                         <&mpss_master_stats>,
+                         <&adsp_master_stats>,
+                         <&cdsp_master_stats>,
+                         <&tz_master_stats>;
+      qcom,master-names = "APSS",
+                          "MPSS",
+                          "ADSP",
+                          "CDSP",
+                          "TZ";
+    };
+...

-- 
2.40.0

