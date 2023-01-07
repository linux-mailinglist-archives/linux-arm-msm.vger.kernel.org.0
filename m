Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5DC660E83
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 13:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjAGMGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 07:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjAGMGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 07:06:39 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4CE5C908
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 04:06:34 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so5677462lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 04:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSXHQVsWHUKcPua78jzq0240G90YXX9B3puQSrtRzlQ=;
        b=aLdS8WIwVzUnKD3OOVothsU8cRSe6i6WTTXfxdghfKAToc/EgJYF1t8itxIyi+FAJm
         +6G7fO4NXfpM2AelD6ehE03hjEzxiHU9fglq4FoaMd4VqIThfPQLP00eWEwF32GWd0Zq
         maDhd1rtLt766qfv9KOVdxZDyuVIZcaRr6DBEaR/25YCHKvhJHA9Gd8iZkMe/4AjWAxi
         6hvL7Wlr0jQxShhlymwDGqtVMEIJTOX9VnWhfp69RDIZq5c37kQG8Xm8EsfCr0MM3dJx
         qwh7OLEk5syf9nhI/wpmcPUKOlfXcGhKLl87yxGpa6WCcZ0xrCofqy+V80fPfJc5sDeN
         Jxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSXHQVsWHUKcPua78jzq0240G90YXX9B3puQSrtRzlQ=;
        b=CB7IgdjTwxm2N8YMreGKBZ8iihA6Cjuaw8QE6Tmn3cc/6MLn9RIzXYP/m7Zj/FkR86
         rVXqBUZVD1eHcFm9wuZtUbGw+kW9Y7D+B1hazaLFEVJwKuxAGT6yRqRAZ/tEs6/aqYql
         ifkpFRzRcPCObV2ZxFOpPuj+ApIqT4IEwfzlOCExgJSdLAPVJg1N05FemIgkhI7GGwGS
         0nsdd40CxG8fXhY18rppOJC7TSbWt/czh+j3sd6ufvPZL7YDWmWv98tXm90kmJgA6dIS
         KDbb1lVfCP4vmsejh/+d8AaugPrN2Jwhk6sGJdQxZRCUdd7fu7x7QTYYJmJ4thuAtUDf
         75Sw==
X-Gm-Message-State: AFqh2kr5HhvxQQCVjkB6xspI4WbA9cb8I8RlQbCWtDKep7u5y+ORGyK6
        TVBZOIUdm6nS98lQt/SOQm141CkeEsWYGnjf
X-Google-Smtp-Source: AMrXdXv+MwwoUNTU1/fdQD7I+AkcMbJbgndrHq5o4DAdMA5y3spl/MTsijx6tZHTYgMpXquYKW7q2Q==
X-Received: by 2002:a05:6512:3b2a:b0:4b5:5efb:7d26 with SMTP id f42-20020a0565123b2a00b004b55efb7d26mr20499266lfv.37.1673093192087;
        Sat, 07 Jan 2023 04:06:32 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id m2-20020a056512114200b004caf992bba9sm551424lfg.268.2023.01.07.04.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 04:06:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm6350-pas: Add SM6375 ADSP
Date:   Sat,  7 Jan 2023 13:06:21 +0100
Message-Id: <20230107120623.1903056-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add entries for SM6375 ADSP, as it's essentially identical to the one
on SM6350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
- Rebase on top of recent changes, move to 6350 pas yaml

 .../devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 911529400142..a225f54de424 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,sm6350-adsp-pas
       - qcom,sm6350-cdsp-pas
       - qcom,sm6350-mpss-pas
+      - qcom,sm6375-adsp-pas
 
   reg:
     maxItems: 1
@@ -49,6 +50,7 @@ allOf:
           enum:
             - qcom,sm6350-adsp-pas
             - qcom,sm6350-cdsp-pas
+            - qcom,sm6375-adsp-pas
     then:
       properties:
         interrupts:
@@ -67,6 +69,7 @@ allOf:
         compatible:
           enum:
             - qcom,sm6350-adsp-pas
+            - qcom,sm6375-adsp-pas
     then:
       properties:
         power-domains:
-- 
2.39.0

