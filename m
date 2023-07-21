Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3413A75C86C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jul 2023 15:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjGUNy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jul 2023 09:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjGUNyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jul 2023 09:54:25 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF06C2D4D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 06:54:23 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b7441bfa9eso25393451fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 06:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689947662; x=1690552462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VLbg2b/AEZY+CpuEE45WzrxrUPycHTxVLLWXFR6z5c=;
        b=rYnvfj929aqdUDB2SRfkoyM5MWZZuy1qjxUfTZZN1bV+c2CwLWJOcVAtQmOykgORek
         eZd/ZOKrJci+JHABfGoT1L9FroACMh4QzcQRQAkOx86yDiZBSGxKWZ1DwiC07WrkujQ9
         F87+5cQbxbtzi9ZGPkNpVz/YfYzp1YE4/QnnxR14ivN7N0vy45YlIN2C832cvdGLqR6S
         7/aDORKb+G4hMSuQ4/mxgV6q5H48XI3P/PFFK5TBzjvkXFkM3KWvEczdNlmveFThD8Fl
         1Y/220Nvu9v9rhmEkgucqsdwLxdVXJh3J0/ijDqI5L9LQ1ixevvkUrSjq/nOzz86X2Sr
         kFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689947662; x=1690552462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VLbg2b/AEZY+CpuEE45WzrxrUPycHTxVLLWXFR6z5c=;
        b=GW0/FonAY78sZ5bQc8SFL4G2LfgSuxYeFtyGhwmISW2vl4utq1vAS0hx6vD8XU0OvL
         hzSQ/P4V41mZ3McsGn6ElEPlrcUwiorMPtD++4RfRx62u2EVwJhoyxpMRVzmDv+m2/9s
         76v3/qzylFFWdd319s7XwciCzMuFRGFYH1yqRXPKhcwWnyJNT9Nlna9PlC72zbr+WiVE
         drCov8IZK9F/sp7qMbFwo3NF0zT1M+uMWil78k2UbTfnurkLODnCqI1Y3cPLW/HtGbZs
         LxDcMF5jmWVPvjNGgBWM6pW58DvMwzezwa9tTvYO4xCI/BLWMajStxuhhRQvXMaWkJCf
         uhew==
X-Gm-Message-State: ABy/qLZ7JsVyleVV0OcEb2y3648XX4B2em2fxTpsPYTzRHh3kcvv8G+6
        wl1i3VjDEqJquIGV6pvHcNwNnw==
X-Google-Smtp-Source: APBJJlGYtxhxf5JQq0t2V9uDd+Q9B+uEyPzcSmXbhylhG6MFUiKS+aQLEnqouyH+/dZG6ITVTsP/aA==
X-Received: by 2002:a2e:b80e:0:b0:2b6:fdae:903a with SMTP id u14-20020a2eb80e000000b002b6fdae903amr2025525ljo.5.1689947661752;
        Fri, 21 Jul 2023 06:54:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id k21-20020a2e92d5000000b002b6ad323248sm953838ljh.10.2023.07.21.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:54:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Jul 2023 15:54:12 +0200
Subject: [PATCH 2/7] dt-bindings: interconnect: qcom: qcm2290: Remove RPM
 bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-icc_bindings-v1-2-93e2bc728fb7@linaro.org>
References: <20230721-topic-icc_bindings-v1-0-93e2bc728fb7@linaro.org>
In-Reply-To: <20230721-topic-icc_bindings-v1-0-93e2bc728fb7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689947656; l=3313;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BjBFVhQOBh5m/NVyCaKDcFbNtwPK65Qu/CW9fU3ga2k=;
 b=2i4+8jv+GvAD8/EyZiI8TwCpNDtsJVcooMbSRUnvNtfXn9m6sEbwqMd2I7Ulou9l/KvLaXDLO
 H8/5ChQIGQGAF8W3b80W/SDcs0S4DbvWZERInCEzKGVtZYzCaLOHnmL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the recent reshuffling, bus clocks are no longer exposed as RPM
clocks. Remove the old description.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/interconnect/qcom,qcm2290.yaml        | 42 ----------------------
 1 file changed, 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
index edee78c456b7..d2a36bec97c2 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,qcm2290.yaml
@@ -23,16 +23,6 @@ properties:
       - qcom,qcm2290-cnoc
       - qcom,qcm2290-snoc
 
-  clock-names:
-    items:
-      - const: bus
-      - const: bus_a
-
-  clocks:
-    items:
-      - description: Bus Clock
-      - description: Bus A Clock
-
 # Child node's properties
 patternProperties:
   '^interconnect-[a-z0-9]+$':
@@ -51,29 +41,15 @@ patternProperties:
       '#interconnect-cells':
         const: 1
 
-      clock-names:
-        items:
-          - const: bus
-          - const: bus_a
-
-      clocks:
-        items:
-          - description: Bus Clock
-          - description: Bus A Clock
-
     required:
       - compatible
       - '#interconnect-cells'
-      - clock-names
-      - clocks
 
     additionalProperties: false
 
 required:
   - compatible
   - reg
-  - clock-names
-  - clocks
 
 unevaluatedProperties: false
 
@@ -85,32 +61,20 @@ examples:
         compatible = "qcom,qcm2290-snoc";
         reg = <0x01880000 0x60200>;
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-                 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 
         qup_virt: interconnect-qup {
             compatible = "qcom,qcm2290-qup-virt";
             #interconnect-cells = <1>;
-            clock-names = "bus", "bus_a";
-            clocks = <&rpmcc RPM_SMD_QUP_CLK>,
-                     <&rpmcc RPM_SMD_QUP_A_CLK>;
         };
 
         mmnrt_virt: interconnect-mmnrt {
             compatible = "qcom,qcm2290-mmnrt-virt";
             #interconnect-cells = <1>;
-            clock-names = "bus", "bus_a";
-            clocks = <&rpmcc RPM_SMD_MMNRT_CLK>,
-                     <&rpmcc RPM_SMD_MMNRT_A_CLK>;
         };
 
         mmrt_virt: interconnect-mmrt {
             compatible = "qcom,qcm2290-mmrt-virt";
             #interconnect-cells = <1>;
-            clock-names = "bus", "bus_a";
-            clocks = <&rpmcc RPM_SMD_MMRT_CLK>,
-                     <&rpmcc RPM_SMD_MMRT_A_CLK>;
         };
     };
 
@@ -118,16 +82,10 @@ examples:
         compatible = "qcom,qcm2290-cnoc";
         reg = <0x01900000 0x8200>;
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
-                 <&rpmcc RPM_SMD_CNOC_A_CLK>;
     };
 
     bimc: interconnect@4480000 {
         compatible = "qcom,qcm2290-bimc";
         reg = <0x04480000 0x80000>;
         #interconnect-cells = <1>;
-        clock-names = "bus", "bus_a";
-        clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-                 <&rpmcc RPM_SMD_BIMC_A_CLK>;
     };

-- 
2.41.0

