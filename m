Return-Path: <linux-arm-msm+bounces-67139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC837B1606C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D01C3AB378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F37299931;
	Wed, 30 Jul 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oytBIKTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E84298999
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878962; cv=none; b=Kd7YOkSpQYgVR0On6OsYmVgdP41uLiT++OszQ5hU5lxOhCq1jEIvn0zXL1ec+t5Ood5sugG6o3LbEoowcGpJyRDqTmetiRefOhPX77xkwXteQYSYCaU4dsOqtcDV4qk3xWo958+hl3t5kkZUwi4M+8oQxdLNPHE+9OQYENPKL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878962; c=relaxed/simple;
	bh=FdLKYyZbfYSsvJ/xHFdBnLCPtWsxGyr4mVu3tlfgIuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArmCrAZovY7IdDCuXeRTKExDs1k+BVYA3HrfLyLEeUg3YSDT025qla6aHgCKggPgiUqG0mROj3dXc99HTMTskOhtcpA1ftZr6sPYYjY9+VG6s5Yo1pg18wx3V0iK4VFqdS6NNaLKN29Wa3ZvrJzh53Xh1ljjDx/+fSjXTiZLY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oytBIKTX; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7074a9e498bso1262536d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753878958; x=1754483758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yq1vQi8nX5SzZwnMjuxxgoo742N3v7FflaYZunf3Ev0=;
        b=oytBIKTXsn1lPk6tLisezua1871bi3wGG3GFNvmoHZrN4hBS69Dfm7aq+9QYMGzA4x
         sD+P7XdmYm1iHRcABDVXPeWoDFUfJoD79nAchpYnVoUNPg9qObBjoLLrD8GcJGwmQI7L
         Cp4B4Jp+/5fSoIqw1W6mY7dIMqVXvXjJ1NUt0hseZpzzcs1Y9Rpg8xwErhXLh+Rg9XxZ
         2vcqRPyhtdcRexyE42nMPWpYe+izwxrboOUfVtUAUcQVkYmxIgJBW2FsqcjGXA+vf6Rm
         z+fw0N0HxQ8YPWBigHK554v4SCr/Whky4roADVFt9Izd/6LoPRca80QuOwn7j9tiWu0G
         LFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753878958; x=1754483758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq1vQi8nX5SzZwnMjuxxgoo742N3v7FflaYZunf3Ev0=;
        b=HN7k3RZsFSnG6MrGTLN8SkEH8tPqDG4E41aScin3YIUzMhl84Qf6tu401SJmqTgoHv
         OH0rZeaxiQtSSn9pq7sXnb6my+J5D2Qjc43OvBxCddhuh86UvTPcSG6jBoW16h9O/3nA
         7bjglqQvHn9o6edPiXIYBiej2oBgFE6r3AbKmswX8Z1TVoDD8K78cfKVYwfzNI3NcpxH
         B2wR+X8oPUFrZ+8uwP98Yy0yybRqaQVyWp9lppcTI53MRlrS9hHRvyS5TfNcS00hkOBI
         fjShZjmoJ9WvTkFptu+Ce7HeMG6/1eO2m/YKTXAAe5fmlM9IQ1nmvenewGqlPoWYRi0Q
         OY6w==
X-Gm-Message-State: AOJu0YzsjAbixCXlIfXMhc4UmtCsvAdon4UICeJHXhovdETO32RthYxo
	kOdgrF6cTg+68CkZB/OeMhD7oEwGsMyI/fDs8/uzDiyIBb926AR8uaffoQeRI2XenvM=
X-Gm-Gg: ASbGncuBf6Ps53sMccVrn/k5DfEApeXXLgrEeEazNhedxU8NXDsCiVmppEQAk3NPLcw
	OZ9c6vCT9Shtx3e9uH48etJDsA3atitfK8RV032Ob4ZmRauj1nlaLcmjnFtTgSCEpfS3CCB1znb
	0BEKfdVymWNzTFVa1JsfcPNVm2ZXvtbtbHZqyu7kZ5XFDNPiyt9nwpChxfFS8ZYBSyOh5Br7BD4
	Y+3qPGPdiinntsKtIYOV313PbvjPcw0AJWGNRJBivfeIuaaBC/uo3/QawdumNT44gAldd2AonoS
	g0joi+EN0se9U8PM7k5+e8vznQUUm2eZVTI8iRffKVvUs/opTszoZ63JjS/TIYUY/4DWHCi/FOb
	I7CteNPwTyIlYWaEh7z8cwj5CskkcTfkWWgEgvz0=
X-Google-Smtp-Source: AGHT+IGflNFiycXFqZ/YAE64LpSel2Xs0guweuUzkZ03uokbzQxtkW+lJkWGBTvgU/sgiGxjni9CEQ==
X-Received: by 2002:a05:6214:588e:b0:707:6b6c:6598 with SMTP id 6a1803df08f44-7076b6c66fcmr13305586d6.4.1753878958184;
        Wed, 30 Jul 2025 05:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.218.223])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7076a647d47sm10105716d6.9.2025.07.30.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 05:35:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Jul 2025 14:35:36 +0200
