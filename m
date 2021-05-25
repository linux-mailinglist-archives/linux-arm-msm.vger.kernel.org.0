Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4680A38F6C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbhEYAFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbhEYAEi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:04:38 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41319C061347
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:56 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q67so5123363pfb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3qFLOaUCi0WYGUyCmLqrEif6mRJ8u8fFU7Zgh2OGms8=;
        b=mG7J209zaQCJJxhHTB1kgkaUN3lotKNwZl1qpb1B/7puBZWLYE/M/Qfnt2cDUWNCig
         nQOFY4Tftu9/1Xin+yQPRW+462ofrPtvfh28OYEXR3PCHAZc0rU+82eOZNUDK/1bTBdB
         MCazDzs5CjxFNsJfJlRr+KIhYqs55qaaH5NAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3qFLOaUCi0WYGUyCmLqrEif6mRJ8u8fFU7Zgh2OGms8=;
        b=EpJjlmTyNFrRKjGRiQuRaaeXwylkcvcgdWA7SVWFXnFeyNmAr58oryu/DyQBEsIFQi
         mWlDNqvS1ZELCZ10KAGQZ8i3insdhW2waDdxDoj6G+D8KzuOLN+ffiSL/LC+cbQuWKmV
         tK8hfrmIKwt5GVjOrMu7Ef11U2DnOjxPxXmC1JM3oFwxc4YxJhT0y3Alzb3YkMDaghKi
         CJu58ierAKdHV5oeh7W/67/+Ry9F+VaFn4pEuhFcK8G2ZvveAVdAQ5f7FmfJGDGNNNDN
         2fzX6eAWtrArFKtx9z3hgTBI2Av06yZBkkE76DHKTS8XJzI1y75C1UILR289K4gcRulr
         ad5Q==
X-Gm-Message-State: AOAM531zX8MykByuMcUC4Vz/s1XO0gHVnaST0T1Pn4vA4EUyxgi9gMei
        5tGPdaZHyHnENBiUwdOslR1LXg==
X-Google-Smtp-Source: ABdhPJx5C+8zTuLTjxVJMS4EPDr7rRNr7Ky/FS6RudZXZZvp+t4FXELkMogHFv7NbjC/xJ97iP4p3w==
X-Received: by 2002:a63:6f4e:: with SMTP id k75mr16304849pgc.434.1621900975692;
        Mon, 24 May 2021 17:02:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
        by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:02:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 11/11] arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
Date:   Mon, 24 May 2021 17:01:59 -0700
Message-Id: <20210524165920.v8.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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
2.31.1.818.g46aad6cb9e-goog

