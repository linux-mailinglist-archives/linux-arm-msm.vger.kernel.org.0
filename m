Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28A06BF9D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjCRMSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjCRMSj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:39 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329C931E38
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:38 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso6535074wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wLSDWvrESz4iYHp2hJf4zI/B2Ft5IfrJsh7oW3/t5M=;
        b=P8L6gmRvxvKRPt7yP50DNz6B+U2CeoTtWTC3OgMES0EU57hTS5giSJU1BkKbuj/D9k
         79lWtx2nndF97422oUJP+c8wsy/n6CFQBly1VdWdx4XhddAWxPxSZ7ZAqSwHxF0gYp11
         ZYq8KsdZMum4xGU47cLh6q3ph6Kf50joOIL1YNs5+I7QPn/sauClBYC3LQQXks3Ra2US
         IT5I9oHUcDZ4GtSzbpPPibwGq4cSg3KB37Kh+p7CN5IkVwpyH90kgw299xipcMJRv/ZY
         4FIU+zxqiuD09M95EDxOQ9kZch9hwozjQIQqKYfPDkX6dpwOKLF6UAxopA4lwV0nJ9r3
         OM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wLSDWvrESz4iYHp2hJf4zI/B2Ft5IfrJsh7oW3/t5M=;
        b=ek1Auzr2ssMgjMdYoM3+Aeb3uIm9IKBblvvYV+vt39eEpvCEjkBkD5YZXJOL3Uupcp
         E8io6OQSWJY1RD3lN1wKF56wQSmbtDd77cPw46y8Pi93rRbYLlbM9rhtqee/z/2VwSh+
         IV8woel0ZlWuynHtiOIQy3urZYzL9QnXc+kCdFTHcjN7CBiDGZUvovBFqiU6pqOp4Nsc
         uHs6VTGBi9c6l336g6iSnrFPny4qp4a5+eS8E7tOlKRD2WX3wAMSn/F2q+yP5nZM4gYV
         FW+SdIJStw+RuP4K5gsVjc5lgJNYA9HVC8/QN9M7pHH+0Z/FagqlRQ9fLEFVxuhILvOw
         3prQ==
X-Gm-Message-State: AO0yUKV3SZnsYC+ZdZ/kHJ4qY72mse9fXKuxWNgiVvRyxEFVo1884LpM
        tYOmui6WvoxK6WE3aVLykNSy2A==
X-Google-Smtp-Source: AK7set+9yXGCNUiHc2ojXeS8P9OXRKhTJIrw13uPQbsv32HtvarbM3YY2yihX22FZSfG62oky6Qtgw==
X-Received: by 2002:a05:600c:45d2:b0:3ed:2a8f:e6dd with SMTP id s18-20020a05600c45d200b003ed2a8fe6ddmr16602324wmo.6.1679141916686;
        Sat, 18 Mar 2023 05:18:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 04/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add port as an optional
Date:   Sat, 18 Mar 2023 12:18:14 +0000
Message-Id: <20230318121828.739424-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

port is required to instantiate a remote-endpoint which can receive
orientation-switch messages from a Type-C mux.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index 52886cdb0e506..1c887e34b1223 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -65,6 +65,12 @@ properties:
     description: Flag the port as possible handler of orientation switching
     type: boolean
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the PHY to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
   resets:
     items:
       - description: reset of phy block.
-- 
2.39.2

