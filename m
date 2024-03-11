Return-Path: <linux-arm-msm+bounces-13788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCF877953
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 01:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195211F219B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 00:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E171364;
	Mon, 11 Mar 2024 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VE7eKqGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42A47EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 00:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710117211; cv=none; b=MFZSxBc0yKQdlW5JaBjhsr5vJUTa0SC1pNhTrRqgohkdCHGNWXDyjMGPS1MOgyTaff/HUFZXHoFaaL6KUAx1ySQLCWl9JmpzrnyPMZBIaIE+n8Y4LzPR3wIzOeA+3ny4ZQgMAS6ho42Eax42o+HfE1BVRuTekD2PemfMXlhxvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710117211; c=relaxed/simple;
	bh=YyOrv76+mgxBw3I4eDVdszM5X+GcVNMI85NNIHTNUHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLXjq5Rah7KkJUlKjbFenNbPMyGcOr4JNAhWndg5U0NDWMPtDov4h51TDvpiORRZEq8oS6fheqD9fueXc4PZd1n0uc5fpoyH0dSn2Uh0mgHInPCB4mnJftRtwCAGzZWHfdehzfZkKCXts65atuewlMBGjVtEFKr8YjglWduNBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VE7eKqGh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41329a665d8so2933955e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Mar 2024 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710117208; x=1710722008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSwq3Es2w3od7CAorcPr9UQvzr6MAfnOPjW9TjTrcXU=;
        b=VE7eKqGhLKax4lZ/m0WJkaJzFV/QS2K6OkcnP4Xjll3SYPawkghsvBk7/47rJhpn93
         L3AyGXWv7/rU7kqtXCNsxu0NmLE8QR3GkyEiD0wUAxBibDH88SPrkRLLTVuUFZquD69S
         K7Mr1kUP6HOR72xYqAu5wuaiup9VXY+sIeJFG5Eo0MSFeEwCE473O4v29pNCwdhllKt/
         4kdC51LKFkgv3cL8QNGXFQ9cQ//Ub/VqBpnRPWWkbHIheNCfAjvOZJyH6MC83NawICUj
         gqeeD8Kzi0gwYYU07OHwfvyzQivUtPXS1v1yPw65kyEGK6RibGT5LVH+WTlVNsbDFOve
         UmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710117208; x=1710722008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSwq3Es2w3od7CAorcPr9UQvzr6MAfnOPjW9TjTrcXU=;
        b=hAk4kFlxOllpUcZslmBOy3GV/keRumzMHSGp8RHFWF5XRclwOehdtqIdI5uWaCm/1W
         HV7z3BMoEHkFbQYGKl4FMX7liScuzHQ/OiADb+f6IEGTJz4ehdVb+gDX5xffSoWOgmil
         Pmfg1URDTZEWhAUPXmXd/0tGGZCUZDIuXtHUCLWVJ+xX0CCJOI2eiLitplQ58Cufvsq4
         1rPo/Lp71+sCKRlEktTX4lc49qaaFpWM/FS1EYhn0MSRcdSxswtlu+mM1dZgpp7en2Eo
         asnUvsRc45Kp68ay/X4oQE/QE8yuBA6Z3KGs2qeliCniVoikHQbngistyVOX1ry53CJk
         V3Kg==
X-Gm-Message-State: AOJu0Yx8ebSsOWKq0fxkAsQjQj/lcWo9tCTNcVO0yAmhrgCSe8GYFcE2
	GFtbgB54xuVVpdOvZXTPdis8DN8xtQJWEJwe6NBHj5btV7QeDhcPrHAHmVYJMG8=
X-Google-Smtp-Source: AGHT+IFvZL3gWGGpxsFPBDBOzfj6geyaM1RGcs7sJPsX7UfmaVPrECbVTS1OhKcFXzEET+4cNqIZdg==
X-Received: by 2002:a05:600c:45c6:b0:413:2c11:f795 with SMTP id s6-20020a05600c45c600b004132c11f795mr115920wmo.39.1710117208283;
        Sun, 10 Mar 2024 17:33:28 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id m38-20020a05600c3b2600b00412b6fbb9b5sm13881720wms.8.2024.03.10.17.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 17:33:27 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 11 Mar 2024 00:33:25 +0000
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Fix x1e80100 camcc
 power-domain declaration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-linux-next-camcc-fixes-v1-1-d126ae0b9350@linaro.org>
References: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
In-Reply-To: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-26615

camcc on x1e80100 requires two power domains MXC and MMCX. Define those as
part of the schema.

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          | 37 ++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index fa0e5b6b02b81..eae9b73ae1f16 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -19,9 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
-allOf:
-  - $ref: qcom,gcc.yaml#
-
 properties:
   compatible:
     enum:
@@ -38,9 +35,8 @@ properties:
       - description: Sleep clock source
 
   power-domains:
-    maxItems: 1
-    description:
-      A phandle and PM domain specifier for the MMCX power domain.
+    minItems: 1
+    maxItems: 2
 
   required-opps:
     maxItems: 1
@@ -56,6 +52,35 @@ required:
   - power-domains
   - required-opps
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-camcc
+              - qcom,sm8450-camcc
+              - qcom,sm8550-camcc
+    then:
+      properties:
+        power-domains:
+          description:
+            A phandle and PM domain specifier for the MMCX power domain.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-camcc
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: A phandle and PM domain specifier for the MXC power domain.
+            - description: A phandle and PM domain specifier for the MMCX power domain.
+
 unevaluatedProperties: false
 
 examples:

-- 
2.43.1


