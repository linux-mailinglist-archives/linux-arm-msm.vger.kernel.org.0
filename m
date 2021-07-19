Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FCB3CF013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 01:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354709AbhGSW5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 18:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388274AbhGSUsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 16:48:39 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30DAC0613DE
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 14:25:00 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id w22so13542341ioc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jul 2021 14:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r7IIwcEFnbBJbVXSjVGGdfTr8FW2F9zozHrzizCnu6k=;
        b=jvBTIiql8PFue/rA4X4a5i0OBg/MWU98DiyH2cQFL3yXPuMamFrPc9D3/BAf7qd0o2
         AzECrBNxvgTZ1TxSKR9ja2rgBEWWsa2bi2jafFIvjyi90ko7WIFbpE9aOql4s811XfRW
         PWNxYthe6qX+XNvyPU/DEkUS2P3ktojibjOTP0BD2NvE1HBzYilFue8gSS3UNIPubikx
         +73cwSy+X39VK7FY9vqb3GMvgb2gM1f1LfciCQAnAy4m7oykkTsymP4pzE5IpmIoRdw7
         HIAx/5VaTpcTy1MiIjpUaEfeGgLOlOZQHpn7hAct6K8kqshZ9N0Vv0wtP5m086G5ZOdI
         9OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7IIwcEFnbBJbVXSjVGGdfTr8FW2F9zozHrzizCnu6k=;
        b=h29cjd2VW1VAEZ0NWqvvMbT2kwz/vk6M2aOe9p5bCqf3IoOJn+rHZaLT2i9f5Dm1ya
         fo6tW9AiPexcWpqcFX2NLkuBoLT2JydebOVK0l/F+GAbCItFhdK2RRBtSdzHXeqppMg3
         KHV9YGi+GnvOHogQo8XYbo4RPrXuoqoisDRhAa4sD69DhBr+3E2N3gzkLkdDyIufr6NG
         xxp+qRCEotMVAnIR5jFQdQxZjwjvJk3HR3Gnu5+Qyh2S6Mbapgxpa9eStG7lSmMvQbDT
         bkWZqrX93ZVlI7hYZFzcNjpl4tFfEZ6C2rYAYgSCLgWLj3BZob1gQM2DozkNLdBjtoWM
         Wa3w==
X-Gm-Message-State: AOAM532MpxQZlESBp9MpPliaVCxBsqyhOPE6JFtwowNcY+QRsPo/VWKr
        ksMHC2uplYmcBj29Q96Egy+BEg==
X-Google-Smtp-Source: ABdhPJxjooy5oyUmH2Eg0hJixGIRqk+cFsPWqI+M6jfWjabbRTuqLzKKPdfWMoUBRr9SktiAQv5DIw==
X-Received: by 2002:a02:9626:: with SMTP id c35mr8345598jai.84.1626729900198;
        Mon, 19 Jul 2021 14:25:00 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id f16sm10365634ilc.53.2021.07.19.14.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 14:24:59 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org
Cc:     davem@davemloft.net, kuba@kernel.org, evgreen@chromium.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] dt-bindings: net: qcom,ipa: make imem interconnect optional
Date:   Mon, 19 Jul 2021 16:24:54 -0500
Message-Id: <20210719212456.3176086-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210719212456.3176086-1-elder@linaro.org>
References: <20210719212456.3176086-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some newer SoCs, the interconnect between IPA and SoC internal
memory (imem) is not used.  Reflect this in the binding by moving
the definition of the "imem" interconnect to the end and defining
minItems to be 2 for both the interconnects and interconnect-names
properties.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 .../devicetree/bindings/net/qcom,ipa.yaml      | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index ed88ba4b94df5..4853ab7017bd9 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -87,16 +87,18 @@ properties:
       - const: ipa-setup-ready
 
   interconnects:
+    minItems: 2
     items:
-      - description: Interconnect path between IPA and main memory
-      - description: Interconnect path between IPA and internal memory
-      - description: Interconnect path between IPA and the AP subsystem
+      - description: Path leading to system memory
+      - description: Path between the AP and IPA config space
+      - description: Path leading to internal memory
 
   interconnect-names:
+    minItems: 2
     items:
       - const: memory
-      - const: imem
       - const: config
+      - const: imem
 
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -207,11 +209,11 @@ examples:
 
                 interconnects =
                         <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
-                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
-                        <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
+                        <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>,
+                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>;
                 interconnect-names = "memory",
-                                     "imem",
-                                     "config";
+                                     "config",
+                                     "imem";
 
                 qcom,smem-states = <&ipa_smp2p_out 0>,
                                    <&ipa_smp2p_out 1>;
-- 
2.27.0

