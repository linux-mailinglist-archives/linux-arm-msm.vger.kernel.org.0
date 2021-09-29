Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75ECC41BD9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 05:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244059AbhI2Dou (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 23:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244049AbhI2Dot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 23:44:49 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5E1C061745
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:07 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g184so1305369pgc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 20:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XiAcvN5D+Y73TnzW/uz6uuO7o7HK+IwXNf7Gv1BpkoY=;
        b=V+7T44/slVAl+pNwTIxSKRYbpDdNYZvl8TkqNqfzEBx4S/3NcwSahB2sA8y0BgB0kJ
         qz7HZH2XPHl79aZRTdWuamDLCXjbtdJURO+toqMXk6aev/0SVrDUC7/azRMEjw0Tucv7
         KIhz7VYXjpBTniISWSG9U/uirXebd3052ZyI1uLHkOwIQXm1KHtjo3rJ4vIOWFThHw0r
         wzx+cRG3Y2crnWTgG9rVryqkJSO9QL6yxrdQlKx8HnbLBIVKlI+Ea3HU4nKBqoHkW5VY
         H0UZPx2E5Lky2kUujJI4OhoBHgN9lblr3vfGlEM0KxlrcT9vwiLdzDKPJJMg1c+yeFl4
         ytQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XiAcvN5D+Y73TnzW/uz6uuO7o7HK+IwXNf7Gv1BpkoY=;
        b=ZyEWx4AbLPDzeXsCagV4TQ5/3x41C/kc7NAhFuQD9apdqTRXuxKDA1Qi/NxKruYFNR
         3Uaze0Ztj1cZGHxTVqPnzu3OjhwAmBNP9NAHOcOWTuKKqP7AJvEy3vACyXXznrKq96Eg
         TxxEk+lC5m0mNHI6Dhf4ybhFas6FgkzgohiCGIgeDyrn8j2d7XoRxDsC9pRb+0MG0QCE
         mEfmwfaf0PrNhWwcCFpKAM/9RZjpkedTPOKfX/wwBq17BV4rXPDt7HVpeTeILA3cjigI
         qd6ibv47JsAE6NctQDjVJ7MJXQVVq8WswGjt3sfgZhLWoDYzVLhx2Mgcc1XKjgDHXV1y
         /4tw==
X-Gm-Message-State: AOAM532VOvW8cUsr7SIhZOzN5hrik3Sqn2GcDwCKPtd3UfO8gxkUSo+t
        44PBPQq3Mv5IuTQv8e4nSTH1Lg==
X-Google-Smtp-Source: ABdhPJxo3TFzb6VyXT5qwqheqSUQ61Z1njZpEUQDLHcl5V1QDAt0UzFWTh3qDy4lyiVRjxzs0EVW2A==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id c6-20020a056a000ac6b0290374a33b0a74mr1223422pfl.51.1632886986882;
        Tue, 28 Sep 2021 20:43:06 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id b7sm533032pfb.20.2021.09.28.20.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 20:43:06 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 01/10] dt-bindings: phy: qcom,qmp: '#clock-cells' is not required for parent node
Date:   Wed, 29 Sep 2021 11:42:44 +0800
Message-Id: <20210929034253.24570-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210929034253.24570-1-shawn.guo@linaro.org>
References: <20210929034253.24570-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'#clock-cells' is not required for parent qmp-phy node but the child
phy/lane node.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 75be5650a198..604435e46623 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -58,9 +58,6 @@ properties:
       - description: Address and length of PHY's common serdes block.
       - description: Address and length of PHY's DP_COM control block.
 
-  "#clock-cells":
-    enum: [ 1, 2 ]
-
   "#address-cells":
     enum: [ 1, 2 ]
 
@@ -108,7 +105,6 @@ patternProperties:
 required:
   - compatible
   - reg
-  - "#clock-cells"
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -421,7 +417,6 @@ examples:
     usb_2_qmpphy: phy-wrapper@88eb000 {
         compatible = "qcom,sdm845-qmp-usb3-uni-phy";
         reg = <0x088eb000 0x18c>;
-        #clock-cells = <1>;
         #address-cells = <1>;
         #size-cells = <1>;
         ranges = <0x0 0x088eb000 0x2000>;
-- 
2.17.1

