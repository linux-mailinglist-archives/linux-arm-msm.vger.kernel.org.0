Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CDD60AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 18:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfGEQ5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 12:57:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46188 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfGEQ5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 12:57:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id i8so4531478pgm.13;
        Fri, 05 Jul 2019 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aJ9A33XeWtxV0qN7kevtyk3VxBBowXnZfu+VcAnor48=;
        b=tz8DX/jKoInhtLlLZaBLfxK3HCjQCvrIbHkC4j+EqgsDTfRoUcyvqIxLOOH3r0KvzH
         NoAMntP26vyOTlx5Q63WRr3rgXn7UX/fHGGuyjAnjpNl7zSOdOxkTijfhawjIl1OV03V
         roC8k3Ptfl7gPSWwO0tb+pWguCp7M95yIZ6eL+pE8t2/eKZN7tCA0RmY8P00SAhMiZ6B
         GK/AtvtJLyXJHe4OIx2cBYmKrWhvjTp53Zk/Qz1gWoeguE2NhnWRCaN0Gh00pjvmnj0Q
         T2B5NxnjCIPvY/q/0gagoimqpsrvadlA9HuAyrrYtoX6c6uInqBHZIy3T+Yu3CDMtRzm
         hOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aJ9A33XeWtxV0qN7kevtyk3VxBBowXnZfu+VcAnor48=;
        b=doIcLyWEmgVUWEbV97SbMjm74sZAmFFRUCJ+CZCZz4rSofxbR6w94jMkU43jRcPx9G
         xBl8j8KOTb70mvMmDoMcXQM6rRJ/1YnrcPHb7XpSZ7pouVuOmMD462YGdh6VjHb4AEmO
         vYNq8EOozznbIhzmF2sftkQCDonSJVev7m7WATrEU60CUMDSDA9CJb8oUAjtH7YSmPFj
         iP6Nm/LQS8knbDPAX/u6KVCYuGv2w5RomQ5eKUOd4T5Eo8bZ/r7VOXPW+sQe9WbnqP3q
         a/YYTj/x4MQPK5XD7mq34PiGcFNJWlRWV8uZaFPEJwfkYjKoB81aifaPeUSJoSPvsiL6
         COPg==
X-Gm-Message-State: APjAAAX3HXWyvjyHjSTBBByCR/lZaHdJigUVRoRpjszlOkh/3iExytag
        uoGeVD6ijcuTNzCenlfTFCk=
X-Google-Smtp-Source: APXvYqzLkG4W3qE9HCpmT4BW/IS4oA24stCeA7+cpzx8H5U5MOt5gzOL5CxjX+fL+kFC2K4XhRjd4w==
X-Received: by 2002:a63:1f47:: with SMTP id q7mr6615825pgm.264.1562345819395;
        Fri, 05 Jul 2019 09:56:59 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id e26sm9285734pfn.94.2019.07.05.09.56.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 09:56:58 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date:   Fri,  5 Jul 2019 09:56:55 -0700
Message-Id: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
new file mode 100644
index 000000000000..3938c2847fe5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
@@ -0,0 +1,27 @@
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
+		no-hpd
+
+		port {
+			panel_ep: endpoint {
+				remote-endpoint = <&bridge_out_ep>;
+			};
+		};
+	};
-- 
2.17.1

