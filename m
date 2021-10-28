Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34A943F173
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 23:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhJ1VUa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 17:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhJ1VU3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 17:20:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C0EC061570;
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t11so5324311plq.11;
        Thu, 28 Oct 2021 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ux256oKBRk3wAEphIgj4fj2EC4kPfTF1Gk3PRuUQeSA=;
        b=eHk9YCnrI94W1CMF0TQV8k4WtKXfyRiE0SwPc4RZb+1OcV2ZROcVkU9AAZjqxZFxwS
         BUF6crWty/LanSF/oT8RL+vb7RISzUzZnzf7jlCno2F5HJB/ANv1CYVsNi9Cxg96fHrI
         lSg44A98r8JA1sL7prWJI5xZT+qEwyzK7iSmxuIc516CEasxeR+hHFsA9Y5x4BU/9uLZ
         4gJqCRvPKbKwHN41yR4ZK1aNOoi/r6tizDIWOKZY2Z8CMfUvPrwANsxstuzgWPn4kMMq
         6BT2j6zY8HYaUcfI2MpgiJgkwrlU5kSoKJRgdjsr6ff5OdnKtMgmcQ1zf4nlzPQI81ug
         syRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ux256oKBRk3wAEphIgj4fj2EC4kPfTF1Gk3PRuUQeSA=;
        b=4lJfqfzfXNleKKbGBa67LWOVr7nKevULn+4/uL13qP5KaB7EMri/kWZPXQh2zSW5id
         ooi+LSb1fhycYOJ9HxpGGrOKsBmujJ+2XK1mphgvsOZ4DRufKQSFitbNeW6Pc7DLzgTA
         86jIatqeEJOJu2LfDWhFCXpiSArdHuwAsKUkAvaQTmIUWNx0h8DyF5+indcXud1NCJY8
         0Za0XfAQrv2eu9sSm2wj1CILDICDFfhAGYKopSFU/F3A3bkt8WWiMt5vvA/ZVjAIH9CZ
         B9lfh67bugidSkdz7WyQynDBHJ/UpJ+eyokYtucv3UYvQM9f3K68rpbwUZkxC3lcm/1b
         Q//Q==
X-Gm-Message-State: AOAM53381jMam6iC7JJDiGo86uoKlK0ldrhvBO6Z82VnJhJh1iR78Zrq
        a71vi5gshlKnjFl08rYohSo=
X-Google-Smtp-Source: ABdhPJw4aIKkqTr1mWd47J2aDaNTuB6RJH9L82aspWtvvodGCjkMNWCoFqZedqwPRmpcXGsaUyCJFQ==
X-Received: by 2002:a17:902:7681:b0:13f:45d5:b9f with SMTP id m1-20020a170902768100b0013f45d50b9fmr6164170pll.62.1635455881677;
        Thu, 28 Oct 2021 14:18:01 -0700 (PDT)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:0:1173:767a:1b1e:f6a4])
        by smtp.gmail.com with ESMTPSA id t14sm3506610pga.62.2021.10.28.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:18:01 -0700 (PDT)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultzMS@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH 1/3] dt-bindings: platform: microsoft: Document surface xbl
Date:   Thu, 28 Oct 2021 14:17:51 -0700
Message-Id: <20211028211753.573480-2-jaschultzMS@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028211753.573480-1-jaschultzMS@gmail.com>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce yaml for surface xbl driver.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
---
 .../platform/microsoft/surface-xbl.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml

diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
new file mode 100644
index 000000000000..3d2771322e72
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Surface Extensible Bootloader for Microsoft Surface Duo
+
+maintainers:
+  - Jarrett Schultz <jaschultzMS@gmail.com>
+
+description: |
+  Exposes device information to user space.
+
+allOf:
+  - $ref: /schemas/platform/microsoft/surface-xbl.c#
+
+properties:
+  compatible:
+    const: microsoft,sm8150-surface-duo-xbl
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    xbl@146bfa94 {
+      compatible = "microsoft,sm8150-surface-duo-xbl";
+      reg = <0x00 0x146bfa94 0x00 0x100>;
+    };
-- 
2.25.1

