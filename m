Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5249D2559C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 14:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgH1ME5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 08:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbgH1MEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 08:04:51 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E287C061232
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 05:04:50 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d2so585769lfj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jnJkpVlnhMxAh71Cjf8d2Unww6T02tO0K+kvU2U1wWY=;
        b=mede1u5UxI1HNiOfFL/BVB94+AYOMFwIOI6fO1xrbxyc/qa0Ayjul1tQ8xjVz2MaGa
         ig0b+3CfVUtV6tVUDb5joNAknIIqHarNZKkXfY6GZvp46E4zb7k+m3MBKLV4mcmld5+I
         HuoF2YTTBt26TMiHqcJl9Iq/DTOwMNjQz70cHXxhxoz0DAsu7BJK81VnytmUSSlqajaQ
         8J68I/LOi/+r2tnjTr2pUzBVDZXPECkKF0pJGw+VVlO6pXWTrgl861ng72jcn5tgnBXP
         Q1+vG8GkCUJvhgk6vzMA1NVL86ofA2eU+7BJqCJBnCDI1iLWRmdqZEqG4QUcOLIWhHTv
         IW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnJkpVlnhMxAh71Cjf8d2Unww6T02tO0K+kvU2U1wWY=;
        b=KllSqJ7zwWVLOcK0WuggFZVkOcwlYfMILWhZDRpaCyvfOGbq7z8gH6ViIU5V2jfVkg
         F38+MN8w6K/v0XPsFGHo4PY17y2v0MIMb1fx/iJmzQRvBaYJFDFQvuzma6K+u/pSFPtM
         wR28sc8D5YF7IXF+Lg+d+HfRBQ7YQBbbPDpYD/765huWnJdSRDqHQXrI/2nmGtVrBRMs
         8liQ6YbrXyjcLE3vKI5TYkQWjUxOFgT2ZoTfjwAO7HDUTIWTegsz45wYHmiPj+XHm8kH
         zDt/AzVvjkotTF9srqz2E2cdybWNPfu2nHl80WiYPdigdtlUDEA5f165JzcK1GALw5FW
         iPvA==
X-Gm-Message-State: AOAM5310Z5o4txhdHijfREQAqKIB7fms/NEteUNK4+TeOyk52lU7y8Qg
        xDgwXOMMga/6Xxcogvv935YSLQ==
X-Google-Smtp-Source: ABdhPJwIKC38BfPDipaxUw6YQZ6nAyVWAtvuVrVRdbMqEL8Nj5f2g3NlCtb3AHylHCEaJUHyePNqwA==
X-Received: by 2002:a19:c189:: with SMTP id r131mr644898lff.186.1598616288851;
        Fri, 28 Aug 2020 05:04:48 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id c4sm163340ljk.70.2020.08.28.05.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 05:04:48 -0700 (PDT)
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
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: display: bridge: Add documentation for LT9611UXC
Date:   Fri, 28 Aug 2020 15:04:30 +0300
Message-Id: <20200828120431.1636402-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
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

