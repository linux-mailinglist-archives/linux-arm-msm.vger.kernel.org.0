Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3D8553F04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 01:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355363AbiFUXei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 19:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355266AbiFUXea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 19:34:30 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D8C30575
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 16:34:24 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i64so14481617pfc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNiBBGtjCK+ZmFTWiJaqByp/lu5YMU+M8mXSHVMyVJw=;
        b=ZwObd0CSO+MLtJB8wKqxSdosHAvmXMCbPRSKofeOUqh1e7CGe+kGO2qxWv2p9k1B7B
         D2XP8nWKsQnjA/bdhaymxK61nIF/9mJXk4qUF1cwzuaZWi0dClahLj4YpOie/jEcmdH4
         ANKE2bTH0uNQj4ex5hzZevgT5lHKEQ/cgsJ5pFUlS5mJqKr2jsHtOkt4Akw2FDY0Bebt
         RE+Nd5LVhyyXf6BIwYezVn3QeWL3joNxCjiVkzMZGLA9bxi63u1NdC67LIfzsOYUWf8b
         P72tcqoXNi4QzoTPhAmhHprPO3mDsBbnpcuibaklq11m7WZrgxgO2ak7+PYsfkDP27DB
         SfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNiBBGtjCK+ZmFTWiJaqByp/lu5YMU+M8mXSHVMyVJw=;
        b=3xAFhaJuHPHHcmy3MSuLiFsd1c906Wr8r7kijveU2GmMo+Pz7K0VXWqUaSewzs3t0y
         KV2hHGXS/jhM7oL9n3A/xUgJm6DJWn1s4uQ0dHkbr97Z+dhN450xfx9oVNZipuPJhMrT
         cQxnpwNRVe51CV7Qmfj1NK/gmM3iLos6rczJeM4v9hJmxri3HzJCvnRUc73Mm1kL4Wbb
         52dosZPbHsg+BMyjU2MzaVI06997HQ8+Yh/f8Ocdr2D26/NS6YmrjB99WzMVavNeTKh8
         ljxONsUecQ/9qn1aEvTx5wtjZu8UB8mYA9U32mcz67jZF++MmTvp4Pw6dcSaAXbPydk6
         ur8g==
X-Gm-Message-State: AJIora+r1lO71ZGxGyvTy+Mt/EBQ3wdK59HkNAjlHn0h/J7ROE8MePjL
        x8uA8YaINd4rXKrt6M7CXdEDhQ==
X-Google-Smtp-Source: AGRyM1s2Nnz+Lp+zR3dX5jvhHc8pmNbz7oQtyNkSD5Ad2DsPSowgA8NjpyNE+oWJTTCY8iEAl5GrZw==
X-Received: by 2002:a63:d57:0:b0:3fd:ac2b:75aa with SMTP id 23-20020a630d57000000b003fdac2b75aamr352867pgn.533.1655854464257;
        Tue, 21 Jun 2022 16:34:24 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm11297873plk.3.2022.06.21.16.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:34:23 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v6 5/6] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Wed, 22 Jun 2022 01:34:11 +0200
Message-Id: <20220621233412.506768-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621233412.506768-1-robert.foss@linaro.org>
References: <20220621233412.506768-1-robert.foss@linaro.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Add SoB - Bjorn

Changes since v3
 - Separate from qcom,dispcc-sm8x50
 - Remove clock-names
 - Make example sm8350 based
 - Changed author to me due to size of changes

Changes since v4
 - Add RB - Rob

Changes since v5
 - Reverted split from dispcc-sm8250
 - Re-added tags from v3


 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..7a8d375e055e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.34.1

