Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1388138609
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2020 12:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732695AbgALLaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Jan 2020 06:30:22 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:38559 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732689AbgALLaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Jan 2020 06:30:14 -0500
Received: by mail-wm1-f47.google.com with SMTP id u2so6550465wmc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jan 2020 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D0KuYFijWaSqVKsGb6hmrEpwICKO2Gc2adNnWdcjJlw=;
        b=wsfy+6bDlh8NItsWdLenHANbaQDJ/2Q/5oprrJQtdFmANH1Q3SN8JIOmXYHl5KVUkt
         Ku23Cv9TL2TMIuPQzIQN24suhDKs+fMn0554AP915uEc6x7fnAbqwXxIkZ93X8zM7DSA
         zRlCumyKb94KeJv9550up9JEmMdnuY9m94bn4Nfy8PKeGYS7IyYOjM/whydqMV7awaMm
         YRrxRGxsZF8tkdDeGEakURR4ExAeXl5J985xWbtQtYoPA+OKogpGeS0YT3h8wprVqsnz
         jEsL7zMl13Awf/ty791Gb70L4rzSHIf9dGU0JuXZ1a8AhtZOEbgkjB970B2pQ2tdI1M4
         K/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D0KuYFijWaSqVKsGb6hmrEpwICKO2Gc2adNnWdcjJlw=;
        b=mDNNiUwmyCVVAoHNO6mPskWyvy0j3jSZZjNrvPGpRIsKGqzDNoFBJ/M3eO2l5+Ydea
         kPKSJ3UnXmc/eF+q64Y94UUR9VJygFfBKGouglbbWkAJ9xwfWTnWLXg2eTyos0SJ5kbO
         3ztA4HgM1NP5RBXsVA+he0b1WSl5M/nor2mqG8ChqsGKHwq7MY+L341xTYUto4KMZbAH
         C86lDYz+j8GdXtRFg7HoaplSp68vaehKHPySVHr8xCzaTFvIVtgz1C6kxppmbwfPe1Ut
         /ddaadiizqBvOtxQGV9feE7DCfLj7p4ttH4igxpwELfrAwjtmcDSJIsVlXmGqgxBwmG9
         1spw==
X-Gm-Message-State: APjAAAU0u8bCJMVuDM1UZAd/XX8BU6q2tBVqpWDmZR4uxr3CKW8Txzdd
        n7gsyc7KluMDrUKmHuAo/fD6jNP7S8o=
X-Google-Smtp-Source: APXvYqwZGTZ91ANJOl2LHDtI9FWkubYYOQQnYfUMMCvb50Z0DB4yd63j1mXbqM5okBU99AVs/6B90Q==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr14679045wmg.38.1578828612726;
        Sun, 12 Jan 2020 03:30:12 -0800 (PST)
Received: from localhost.localdomain (dh207-5-115.xnet.hr. [88.207.5.115])
        by smtp.googlemail.com with ESMTPSA id y17sm9943045wma.36.2020.01.12.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 03:30:12 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/3] dt-bindings: vqmmc-ipq4019-regulator: add binding document
Date:   Sun, 12 Jan 2020 12:30:02 +0100
Message-Id: <20200112113003.11110-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112113003.11110-1-robert.marko@sartura.hr>
References: <20200112113003.11110-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds bindings for the Qualcomm IPQ4019 VQMMC SD LDO driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../regulator/vqmmc-ipq4019-regulator.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
new file mode 100644
index 000000000000..d4d9b618d351
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
@@ -0,0 +1,54 @@
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
+properties:
+  $nodename:
+    pattern: "regulator(@.*)?$"
+  compatible:
+    const: qcom,vqmmc-ipq4019-regulator
+
+  regulator-name: true
+
+  reg:
+    maxItems: 1
+
+  regulator-min-microvolt:
+    description: smallest voltage consumers may set
+
+  regulator-max-microvolt:
+    description: largest voltage consumers may set
+
+  regulator-always-on:
+    description: boolean, regulator should never be disabled
+    type: boolean
+
+  additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulator-name
+  - regulator-min-microvolt
+  - regulator-max-microvolt
+  - regulator-always-on
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

