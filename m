Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C419B39E4F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 19:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhFGRJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 13:09:32 -0400
Received: from mail-pg1-f172.google.com ([209.85.215.172]:40947 "EHLO
        mail-pg1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhFGRJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 13:09:31 -0400
Received: by mail-pg1-f172.google.com with SMTP id j12so14300102pgh.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wKbk17m+yRiqrp8oW9bJSr2UykFdXfcHhiqIPzfS2qI=;
        b=d7uRiZFiVdHNBDp2qM1GV2qvC8tUScUp4gQqpHiZHXNee8gRa/eAc4xiuA9dx93pFr
         QOiJLnTOHlCOM5wbiTgfPH6ytHol9+kEJug/yedPbuegsMS8kLc4Vx0/w/FDNaGsGRST
         1ylMolobN5or1ag0U0WYOWfgeGpYnzKuQdi3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wKbk17m+yRiqrp8oW9bJSr2UykFdXfcHhiqIPzfS2qI=;
        b=OIqzN6D3rvZnjAGLRq/RU0A9j3IsQq5xso3/NFTzCvcpGOjKKJ6BV7Xs7LJBV4L6EL
         5ziMH4YPjK/ekG2WRXJp2MMqPT4EEKG+gbUaX5vC8iGutqoXJVkCR4lPyN0P8tvNfVdE
         3JazYUzHq2v0Gx97rx1yEOhQOJ5mqydj9amyjO7M2ETKxAduxY8HQK90GnE2RO6gJeTv
         TzeRNBOONtwC9N0YMYRFxSKcWhgB4uCKhRkIL6mkO6FQ2GOmP/k+HgV53A3RNEJEbUtR
         8nx/rlZGZtbEy0bHJxRngTTcdH90WqJbSJLvhMFjylIqBUu7lTmzMsbCO5NOKheik7AS
         tUHA==
X-Gm-Message-State: AOAM531QmEPBSd9rzB0QwONGTCLMfQPaEo4rZY6CnBAcgEPI3xRNqLvX
        F87X8MXV0coyz1+ZA1uFxSJKSQ==
X-Google-Smtp-Source: ABdhPJxEW50WvoFT9KK67OmVwM2Mr1eVymTaJSsTsWnsiAx1vJIlqoWz/EV/BWZ999GsFg+jutEjjg==
X-Received: by 2002:a63:5504:: with SMTP id j4mr18814384pgb.238.1623085590332;
        Mon, 07 Jun 2021 10:06:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f656:ffce:6348:a42a])
        by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 10:06:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 11/11] arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip
Date:   Mon,  7 Jun 2021 10:05:55 -0700
Message-Id: <20210607100234.v9.11.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
2.32.0.rc1.229.g3e70b5a671-goog

