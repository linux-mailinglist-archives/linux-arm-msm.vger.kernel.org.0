Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837FA3C2A9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 23:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIVKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 17:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhGIVKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 17:10:20 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E73C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 14:07:35 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s18so10115468ljg.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJEW9w0y6Vcyes9owQtz9S/0i0lXig3Az7cXFopBjtc=;
        b=fErVVr4pfIJbVtUKRHnaiRSwiESw88MXK4nJOMrQurA3qSPw+jY8bZ7yjI0gwd8IcA
         Z0Y9hswzeZlcQINkON1LTwNJGPzPwFkFjkioN0yYm4bVKTQJSbN7rKbcK3kHfHfOrGEF
         s8eIlFTqWE8NVoVmXDfTK8o8YgUnlvq9pxg5UfvlUQsHTZUtHtQR7RuKOtJB27pdxDaq
         s38BYWqY66kmHU+Hk1s9uVptda29k3gyzDeDP55L/YPk4BYTmFkgQzDvSpaBCruR5sZg
         UoLfxq9JOioajcPf2PhCaWZA5FsUHeBHZQOkz+Xahi713/PersOMrDO5A12kVOY1wx6q
         jx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJEW9w0y6Vcyes9owQtz9S/0i0lXig3Az7cXFopBjtc=;
        b=d6xh7TsU5rFMrpFbRZdo3W+xCg20O7mmO4Hcyjq0b5kQ/ESzKkGcNZaLRUOWJJB2dY
         b0+rMl4RKSZNzVzJY8yzNjzMOz+0GeDD6agYuomioYarn5CgTvYGGvNZ7L1W2ddQZ7Yi
         tCsvw5QLfl1gS8EMZc1YySSrObYm7DTn8vv0ZEZRPL2elKvKd0u7N3t68cM8uXz2AOKA
         oWWfbv97AJUVlLeRJKruVU4M1KalFQOon9PBeTFdawE6Z3EndSc/CVQEOVUJ5F6ViwhC
         vY2BQnJHuck0PPMgb/nEE4ZJ9JoxMsMvZ9WyetWk9o67SvBzUdMMkV08WaHDaYsSNy/q
         TPMA==
X-Gm-Message-State: AOAM530PT1NC2GwYIOFf1Fhcl60VnHOZqOonLw60iebE4PuqfLFNcgoZ
        smYAbp8JufactI/5MLWtpaz78Q==
X-Google-Smtp-Source: ABdhPJxwEU1JXAYF23cylO9ydxaJi+pRUDC33zBTaCd/tXUSJbSPQBQH5TQCHFNqw+9C5KQLXr0Ddw==
X-Received: by 2002:a2e:50c:: with SMTP id 12mr23647928ljf.173.1625864853431;
        Fri, 09 Jul 2021 14:07:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 14:07:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: display: msm: dsi-controller-main: restore assigned-clocks
Date:   Sat, 10 Jul 2021 00:07:22 +0300
Message-Id: <20210709210729.953114-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Restore the assgined-clocks and assigned-clock-parents properties that
were lost during the txt -> YAML conversion.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 76348b71f736..760eec6b0db1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -64,6 +64,18 @@ properties:
       Indicates if the DSI controller is driving a panel which needs
       2 DSI links.
 
+  assigned-clocks:
+    minItems: 2
+    maxItems: 2
+    description: |
+      Parents of "byte" and "pixel" for the given platform.
+
+  assigned-clock-parents:
+    minItems: 2
+    maxItems: 2
+    description: |
+      The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
+
   power-domains:
     maxItems: 1
 
@@ -119,6 +131,8 @@ required:
   - clock-names
   - phys
   - phy-names
+  - assigned-clocks
+  - assigned-clock-parents
   - power-domains
   - operating-points-v2
   - ports
@@ -159,6 +173,9 @@ examples:
            phys = <&dsi0_phy>;
            phy-names = "dsi";
 
+           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+           assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
            power-domains = <&rpmhpd SC7180_CX>;
            operating-points-v2 = <&dsi_opp_table>;
 
-- 
2.30.2

