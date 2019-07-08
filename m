Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01841626B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 18:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389850AbfGHQ56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 12:57:58 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40310 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGHQ55 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 12:57:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so7985764pgj.7;
        Mon, 08 Jul 2019 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xDwSUm2ymU/W1fSZho5QIri1l9GMHXrnnJtJgPD9q8c=;
        b=cUqnE1qJhl3aN0kYxeb2SjpcgFwRj4ZP4G1SQBx2d9jsqA2OItxE1MuXGX5OceJ9rJ
         /i18h7EhofDQiCMmSS9BSVtNTifgQi5NTpjlwB09P9BRk49ZfAqEW/Q8QxakZdxMdy+H
         u2/s7QFSBF2LXOEwYXdTUZ10znesq9ATfZ/7W1EYB0nysxpT73RkiT85DuXmfDlDt78Y
         4WosOgy8yX5QSD8LD5gbB5YRe/+8AoOqah8y0FHeFgN9SZDtig2WKmsQBflUW9ZADZa7
         YVJNqDr2Wj9xCF2VPteY0mHl3inFSA2SNcESc9a792f2A+s+lvWnKKur6/QUixjwTQKs
         2R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xDwSUm2ymU/W1fSZho5QIri1l9GMHXrnnJtJgPD9q8c=;
        b=NuGM7Eul+vrN4yyt8E2QPxVxkEHtJsfmTEisYHyABpndeRx3Aqo33b1G2xvovo8ggu
         SxczYvZ9QDwBa25KiJQPrqP7dr3AnP/2RYwPVgPYWNoAylkZRJXe68kUpOrUJ6Qfsq5M
         4wLzBFCW2lL912qSDQm2gLJ0aD4UI+e3t3NyWn95YRRqIPRIkyv4uxgsO9F8VELZpdMT
         4Zh24J+lB7aLpHBVvRC7YD0Xvx20QRW8HJcH02xrypP2eTTXKjqj7dIqkDgrZk4+Y76f
         Wu5xJ5YNItdXjYDXPGuiH+reUQidnNeOlwywVVVD27DeLwTAZlqv2IkZz6pBGySsEejx
         mw+Q==
X-Gm-Message-State: APjAAAWJXQCfClDqCFq6wLWgqbDkWtpDLBN3dBvC2gHO5jJGgOyUFtLq
        MNYKn2QcmeePjwsgXs0xYEo=
X-Google-Smtp-Source: APXvYqzSJot1VXmkklME31WkeSKMsCOKZxANzmuc2CzhjLcyvTi751cZbwfGTLg8UoLNQEdOMtdGbQ==
X-Received: by 2002:a65:62ca:: with SMTP id m10mr25029485pgv.57.1562605077213;
        Mon, 08 Jul 2019 09:57:57 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d16sm12280022pgb.4.2019.07.08.09.57.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 09:57:56 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date:   Mon,  8 Jul 2019 09:57:53 -0700
Message-Id: <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/sharp,ld-d5116z01b.txt      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
new file mode 100644
index 000000000000..fd9cf39bde77
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
@@ -0,0 +1,26 @@
+Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
+
+Required properties:
+- compatible: should be "sharp,ld-d5116z01b"
+- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
+
+This binding is compatible with the simple-panel binding.
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [1]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	panel: panel {
+		compatible = "sharp,ld-d5116z01b";
+		power-supply = <&vlcd_3v3>;
+
+		port {
+			panel_ep: endpoint {
+				remote-endpoint = <&bridge_out_ep>;
+			};
+		};
+	};
-- 
2.17.1

