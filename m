Return-Path: <linux-arm-msm+bounces-33000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6598EB3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B97DB1F2429A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 08:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821B013D897;
	Thu,  3 Oct 2024 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFLInN7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2517137923
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 08:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943276; cv=none; b=ROV1kR8+G5FBrnA5THJsu48FB27Gd8m5Z+t+A9EtSllHaOsdk6krZzbR4knTTSTz8EbStOkQUy4AOt4XHPi/I4x2ZUCDjMSKAHH/F2mbY3QTDlhsutubmAXTb2S23e71m2Pw7VPELpt/MeG3Obw5q6BzL4wGxUec7SUdLcMsIrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943276; c=relaxed/simple;
	bh=I5gkxxh+/Kn7rSd5JE9ZVp0kaBODXFkfmbSKaf1DYHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dxl005bugOrzKTb2skyoZutiLFSP4pyDorGZcRgVCqWM8Rk+Yjt0vPe8VlxQTtfyeDFZrSe+Ajm5+VgJv6WTmKoFr+EHQtnx0sWQXKKALnmhwWQQh7oZSiKPgcPn2wQjzyrEycukfrcTwgT2C5+Gl48AY1Q80vXLldzJdmA+ZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFLInN7m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42f7e1fcb8dso1007055e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 01:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727943272; x=1728548072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHrfObhoXZxOjnZcmfI2vEOVJIbBll+cRB8dRqaKEJs=;
        b=QFLInN7mDPxZ76Y+DBfNKyYAwLcqBTwBfTF0ESMF/3HEzU6TFDo+PRi+u1RcGJ3oOD
         dXBNFPwT860Q4yskSJ2RsjMqpGEoElAb/cDgTDjJ6wyvveU2g2VMeH/y1HT8bg1OZPTy
         8ZiG+IeEDAIUDHKS+Il9T2b/DUOP78vmxmcAPv/7zu2PVaiz3aCllkMIHAf0J/JVht55
         1aKXgTQfCaJjPhID2q2qCAbR0oozS9dHUbsG/9MTnoZ2U89wmtWVE7nrvj5ILILcR1zB
         5mFfWxbgDelegfrkXoWjeYaLxZ3SAPzPli0pEiB4ExwCjUM99TfQHUPXA248fmV0CX6J
         RHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727943272; x=1728548072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHrfObhoXZxOjnZcmfI2vEOVJIbBll+cRB8dRqaKEJs=;
        b=XcHOcryUAgvVyqJGGQz1dSx87gIfmO3BId9zroS6RrljpUXaJXCatEZNWhP7ngpL4c
         m1f1PEV9rahtSJEBN8EGds4lNzR27zS87vCHtbI/9kONDQo6qmUsNihYzLOz1uiJOMcs
         /tjGp86Vtf8OU2c76Ca2udb2obYucUhXNKF8BY02iIzLidA14UCLBw+7gHPQF1zbGruZ
         r859EjplNFocoAcalTSJPlG8zOPC5uNdwJYv3TAorAAAYztnZgKSgRCAEqSgboCfV6T7
         q3nq/0oEbtF64hBbgEK0I4eVPlBS6q52iy0WF5qHiZV5OdT0RzMer8Wpos7GKoAbFKwt
         ZBIQ==
X-Gm-Message-State: AOJu0YwgnhsMZKATco0+nLQ5FkTIdYB5qXXmxJ5F4Wj0biCSon8Vb4sO
	PBUBEQaubD08dJFp/qNjBwY41sqUKzx1/GgibFw+WpHDkG/iAiZnGTD/tiqzXUE=
X-Google-Smtp-Source: AGHT+IHMjRyVUMPEi+gSZ/24bRWlnva5QunmQXCmdsDcU6Mhxs+a79NfsNMAh1FZ1Yq85tIJ65W/ig==
X-Received: by 2002:a05:6000:1ac6:b0:374:c962:a18a with SMTP id ffacd0b85a97d-37cfb8d068fmr2143166f8f.4.1727943271910;
        Thu, 03 Oct 2024 01:14:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:14:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:18 +0200
