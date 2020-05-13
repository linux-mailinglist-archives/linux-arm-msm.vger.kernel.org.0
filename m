Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6771D0F44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 12:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733189AbgEMKGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 06:06:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387444AbgEMKGE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 06:06:04 -0400
Received: from localhost.localdomain (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E968C206B8;
        Wed, 13 May 2020 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589364364;
        bh=f4a7jQYUGO+gefhtNwOgyxXu8SfY9ICLOZ0ZEWYfr1Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B3R1wJ7GK/L3htlT9FId9pUaXL7vqHSMvbj3xYa212Rc5lvpxqzSEgX0J8tzVX+qx
         y3EWZyr1iH3CcHGPbPlTOKIgxuJ+JhA1K7KHcw0H9ef7m0tDY8/PxA3eXnB00VkFla
         iF5y4dxlR7eumQ9SUZhvVnGbXx9b99GSPwmhWw74=
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Lontium vendor prefix
Date:   Wed, 13 May 2020 15:35:31 +0530
Message-Id: <20200513100533.42996-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200513100533.42996-1-vkoul@kernel.org>
References: <20200513100533.42996-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add prefix for Lontium Semiconductor Corporation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..7294852bc47b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -579,6 +579,8 @@ patternProperties:
     description: Logic Technologies Limited
   "^longcheer,.*":
     description: Longcheer Technology (Shanghai) Co., Ltd.
+  "^lontium,.*":
+    description: Lontium Semiconductor Corporation
   "^loongson,.*":
     description: Loongson Technology Corporation Limited
   "^lsi,.*":
-- 
2.25.4

