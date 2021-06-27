Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A303E3B54E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhF0TCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhF0TB7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:01:59 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78EBC061574;
        Sun, 27 Jun 2021 11:59:33 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o22so8823296wms.0;
        Sun, 27 Jun 2021 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omZcbiTtS7++12UxYx04btGCoOY7nF1lh3E7O94QvfU=;
        b=VP3DckOxspIHZL/sCXR/N9vdouz3PhLabP7XEP+7zgGRslLRfNrSwsyRJNY+rhSGTw
         2EYyH/ENNrSA6LDIC6fgYNfZZjx8T8gMdizkbndDDKYEfsNZ6YlYUKzl7I6rfVqoMZDx
         sed7WDoli/2JsZ9YhTQMcdKdxi0UHAxJenxEi0vMod/hGS/pqrPbbBe6zD+okhaT8/pu
         gg6aBW4oDi8yNTaQorG1M7rJSCO7wNqWs2bVZydeqEb5odUwwK7ZfQmz44ZUVNKHooAq
         homWQTpO+knnbF5vc2G2iHkJ347Uplo6vponZMVWhYUjwNvJxm6Ovugo4wkXd1+vpqGl
         c/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omZcbiTtS7++12UxYx04btGCoOY7nF1lh3E7O94QvfU=;
        b=drEV1n+gSgewt4NZ0OqYKdRSOkgyFfsg6omlF2X+rSHe2eBQxdD1MQzPqWSSmsl9N+
         daTPuYdRXCpAoLxde0OZ33NxyzsiTvhX7e7R/ojbIM+HWRm4QzksP+dAs/DtZhn4vCKf
         VR+ogjAFU3ZDR5oe8SC6sP+ws137Ztkjkr2AXfw09EzkO+XSz3XpOGbTCvuZx/BWbK54
         s/j8rfEi2xCDOz/hKhD1NA+Bj+4RKFvvBEr8SC3r1L31+fSdWp5sC/c6NQfjLRJaYeuS
         eG24owzPMDdFK/OIMeUQu9XLzeUoIgJrlJkyqrvfJBo9NEwiwuZule1XvKftc8yspCCN
         sQdA==
X-Gm-Message-State: AOAM533twd6wQrB5GnG/7IoCBlaxaxSF9GTjedyhTMaGCiaE2QUlX7/z
        DqZqKRaKTJe+m2gqo0DFW8U=
X-Google-Smtp-Source: ABdhPJxXXl4dOfvh+m79ItXG5ad+C0kcCOmvKN7BAlgeC1OZdlB6Qb7gc3z1Z+vHX8pv7jZr9HkEow==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr22035588wmc.163.1624820372452;
        Sun, 27 Jun 2021 11:59:32 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m6sm14516140wrw.9.2021.06.27.11.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:32 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 1/5] dt-bindings: soc: qcom: smd-rpm: Add SM6115 compatible
Date:   Sun, 27 Jun 2021 21:59:23 +0300
Message-Id: <20210627185927.695411-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185927.695411-1-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dt-binding for the rpm on the Qualcomm SM4250/6115 SoC platform.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index d511f01fcac6..cc3fe5ed7421 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -39,6 +39,7 @@ properties:
       - qcom,rpm-msm8996
       - qcom,rpm-msm8998
       - qcom,rpm-sdm660
+      - qcom,rpm-sm6115
       - qcom,rpm-sm6125
       - qcom,rpm-qcs404
 
-- 
2.32.0

