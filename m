Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76095255E2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 17:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgH1Pt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 11:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728204AbgH1PtR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 11:49:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B98C061232
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:49:17 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e11so1828879ljn.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 08:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
        b=ObOhJQlcC2wrUZvz/Sa5WdH6CBtF1FirWagTSTjFA478ShCAfENPUBhWqBwSJsc7ph
         IBfCh4/UZVho2Zy0Z3a1Ww1HT3KpaWJU3MEY4WqznZRbdzfWbICAeWy+KNWiHrRHPx1l
         YBjp6QEYudGlvTQA9AibpmhCWGp4MqDic+eza712jiI5N1uvoL7ailsyn3MzRDNP7M8i
         SqxIJmTrT2GFx/o612QaG180NBIlYD9O1g7C/5+1gOwkIFi12ZHsYnmPQRB3aMHbEYcf
         MoGwDAmqwtpRS0kMdgka8hW2RReAgMVkokjZH3spi6HxzxoQPdQHJd+Nqgeg7dvyQhQw
         TEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RzO/u82bhYkbGzYXqTgJ4HBSdRoIsJl4r3uZiLJLve4=;
        b=kQ02EKSnlpqf69vuRMqr4/JeqynEBu/jdOtQAvXNKUFJt1f937kHgwoWLAaTz7Hat6
         CYZnUf1yUcL6kM4nerK892/FqjI2Yv8CgWyFcb5A+rx3qGS/2aDtUzfJbkc8Upg2tUtZ
         DcleDrXxThXSY76lv8cMqbDDuztiU9a8TI9Gl5a48AU+7nYURwvy3r3rTYz2TRqU0+JB
         oRR2vxV0A1JEL4QHz3fSyqlptUb6NQb/77gfFXHFrlW4SEgzgW2lnCdRwEWE1Xn2k6RB
         eQYiO2sx9JpUV2eDivo5r5HtwljmcGkbQSqh9BW6PgK3+YEDouHnglg/vSj+C9tn5VQC
         1eBQ==
X-Gm-Message-State: AOAM531tYDbWAp8LYNqi/u/LbUiH35uz5ih7MouOmQ8lvOWNu4hLNScE
        rjJ8OCSV3MAdg4CXZqt8Prx27Z0gnEEwEw==
X-Google-Smtp-Source: ABdhPJxzFZT3xAeu/O5lodHhBa/sAIGF7iAxnNo9eQnh4WtgUBokeiPOTTMFNBe7D17Jmxr/83YieA==
X-Received: by 2002:a2e:910d:: with SMTP id m13mr1266060ljg.240.1598629755378;
        Fri, 28 Aug 2020 08:49:15 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id r16sm270215ljd.71.2020.08.28.08.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:49:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: Add documentation for LT9611UXC
Date:   Fri, 28 Aug 2020 18:49:04 +0300
Message-Id: <20200828154906.1662611-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
References: <20200828154906.1662611-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
and I2S port as input and one HDMI port as output. The LT9611UXC chip is
handled by a separate driver, but the bindings used are fully compatible
with the LT9611 chip, so let's reuse the lt9611.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index d60208359234..7a1c89b995e2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Lontium LT9611 2 Port MIPI to HDMI Bridge
+title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
 
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
 description: |
-  The LT9611 is a bridge device which converts DSI to HDMI
+  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
 
 properties:
   compatible:
     enum:
       - lontium,lt9611
+      - lontium,lt9611uxc
 
   reg:
     maxItems: 1
-- 
2.28.0

