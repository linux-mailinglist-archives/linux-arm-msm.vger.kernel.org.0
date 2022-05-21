Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 175AB52FE41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355551AbiEUQrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:47:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355458AbiEUQqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:48 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998612C661
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:29 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y32so18997589lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMIvDTZuqS/+po3VQFQJ9f+W1R+y8U0WI3D5yp7/eps=;
        b=IX9naaFCsIxfdej2NveuEzNIQwQXPGFrQFlYkGqJ6bVq/aFY9yYSk9MDd9lSFE/h+z
         WmSafFtqwgsr3RK36xhLjNKP0lRnozF3VMfWG3EnYYnXaqe/C2sIYzC/XetJQImqSXu4
         /c6Bgl12XIeBK8LzqOg2zIJ8SLk323XxU7Sdjo34g/pyM4zdXe1KPEs1tpVILhnHwbNj
         kkHeUETRu/d9/APtWBQk5nAYT4kbaOmEt6qIFwLP+YahXn2wM5mfeTVTYhAvzMRn92RQ
         iZHz9tXYKHuOsgr5dxWBON5Mf71mXM2A3zuL911RBUhUzPKT22NSYPPkYRTW/SF5sd7G
         0TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMIvDTZuqS/+po3VQFQJ9f+W1R+y8U0WI3D5yp7/eps=;
        b=Ig1ujecPnLmRFHXUXM660+Ss9lckagYfKnGl1yGZgEymoYQBpkcdI3x4JLRlib6ZfC
         P3mstYe2dbYz4LYR5qjDZvWe4MyVWxMgqRhfzf/aXrVQBwfRs8xpK6/h+bWAX9DKtePG
         dSdQW7TmV8Jfhre9EP2xZsKRxeoEl2kWR5n/CPs0gYNWKZ0HVfCHQ0z8OW/Y8LQf+8Vt
         IqbLX0+7WqrR8GuBMMvAHRcgNy1EqranJ3fUuZfZiTJjUErbKDpIIxKNIZ8ySfpFycpW
         D644JVDO2uIYhEJlDkIoPyWArVLErkeQr0KLP4kpjrNd99DCFB+2vrsMXKLM2gNilIZi
         7lbA==
X-Gm-Message-State: AOAM5317T+JV95pztz4244ouFK81Q077Y83PSDXuVDjP4AZrUKcWpJ4X
        n/z0pXeu9RxQPUh1HHEwRvUvgQ==
X-Google-Smtp-Source: ABdhPJz7x8s8SRAwJThpaS1m/hqYbUOhZaRRyaWGPWIFKSIwxQNzOOaa5kGzrrIu4pUITtoFIrqspQ==
X-Received: by 2002:a19:6757:0:b0:477:b7f5:8845 with SMTP id e23-20020a196757000000b00477b7f58845mr10173121lfj.504.1653151588887;
        Sat, 21 May 2022 09:46:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j6-20020a2eb706000000b002509fcb66b8sm749787ljo.65.2022.05.21.09.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:46:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: firmware: document Qualcomm QCS404 SCM
Date:   Sat, 21 May 2022 18:46:23 +0200
Message-Id: <20220521164623.91322-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Document the compatible for Qualcomm QCS404 SCM.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 0f4e5ab26477..0eb9759d8d8d 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -23,8 +23,10 @@ Required properties:
  * "qcom,scm-msm8994"
  * "qcom,scm-msm8996"
  * "qcom,scm-msm8998"
+ * "qcom,scm-qcs404"
  * "qcom,scm-sc7180"
  * "qcom,scm-sc7280"
+ * "qcom,scm-sm6125"
  * "qcom,scm-sdm845"
  * "qcom,scm-sdx55"
  * "qcom,scm-sm6350"
-- 
2.32.0

