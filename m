Return-Path: <linux-arm-msm+bounces-33004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B298EB47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 10:16:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 109A6B21D7B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 08:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936F4149DFF;
	Thu,  3 Oct 2024 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LiEQ4yku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51961482E8
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943283; cv=none; b=mapjLfC5OV0PaARi4Lt2hefsFMpnCAtuj63LXi9jQUkM+kB/bqMODLOY15EstveXUWC7kix6My1E3pgPJANfDnMqxcS0rVj4yFOifcmYbldwBXCRrtFM5YNb6Ttd5oKmSVttwXKWMWl66Xtw6sdqDlRKJKh6SS59KSO4yBoA5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943283; c=relaxed/simple;
	bh=519873eizrz1N27nvT3FmdiGwc5SoCwK9tJ1LGTJkmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g37zDNKVv6ORcAdHkQpn72JJImVPUE81/LtQzaIojUJ0lK3OU8eVNolmAJ72kBp86LoAvVq43NOlMk/qG5OOK2qeNgAMEtQtfyGdVeJoe48xJh9TEiOrkVPvD/ZK/27jLEuwAWL9zJaJLwfa9rN0xZg+cJ04vngvAkHVUHd3Uh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LiEQ4yku; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb3c6c353so1113335e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727943279; x=1728548079; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rwyEFJ4idpDb4iBRYg6Jk2ZQkdCcSf0YAokuJ1SzVA=;
        b=LiEQ4ykuQNx2cZVv573Lu5sf9QbKUZ9BwUkMMgBNzAJmbS+nFUgEBL1nrWNKIq5YvK
         5zyjiitEhXSj396yD1Rzf95g1UIMhF1Wk9hrtrpPNUsxTpMqpgHRmbDoNSM5Kimj+hC6
         M5JfQNBsL+kePcuFqFSVCBKEYnnyrCKxbuMwYuTM3f40E28lSD4JVfD/gYYPtLEMU0w3
         OpX/vG/eyajtxypSHaY7mpvU9fkdHTbs8XPq4F6OuSPTSN68lHYCita7QDRZRC15l6o5
         RvZ//Nohc+uBZLmUP4l9ZMNl7WAqv3niVMqAH4dklPBSSGkicfgA/MhysDKTbWlxtukO
         WSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727943279; x=1728548079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rwyEFJ4idpDb4iBRYg6Jk2ZQkdCcSf0YAokuJ1SzVA=;
        b=ThD3VBL9SGgqBKdkQg0vqyDE5Rzj7ZvkRQ5wKm5+0485TiTn6LSnpM98TuJ6w+wDO2
         6WsW7sMll/7Wkf/T0Wz82w59/nYJ4ou7NNonNXiC49hylml/Or+MyAsbLCLyNQucU6fO
         DhUL8jF7kBaz9WYT1jxZ+uEJjoot3eBNmbmPRIeq3o+ySaVJJrOuo4iDSug2nqrWByc2
         nNBGuQr3B5KfeL1V8colng8MbHFNyMmlY/gmTsD+Bi/ECklc2zJjGPUybkljmv9IwSt1
         OGjlTDrsb4CwW44wGVneyRO4cPKWgY4XSMgKQTzPAKucIBuDW3jkvQjOpjYXn7a6dDKx
         b0hQ==
X-Gm-Message-State: AOJu0Yy8vjDQwyLPdSj7ODRpgrkwzEFWC00fbMEsIkRJBjQphg4/71k6
	VN7PCkm/Io7ZfohYu1knL1SP6FG5v8Qd6acnk1b7ngALEm8WI/4OZejyds8icIU=
X-Google-Smtp-Source: AGHT+IGM0q7njLtYkyHsjlENSHcXM/bNjMhqikyJ3G8Gq5rle1uFsdl97+lU80Xh3CPM0h4uTp3hpA==
X-Received: by 2002:a05:600c:1897:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-42f77d30905mr19803775e9.8.1727943279187;
        Thu, 03 Oct 2024 01:14:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d082d230dsm702027f8f.94.2024.10.03.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:14:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 03 Oct 2024 10:14:22 +0200
