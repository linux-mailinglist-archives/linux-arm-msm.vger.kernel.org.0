Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2401222B3A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 18:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgGWQfC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 12:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:53272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbgGWQfC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 12:35:02 -0400
Received: from localhost.localdomain (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 854DF20714;
        Thu, 23 Jul 2020 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595522101;
        bh=j4EX+FYYMmUL3lz0Sf39rotA7d7j4vro6NAbsWtYLko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nwv/5eMywXCp0cM0DCZaJQH48pL2K9joRr9bJ18pYb1gTue84gV+dg3b7BnEEmKOI
         QH5zQYGOCANIwj4bheQo+jBwyOI2fB+a3A6+uwAaGEM7lR+nf45ivUej+NanYfhYzP
         ErzuX5n8hQrhmshcttbOQXObifHQs6NvZUiPgE20=
From:   Vinod Koul <vkoul@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH v6 1/3] dt-bindings: vendor-prefixes: Add Lontium vendor prefix
Date:   Thu, 23 Jul 2020 22:04:40 +0530
Message-Id: <20200723163442.1280414-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723163442.1280414-1-vkoul@kernel.org>
References: <20200723163442.1280414-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add prefix for Lontium Semiconductor Corporation

Acked-by: Rob Herring <robh@kernel.org>
Tested-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..31cdb21a3d22 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -595,6 +595,8 @@ patternProperties:
     description: Logic Technologies Limited
   "^longcheer,.*":
     description: Longcheer Technology (Shanghai) Co., Ltd.
+  "^lontium,.*":
+    description: Lontium Semiconductor Corporation
   "^loongson,.*":
     description: Loongson Technology Corporation Limited
   "^lsi,.*":
-- 
2.26.2

