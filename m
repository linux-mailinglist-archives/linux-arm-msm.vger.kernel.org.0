Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33BF06E4C16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 16:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjDQO4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 10:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjDQO4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 10:56:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97239C149
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:55:47 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f09f954d29so15565945e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681743342; x=1684335342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpUMtv1IxR21LDoVKDuC4GQOAQkDJXs8GOPaC4q6kGw=;
        b=OAVP3bzJHORQstUTbwhu1R3B+n7USYjtUFjZ2uyNLnP4vQACBRdZ5DV0lB4HwfquS2
         0P2ltjjs9TgQyEfXK5kt3xhlkm3+QIiThcI0RGg+igCZzTMoU96xhdnEOdD0tT4zLyve
         5QUNH/aNi6VkXzeFefOgSro3FY6BffrCxBaso0/cJAsiJS0e4dLeVlBTmuPpNd91nC0Q
         PtZMysBXSSrP19Hq7TxIOGheNvUk8MGw/SpY7SvKxLoDUD52dj7Y8qgSDQmHCfSvzlgD
         KJfOTBgA/OO+6LKfhrOv0TUp4q5bKUHYi3ye+YFwjjjgOKjygWxKiyVdRs8lvFXMKuKU
         dISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681743342; x=1684335342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpUMtv1IxR21LDoVKDuC4GQOAQkDJXs8GOPaC4q6kGw=;
        b=eM/+uYtqP1QBs/0EI6LXLFPbzrQzRddxNobIQk0qjr++fmrazw6Pi6FmYzcvxwCXZL
         lUbTkgNmoNFUxNQg3oumQ2SWpofVQPod7TBEqqTwUp3LJ0nKSg1nczFj88oGNPP36cC6
         Su+qVTM22CdG2PNUji01iYwqiN72GtpKH5ygTdqHaHU9EtJGAXUqiP4K6fHMYDgVIf4Q
         /wbS6QIq57vKSVq6g63x+1qOTo/dKsSFRoNJ0lpPycyKYgxTUT/QoLtSarzrLYvUx9un
         ETfJXUj3PSNBnL6DmLFLiGnqPJCCld+7CvY74PijZqTEUKYytjWATeZSqaX8KmWUZINU
         hH9A==
X-Gm-Message-State: AAQBX9dHCk3gsU5n+NIfBvdp8bbL0sVZSdHfkiFZ8NdiPzUcHjtroGCv
        UfJaZ3Ea8fH8/D5twpCfgfEHpw==
X-Google-Smtp-Source: AKy350YUelkvSGh5Es7dzBXKaCo6pR3I2qp7ux+Zim1p2vQFQCvJcdNdceJsLAnB0WKGiXqhgxFzbw==
X-Received: by 2002:a5d:4004:0:b0:2f8:67ee:5ca9 with SMTP id n4-20020a5d4004000000b002f867ee5ca9mr6168602wrp.65.1681743342270;
        Mon, 17 Apr 2023 07:55:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:374a:ffae:fd26:4893])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d564f000000b002f7780eee10sm7998301wrw.59.2023.04.17.07.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:55:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: power: reset: convert nvmem-reboot-mode bindings to YAML
Date:   Mon, 17 Apr 2023 16:55:35 +0200
Message-Id: <20230417145536.414490-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417145536.414490-1-brgl@bgdev.pl>
References: <20230417145536.414490-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the DT binding document for nvmem-reboot-mode from .txt to YAML.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../power/reset/nvmem-reboot-mode.txt         | 26 ----------
 .../power/reset/nvmem-reboot-mode.yaml        | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml

diff --git a/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt b/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt
deleted file mode 100644
index 752d6126d5da..000000000000
--- a/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-NVMEM reboot mode driver
-
-This driver gets reboot mode magic value from reboot-mode driver
-and stores it in a NVMEM cell named "reboot-mode". Then the bootloader
-can read it and take different action according to the magic
-value stored.
-
-Required properties:
-- compatible: should be "nvmem-reboot-mode".
-- nvmem-cells: A phandle to the reboot mode provided by a nvmem device.
-- nvmem-cell-names: Should be "reboot-mode".
-
-The rest of the properties should follow the generic reboot-mode description
-found in reboot-mode.txt
-
-Example:
-	reboot-mode {
-		compatible = "nvmem-reboot-mode";
-		nvmem-cells = <&reboot_mode>;
-		nvmem-cell-names = "reboot-mode";
-
-		mode-normal     = <0xAAAA5501>;
-		mode-bootloader = <0xBBBB5500>;
-		mode-recovery   = <0xCCCC5502>;
-		mode-test       = <0xDDDD5503>;
-	};
diff --git a/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml
new file mode 100644
index 000000000000..14a262bcbf7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/nvmem-reboot-mode.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/nvmem-reboot-mode.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic NVMEM reboot mode
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  This driver gets the reboot mode magic value from the reboot-mode driver
+  and stores it in the NVMEM cell named "reboot-mode". The bootloader can
+  then read it and take different action according to the value.
+
+properties:
+  compatible:
+    const: nvmem-reboot-mode
+
+  nvmem-cells:
+    description:
+      A phandle pointing to the nvmem-cells node where the vendor-specific
+      magic value representing the reboot mode is stored.
+    maxItems: 1
+
+  nvmem-cell-names:
+    items:
+      - const: reboot-mode
+
+patternProperties:
+  "^mode-.+":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Vendor-specific mode value written to the mode register
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    reboot-mode {
+        compatible = "nvmem-reboot-mode";
+        nvmem-cells = <&reboot_reason>;
+        nvmem-cell-names = "reboot-mode";
+        mode-recovery = <0x01>;
+        mode-bootloader = <0x02>;
+    };
+...
-- 
2.37.2

