Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A74D55115C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 09:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239105AbiFTHTp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 03:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239211AbiFTHTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 03:19:43 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30707E0F6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:41 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id e4so10893053ljl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7pwmfrKA1nEipvXRtK0w+R1U8Aqjt9EJ8F+OJp3lpnY=;
        b=QcZ7An7XVkm6jpd0rH5Z1KUeYHeFa7pLag9cDrfnfjAUPPj/+/lS5tZvV9kaJTgfaD
         x2T8og4z+tzE4TOIkG4ML61v8IU7Xl41HCyNhWPw7FmYdd2OLxkgLTgeTQ3EdtJkvXe6
         OWIvRSV27KGpOP9C/+RA0YeX+qNibQGsLEwrCrmXg96LIa9CxzQjNr5YzYRbJHXlxhU1
         r316qunuAbTuVyR/ky3CZuI1cA3Tj9rH66KI1I6soB8Sgsr84fwkzYPQ74QfPB3xTOAa
         CJB9qsFqMf9jZkfjBUu0B4JcsSnI/p1kw1xbJAMWhzLJB3FbaFpwBhSsyj1Nt/MpDPhG
         BBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7pwmfrKA1nEipvXRtK0w+R1U8Aqjt9EJ8F+OJp3lpnY=;
        b=v/k41RsbH1b/wUm7L5mj7jb4oB8dh0/UBQabZ2/wH7j+sOAFpziSMwGB9BO+GNIaf3
         2JFD7qcg9GwHKCidEabIDILKmphLhUGI759KSgYjiOAzeNHlwfDfZWxS3J7d/3fjizUT
         qOg1dMuZ88EAg+S4OLoG9Guuw8c5Rf9nGqFpUFXmvgdQZ4aQrgqEk6sv9tVc1+e3TlaM
         ZcYXC9/wl+wQovowxjl4eXChb3Da08TaFFrmMrmKRK4L+2fR8KR75xfkyacZoAzCIRN+
         4pDbVRV1fKXk/i+/BoSmlQuzs6xm0LJcp1P7biPrhtmSjV6AmzZJNjwnPK/app49Jo9j
         CkhQ==
X-Gm-Message-State: AJIora/61+QOtpKBOVzuLYZtP07TghHN27Vonv1XfGEHpz+e+b+YRO9k
        RmYopVynUvpq65sNqfj1gEnFLg==
X-Google-Smtp-Source: AGRyM1sQbOyUovrlEQlC7AXidzGW7zm6/vpgLzb2lC1iQD5OnPyZCOziBdKinNwpmE4P9myYOhyi7Q==
X-Received: by 2002:a2e:1453:0:b0:25a:725a:db92 with SMTP id 19-20020a2e1453000000b0025a725adb92mr624129lju.483.1655709579582;
        Mon, 20 Jun 2022 00:19:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t16-20020a195f10000000b004795bcfe953sm1649775lfb.214.2022.06.20.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 00:19:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: qcom,gcc-msm8996: add more GCC clock sources
Date:   Mon, 20 Jun 2022 10:19:33 +0300
Message-Id: <20220620071936.1558906-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
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

Add additional GCC clock sources. This includes PCIe and USB PIPE and
UFS symbol clocks.

Fixes: 2a8aa18c1131 ("dt-bindings: clk: qcom: Fix self-validation, split, and clean cruft")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8996.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
index 70f7d3101bd3..dfc5165db9f1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
@@ -22,16 +22,32 @@ properties:
     const: qcom,gcc-msm8996
 
   clocks:
+    minItems: 3
     items:
       - description: XO source
       - description: Second XO source
       - description: Sleep clock source
+      - description: PCIe 0 PIPE clock (optional)
+      - description: PCIe 1 PIPE clock (optional)
+      - description: PCIe 2 PIPE clock (optional)
+      - description: USB3 PIPE clock (optional)
+      - description: UFS RX symbol 0 clock (optional)
+      - description: UFS RX symbol 1 clock (optional)
+      - description: UFS TX symbol 0 clock (optional)
 
   clock-names:
+    minItems: 3
     items:
       - const: cxo
       - const: cxo2
       - const: sleep_clk
+      - const: pcie_0_pipe_clk_src
+      - const: pcie_1_pipe_clk_src
+      - const: pcie_2_pipe_clk_src
+      - const: usb3_phy_pipe_clk_src
+      - const: ufs_rx_symbol_0_clk_src
+      - const: ufs_rx_symbol_1_clk_src
+      - const: ufs_tx_symbol_0_clk_src
 
 required:
   - compatible
-- 
2.35.1

