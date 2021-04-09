Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBCF35A7FB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 22:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbhDIUkn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 16:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbhDIUkm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 16:40:42 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4634BC061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 13:40:29 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id n4so5754713ili.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eqErB1BGtSYLSRcvCx/61ODE5QLSgu/K7kbGZ07zxxc=;
        b=CRP2+XeE0cWPtKGLK3vM3qpEMrFVKcT+k05Mf0QBcCsNPy7LTFx7Mg82oqg6PRNP6+
         x6X+IDRmR8IL/2tQ9LQNkKT5HUYb76npzAr41tmCCN+3llZc6+lG9SiIVqh5Xsgi1aaC
         oygNusjXjaa5DSMOu1coNLxXicgNcz2Oe2jeqS34X2SwTKso+RWG8ONQ6b2GoArBz8w5
         d7GjvBOiFfTu2aKLtSF5SEXXbGIAdrhuxRNQzrNFC3u5RBn3UiHnHUo3hrDOw4tux92l
         jBT08vMEGB2UMoPiqafFt8kgzdOeUrVJu5++RtQ6Km9eJEOWa8xP7WBhqqwlDHoZl7NM
         A/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eqErB1BGtSYLSRcvCx/61ODE5QLSgu/K7kbGZ07zxxc=;
        b=p6gG6acNwcT5AAe5sBrKsEoKbgMYwsw3ys8jYndr5wD8ipZlEby52OfYdI9bPAI3cM
         6VRAnUmnAayMnDYqGaMChmuRBXa/l82DP+scBB5WTdNjzPR7RScbZ2gdnaURMY4qB1jd
         4BelV7TrELGvidVr8iDh398xLlqeiBbaw2dA4zgJRNESSc7TzGkcr/laR6MY6d4y+Ml6
         98SZpNk+/I4wSoyNiJlpj0Yhg2GuFNA3WtydN2L2tr/W4Aw0qq1pqMx0saL51UICu3z9
         Z0ZSqD6S0LQVnIj0qaEmALcEWtsjLKOAxr393nvjfDc/J7TmqWJyarF45tHw3kbT7vtJ
         ZBWg==
X-Gm-Message-State: AOAM5309dmgX4eZP7Q58LcWwDuaAQxQfcud7eA4B/yDyxchJR0zyDNuo
        ASKqd9pT/JhxA8AxD6L5D1Hy5g==
X-Google-Smtp-Source: ABdhPJyhqyM6lypSVScVyrDKkEEtsmxSsYZMSCcVOR90TXUyUWmH2NHHQcvTxRZJBtK+df2aMa2LWw==
X-Received: by 2002:a92:c26e:: with SMTP id h14mr12449414ild.33.1618000828764;
        Fri, 09 Apr 2021 13:40:28 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b9sm1667212ilc.28.2021.04.09.13.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 13:40:28 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/4] dt-bindings: net: qcom,ipa: add some compatible strings
Date:   Fri,  9 Apr 2021 15:40:21 -0500
Message-Id: <20210409204024.1255938-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409204024.1255938-1-elder@linaro.org>
References: <20210409204024.1255938-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add existing supported platform "qcom,sc7180-ipa" to the set of IPA
compatible strings.  Also add newly-supported "qcom,sdx55-ipa",
"qcom,sc7280-ipa".

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 8f86084bf12e9..2645a02cf19bf 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -43,7 +43,11 @@ description:
 
 properties:
   compatible:
-    const: "qcom,sdm845-ipa"
+    oneOf:
+      - const: "qcom,sc7180-ipa"
+      - const: "qcom,sc7280-ipa"
+      - const: "qcom,sdm845-ipa"
+      - const: "qcom,sdx55-ipa"
 
   reg:
     items:
-- 
2.27.0