Subject: [PATCH 1/5] dt-bindings: display/msm: merge SC8280XP DPU into
 SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-1-91ab08fc76a2@linaro.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5123;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=I5gkxxh+/Kn7rSd5JE9ZVp0kaBODXFkfmbSKaf1DYHc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJgpCz5PczWvVC4MOIIKhlQ6KLXaZenlrYJI
 drKKpzFNpOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYAAKCRDBN2bmhouD
 10fcD/4547yeLqXfKNqq/CjO1tHYFMiWiDA6JArchwq/G4NWZyVC+Xq8hEdf7u3a7ycQb0rs3cL
 0huBzw5X9Ufag9yLBEM3iS8noXXPgJuWSh/WqX8DTWpOvg1E3Bu8+w55lf/zy8GuUqGF4h1o7W0
 qOmxHVECt5X4Ny+VxP5b6kxsezf4wUbVipwfW45ykmdqijK6D2qgrfF2CZMB+/aOZkVnUdavGtJ
 gjMIYp5Pf/r9uGsCitHgUB0rULcJEippVF59cFhZdGD9ESFbSuuyS/CdaFmO9bmN3mPq/7UpD+i
 kA8s7BwUumRlLjkhjAnSfC1+sg6vJln4nvp84XpySm80dTf6rRC8D3zfBlk2leVrq+eKr/4r8bF
 7x/I6rPiTHgPRHpsiwiVyR9BpzxnmvjQeCjlCHlGxW3Db+O3bbP6xvezxKYnHd6DTWm9ydIlNrU
 UpONUCnuUvGy/SGhA6la9MlpRTcPlVCywjDAWVXW+U9ninUzNQqctGNSigCb9sgcp/oQEhgdrbG
 XShEwlMGR1T1Co9HkghLDyQVMIqNGSc7htte0RjHVWqQadeLFyE/O+o2yA98PTrhN/PKR0A8Zj3
 DNK0MrBAfS0fTQlkz0RNU2LrYSvNF51+fkpAQexMN5NMDH6zif5WdABJIKysAlQllhnMYh/63wo
 KmkfVBAKxFOlbzA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Split of the bindings was artificial and not helping - we end up with
multiple binding files for very similar devices thus increasing the
chances of using different order of reg and clocks entries.

Unify DPU bindings of SC7280 and SC8280XP, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   5 +-
 .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ---------------------
 2 files changed, 4 insertions(+), 123 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index b0fbe86219d1..fab7a3b9a20e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -7,13 +7,16 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Display DPU on SC7280
 
 maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
 $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sc7280-dpu
+    enum:
+      - qcom,sc7280-dpu
+      - qcom,sc8280xp-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
deleted file mode 100644
index d19e3bec4600..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
+++ /dev/null
@@ -1,122 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sc8280xp-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SC8280XP Display Processing Unit
-
-maintainers:
-  - Bjorn Andersson <andersson@kernel.org>
-
-description:
-  Device tree bindings for SC8280XP Display Processing Unit.
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sc8280xp-dpu
-
-  reg:
-    items:
-      - description: Address offset and size for mdp register set
-      - description: Address offset and size for vbif register set
-
-  reg-names:
-    items:
-      - const: mdp
-      - const: vbif
-
-  clocks:
-    items:
-      - description: Display hf axi clock
-      - description: Display sf axi clock
-      - description: Display ahb clock
-      - description: Display lut clock
-      - description: Display core clock
-      - description: Display vsync clock
-
-  clock-names:
-    items:
-      - const: bus
-      - const: nrt_bus
-      - const: iface
-      - const: lut
-      - const: core
-      - const: vsync
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
-    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
-    #include <dt-bindings/power/qcom-rpmpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sc8280xp-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
-                 <&gcc GCC_DISP_SF_AXI_CLK>,
-                 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
-                 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
-                 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
-                 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "bus",
-                      "nrt_bus",
-                      "iface",
-                      "lut",
-                      "core",
-                      "vsync";
-
-        assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
-                          <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
-        assigned-clock-rates = <460000000>,
-                               <19200000>;
-
-        operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd SC8280XP_MMCX>;
-
-        interrupt-parent = <&mdss0>;
-        interrupts = <0>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            port@0 {
-                reg = <0>;
-                endpoint {
-                    remote-endpoint = <&mdss0_dp0_in>;
-                };
-            };
-
-            port@4 {
-                reg = <4>;
-                endpoint {
-                    remote-endpoint = <&mdss0_dp1_in>;
-                };
-            };
-
-            port@5 {
-                reg = <5>;
-                endpoint {
-                    remote-endpoint = <&mdss0_dp3_in>;
-                };
-            };
-
-            port@6 {
-                reg = <6>;
-                endpoint {
-                    remote-endpoint = <&mdss0_dp2_in>;
-                };
-            };
-        };
-    };
-...

-- 
2.43.0


