Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300B86B82B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 21:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCMU1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 16:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjCMU1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 16:27:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3B58C518
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:27:09 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id a2so14329473plm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678739229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hs+0VFLpmrPJUXyoVfcb979HJWTOyjaF+CHF//mTgk=;
        b=wdQEPcAY6Izd+bNjUVk/FQOewydvg+jc2Z/vTKWAP5NMWCjr3RJMn3RQw0/zj6fT/y
         gBgpxoB4sHc0pWxO0iwviARKoQ3viNuF98sx1Bs0kGwPrIxHBIluZgwTX2XK0eA/lla+
         XJmBZSON4sewif+VzkMvqaDDzlA7zCa0D6j0NLzPiFKXlcRnSXHNPNCy3KZeFyCVv7Ez
         CQt4F8Z2zXWDvYWUkB2/rNFBrfHXK01gkHI+J1Z6IRmbc8Z2OBULJcczw2phCrcHcjIm
         YXJRP7m58i7ouOTv1OmZhL3BuE3/LJDNCXS9o+EoaB518M+W/wux75TZxwJPVQf80sAh
         ZvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678739229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hs+0VFLpmrPJUXyoVfcb979HJWTOyjaF+CHF//mTgk=;
        b=K3bwrnlcbpV4wtE3XoPmUrVGINbhPFv8C75xHbUAzoqM4qEokQN4Djw9x3NFliEMjq
         ZzlPzaDV6aAAzoswfP/1AP5p4EpUjPsUVy1hXGY2Iy1pWbJmtEBGUdCCsh6AX862THb0
         j+cW9kHQNl1PZL2vlvmFDyqGzlDPew0znNj3Aze+rPOWbCRQAH2LzPaiOyb8oI7qDMIq
         njslpDFEcuVQ3Dl+ujPBhRuKct89MaJVHUHTxIdkZ506kib3OgD9rLMvWo182f9vkugd
         xr82xWUN7TneuYLMJUcQ34/0QD8hpajrF4UmZXYiDgmCiZ4wkqN5wbyqoYNzToY6TX9b
         l0fQ==
X-Gm-Message-State: AO0yUKVhaV+1sXz5asbE6p/MJTXH2cuadxOCsfRprFSGBM4JcxpUxs1+
        MQqVZDYdVoxE+BQ0Tu+fxgcaGA==
X-Google-Smtp-Source: AK7set/DuxNbASPt88XCHkLIzf4qyAFpuR+ZME6CaTzb/ywzgClzkWF6f6Taf+v3EbZ0SNrKCLiY2A==
X-Received: by 2002:a05:6a20:b283:b0:d3:72c6:b018 with SMTP id ei3-20020a056a20b28300b000d372c6b018mr7347841pzb.39.1678739229099;
        Mon, 13 Mar 2023 13:27:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c5e:4a3e:15d0:d540:3861:ef0e])
        by smtp.gmail.com with ESMTPSA id b23-20020aa78717000000b00593a1f7c3dbsm157647pfo.10.2023.03.13.13.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 13:27:08 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, bhupesh.sharma@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom: Fix sm6115 pas documentation
Date:   Tue, 14 Mar 2023 01:56:55 +0530
Message-Id: <20230313202655.1719587-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the sm6115 pas yaml documentation to note that 'memory-region'
is a required property.

While at it also mark that memory-region property supports
only one item.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..cd5d5d068912 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -43,6 +43,7 @@ properties:
 
 required:
   - compatible
+  - memory-region
   - reg
 
 allOf:
-- 
2.38.1

