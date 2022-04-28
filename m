Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5BD95132B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 13:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345693AbiD1Low (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 07:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243679AbiD1Loq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 07:44:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F908633B1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:41:18 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu29so8183449lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRWaeEiW/QVUz3fZlrexDEL8l27tmCvqK5tlRWI308w=;
        b=itCxdb77MCR/EjKYnX5efwXx0Y88f8ihVWdSauBaK+99KBjk/JUTR8J4OHTSeYnG9L
         WNmiZBMO9vCCfTuSiDj8CG50aJwQuBBAw17LtBKa2pJwatmfmd8BIes63cvUi6jW+8mi
         xxYWlaUftwVcysWbFg+vlybFSuVoaHXoeaPrvLDN2HRpsCT205yxlWK9WMUg1udGR1bl
         i3lhnIdHmkRyNtbA1eizCjGl0xNC99xewVuPdsIgO3UGjBk+09zvX4kHPyQo2gS1QGTR
         4HVv9cbOXbbQ6iMjzO2SrTQ/i7gGyaONQ31BcYW+Lv1CaFGjMyAUTviFKnYOBNcYpEdL
         HFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRWaeEiW/QVUz3fZlrexDEL8l27tmCvqK5tlRWI308w=;
        b=a4bCxz0x/OnzUxc/QrXUuqV0THrYIY+7dg9aQB8YYi0O7BiPNLATuia8D1nFIj5dwN
         s8sCip6nihzYEwfGBwAxLW8uFMFbE/iCa76CZx36F003UVF3shsj4e7SrBxaYRTkdwfH
         WuL40QUUH+t7pRtIwDXRPwIqrDLSBLMqQJWdxl7uwrRBoJCGUQHCf2EGK2PSZuhyX7ck
         FZ15j5vUn/vPl+xmKDCcHhpY6c6lcOJobB3WiKiHyPclkgJ08/aP3M26aR89HHE4oMJ5
         JTlOsA2R30kgMlQgC+rcFaGr0hX0C2Iu5Q+uf0t1PWA7HlXaaUXvkDHbftAhTeu2KzQr
         fSBw==
X-Gm-Message-State: AOAM531tAEnyXO//5i+DMf/7FNg7N56eqc/X5L4a8CT0G6F9uUcgiLlM
        3EyiovQrJxmysbmkCKd1r7C9tw==
X-Google-Smtp-Source: ABdhPJweIETiQxq/8CVvHAimLaUu0fN6GR7HwW0uC5Scq7Edc6ELZYP+eSICLGb7GQaNRfAc6Py45A==
X-Received: by 2002:a05:6512:25a4:b0:471:fbe9:8893 with SMTP id bf36-20020a05651225a400b00471fbe98893mr17641999lfb.147.1651146076757;
        Thu, 28 Apr 2022 04:41:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu39-20020a05651216a700b004484a8cf5f8sm2338790lfb.302.2022.04.28.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 04:41:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/8] dt-bindings: pci/qcom,pcie: resets are not defined for msm8996
Date:   Thu, 28 Apr 2022 14:41:07 +0300
Message-Id: <20220428114113.3411536-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428114113.3411536-1-dmitry.baryshkov@linaro.org>
References: <20220428114113.3411536-1-dmitry.baryshkov@linaro.org>
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

On MSM8996/APQ8096 platforms the PCIe controller doesn't have any
resets. So move the requirement stance under the corresponding if
condition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/pci/qcom,pcie.yaml         | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 16f765e96128..ce4f53cdaba0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -114,8 +114,6 @@ required:
   - interrupt-map
   - clocks
   - clock-names
-  - resets
-  - reset-names
 
 allOf:
   - $ref: /schemas/pci/pci-bus.yaml#
@@ -504,6 +502,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      not:
+        properties:
+          compatibles:
+            contains:
+              enum:
+                - qcom,pcie-msm8996
+    then:
+      required:
+        - resets
+        - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

