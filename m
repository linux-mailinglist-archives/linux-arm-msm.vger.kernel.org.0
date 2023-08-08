Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2A07740E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjHHRMY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjHHRLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:11:36 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5883169697
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:04:48 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99357737980so850539866b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510684; x=1692115484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UuNhIPZQtVYzGmtMAw0xH3Mxdy93w7NQpbLuvaKjSg=;
        b=bsXG1fGulGkQJ6slL7CEmEiBxY3vKw/HYFzPk7D7T4p+PSfUPQK8i7tP0luFwvxR/M
         WhUHkaS8lp4afrmexAQW+aXE3Txi/ZGwIf3pB4tzIUlvLzvQG7NgTavfyV4F2u5vO2ZA
         mUFDmb2me11GTbrHuZRNBkMJjXdRo3egLbkH1lQhuIzIvcVJadDlD8/LCSLq7yWCoEgl
         WyetURXfUsEF0T342Ay6ynlTBUYuwjfr6t7MrcYM7H0RULAFfD0ubx7TkEC6avyAbs7l
         I2bZgBAfnbcW7i38X9oq8bGYnCPuInzjBb0xFs+aNwUXxHftmPe/lyYCCDrUMw1XOAR9
         Mzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510684; x=1692115484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UuNhIPZQtVYzGmtMAw0xH3Mxdy93w7NQpbLuvaKjSg=;
        b=HE5ralLgj+nrwUiaf4c4EOjCkrJECUQhso3BQTDozDQGNIgZV2A7iiYso9Xvb2N5iL
         0VWso8T3TkW5J+FARRI/BjcllBJ10de+Cyd7YkBJfIm9nsSuh4lVWZf7p/D98PEoXxeQ
         QkUYEowxd64e2Ww4cgTAlFfIQxu2WHsvdwvN9Wr7hG8bmSlmx3CkEmSVou5iph1vWNAx
         AiU0YGT/w/DczL6HE7QPDKuPbrBtiYABUORWdxcr2bJ5eOlCtYrOcW1T5pnw+U2EAtLt
         pjK969g4mgmytLUJ6kOc4CK3sWI+8uD003/GAlfBoRlwcSKWlf+vNBo+nE2PaLMqKxc3
         nNAQ==
X-Gm-Message-State: AOJu0YwqRmzi+KLecTKOUkYEXn8ZKIPE8L39o8Ei1m1izLmS56M4u/ki
        gs6YsqMSGf10yhUlaYwiK6uAI3jsJxwBI0h37D0=
X-Google-Smtp-Source: AGHT+IHe6NP3MzfgZSWbkR7jxRMoFmcA9NIiePawh4EYEM7Q9mrKbCLB6JP4QQacs26mWD9MoLIIVw==
X-Received: by 2002:ac2:4ece:0:b0:4f8:5604:4b50 with SMTP id p14-20020ac24ece000000b004f856044b50mr7020474lfr.64.1691487899167;
        Tue, 08 Aug 2023 02:44:59 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:46 +0200
Subject: [PATCH v2 6/6] dt-bindings: arm-smmu: Fix MSM8998 clocks
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-6-34273e275c51@linaro.org>
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=2406;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=GiTo3aHVWSJqXeRVvBwFrjMpXiRsIg5liCVx9M1P4EU=;
 b=Nxs8hOuPBNmdHqXrObFj394Ryc0kynWXqn1i40tZ53Cb01Hzw6WwtFi+3X0Jcw4BcgOd603j0
 ZWoh4q6XnKVBZvu54Q3HrIhvJNMsEM/z8rSRfzNPESDS1/k+Iq2OYtg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8998 was abusingly referencing one of the internal bus clocks, that
were recently dropped from Linux (because the original implementation
did not make much sense), circumventing the interconnect framework.

Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 3a31a979709b..cf29ab10501c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -270,6 +270,47 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-smmu-v2
+    then:
+      anyOf:
+        - properties:
+            clock-names:
+              items:
+                - const: bus
+            clocks:
+              items:
+                - description: bus clock required for downstream bus access and for
+                    the smmu ptw
+        - properties:
+            clock-names:
+              items:
+                - const: iface
+                - const: mem
+                - const: mem_iface
+            clocks:
+              items:
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for memory access
+                - description: bus clock required for GPU memory access
+        - properties:
+            clock-names:
+              items:
+                - const: iface-mm
+                - const: iface-smmu
+                - const: bus-smmu
+            clocks:
+              items:
+                - description: interface clock required to access mnoc's registers
+                    through the TCU's programming interface.
+                - description: interface clock required to access smmu's registers
+                    through the TCU's programming interface.
+                - description: bus clock required for the smmu ptw
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,sdm630-smmu-v2
               - qcom,sm6375-smmu-v2
     then:

-- 
2.41.0

