Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C703A47C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 19:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhFKRVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 13:21:43 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:33347 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbhFKRVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 13:21:31 -0400
Received: by mail-pg1-f180.google.com with SMTP id e20so3040869pgg.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jun 2021 10:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lm8f+cgoTyoMv6LojWG+q+HbbYy9bIevpHmIO6bhvFQ=;
        b=SONsjUgaSCpjesoP57Duff7/N9FbooF+6xHaFm2/6+0js4J+/5pRap7OlmmS6K14OC
         ALyszZdGFo6vkpx671CpBwRK1M+sBHUkQdLVLzPPpK5eTOW5eAKNSvFxiZfAoJwAv/Da
         YdS1mTEgZqaSZIr66gQ04l0kBwMxoaGE4mjA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lm8f+cgoTyoMv6LojWG+q+HbbYy9bIevpHmIO6bhvFQ=;
        b=pCXZZOdFrHzwqKsRHDtyqSJRPod1QbIeiydwfVncJH2hgP55rNQXG3nO9C8+lNppgR
         F/L+3yHMmC7T/FGw+K5hbt/xYw8lQfZM+5R79MdtdgKbpvoe4EmYwKv/miLB73fXfZnJ
         82J9GOuSKpS4zl2sDRQTZYvdYPZMm8BiHwciK8s06x9+rcOCDIf0ZIi3uSXP9VBRgxan
         4W7SaA7rs+g/CcYBk9XESfxpnV0K6hNFaOv5HOQi8S2howyFscroHgnng09y6BAEO4GK
         22DJ9Pur1c5Ud6bJ/yoER+4lmBkUdz47W3HASbJTFO5bnJmKyE89hsl4FA8aKQ3frnez
         v16g==
X-Gm-Message-State: AOAM532HYZfIXMI4pmeCcBblGwL/ay4Q1E+hqKZ+Zajb/bLuCW/oeXRu
        LvTCdnurJb+TalSsTPHl2gw0bA==
X-Google-Smtp-Source: ABdhPJwxVBdz4VSd37xZGkjqd3eRlnc19a2QDpFiFB3/GkJaeo2YWCuLiYi8i0v5Gh0sqIcBFVsV3w==
X-Received: by 2002:a63:3145:: with SMTP id x66mr4629677pgx.117.1623431903362;
        Fri, 11 Jun 2021 10:18:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:4128:5428:5cd0:cfa5])
        by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 10:18:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/11] arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
Date:   Fri, 11 Jun 2021 10:17:47 -0700
Message-Id: <20210611101711.v10.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Putting the panel under the bridge chip (under the aux-bus node)
allows the panel driver to get access to the DP AUX bus, enabling all
sorts of fabulous new features.

While we're at this, get rid of a level of hierarchy for the panel
node. It doesn't need "ports / port" and can just have a "port" child.

For Linux, this patch has a hard requirement on the patches adding DP
AUX bus support to the ti-sn65dsi86 bridge chip driver. See the patch
("drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v7)

Changes in v7:
- Panel now under bridge chip instead of getting a link to ddc-i2c

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 24d293ef56d7..c76afd857b54 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -260,21 +260,6 @@ max98357a: audio-codec-0 {
 		#sound-dai-cells = <0>;
 	};
 
-	panel: panel {
-		/* Compatible will be filled in per-board */
-		power-supply = <&pp3300_dx_edp>;
-		backlight = <&backlight>;
-		hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
-
-		ports {
-			port {
-				panel_in_edp: endpoint {
-					remote-endpoint = <&sn65dsi86_out>;
-				};
-			};
-		};
-	};
-
 	pwmleds {
 		compatible = "pwm-leds";
 		keyboard_backlight: keyboard-backlight {
@@ -674,6 +659,21 @@ sn65dsi86_out: endpoint {
 				};
 			};
 		};
+
+		aux-bus {
+			panel: panel {
+				/* Compatible will be filled in per-board */
+				power-supply = <&pp3300_dx_edp>;
+				backlight = <&backlight>;
+				hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&sn65dsi86_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.32.0.272.g935e593368-goog

