Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55891197A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2019 06:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfEJEe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 May 2019 00:34:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42519 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbfEJEe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 May 2019 00:34:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id 145so2345398pgg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2019 21:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jRXSqrjJ/XGneMATLlq6ef0lWRrjzOAsNMFDS9pI5co=;
        b=o9ITCZZxe5qNjs4HbiK+mgBzmySbP+LEYSzv3r5wNCHFzKqikvp6eKL/OEA4HKSVFf
         /16HzvfrrZyt2oJdVaHu6giUxmW3GPIiMUvw8N7xsasvwqftFbd0Cbso0C0PbxTYuGW3
         bumqxJYT/BFhyANN9EPoDtcqco+3HONZ1BXcvF18W7usb9tzOYlgEg0pXn5EGp5JY0TN
         fqw1Vz4Vao3+kD7dl52tF+chAi9870zA0EUEesMdvTsh+1I2gXgqHhANo3ctoeOjL22h
         TIeYS7cx9aJIMovyyImXgAYlzoNLDc49GZHAcJKE4hSaW6G2vTVxiwTHnKVGnpGdKwi3
         tE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jRXSqrjJ/XGneMATLlq6ef0lWRrjzOAsNMFDS9pI5co=;
        b=VaZYr06oyiGcZctJHfSiOLbHNj3hoO8md6IgPxL+xEdo+GCONUcRLIKMmlVHaaN13D
         EjD29RlJcFT2slj135kl1vnD153ClRI6wKWA+ZQ0fcgMThBCWASuRgbxO07w4vhccelA
         rcM7AUFsV7AKY+DTGOzhZE91wBmQYg6Ke+6YGRSfye6WSr61YuGLxd5rF7/TsrI/LD51
         dfXkf1u776BDfpexOzMUrLa5pR55Cw1XMIhTrPS8/H3qafkb0+Ar2d+bUAUUyqxF/P31
         /q0h1hLEttZ6BrxPheI7Vk8nFFDkThWuQWiBWkIuhOILN1sqJ6jggERTZOHd4cELxAJj
         jNrQ==
X-Gm-Message-State: APjAAAVfU1lK/Odjt8Zi0OhPpCxoDwjV8c7Owt5HvCjC6J+9OzuFLZ3n
        +vNb1SSHyl9GXT0KyfclrXokTQ==
X-Google-Smtp-Source: APXvYqyq0T6O9AwNHGZ8exszrlMLgNwoqL0bTEBMBtlW42UzP3iY13mfX+IryzwDN2LRR7PC2Dv/bA==
X-Received: by 2002:a65:408b:: with SMTP id t11mr11009686pgp.372.1557462865964;
        Thu, 09 May 2019 21:34:25 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s17sm4785317pfm.149.2019.05.09.21.34.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 21:34:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: remoteproc: Rename and amend Hexagon v56 binding
Date:   Thu,  9 May 2019 21:34:14 -0700
Message-Id: <20190510043421.31393-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190510043421.31393-1-bjorn.andersson@linaro.org>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM845 Audio DSP peripheral image loader binding describes the
properties needed to load and boot firmware on a Hexagon v56. Rename the
file and add the Compute DSP (CDSP) found in QCS404 to the binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)
 rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
similarity index 74%
rename from Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
rename to Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
index 66af2c30944f..1337a3d93d35 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
@@ -1,12 +1,13 @@
-Qualcomm Technology Inc. ADSP Peripheral Image Loader
+Qualcomm Technology Inc. Hexagon v56 Peripheral Image Loader
 
 This document defines the binding for a component that loads and boots firmware
-on the Qualcomm Technology Inc. ADSP Hexagon core.
+on the Qualcomm Technology Inc. Hexagon v56 core.
 
 - compatible:
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
+		    "qcom,qcs404-cdsp-pil",
 		    "qcom,sdm845-adsp-pil"
 
 - reg:
@@ -28,10 +29,11 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
 - clocks:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition:  List of 8 phandle and clock specifier pairs for the adsp.
+	Definition:  List of phandles and clock specifier pairs for the Hexagon,
+		     per clock-names below.
 
 - clock-names:
-	Usage: required
+	Usage: required for SDM845 ADSP
 	Value type: <stringlist>
 	Definition: List of clock input name strings sorted in the same
 		    order as the clocks property. Definition must have
@@ -39,6 +41,14 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
 		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
 		    and "qdsp6ss_core".
 
+- clock-names:
+	Usage: required for QCS404 CDSP
+	Value type: <stringlist>
+	Definition: List of clock input name strings sorted in the same
+		    order as the clocks property. Definition must have
+		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
+		    "q6ss_master", "q6_axim".
+
 - power-domains:
 	Usage: required
 	Value type: <phandle>
@@ -47,28 +57,33 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
 - resets:
 	Usage: required
 	Value type: <phandle>
-	Definition: reference to the list of 2 reset-controller for the adsp.
+	Definition: reference to the list of resets for the Hexagon.
 
 - reset-names:
-        Usage: required
+        Usage: required for SDM845 ADSP
         Value type: <stringlist>
         Definition: must be "pdc_sync" and "cc_lpass"
 
+- reset-names:
+        Usage: required for QCS404 CDSP
+        Value type: <stringlist>
+        Definition: must be "restart"
+
 - qcom,halt-regs:
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: a phandle reference to a syscon representing TCSR followed
-			by the offset within syscon for lpass halt register.
+		    by the offset within syscon for Hexagon halt register.
 
 - memory-region:
 	Usage: required
 	Value type: <phandle>
-	Definition: reference to the reserved-memory for the ADSP
+	Definition: reference to the reserved-memory for the firmware
 
 - qcom,smem-states:
 	Usage: required
 	Value type: <phandle>
-	Definition: reference to the smem state for requesting the ADSP to
+	Definition: reference to the smem state for requesting the Hexagon to
 		    shut down
 
 - qcom,smem-state-names:
@@ -79,7 +94,7 @@ on the Qualcomm Technology Inc. ADSP Hexagon core.
 
 = SUBNODES
 The adsp node may have an subnode named "glink-edge" that describes the
-communication edge, channels and devices related to the ADSP.
+communication edge, channels and devices related to the Hexagon.
 See ../soc/qcom/qcom,glink.txt for details on how to describe these.
 
 = EXAMPLE
-- 
2.18.0

