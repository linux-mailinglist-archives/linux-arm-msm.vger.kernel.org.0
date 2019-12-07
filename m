Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56D9115E92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfLGUgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:14 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45741 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGUgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:13 -0500
Received: by mail-pl1-f194.google.com with SMTP id w7so4134929plz.12;
        Sat, 07 Dec 2019 12:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3/AYVovlJiJ1Alu6bE6pYRPal+N6Ynq1x5wnV6ZnAY=;
        b=AI3kKMlUpDOEK8jI30xnwDi6FbaN9R3AEX+zDWP825P8L4WIE6lqRibsGBNH990x6S
         2W1aLv0wOqFpSB31f8F7l1zxV56Did5ya2GMvZJ/7kw5cHAiEfhR2Tp53PQ3sBAT6oDh
         JqVOaJt1II8tJNn5yAwswhTIVOU091UFAbTFFtsaWx9yef9ywpJEWEh8wHlNvkGl5Dz6
         AyO6kHoUAsNIa12cbiDJO2VwLMlvuw05GwqlR+nBzBPNHq75Pfni4Kia7/5Ei0HVRpRP
         xZ2t/i0AwZn6D+xVSpxrbG6oah5ngpYwQTzPZiNkuXxk2AlDapRg4dVo5mUFeoHH5c8p
         FtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3/AYVovlJiJ1Alu6bE6pYRPal+N6Ynq1x5wnV6ZnAY=;
        b=dh/hzZ3uSwUOsmp99yIDkbcNyZGJvW/x0x28nLWetKiIEB83kXUd0oFzjcLfuQiN5S
         lxqFB7JXM6x+xX6eWkOcObIWa5YZyxy35L9GhbJY+phOi9PltsClCQH5q9qVxHd9/Kk0
         lcJikDwwmWj7ha2sMaQtFMDy7T1eFiSdZYSngqoW25JM/KVwZA1J8LvPl5TTuVXNSV1B
         hu+NYs1vp8LIsXMcOhS003i0Y6u/WaTcTCkXmbPnUPzI9/UgzhP1Rb3c6x3llFyW6dHt
         DUxtNEDsYaEs+QWlJ/H+NZfWJvtDzM9V25/kuQP8JumjdOUeNgWiR2rVMg3wrQFtCgIN
         ukQw==
X-Gm-Message-State: APjAAAX/NKo2r0la6wSwoLraosZbMMysscUxiec+i2udyeklrsBPAF7/
        J0/5JjNMI8fubnbTEn0TIK0=
X-Google-Smtp-Source: APXvYqy0w+EuWHFKr8S5+G6Ihehi1cLJ75cYyMki2L3dxv/6qi53ML5wX8lcDeRM081R2NGlCpOONA==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr23509768pjb.56.1575750972199;
        Sat, 07 Dec 2019 12:36:12 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l1sm1884223pgs.47.2019.12.07.12.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:11 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org
Cc:     Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] dt-bindings: display: panel: document panel-id
Date:   Sat,  7 Dec 2019 12:35:50 -0800
Message-Id: <20191207203553.286017-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191207203553.286017-1-robdclark@gmail.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For devices that have one of several possible panels installed, the
panel-id property gives firmware a generic way to locate and enable the
panel node corresponding to the installed panel.  Example of how to use
this property:

    ivo_panel {
        compatible = "ivo,m133nwf4-r0";
        panel-id = <0xc5>;
        status = "disabled";

        ports {
            port {
                ivo_panel_in_edp: endpoint {
                    remote-endpoint = <&sn65dsi86_out_ivo>;
                };
            };
        };
    };

    boe_panel {
        compatible = "boe,nv133fhm-n61";
        panel-id = <0xc4>;
        status = "disabled";

        ports {
            port {
                boe_panel_in_edp: endpoint {
                    remote-endpoint = <&sn65dsi86_out_boe>;
                };
            };
        };
    };

    sn65dsi86: bridge@2c {
        compatible = "ti,sn65dsi86";

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;
                sn65dsi86_in_a: endpoint {
                    remote-endpoint = <&dsi0_out>;
                };
            };

            port@1 {
                reg = <1>;

                sn65dsi86_out_boe: endpoint@c4 {
                    remote-endpoint = <&boe_panel_in_edp>;
                };

                sn65dsi86_out_ivo: endpoint@c5 {
                    remote-endpoint = <&ivo_panel_in_edp>;
                };
            };
        };
    };

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ef8d8cdfcede..6113319b91dd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -75,6 +75,32 @@ properties:
       in the device graph bindings defined in
       Documentation/devicetree/bindings/graph.txt.
 
+  panel-id:
+    description:
+      To support the case where one of several different panels can be installed
+      on a device, the panel-id property can be used by the firmware to identify
+      which panel should have it's status changed to "ok".  This property is not
+      used by the HLOS itself.
+
+      For a device with multiple potential panels, a node for each potential
+      should be defined with status = "disabled", and an appropriate panel-id
+      property.  The video data producer should be setup with endpoints going to
+      each possible panel.  The firmware will find the dt node with a panel-id
+      matching the actual panel installed, and change it's status to "ok".
+
+      The exact method the firmware uses to determine the panel-id of the installed
+      panel is outside the scope of this binding, but a few examples are
+
+      1) u-boot module reading a value from a u-boot env var
+      2) EFI driver module reading a value from an EFI variable
+      3) device specific firmware reading some device specific GPIOs or
+         e-fuse
+
+      The panel-id values are an opaque integer.  They can be sparse.  The only
+      important thing is that each possible panel in the system has a unique
+      panel-id, and that the values configured in the device's DTB match the
+      values that the firmware is looking for.
+
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.23.0

