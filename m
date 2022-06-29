Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D77CB55FEDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 13:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiF2LkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 07:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbiF2LkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 07:40:17 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668C63EF30
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 04:40:16 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id n1so21996164wrg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 04:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e12zOkbSl/TTgIy5byX+f+5dgcezW3bwpD9ZmWTyAuQ=;
        b=NnBWNG44+SIlVbLxBipqsu96uM69+jGagVwRuG1a5sKywjFPz4bc6Sz9Yp2FwsCKTG
         SS+3V6f47hyyDX1jUlIfUXWShQFnp0mz7BT7CHsM9c8lZ2fqaAx98iET7de6v/jviRfk
         TakgO4GO1TBHaBMxEhvaBZ+YAoaZqXMP1AxwUoQzRKUsY/YAEHwnQomyqAA15JAB+pRh
         aI87L2R3eU3Csu+vgIiEPs+QSiUJZsEoYdO29yNQVOywP4dkv8cJERWMy0v1YztOFz6C
         s5S/Ufjt9mGeAMfwuDoxehqIq//vtzx2MqDpQpMi2YKPCaEF4U+TnXf8Pw4cF2ipS2do
         SKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e12zOkbSl/TTgIy5byX+f+5dgcezW3bwpD9ZmWTyAuQ=;
        b=QrBXgNhETv1NAcjGRffy4HHSuXmWYNHDLPEZ3c2pd5/LPh9J0pgcHCJGEHV93euGFQ
         sPY9UggsIjw3iJHKHlmYu/eJENbXqp8M4mLTDZWp7t/wU93m8lMIQdeZQiYw0dh3nSnl
         YDFgpUFc3xSJsZ4GSJBJpJ5Zl9G6QxZyZQ5xbpKVlIxuD9BY10Vk1GbHqrjOpNjX4S3F
         97FG4TNscn32uKTpXGJeWBsXXJ9eMc7En5Oqj3ukncZm1DFHx0TVcTqe9Qbyb3McVtft
         9UWtcgH52ayad3Y5j9gX1hCh0eYLxlAgq4cvsZNtCmgUnwYdaPZ5mcfywDUrQtJXZrDT
         MMZw==
X-Gm-Message-State: AJIora+i+PT/JcOo3Dql+C2GfmBRXNR8v8NEUAeCX1XD6LYk93Zjk6V8
        XQA/Qn+zuVlW7Gf9Y7Zi0wPpyg==
X-Google-Smtp-Source: AGRyM1tJRec+suh/Fq+QJOybEcmANFgSQzjUGT4MbvFTQVpTbNTlOPIkzLoxXGoQPjcf121UTlpgFQ==
X-Received: by 2002:a05:6000:a12:b0:21b:93b9:134f with SMTP id co18-20020a0560000a1200b0021b93b9134fmr2644810wrb.310.1656502814986;
        Wed, 29 Jun 2022 04:40:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q11-20020adfea0b000000b0020fff0ea0a3sm16136500wrm.116.2022.06.29.04.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 04:40:14 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, srinivas.kandagatla@linaro.org
Cc:     rohitkr@codeaurora.org, quic_srivasam@quicinc.com,
        quic_potturu@quicinc.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH] ASoC: dt-bindings: Fix description for msm8916
Date:   Wed, 29 Jun 2022 12:40:12 +0100
Message-Id: <20220629114012.3282945-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

For the existing msm8916 bindings the minimum reg/reg-names is 1 not 2.
Similarly the minimum interrupt/interrupt-names is 1 not 2.

Fixes: f3fc4fbfa2d2 ("ASoC: dt-bindings: Add SC7280 lpass cpu bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index e9a533080b32d..ef18a572a1ff3 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -25,12 +25,12 @@ properties:
       - qcom,sc7280-lpass-cpu
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 6
     description: LPAIF core registers
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 6
 
   clocks:
@@ -42,12 +42,12 @@ properties:
     maxItems: 10
 
   interrupts:
-    minItems: 2
+    minItems: 1
     maxItems: 4
     description: LPAIF DMA buffer interrupt
 
   interrupt-names:
-    minItems: 2
+    minItems: 1
     maxItems: 4
 
   qcom,adsp:
-- 
2.36.1

