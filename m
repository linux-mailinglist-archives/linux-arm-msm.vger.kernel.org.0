Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28D8695E69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjBNJKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjBNJKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:10:04 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDEC2449F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:08:56 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id qw12so38432349ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQlRVEdqb3xvOh0YbavmZdnZTVv7UAg4IoCftBovVqc=;
        b=nkpCXQ56BxHkEWs0xM2KwhdQDFBBPyxNWzIisqVASibdi8RmNbz+7S3A//hu0rfqgm
         NJHubDaNKd906a2/uWCZdR+yvvJNqEixXTtb+LJMweNmXtVOcjWaOMTyTBjKQYecpUsW
         4YQrlSt3/wkk1g+19rmcSBLkX+ri+AS3CEUsfYc8DbHAQhj5m3064AWI5/ID+VnHXZYh
         H6VEKdNW7wWpJKajcinMLgs80chXciNoPblQbW6m/p2LhZM1KgXFwkPIzDJir392a/PW
         2j2WBtaWwv+8ZtKFkC9SFdLoa6jXiJaBPxX7JLGIJ7sJKDv6y5L9BOd1+Q+7K5OrbLoC
         t28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQlRVEdqb3xvOh0YbavmZdnZTVv7UAg4IoCftBovVqc=;
        b=O5Km929frHDlg/QaRNE6n7k5AFlZVrbNrpcUcBANp7BVPgoWus2GTmSet/2FjaIM7K
         o0UQl2fry4++KQaBt+VPh5ajd3R7Mnntpic5rE6NBMmDJbzmPHeyJMKeZXKt6vUt3K4/
         Yoy5Et+9c05cv6thy/W3IbmDCg3Pbvg7dlMvlXp+Bva36WnwYLFnPJVSw1RcF8MqWZAs
         XqbUKukzUZyrGKVfh67MYN13agiVeLBE3FPdL4pP6OQjS+W4WrPWMHkInMmvkpbaVOIL
         Hs/+e32lfpQn3YUGXHnS65JDD6Xhm02197eGYAwPA72RuctR6gZZTVMiLiiXnYBEF3+l
         UVkA==
X-Gm-Message-State: AO0yUKXMzy23PYPFgAVB+eMYWpXMvsR2IfGeG8GrilWjWCrqEf7A4Q58
        6f6e2aEIvWXD+dlAIJ3E4+dMA19gNtb/+HlY
X-Google-Smtp-Source: AK7set+Fio3/V9C9xU0yVNQs5+EmRzMhhPFr4O3TEgYKhPb6nLL2gLmx8WtclBUSzQsbxVmqi0BxmQ==
X-Received: by 2002:a17:906:1249:b0:88f:5377:1048 with SMTP id u9-20020a170906124900b0088f53771048mr22128328eja.22.1676365734746;
        Tue, 14 Feb 2023 01:08:54 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906040600b008838b040454sm7998110eja.95.2023.02.14.01.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 01:08:54 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: power: supply: pm8941-coincell: Don't require charging properties
Date:   Tue, 14 Feb 2023 10:08:48 +0100
Message-Id: <20230214090849.2186370-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214090849.2186370-1-konrad.dybcio@linaro.org>
References: <20230214090849.2186370-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's fine for these properties to be absent, as the driver doesn't fail
without them and functions with settings inherited from the reset/previous
stage bootloader state.

Fixes: 6c463222a21d ("dt-bindings: power: supply: pm8941-coincell: Convert to DT schema format")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:

- Describe the behaviour when the properties are absent

 .../bindings/power/supply/qcom,pm8941-coincell.yaml  | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
index b7b58aed3f3c..1d2405bea109 100644
--- a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
@@ -28,12 +28,18 @@ properties:
     maxItems: 1
 
   qcom,rset-ohms:
-    description: resistance (in ohms) for current-limiting resistor
+    description: |
+      Resistance (in ohms) for current-limiting resistor. If unspecified,
+      inherit the previous configuration (e.g. from bootloader or hardware
+      default value).
     enum: [ 800, 1200, 1700, 2100 ]
 
   qcom,vset-millivolts:
     $ref: /schemas/types.yaml#/definitions/uint32
-    description: voltage (in millivolts) to apply for charging
+    description: |
+      Voltage (in millivolts) to apply for charging. If unspecified, inherit
+      the previous configuration (e.g. from bootloader or hardware default
+      value).
     enum: [ 2500, 3000, 3100, 3200 ]
 
   qcom,charger-disable:
@@ -43,8 +49,6 @@ properties:
 required:
   - compatible
   - reg
-  - qcom,rset-ohms
-  - qcom,vset-millivolts
 
 additionalProperties: false
 
-- 
2.39.1

