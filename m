Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F126D45A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 15:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjDCNZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 09:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbjDCNZV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 09:25:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B06022202
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 06:25:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r11so117314145edd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cFC2doK7pP+oZeom2O+jOvVNNVc+JGEYRAe06U7TEU=;
        b=tzRfk8NOdb/h927gg/TWagqrk60Ev0iFDYfLVXJiwNd5qxCR4SaQ12ZujIf+zwJPb5
         veojcYiD+25NuWCpRkUWd+Xk5H0ZJzqrPqYGlkNI8Wfj7rGpj8OOfclitrkW26YSgM7e
         gUqdtm4+pOs2MZ4vDSvBBt7Vc+23eB6tEd9u3XxkK4a50d470J1R/D0hgFmSUNmHQ1dX
         Hp35beC+zAdmSVeHdaKkKFHDknXrxGxGIIBm8Ud3AcM/Z5XOHLB0mxVWiyrONl5McQq3
         2HLsFHd/vlD+txHkqAuUppb5au7uD1atcUsR5VXz3SHg8S0Bq7F3/WFOS8V1cMage530
         g+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cFC2doK7pP+oZeom2O+jOvVNNVc+JGEYRAe06U7TEU=;
        b=jDhePrt6wZhH2+PMJUJFbI98oNPklbnvdtu95iMAK+AJEQNo001ficHu4Xj4DX9uRP
         PC1QaVgixcqIyL7EyeUkmKXb/pF30QRFMzuAzyk4gJ4SetvJantM2HYrIGKvBNFa99xW
         wvwZKtv91JEJ4W+h4ZaDjG5zWprUTFXlrDTccwDCp2L9+7WOoLE2t36oQFiy/vohYA/H
         uCvSbZnQwJDispmHvzDEYaSMEFmMAk6ngJR3v9BjIKcMnwG915KyrYtF8XL4Ncqd9rnX
         C6RkCcxt05tslJOYVPHWOk8+4b6GX501GS8xMt5gVZ9aH0U8EjVVj0YH5YHBikw1ORbH
         bMYA==
X-Gm-Message-State: AAQBX9cymIwDFurTK4aQwZj3AiJd5shWQ/xwoak/Q2glD/nYTG+xccBl
        Kow+rLurs2qY5qdh3vpzIMxZpQ==
X-Google-Smtp-Source: AKy350YbAnSJzJAryYy5Z4w+TUXHLgy/iWJlundDtd2T8cKcldJbO5NJI5MUclajMl0qDLW39vc2ZA==
X-Received: by 2002:a17:907:75f2:b0:88a:1ea9:a5ea with SMTP id jz18-20020a17090775f200b0088a1ea9a5eamr32427334ejc.65.1680528308765;
        Mon, 03 Apr 2023 06:25:08 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906229200b00930ba362216sm4658489eja.176.2023.04.03.06.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:25:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Patrick Lai <quic_plai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample interval
Date:   Mon,  3 Apr 2023 15:24:58 +0200
Message-Id: <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The port sample interval was always 16-bit, split into low and high
bytes.  This split was unnecessary, although harmless for older devices
because all of them used only lower byte (so values < 0xff).  With
support for Soundwire controller on Qualcomm SM8550 and its devices,
both bytes will be used, thus add a new 'qcom,ports-sinterval' property
to allow 16-bit sample intervals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index c283c594fb5c..883b8be9be1b 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -86,7 +86,7 @@ properties:
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
-      Sample interval low of each data port.
+      Sample interval (only lowest byte) of each data port.
       Out ports followed by In ports. Used for Sample Interval calculation.
       Value of 0xff indicates that this option is not implemented
       or applicable for the respective data port.
@@ -94,6 +94,19 @@ properties:
     minItems: 3
     maxItems: 16
 
+  qcom,ports-sinterval:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Sample interval of each data port.
+      Out ports followed by In ports. Used for Sample Interval calculation.
+      Value of 0xffff indicates that this option is not implemented
+      or applicable for the respective data port.
+      More info in MIPI Alliance SoundWire 1.0 Specifications.
+    minItems: 3
+    maxItems: 16
+    items:
+      maximum: 0xffff
+
   qcom,ports-offset1:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:
@@ -219,10 +232,15 @@ required:
   - '#size-cells'
   - qcom,dout-ports
   - qcom,din-ports
-  - qcom,ports-sinterval-low
   - qcom,ports-offset1
   - qcom,ports-offset2
 
+oneOf:
+  - required:
+      - qcom,ports-sinterval-low
+  - required:
+      - qcom,ports-sinterval
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

