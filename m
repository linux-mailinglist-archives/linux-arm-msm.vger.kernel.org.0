Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9BF1456F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 14:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgAVNlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 08:41:36 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:36876 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgAVNlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 08:41:35 -0500
Received: by mail-wm1-f44.google.com with SMTP id f129so7256279wmf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+1YnzaRuU5b4diDznRLosYKwgKO04B248mWmfTAg/qY=;
        b=Gv3O69wQrItN9AKLUalv6zjwAvGjYihR9cqDBaAJCQTqQWIMdjnbHG4JYM/ZHefV42
         6XB0jUmYBA5VX7dLlzHKfoMg6seTnf/t8+NMoSbHX0Mq8JbdAeM8wByuxjVS5vQBBuio
         rh3CJW1zPGcFQeR2BpId4RzRyHE5qPh0z0MOECiRHY7IcOr+4FjWSny0IvYETqmYI0LZ
         lbLKzmjZCIgkp6rneAcKf5XGFjWcFC52Xq025cieorQg9QXctUL9eeiUnX9NB9twpvO2
         4hHJiR4NOOrLIl1J7WdyM4NF/w3oZvyc7rP5pW+qkfbjZ87gP3ED6A7lT6g5V4denVb0
         N0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+1YnzaRuU5b4diDznRLosYKwgKO04B248mWmfTAg/qY=;
        b=qoVF5IAuKgw1v52sHbWyZK88yD+NPCfbGQNQzJDuFjF8shKOFGQtIizswBH1VK5Q6S
         k9elUe3UUmKfK5XBa5c73fah74SgxpLNDPF8hCLkD0tEO2fIMzuWuPXUtRicVSbqHOmM
         LTPVPZnqy0mAMNeJYmXPl5MCbeCUU/2rAlr+HaVwl6QQcR150YEFt5695pzt6iT1DizD
         rxfq811T/V/jQ1Ux36GOZ6VWctWLrk8mZJ0ifNKoXeohw9lfqoWzC+YaoKyKpSsbMXka
         JvoJVvUOCqkuPm431VQ2k+xswhRbkfrOlw7Z++BEkuJCtig3kr1IXK4W7ufRq0VT4m8/
         aIRQ==
X-Gm-Message-State: APjAAAXUZlie4hxdDS69zKr7L9IOT+1RV4RHS8/3UW4/iaZhqm8XMxlM
        x5byrHXf/zVDVspXoEfIzOE/OGTS6nL77PzUmjqHqwHJMNf4xPAgRCNdBVVvaLq1k+UD2OW6PI5
        M/AHEO0r5gBOv3u7lwtqysxMVgTsE9hHZFJ4FmmBa1unLsFad4Tt96AwuQfAQVffUAGRewjWmlI
        ze/1oHJQ==
X-Google-Smtp-Source: APXvYqwzKzTPlcD6YHbeIeTQlMd/kKKZBQG/SB++UwvKQ5NhIvyHHHZskbGqHWgwCmqMUQ55RfMmRg==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr3076210wma.78.1579700493934;
        Wed, 22 Jan 2020 05:41:33 -0800 (PST)
Received: from localhost.localdomain (dh207-5-248.xnet.hr. [88.207.5.248])
        by smtp.googlemail.com with ESMTPSA id z11sm59830504wrt.82.2020.01.22.05.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 05:41:33 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2] dt-bindings: vqmmc-ipq4019-regulator: add binding document
Date:   Wed, 22 Jan 2020 14:40:24 +0100
Message-Id: <20200122134023.1467806-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds bindings for the Qualcomm IPQ4019 VQMMC SD LDO driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes since v1:
* Drop not required properties
* Include regulator.yaml

 .../regulator/vqmmc-ipq4019-regulator.yaml    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
new file mode 100644
index 000000000000..d1a79d2ffa1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/vqmmc-ipq4019-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ4019 VQMMC SD LDO regulator
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  Qualcomm IPQ4019 SoC-s feature a built a build SD/EMMC controller,
+  in order to support both 1.8 and 3V I/O voltage levels an LDO
+  controller is also embedded.
+
+allOf:
+  - $ref: "regulator.yaml#"
+
+properties:
+  compatible:
+    const: qcom,vqmmc-ipq4019-regulator
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    regulator@1948000 {
+      compatible = "qcom,vqmmc-ipq4019-regulator";
+      reg = <0x01948000 0x4>;
+      regulator-name = "vqmmc";
+      regulator-min-microvolt = <1500000>;
+      regulator-max-microvolt = <3000000>;
+      regulator-always-on;
+      status = "disabled";
+    };
+...
-- 
2.24.1

