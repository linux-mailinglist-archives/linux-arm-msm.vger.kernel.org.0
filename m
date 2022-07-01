Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6102A562CF3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 09:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbiGAHrQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 03:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiGAHrO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 03:47:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B6414D01
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 00:47:12 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id mf9so2630086ejb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m9LluxtMdj10AOwxO8dQarqqYheoPawjt1DHgDLPduA=;
        b=NXEGXj+8sJof4bqVatqLMyyQ/gW2KnQk0bLezkssNXsLrJ3hwqPCqsYkAxJ17Qmd3c
         1YcuSw3QkJm05feG1+O6aNvVoy/Nq4x6+vbIjeW8bMJdB9ad4SOpBhBMYv15YssZFaXh
         K6/B7KPDkaSyl5/vPtckTq5fAxA1+h37e9Qiw8pCap13G5UwjbrlNr0Ysu1xYr+EmiwQ
         Kr/Ptrs+Dz5TrTpKZLFrTR6ah4kmjDOe2rU1eJQYYKW7+NcQPCWaMqnkMLbC4lELe6uB
         qnk5sSxFjakYjEbLNwpzDARiA62yVD0Y6vkF2lDUv9G9yVi8Racmh4MPlqXC8CkD+M2y
         wfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m9LluxtMdj10AOwxO8dQarqqYheoPawjt1DHgDLPduA=;
        b=W2fQ38QwP8adpP2WVvc2QX2r8eLeMcOscsBxolMV5w/ZY3d4nn75NedTCSKsXYS5eZ
         2/jU2mOBA92WmK0YlvQUfN/bm0MesZ2pKOncGsny05hE5qRkw7Q1/zgKyqbyNFV3xA/z
         ppaRmMRaUMCLBEkXB4CPt48NSILQijPbhqw3XPr+46XRf0Wt8i/Bh6p2jYoiVNNkRSY6
         o3HHNuOW3mNSnykk2lpeEXyY9OJ3Rb3JGhc+vEb+eKZLMgvQICkTakanCE8qp2TzuhvA
         w6/PFxkSEhVIieNY/HLoG2UkG/Ht4wJ4isLDfG2LklmZJHQB8g210JfvCbaXTX9uzc+K
         VpzA==
X-Gm-Message-State: AJIora87zUoG0DaVMbshJtv3IE0AQHSSNhEdM+dSxmJfHUnICD9zQYIf
        3hdCYfoI62B/qG6yZmR9pat97w==
X-Google-Smtp-Source: AGRyM1vPSlGFlyi4PfcCGNONdQN0a8R4BJ8wunE9JqDWhsdlm1U3EDjpawSYW8EGgSrBIneNdaN6PQ==
X-Received: by 2002:a17:907:d17:b0:726:a3be:bba4 with SMTP id gn23-20020a1709070d1700b00726a3bebba4mr12903075ejc.584.1656661631244;
        Fri, 01 Jul 2022 00:47:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u5-20020a170906068500b00703671ebe65sm9992497ejb.198.2022.07.01.00.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 00:47:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Subject: [PATCH] dt-bindings: qcom: readme: document preferred compatible naming
Date:   Fri,  1 Jul 2022 09:46:59 +0200
Message-Id: <20220701074659.12680-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Compatibles can come in two formats.  Either "vendor,ip-soc" or
"vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
readme file documenting preferred policy.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Alex Elder <elder@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/soc/qcom/README.rst      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/README.rst

diff --git a/Documentation/devicetree/bindings/soc/qcom/README.rst b/Documentation/devicetree/bindings/soc/qcom/README.rst
new file mode 100644
index 000000000000..322b329ac7c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/README.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+Qualcomm SoC compatibles naming convention
+==========================================
+1. When adding new compatibles in new bindings, use the format:
+   ::
+
+     qcom,SoC-IP
+
+   For example:
+   ::
+
+     qcom,sdm845-llcc-bwmon
+
+2. When adding new compatibles to existing bindings, use the format
+   in the existing binding, even if it contradicts the above.
-- 
2.34.1

