Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A645E8E206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbfHOAtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:13 -0400
Received: from onstation.org ([52.200.56.107]:44310 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbfHOAtM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:12 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 7006E3E998;
        Thu, 15 Aug 2019 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830152;
        bh=onikNoreFBf7Lir0NTdw9PrR2YRnHxeCYQkeZbJ3YvQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KSVmUNaF+Q0K6DwjQyjqoeBvOn/EcvL1UgZjHTVMHSqL77RES/N9Fzns/3ZaSBAka
         1oJVk0pjCCNXe/yEt7U5E2IviJzpSqcT64KjnIKFDfDN2DRWKC++aqaxd9oZv0ipmF
         JbeS94gZj7/gRoZF8kun4tUDaM/udwWxjGLuyn1E=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new variants
Date:   Wed, 14 Aug 2019 20:48:44 -0400
Message-Id: <20190815004854.19860-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the analogix,anx7808, analogix,anx7812, and
analogix,anx7818 variants.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 .../devicetree/bindings/display/bridge/anx7814.txt          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7814.txt b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
index dbd7c84ee584..17258747fff6 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx7814.txt
+++ b/Documentation/devicetree/bindings/display/bridge/anx7814.txt
@@ -6,7 +6,11 @@ designed for portable devices.
 
 Required properties:
 
- - compatible		: "analogix,anx7814"
+ - compatible		: Must be one of:
+			  "analogix,anx7808"
+			  "analogix,anx7812"
+			  "analogix,anx7814"
+			  "analogix,anx7818"
  - reg			: I2C address of the device
  - interrupts		: Should contain the INTP interrupt
  - hpd-gpios		: Which GPIO to use for hpd
-- 
2.21.0

