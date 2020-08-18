Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0C6248E39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 20:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgHRSym (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 14:54:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48058 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726734AbgHRSyl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 14:54:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597776881; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dvwBrEbVERFUgM2LMCV1G2AljSQNPyFfudWmCq32qKw=; b=PL6ONC6eynkRS8Lu1AZ+Y1hbN/v+lMp9lhf4mw0WiA6EgbxDcSzwM6kxo6Va3jIEHgdEvGdr
 9kEliZYtVH7LW7rnl4knF2kEFytB5MfuQnIVehPRlKIUs4cfbEpnwvwQ/rWLCceegE32gtH0
 8xCvN8lfGswAI7iJdNcf8IIEJ/c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3c23e191f8def8b2d7a43d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 18:54:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90DFAC433CB; Tue, 18 Aug 2020 18:54:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A3193C43387;
        Tue, 18 Aug 2020 18:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A3193C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Elliot Berman <eberman@codeaurora.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [RESEND PATCH v1 1/4] dt-bindings: power: reset: Convert reboot-mode to YAML
Date:   Tue, 18 Aug 2020 11:54:13 -0700
Message-Id: <1597776856-12014-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597776856-12014-1-git-send-email-eberman@codeaurora.org>
References: <1597776856-12014-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert reboot-mode bindings to YAML.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 .../bindings/power/reset/reboot-mode.txt           | 25 ------------
 .../bindings/power/reset/reboot-mode.yaml          | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/reboot-mode.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/reboot-mode.yaml

diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.txt b/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
deleted file mode 100644
index de34f27..0000000
--- a/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Generic reboot mode core map driver
-
-This driver get reboot mode arguments and call the write
-interface to store the magic value in special register
-or ram. Then the bootloader can read it and take different
-action according to the argument stored.
-
-All mode properties are vendor specific, it is a indication to tell
-the bootloader what to do when the system reboots, and should be named
-as mode-xxx = <magic> (xxx is mode name, magic should be a none-zero value).
-
-For example modes common on Android platform:
-- mode-normal: Normal reboot mode, system reboot with command "reboot".
-- mode-recovery: Android Recovery mode, it is a mode to format the device or update a new image.
-- mode-bootloader: Android fastboot mode, it's a mode to re-flash partitions on the Android based device.
-- mode-loader: A bootloader mode, it's a mode used to download image on Rockchip platform,
-	       usually used in development.
-
-Example:
-	reboot-mode {
-		mode-normal = <BOOT_NORMAL>;
-		mode-recovery = <BOOT_RECOVERY>;
-		mode-bootloader = <BOOT_FASTBOOT>;
-		mode-loader = <BOOT_BL_DOWNLOAD>;
-	}
diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
new file mode 100644
index 0000000..a6c9102
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/reboot-mode.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic reboot mode core map
+
+maintainers:
+  - Andy Yan <andy.yan@rock-chips.com>
+
+description: |
+  This driver get reboot mode arguments and call the write
+  interface to store the magic value in special register
+  or ram. Then the bootloader can read it and take different
+  action according to the argument stored.
+
+  All mode properties are vendor specific, it is a indication to tell
+  the bootloader what to do when the system reboots, and should be named
+  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
+
+  For example, modes common Android platform are:
+    - normal: Normal reboot mode, system reboot with command "reboot".
+    - recovery: Android Recovery mode, it is a mode to format the device or update a new image.
+    - bootloader: Android fastboot mode, it's a mode to re-flash partitions on the Android based device.
+    - loader: A bootloader mode, it's a mode used to download image on Rockchip platform,
+              usually used in development.
+
+properties:
+  mode-normal:
+      $ref: /schemas/types.yaml#/definitions/uint32
+      description: |
+        Default value to set on a reboot if no command was provided.
+
+patternProperties:
+  "^mode-.*$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+examples:
+  - |
+    reboot-mode {
+      mode-normal = <0>;
+      mode-recovery = <1>;
+      mode-bootloader = <2>;
+      mode-loader = <3>;
+    };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

