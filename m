Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C981AAC45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 17:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbgDOPuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 11:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394211AbgDOPtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 11:49:50 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C051C0610D6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:49:50 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b8so137098pfp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv5Jh31H5+w8jdcU3qZ2inNmrbUd8kK+/sKgr7aMmBA=;
        b=ocsih6TZchbbdMilfJ2eaHo8YrE4iyg4spUMxkGBGstj8CDKhojbdYG+R6JnRMOHpi
         cibm2DqYQindZF69po+bUjLtkYkIIFvjCe50kEUJUbPMiABottJBLLZhsFmJEMAKF8bX
         iYWvV+b13tAnkuxypq1P36v0kRWJuAPIlucVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv5Jh31H5+w8jdcU3qZ2inNmrbUd8kK+/sKgr7aMmBA=;
        b=MeTNzjaPf0uxZhPX46YJvXTyNEthQq4llWGAJ9MZrpnHnT6tiM/uEaJiwy0Y2zx6Zr
         zwq6/PHgnKu5nzO1PDXGjpHAOkNpEOBgdgHD8MgZXUJR73IkOR0SZWiIlMke19ATSxi6
         tjIV+cTPC44O5GJFi+Ts97FdplHWT70q1rjLiQ3OWMFxW8jhQCcoOees7R71xUqXCstj
         9GvFNPmwO/12Ws+MlZZteuHvOYcpzvrv80WKoliTpHeHZ4kXtIE6pzpK7ZqYxJqEt+Hk
         VdjWGEJRJciWmPcjEMar5hPtSngKsTpHVQGE6TZaGFkCKpku7Pp2371dKj9VOZQ49n3V
         hdtw==
X-Gm-Message-State: AGi0PuYV5yE8XMYutmGUOhTx9KN4EkeZr2ap7VCVZqdx0k6xPU3/a/Wb
        GR2PIltXn3ThP5ngMOJYUVun5w==
X-Google-Smtp-Source: APiQypJ7H4gzqxg/2G4EhbDrGrS2BP4/dIipLbFjqpBVazKk05eyediy+KegDkVKm7ncrS7AMSqZ6Q==
X-Received: by 2002:a62:e50f:: with SMTP id n15mr5859148pff.22.1586965789612;
        Wed, 15 Apr 2020 08:49:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id x27sm14382473pfj.74.2020.04.15.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 08:49:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        narmstrong@baylibre.com, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Cc:     jonas@kwiboo.se, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios to the bindings
Date:   Wed, 15 Apr 2020 08:48:40 -0700
Message-Id: <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow people to specify to use a GPIO for hot-plug-detect.  Add an
example.

NOTE: The current patch adding support for hpd-gpios to the Linux
driver for hpd-gpios only adds enough support to the driver so that
the bridge can use one of its own GPIOs.  The bindings, however, are
written generically.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 8cacc6db33a9..554bfd003000 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -60,6 +60,10 @@ properties:
     const: 1
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  hpd-gpios:
+    maxItems: 1
+    description: If present use the given GPIO for hot-plug-detect.
+
   data-lanes:
     description: See ../../media/video-interface.txt
 
@@ -148,7 +152,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      bridge@2d {
+      sn65dsi86_bridge: bridge@2d {
         compatible = "ti,sn65dsi86";
         reg = <0x2d>;
 
@@ -165,6 +169,10 @@ examples:
         clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
         clock-names = "refclk";
 
+        gpio-controller;
+        #gpio-cells = <2>;
+        hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
-- 
2.26.0.110.g2183baf09c-goog

