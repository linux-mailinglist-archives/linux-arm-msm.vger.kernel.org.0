Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207173AFA39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 02:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFVAmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 20:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhFVAmD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 20:42:03 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01723C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:48 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso653033pjv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rOHLQhB/zsp0QBNgF7Of8RLVs1zhcVo1qCLsNxBTdmA=;
        b=bEc1qtq4Oj3ScROAT3XarW0kD2iIdoMYwVC88tInIfEh7npnyMDXy0QsRE0tHN4RES
         tYhVkMpGhV+R7F8xr2Po8qgLcQsTTWuHCDXwZLDiBWzKh8t1Jdw19pdsPhJZhOzTu8RR
         m1GyF76BM8wBIb/gJyGZnrY463F+HV+JY5pD5SZ7J7wUVTyMuuV0+Sq3dDOOGtHTBZS+
         9WiwU4yYMntJCNMuINN78RGlXOXJ5j7iRztj9/yCK34WaBkKm8z4kUZsxjUMZcndPZwg
         3JViFKu8txANG5ugut03ITUc49iYSSLNTSHAEI5oQMhexrMWLXT+h25/uJMd8FcO7VTI
         0dTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rOHLQhB/zsp0QBNgF7Of8RLVs1zhcVo1qCLsNxBTdmA=;
        b=FmnlYAdtjyn2wHt0i7e1FTiyv1487fSGxH08RO8Cg2JnIJxa5LsTM6QRw24BWfHCH/
         lz7q7vuuo0sJfA9Dk/NinAsT1oURAdbvSc8hzkrhEF7QKXV+8s035ZnAzTfAF9gXuuME
         kZfsqIzmXJq4Zr5WghCeYdk+H/sKD3bvx04iMXpYfprm9e0lSuFYqxj8AnqSmsIN3rhY
         ItRpxNj0DoW69VKzNE2pFoIn8NsOcSieMKG4+MH098qskh6PYOoNjYcB9LLv33Ota5zo
         Iy+wPsCpD38gXNDXd6o1ggLc6Et6BOllDi8qQvylM7cKY1sjcJN2c4TIM0TROBFKJehs
         APKw==
X-Gm-Message-State: AOAM533r7ErEqj4Frq+Xj27XcYo/uI4IQKLZ/IVHqsc/aoUPqYFsTy4z
        iBlSNACEdTtD8eKi8nW1pazU9w==
X-Google-Smtp-Source: ABdhPJxEKCaZYYRjjpA2vP6kFRaRaTSjTUfJoPCzCAxaalKrP/S8V43ufV8t4bp1+ZYc5NwJIkMY0w==
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id v19-20020a17090331d3b02900eebccde686mr20751488ple.1.1624322387588;
        Mon, 21 Jun 2021 17:39:47 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id h11sm17722762pgq.68.2021.06.21.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:39:47 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add MSM8939 APCS compatible
Date:   Tue, 22 Jun 2021 08:39:17 +0800
Message-Id: <20210622003919.10442-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210622003919.10442-1-shawn.guo@linaro.org>
References: <20210622003919.10442-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for the Qualcomm MSM8939 APCS block to the Qualcomm APCS
bindings.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 5dc1173d03fd..96b29aa6c338 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,ipq6018-apcs-apps-global
       - qcom,ipq8074-apcs-apps-global
       - qcom,msm8916-apcs-kpss-global
+      - qcom,msm8939-apcs-kpss-global
       - qcom,msm8994-apcs-kpss-global
       - qcom,msm8996-apcs-hmss-global
       - qcom,msm8998-apcs-hmss-global
-- 
2.17.1

