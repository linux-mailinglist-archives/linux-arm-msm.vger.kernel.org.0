Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0EA64F60D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiLQAXc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiLQAXD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:03 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7CED134
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:34 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b3so5922377lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWDEXJzpxC4huaA0slWAfF/NQqnpK+eVzsXesechI68=;
        b=ZM+yJDsO4PF6SLgMkRXKqOLBmkr4aePNEveh3MLwWck2DRedVIehlz+t321+Per36C
         Q4Gb7s/U5GmJ1xkxycHgLZdBQn32HrV3PXIQD7vTZEwkQVmjGO6H7s5I724DnIdLzsXX
         cdQNc2i72/DW7QV8PjUOdqXgQJEvJnHj2I97KnoVeTrTeUrxqeBbi/SsaFxs6Ihv+4b4
         tym+YGhIgfULSnP15kgZ8PIeK8lHVMjol1WuAgjkUkisA3fEY8wBezj3OzdxdKwRgVbw
         aXTWsrPEHvgdRWXsKH/NrE4p+gfv9P4mv0+C9LuxXrGuV+ddt/g9+WraqyFDKEBlRmxw
         PEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWDEXJzpxC4huaA0slWAfF/NQqnpK+eVzsXesechI68=;
        b=CaBQxqE1aVmN2SKDt9qpcgUcpWOGWvbiue7T6DfwfP2RvZfPlufPhEAUtokAl/m+9G
         kn9d7XWwNXwA9p/s5+deYzj9b7BBlm+YzPEtncEuSLygoQhga5bMt+puIkE/AE+JlnCq
         dvhvQh3Q22Fv2kUB3AZokgMqoYx+cmdhLHnqjT7qyy3NzhWmNK8i+ZekczdTW1H7CFrb
         0Yw0TzSArmsDl3jyeJbl/K5C+qu/DQ2AutM8VaZvdfShBHbjSTtA4L8S7BmQnO32FttW
         Qq+IwBjhbQa6XUouES+85CdmM9d5Be7kQGdJ0t5C68CMF57Ovsg7ix+SgwJ248npzvkq
         qjVw==
X-Gm-Message-State: ANoB5pm3NbkyzUpYT5U/H2e7tIOLR/IQdMYv7rxUrEaTZ6Fqp+HvuKCS
        3wIX8flbFzjZOL3SiqGqUgdA9w==
X-Google-Smtp-Source: AA0mqf6L/thwkt+x+ppQjT9ni0s1uXIDIr5UKDKwpKCb2/rgfqzuayJaDX3ZCrQqSwl1nvqP1vxo8g==
X-Received: by 2002:a19:6719:0:b0:4b5:7374:90a4 with SMTP id b25-20020a196719000000b004b5737490a4mr8947691lfc.49.1671236252968;
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/15] dt-bindings: clock: qcom: gcc-qcs404: switch to gcc.yaml
Date:   Sat, 17 Dec 2022 02:17:17 +0200
Message-Id: <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
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

Now as the gcc-qcs404 gained support for GDSC and requires using
the #power-domain-cells property, switch the qcom,gcc-qcs404.yaml schema
to use common gcc.yaml.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcs404.yaml       | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index dca5775f79a4..b70901e0d5cf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -20,26 +20,13 @@ properties:
   compatible:
     const: qcom,gcc-qcs404
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -48,5 +35,6 @@ examples:
       reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
+      #power-domain-cells = <1>;
     };
 ...
-- 
2.35.1