Subject: [PATCH 5/5] dt-bindings: display/msm: merge SM8550 DPU into SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5278;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=519873eizrz1N27nvT3FmdiGwc5SoCwK9tJ1LGTJkmw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm/lJjJVqi58VnNZDpSmxF/yPjCq9ttq1x7JffO
 wwQ5dtGGliJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZv5SYwAKCRDBN2bmhouD
 176aD/4oATjZ3tdEJbCuEHszRygOjNaFfffil0utMA5XmiPMerjNs/BIIOcOH66nbj4ddfmYdUA
 0E4vrdl3vSqyfS5V9JU14ebXyzspUgYv7Oo99XyI8vOFm+uOzlYvKBBjLOiRFykamVpRrAcP/rg
 j+FitluwEgTVQOFoG0HsrDnFtqWy+WuvUeVq0MttvA+2hZUMWCKQbBMpRKUg01Pbv6TGQv3EBSu
 qQStf0fz3iuwvjCEh0FXTS65QEp0csClhCfeGXLzz1KVjvLT+6szIwzFcURy/ZOUJRlHa36MYvm
 mR0xjRSYkt/SZWLyFCKEH0No4KEZNi7Hto1t1T44/pk0xAIRRTs5kv3fRxZUXumzs88SpchJBJp
 08UVEAmS4hj2tcR2HZUlQNDFcxD3+neEoEPHs4wPqdpGq//uUtFbmRFaeMBBPrS7uKko/M6odnd
 IStITPXnIEPR3fL8rxiT2loTBwUL8eI4PiZRAVCFSGkyMI1bkHKV9xATWxeMc+ehzHqoXa2ONz9
 oizmEDr8zkm20TWXT4f5v7RU5wm5SATYTOvZUv2lILuIg/QiK1O88JCfcQDVg35HCxtGjUQjCtX
 lFbeQKiFqjWfoDDI4rNSOBB05D7+COA7Je1v0lnY332TmB3UVCEAG7exTZ1ApvZdgcOzF5JQ5MU
 G6kFNAERUhheIbw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Split of the bindings was artificial and not helping - we end up with
multiple binding files for very similar devices thus increasing the
chances of using different order of reg and clocks entries.

Unify DPU bindings of SC7280 and SM8550, because they are the same.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 ---------------------
 2 files changed, 2 insertions(+), 133 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 750230839fc9..6902795b4e2c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Display DPU on SC7280
 
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
+  - Neil Armstrong <neil.armstrong@linaro.org>
   - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
   - Krishna Manikandan <quic_mkrishn@quicinc.com>
 
@@ -20,6 +21,7 @@ properties:
       - qcom,sc8280xp-dpu
       - qcom,sm8350-dpu
       - qcom,sm8450-dpu
+      - qcom,sm8550-dpu
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
deleted file mode 100644
index 16a541fca66f..000000000000
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
+++ /dev/null
@@ -1,133 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/msm/qcom,sm8550-dpu.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SM8550 Display DPU
-
-maintainers:
-  - Neil Armstrong <neil.armstrong@linaro.org>
-
-$ref: /schemas/display/msm/dpu-common.yaml#
-
-properties:
-  compatible:
-    const: qcom,sm8550-dpu
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
-      - description: Display AHB
-      - description: Display hf axi
-      - description: Display MDSS ahb
-      - description: Display lut
-      - description: Display core
-      - description: Display vsync
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
-required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
-  - clock-names
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
-    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/power/qcom,rpmhpd.h>
-
-    display-controller@ae01000 {
-        compatible = "qcom,sm8550-dpu";
-        reg = <0x0ae01000 0x8f000>,
-              <0x0aeb0000 0x2008>;
-        reg-names = "mdp", "vbif";
-
-        clocks = <&gcc GCC_DISP_AHB_CLK>,
-                <&gcc GCC_DISP_HF_AXI_CLK>,
-                <&dispcc DISP_CC_MDSS_AHB_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
-                <&dispcc DISP_CC_MDSS_MDP_CLK>,
-                <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        clock-names = "bus",
-                      "nrt_bus",
-                      "iface",
-                      "lut",
-                      "core",
-                      "vsync";
-
-        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-        assigned-clock-rates = <19200000>;
-
-        operating-points-v2 = <&mdp_opp_table>;
-        power-domains = <&rpmhpd RPMHPD_MMCX>;
-
-        interrupt-parent = <&mdss>;
-        interrupts = <0>;
-
-        ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            port@0 {
-                reg = <0>;
-                dpu_intf1_out: endpoint {
-                    remote-endpoint = <&dsi0_in>;
-                };
-            };
-
-            port@1 {
-                reg = <1>;
-                dpu_intf2_out: endpoint {
-                    remote-endpoint = <&dsi1_in>;
-                };
-            };
-        };
-
-        mdp_opp_table: opp-table {
-            compatible = "operating-points-v2";
-
-            opp-200000000 {
-                opp-hz = /bits/ 64 <200000000>;
-                required-opps = <&rpmhpd_opp_low_svs>;
-            };
-
-            opp-325000000 {
-                opp-hz = /bits/ 64 <325000000>;
-                required-opps = <&rpmhpd_opp_svs>;
-            };
-
-            opp-375000000 {
-                opp-hz = /bits/ 64 <375000000>;
-                required-opps = <&rpmhpd_opp_svs_l1>;
-            };
-
-            opp-514000000 {
-                opp-hz = /bits/ 64 <514000000>;
-                required-opps = <&rpmhpd_opp_nom>;
-            };
-        };
-    };
-...

-- 
2.43.0


