Return-Path: <linux-arm-msm+bounces-48901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2158A3F829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3163A1890302
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6BD20E31D;
	Fri, 21 Feb 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SR9ofafM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8B20A5C3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740150802; cv=none; b=hliBnPfolgTFBX/fwuPQ2M+4n4iu19NydYJlePoMl0T+uZ8PtdQv8tEHk/NM8ebLz572+tNeNZKyuePNxOtitGav54hv/DYKA5M3HZqmEVigFWtyYCNdR4clAqZqUCRSTCeMFqJ1snE7G0nuODKCAjGN211f6FmDvWP2TuLO2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740150802; c=relaxed/simple;
	bh=Fa1BddI3XJm8BQciNHEuwUqNi53s9MtiqS6q/dOK9Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUNlKKzGW3EeYbygnqSNxcVNnbQqfR3C2sgscnkYhaAQDBv7DrMMWdNpgpUBJQQ4RRFJ5PX+hzJZ3sope7TIv0+aNYEFt8rHxv2pw/jkI1xFbyBBcXkGFyqa2XFIC53T+dbjFc/BYJ6TiLkD9iPTTRJl6ryIFmhpVBjdLXQQ6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SR9ofafM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb7d5a6577so26685066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740150799; x=1740755599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
        b=SR9ofafMegilwl9LWHIOnO6ymnxn9Ndukl8qs1irlSjqzhDbrg3Plxu1E376q5lutJ
         g4AR7Xu1SEgchInZBMOKo8MY4MHdSfenMA8jAfw9JvoFRHhgwUnlWP5cMF5hwiYSzeEB
         n46/HwCSTQ1RT1vRpVigFYIf3CNWwXWWFBaXT5NM79nacKvU8DjcKdDPnkNAt/es8Vmr
         JQUFluZhwzbbFfqGkZHguTcL6G6XLgo9jzSywLPYmejHBzdGKvNCQjW0ny83enLPWd4V
         w5ekHp84g9scuGERSXxEd0uWvarwVaT1MPYhDvtV+IBYmyWDzpUyozOLfkv0Z218qwkC
         fJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740150799; x=1740755599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kffi9mM57RBxjp4z5FLBrRuQy7GA5fKXeHplvEZGGf4=;
        b=tAklsnbVqQImxZpd8Xry7CAHvF5Ai+jX9rLOALliX8hSj6thI6XKXfzsC/BeVTBti3
         7uTO+AK8ki/t181WwNpDUh3OdlotkI3UnomM4gjdOoZzNQiVDLxnEXd9YwKm0JRrmhIb
         fEfk28gs77TzkBh7dR290ozfdgB7UxpFe/a8w2rRUaQwgVRYG4d6gSVfu/KgK/0MSeHc
         gXVehA+X848tElP6O71vg99nxlSLy+GcHu8R9rnoIPyeoEj5pAG6gg7wcuwFGgzMHScw
         qxSqF5uuC2e68KPO71X73vE6kKu0ndNSO/o9Y8R0loC2unpZRMeVYNkVKqpL2AmWcEVG
         5Zng==
X-Forwarded-Encrypted: i=1; AJvYcCVTabXdyLMJ1L6zearZRIwmT71sB3jMcDtCJHiSuJ9M4+qVUWw0uldjYDbAvK2QAILX+WRaIxCJV8r18H3U@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/8VZo71qVRrz/ELqJLYyJsGQ7WogYPri37HPW8i9YhJPz8vN
	OKeTqEt4DR1+4COD5c2drhCm0G4J/aoz7kaKwY86GmSloxTz0jiA9tsecOVb7PA=
X-Gm-Gg: ASbGncsdmiYHbQqJCoT9hx4+9P1Z8HRdFuQ5rW8oGPwBHI9a4rcUsCQ31hQUOPpyyvK
	Bho+vxYs5qnkUdzIQ3iMLIrfFYJKfBvaVJd+g30lHRJKXrGNIhuet9s7KpAEWdxoTKxo5tItk4o
	GLXYDwFRqyYkbAMwMC1vUevqdKR4gWwvJCFukwRohgQPixHqqu+3v6A/Wk3NbCw4+h2+bA0TUS1
	6JsuUngKH2+68RDFxNCtarD6BzEXadCfKTI3uabV2gQW1Q5Dx5Xq1GOoZWqoofSg4bP+WpfPbLZ
	qBrDPyTgHlo9e/Ot42+ZgyH6CHDBbC6IoijDoUdntWCCmG8tmpekJI2kvWLQkvELNCow2RTLGww
	=
X-Google-Smtp-Source: AGHT+IE2efORy+XnFq6iGRbNUJ79O3DLiV+WA47UQiAkKow39HzZeGH66x8Isz/Apww6BksdMEVRpw==
X-Received: by 2002:a17:907:a089:b0:aa6:9574:1728 with SMTP id a640c23a62f3a-abc09a0bf96mr141099466b.6.1740150798792;
        Fri, 21 Feb 2025 07:13:18 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8ab30726sm1110640166b.153.2025.02.21.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:13:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahadevan <quic_mahap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: Add missing eDP phy
Date: Fri, 21 Feb 2025 16:13:11 +0100
Message-ID: <20250221151311.138755-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
missing device node in the binding and extend example to silence
dtbs_check warnings like:

  sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Fix reg size (address/size cells =1) in the example (Rob)
---
 .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index a90a8b3f1a9e..5fac3e266703 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -52,6 +52,13 @@ patternProperties:
         items:
           - const: qcom,sa8775p-dp
 
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sa8775p-edp-phy
+
 required:
   - compatible
 
@@ -61,6 +68,7 @@ examples:
   - |
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
     #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
     #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -158,6 +166,26 @@ examples:
             };
         };
 
+        mdss0_dp0_phy: phy@aec2a00 {
+            compatible = "qcom,sa8775p-edp-phy";
+
+            reg = <0x0aec2a00 0x200>,
+                  <0x0aec2200 0xd0>,
+                  <0x0aec2600 0xd0>,
+                  <0x0aec2000 0x1c8>;
+
+            clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+            clock-names = "aux",
+                          "cfg_ahb";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            vdda-phy-supply = <&vreg_l1c>;
+            vdda-pll-supply = <&vreg_l4a>;
+        };
+
         displayport-controller@af54000 {
             compatible = "qcom,sa8775p-dp";
 
@@ -186,9 +214,9 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_edp_phy 0>, <&mdss0_edp_phy 1>;
+            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
-            phys = <&mdss0_edp_phy>;
+            phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
 
             operating-points-v2 = <&dp_opp_table>;
-- 
2.43.0


