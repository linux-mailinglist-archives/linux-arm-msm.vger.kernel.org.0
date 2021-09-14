Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD2640A2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbhINBmW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235366AbhINBmV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:42:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C296C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:04 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so1058881pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vzWWgarNRy2l997k27Lj6Cug9P7VmcYleT6gc3UMahQ=;
        b=s4X/ORL/owEy1Ueh/AsqdBKckUlm6IFkkz5864T0OecenaCS1GD3YN6kPeP1i5So+j
         aPjuOoGRz6vD1GnmcniWT7Yk00PT8LEHgiaUEnUXfBXyotV6rwcJhbzdtRgZ/gYVMmh7
         2sRuA7xAP4Shyf/3rHSu+6Qn2NXQshxBJFpwHufRbdH1LpjhwIzHcWgQPpGD6rdGI4en
         nSDKerFaRTtC8WZsrPxTg40Xw/B06grxFTgFrllMTM+3PSEhhEhm1im8ZUQEB4XclQ1O
         DGt1hprxSC5wav7QNs947vzaJt4waoHmb4T54qSgexSHOV8W1yOdEn53+U5MJeUSiEBL
         p47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vzWWgarNRy2l997k27Lj6Cug9P7VmcYleT6gc3UMahQ=;
        b=OJmIOzBD3yCVelSlBfbr7kIgwlSSk7eTlqH2+rbPmp8NDR00qmh0GdxNGCvSQOVnen
         +aprAsUVfXiuuDab+X1W2pVwAVfifPDz2cBvIa6nVGfTtXGhbCIDxwKJehZL4iw8Fl+p
         aTz7AInx0vM5yfQk1sErhmDSsyrCMHHXzXK7Nra8Bt6RR29L5VsS75ignK6MJuJCLXtK
         cDDAKGcoTKqzP4AuEf9sA0O/13hok3rKUvwchzjCQgbd3oi1/t0mp7CNu7ddKD+bn7q+
         qb/Vbd/UQJQdE3szX5m/RtCQn+V7Vfzf4dnyNGL9tEhZdV6tHFgh6NIBnQ5yuz+COmyZ
         E2wQ==
X-Gm-Message-State: AOAM532Ku6T9zCIX+P+PQ5wfdl8aS7vMSHyeGvagc/2JHgogJIfQVelb
        RrvZxd+40itdSjNdP8VrludM8w==
X-Google-Smtp-Source: ABdhPJxySZQk80ZFePcbZIAmR4136ZeoOCdTSjHUKhJg1l7LKIq6onVTwKeVI4RdjcuyVC2CzozdRg==
X-Received: by 2002:a17:90a:eac4:: with SMTP id ev4mr2634089pjb.244.1631583664218;
        Mon, 13 Sep 2021 18:41:04 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 4sm8037615pjb.21.2021.09.13.18.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 18:41:03 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/3] dt-bindings: mailbox: qcom: Add QCM2290 APCS compatible
Date:   Tue, 14 Sep 2021 09:40:49 +0800
Message-Id: <20210914014050.28788-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914014050.28788-1-shawn.guo@linaro.org>
References: <20210914014050.28788-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the Qualcomm QCM2290 APCS block.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 6395281b0cec..a6c5c66b7804 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,msm8994-apcs-kpss-global
       - qcom,msm8996-apcs-hmss-global
       - qcom,msm8998-apcs-hmss-global
+      - qcom,qcm2290-apcs-hmss-global
       - qcom,qcs404-apcs-apps-global
       - qcom,sc7180-apss-shared
       - qcom,sc8180x-apss-shared
-- 
2.17.1

