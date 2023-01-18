Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F024D6711AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjARDRY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjARDRX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:17:23 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE7A50844
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:22 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ud5so80120847ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMbaXOpJps57LZX9T8TLMvj9shL/EKlMPCHrubh+ldM=;
        b=hQR6fLTkpOdBbpnoEt5ccS61kq5hOyOhM2sJmDDQS/0+8Oskn0hKPMUwGAaS71aQFV
         6U419l12lxqhwYfCkrTeXt3pWTZsBaykL7Qp/YA5MWJ8QYNypcnBmxd7soqba208fspK
         SaxORZB+E96yWgsv6aMPsltfBjrt4r29IrcLZvJgHqkEeXE7ZdJ+9QIDYPmTG24eIK4O
         DpUfiSWWhm6+WZFce0mdV3cYOLEeGUsNTdIxXWjzRGIIpmehG86A9kKS9qV6Ibtm+Wyx
         srT2CtmKPSa1BOipkot1u9WvRrhG5ft/BbUo+MVhbNzjoqHM1TQgJjAr9DFGMe8d3mKn
         NbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMbaXOpJps57LZX9T8TLMvj9shL/EKlMPCHrubh+ldM=;
        b=LbcyR01SMt3NHRu+uLn9jaURPFVd6W7CdjUJXH/s4kWTl6PnoGA/fG8tFe2oM8CGjd
         wlDK5HE4l1RGOhvdiHBZK+Lf6v/Wfto/7fQwevvb7V2EDJIC9bn6D9G28luZn6hQADA3
         NeoMkTMLKs/eu2C74zZ1CYBuzv9CudQsBccuBWy62RIhG0fB57SMsJB6q+69wBFQClK/
         PJ6g6LrDZIAeMsOUr8f7/1XTNLLNmXyYp0JTl/1pTBrbydYMhPXYg6Ag+abJTUgj82Qi
         sMutkNWZ36ye5qHJwhFn65dfXyB0qb627SzPZvvIBrcSx3wtt5rTj7jlCPfR1TO7ubiz
         mkMA==
X-Gm-Message-State: AFqh2kpN+Xi5ocwS8y/3rLpeMSBqWetsbCs5E7IEzH14i+RlxnEof7Im
        OHdziaPuk3nYEQqi1Rp6SLV4uA==
X-Google-Smtp-Source: AMrXdXvnS/jPFskq9CuPGdx0jCWVekl/5a43zq1NuLIH2RpPyRd/9gSSrJ/4BUYAG+pYbfjuWirORw==
X-Received: by 2002:a17:906:d787:b0:872:5c0a:5597 with SMTP id pj7-20020a170906d78700b008725c0a5597mr4432757ejb.70.1674011841245;
        Tue, 17 Jan 2023 19:17:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00876479361edsm535639ejt.149.2023.01.17.19.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:17:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/4] dt-bindings: display/msm: qcom,sc8280xp-mdss: add DP / eDP child nodes
Date:   Wed, 18 Jan 2023 05:17:16 +0200
Message-Id: <20230118031718.1714861-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe DP and eDP devices as subdevices to the MDSS on SC8280XP
platform.

Fixes: 45af56bf2d74 ("dt-bindings: display/msm: Add binding for SC8280XP MDSS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index b67e7874ed56..c239544bc37f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -38,6 +38,14 @@ patternProperties:
       compatible:
         const: qcom,sc8280xp-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - qcom,sc8280xp-dp
+          - qcom,sc8280xp-edp
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.0

