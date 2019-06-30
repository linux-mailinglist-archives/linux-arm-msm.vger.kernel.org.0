Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60EE5B180
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 22:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfF3Ugl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 16:36:41 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33772 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfF3Ugk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 16:36:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id h24so9492328qto.0;
        Sun, 30 Jun 2019 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nR/YCvWjef2okuUJBoulBLc7CJvLwyzicV4xinW8aAU=;
        b=o3VkptGTVq61lvXebAtF1Vs8W4dTkHIWwPtXHRYASTjCMmewaFs9plkDD2/J4+6eUT
         99w13xOT8AtKeZWBDcDHNrY2Cnlsc7Bi2NyImXZzEz8YAW4abxef7RuwUstD898tYxjB
         2oLC2WfceHZM0cQeMRf3eZfuWS6/TJWXh2hmN0qzhZTWNUd7T0kNUlv0rTZkACVZx7KM
         OMiSRI3Y/YF3biXYIvlyIBZ7dL5eZzxqt+04Kz4fT6y0n1vByrwjsAw7vIXqkXH+xEe+
         rJebE03H9+t5CleK1iADDMFw3OzfpUWS9V9DoONGAm/m32TRWJiK75aKmM243ptyoBHH
         sg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nR/YCvWjef2okuUJBoulBLc7CJvLwyzicV4xinW8aAU=;
        b=f9GrOik005KtBVtr602MpVT6hM8xbuBfvrac1KMwQKn+iRH6llh6f2h2vWNbHqF4GL
         D6eY478oEH3FZibldG982nAAlKhP40dxQ6ZTI0v8TQ5Wo63VchFe7XfKcr12deIR6tGh
         1aUeokqckcAJXkYXEdu5Hj/ae+KgUQ/EewgQ7zS4MfrokFnOSwZP6WatWzX/lPdQS7oc
         qFrjL6t5OLOTlAdBB62WXs7SwL2+wNRKlawVXipG//p0zaMkqwGd9Lkjxvbr2m5HvNbk
         usR6rBk7HIxpeETn6WeaI67vf9B1AQ5+p5gwR7yZPLdakTQxBe9DyIzlbRULP1f3Vk0X
         GiAA==
X-Gm-Message-State: APjAAAXROdVPugyCiDWOu6DjGPvARq70TNYEwEtrlE10rOwpV8CJIbfl
        ZHzexuw9+3PgCPmHRvq0deQ=
X-Google-Smtp-Source: APXvYqwJWB4WKYHWiOhXkTyDDWP8+VjolCHUld/jlsHEBPSEA7SLRDj+rfthVKZlVShn0LY+FxfB8A==
X-Received: by 2002:ac8:2439:: with SMTP id c54mr17304252qtc.160.1561926999718;
        Sun, 30 Jun 2019 13:36:39 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id k40sm4616907qta.50.2019.06.30.13.36.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 13:36:39 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: chosen: document panel-id binding
Date:   Sun, 30 Jun 2019 13:36:05 -0700
Message-Id: <20190630203614.5290-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The panel-id property in chosen can be used to communicate which panel,
of multiple possibilities, is installed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/devicetree/bindings/chosen.txt | 69 ++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
index 45e79172a646..d502e6489b8b 100644
--- a/Documentation/devicetree/bindings/chosen.txt
+++ b/Documentation/devicetree/bindings/chosen.txt
@@ -68,6 +68,75 @@ on PowerPC "stdout" if "stdout-path" is not found.  However, the
 "linux,stdout-path" and "stdout" properties are deprecated. New platforms
 should only use the "stdout-path" property.
 
+panel-id
+--------
+
+For devices that have multiple possible display panels (multi-sourcing the
+display panels is common on laptops, phones, tablets), this allows the
+bootloader to communicate which panel is installed, e.g.
+
+/ {
+	chosen {
+		panel-id = <0xc4>;
+	};
+
+	ivo_panel {
+		compatible = "ivo,m133nwf4-r0";
+		power-supply = <&vlcm_3v3>;
+		no-hpd;
+
+		ports {
+			port {
+				ivo_panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out_ivo>;
+				};
+			};
+		};
+	};
+
+	boe_panel {
+		compatible = "boe,nv133fhm-n61";
+		power-supply = <&vlcm_3v3>;
+		no-hpd;
+
+		ports {
+			port {
+				boe_panel_in_edp: endpoint {
+					remote-endpoint = <&sn65dsi86_out_boe>;
+				};
+			};
+		};
+	};
+
+	display_or_bridge_device {
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			...
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				endpoint@c4 {
+					reg = <0xc4>;
+					remote-endpoint = <&boe_panel_in_edp>;
+				};
+
+				endpoint@c5 {
+					reg = <0xc5>;
+					remote-endpoint = <&ivo_panel_in_edp>;
+				};
+			};
+		};
+	}
+};
+
+Note that panel-id values can be sparse (ie. not just integers 0..n).
+
 linux,booted-from-kexec
 -----------------------
 
-- 
2.20.1