Subject: [PATCH 1/2] dt-bindings: ufs: qcom: Split common part to
 qcom,ufs-common.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-dt-bindings-ufs-qcom-v1-1-4cec9ff202dc@linaro.org>
References: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
In-Reply-To: <20250730-dt-bindings-ufs-qcom-v1-0-4cec9ff202dc@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FdLKYyZbfYSsvJ/xHFdBnLCPtWsxGyr4mVu3tlfgIuY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoihGlxuQYLbZApMks48NMdeNERQIuH2JtrpvJ9
 yc7qamSjn6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIoRpQAKCRDBN2bmhouD
 1z0TD/0bUIg13+xIanVAnqIfkvsMGTdYBVlKFtQsGM+wqWOQ5urKJ1RF7MTFrZffaoDUJBEELFm
 EeA7nvnfDOfvMDqG7kCT8SlgDYX162Fz9bz7ze7KMssRbu/aEaO+CB2bkYAqAH8am+MkH36/bOe
 WJcRwln+UYbar0IA4JcR550iyiEjMMsIKBMEbuYx7pnWzbVI9EglFWup8f4opcdbKxNqewJWeVk
 ppoi7RaphVaPBPNo7GIFWKjZ3Gt+rbwrex6C/cMRCzVUYT5cy/21Xm4rmocpUpr6c6M7RYPnUJ4
 FAQQkKM/IL9nczWPiBzDw+ecOgxn8kmw0cHt2D65ckN5R4jbjCFY7BhJRRY5QSeTL50gDEi4HnT
 DJdbmg0X76dOwlxewIuP0rmGle8Hhhjkn4UHUmRkInZkApqU6g1zRPBp7pxRVqag/QhYW0MaflB
 LyYWi/egLeaIo7GFC8LM1I1BV7YZ8LqlPFfcX2SZ+47wJmxgxhqUSy4SYwHqEzjehos5VxQIYgC
 CmRPHvBNVorvJKZi1hB7XHcy/yi5tbC8ZyT2cYpmAUEBt9TR7JYk/QfkPd5WfTqRsD9V8HRpnnd
 VNoolpmuT2MG6b9151tLof6pKOWQIjElvKDSybpur/NFmhZcXFcIdXtvTxYPGMXQEgjimXvd0U+
 zqTmiv8b6FoHw3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The binding for Qualcomm SoC UFS controllers grew and it will grow
further.  It already includes several conditionals, partially for
difference in handling encryption block (ICE, either as phandle or as IO
address space) but it will further grow for MCQ.

Prepare for splitting this one big binding into several ones for common
group of devices by defining common part for all Qualcomm UFS schemas.

This only moves code, no functional impact expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/ufs/qcom,ufs-common.yaml   | 67 ++++++++++++++++++++++
 .../devicetree/bindings/ufs/qcom,ufs.yaml          | 53 +----------------
 2 files changed, 68 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs-common.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs-common.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..962dffcd28b44b3489be5615c75e7270a0c45dc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs-common.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,ufs-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Flash Storage (UFS) Controller Common Properties
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+properties:
+  clocks:
+    minItems: 7
+    maxItems: 9
+
+  clock-names:
+    minItems: 7
+    maxItems: 9
+
+  dma-coherent: true
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ufs-ddr
+      - const: cpu-ufs
+
+  iommus:
+    minItems: 1
+    maxItems: 2
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    items:
+      - const: ufsphy
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+  reset-names:
+    items:
+      - const: rst
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the RESET pin of the UFS memory device.
+
+allOf:
+  - $ref: ufs-common.yaml
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 6c6043d9809e1d6bf489153ab0aea5186d3563cc..fc0f7b8d1cd1c4a2168f29cffcc0c2ff660424df 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -47,39 +47,6 @@ properties:
       - const: qcom,ufshc
       - const: jedec,ufs-2.0
 
-  clocks:
-    minItems: 7
-    maxItems: 9
-
-  clock-names:
-    minItems: 7
-    maxItems: 9
-
-  dma-coherent: true
-
-  interconnects:
-    minItems: 2
-    maxItems: 2
-
-  interconnect-names:
-    items:
-      - const: ufs-ddr
-      - const: cpu-ufs
-
-  iommus:
-    minItems: 1
-    maxItems: 2
-
-  phys:
-    maxItems: 1
-
-  phy-names:
-    items:
-      - const: ufsphy
-
-  power-domains:
-    maxItems: 1
-
   qcom,ice:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to the Inline Crypto Engine node
@@ -93,30 +60,12 @@ properties:
       - const: std
       - const: ice
 
-  required-opps:
-    maxItems: 1
-
-  resets:
-    maxItems: 1
-
-  '#reset-cells':
-    const: 1
-
-  reset-names:
-    items:
-      - const: rst
-
-  reset-gpios:
-    maxItems: 1
-    description:
-      GPIO connected to the RESET pin of the UFS memory device.
-
 required:
   - compatible
   - reg
 
 allOf:
-  - $ref: ufs-common.yaml
+  - $ref: qcom,ufs-common.yaml
 
   - if:
       properties:

-- 
2.48.1


