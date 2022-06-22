Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A40556F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 01:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377345AbiFVX3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 19:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376762AbiFVX3D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 19:29:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30AD424A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:29:01 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id dw10-20020a17090b094a00b001ed00a16eb4so894069pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pmY3BQeKr6HNZamJdk1pXbKYfHfWmqktvBcsQ334LDY=;
        b=ei6RTPZ9vH8DnF9G3PzTLop0ewfGFU+23vFIWb/JTqsVuaRsiNKUg18nd2RATOjyv4
         ThKjrjGyiTwUB/rZCHdslMD8wamkoDYmXS9GZGqKCNAFo41w/Ll1XRxiyiZrQaBz6RxB
         HSG8/Uqyz5UjETN7k/Dmr+2N+mefCv68mE+L3iWA62YlEiW3QLxIoWGkjFWgK8eIbJgF
         f3kCsf6JV84VqTw/aH9i3cfw8OUGxZrW9SpfRYBngoIVQNVtQlt9iFYdFbrijyYm5jWZ
         clVCiy4srX+mFkVZg33d9MViJAPLs1zAF0+0kSC7thkYn6XdGB9jX6e01hMQxTWgZnr/
         ItDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmY3BQeKr6HNZamJdk1pXbKYfHfWmqktvBcsQ334LDY=;
        b=nz6MdAWKIwbg5+UPwzdULtENLpY7FVVtbEfx5qboiGg/xfXmSF9AGXFZF31rbnSgqt
         c3kfYbDrvUv9MlROzMJFPzmT+NmosELSJ+oZnyqASNSj0nSFnwUGelnJKXo/L6kO/dyS
         eV8zRuwH0Cv1lw+Q9tsyCecXU6WkLo2czkSGg+JItpGbjEB+7f8T9r0YvC8WTBeNJOzc
         N2YVi89SM0ZCc+Y3D+jbWzhr0+D338le2OPCrxN3DZpQrI6Acm+AwGeqDyMonovuMOgt
         p85BdDRiJPGajT3nK70Xw9LNKPiLg/2oOCVr32HVZ8IXaWj48Sg11bVuUMgzkB8Y5sOp
         EiCw==
X-Gm-Message-State: AJIora+Bq1kMk7Gvib6qgOF7iJ2HlicuqLUyrenaj7bq338E+QT9k6ml
        TNSIP2AL8SzLVFS3PJc6ha2Pkw==
X-Google-Smtp-Source: AGRyM1vN3xfnz9Nx4yEi9yMlLNM4FNrHnm75NNKNj02YiMc9gRXLTOFU8gkF6GNx6+fluTT9yEf/PA==
X-Received: by 2002:a17:902:ccc1:b0:168:d8ce:4a66 with SMTP id z1-20020a170902ccc100b00168d8ce4a66mr35676949ple.160.1655940541313;
        Wed, 22 Jun 2022 16:29:01 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f70200b001622c377c3esm13297863plo.117.2022.06.22.16.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 16:29:01 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v7 5/6] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Thu, 23 Jun 2022 01:28:45 +0200
Message-Id: <20220622232846.852771-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622232846.852771-1-robert.foss@linaro.org>
References: <20220622232846.852771-1-robert.foss@linaro.org>
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

