Return-Path: <linux-arm-msm+bounces-109117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGz3KQsfD2pSGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:04:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 952725A7E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1396332D72EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3466C372B27;
	Thu, 21 May 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AELYmUs/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075F637D10A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374851; cv=none; b=bDATPoVswGy6zd8WprYI4G+ssxQSb+z1Nu1rwtty4eKJ2olcbRO49M/va/03E1JKVhNFvyX638+7WEgv+usFy/+K5doakFcUkWYjaDd+C2FzFkgH7S8nAtAORyj+r5+pM4etyqikEW+f+HZy+sjs4huMdEh9Ql//wabUNKhD3MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374851; c=relaxed/simple;
	bh=hIuDotw+GX5XbmOdxDTJx395z7b2RsR58qNFPRHASYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6HV2HIlU5d1px93Zzl3IKN0YmxtKY/oxgz88Wpac3/NdaB6cG3uHVUFu3r3sTN+90E9ZXGnxwznSpQ7IAq1LgO5jqDkwM+rwgMTzbkNQj3BCbDr5HmspwB5kzMA/3aYrPI80ZeRwevd6rBxCvhTXhpvY8Wo8lISKe7zYDqPQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AELYmUs/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36974221f93so3403246a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374848; x=1779979648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPjL0X/X6YgpMCLcCHGKLym9NxiiWm8gzz8E+L90JHc=;
        b=AELYmUs/ZemBUXg68MEWPRrYx+bI8TUwC5AZzc8E5SQJJfS1G9IlUKucYDPh99f9Co
         eBn1JE/N3CI3FgXbsnPDr+iVYnDTn/eUQr2OGBXxUNHIXn/pPyHcmRAsRjCCMm9aEx48
         l3Tq+/iSMau0/7maik3yEGhs6B6+Tsutif3lJZK7ZyX1KATX644T//l6IR4okC08dykc
         jBmCh28bMsIzzyBiATmq0rDVsOId/NGvjjeY6dZff/sowJR/9ZwKpogWlCJO8ta7641v
         0YTLbKeh5zb85SgWk8xLvYG3rYZ03ml0yNF5EsbUUfQ2Vjzq00JVF/xCOtK5NEgc0hW3
         m6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374848; x=1779979648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MPjL0X/X6YgpMCLcCHGKLym9NxiiWm8gzz8E+L90JHc=;
        b=SgFBbFQ4Wwr1d9PED+SGzPA2BkuALYeAn7dJfLdTqluz6GK5qR919y7D1sidPNEgeO
         baN5V2u+bBHEjQVg72p4Qa63GxhEuq2yYCwVmmGOgY3fRk4oEEphVT1CUBmWtD94qeDu
         3m4fKlib+7YgCCQ06KQCU6yli14eFhdRTMyObCYox+O2D+n2apyiMLCXcGtuoT7f9zRY
         Hh3jVYRj7HsqjwRaVjnfyOT/PFLZriK0VgMV8ZL9sVkvn19I9e2fcaW4Z3gQ0CUyICFg
         FgJULfCYz2npMBFVofvD36+NwbjU0ixV3wFr9/LRg6F78LGTlzy+xcGpSRcfc8DYgFty
         WoGA==
X-Gm-Message-State: AOJu0YyZl5PwCigXuEW9Kg6mkVIxDw4RALxl5ktRTATk6hO46bqRpgBs
	oBWJF0RV2uNk3thtY1rnYrcfSUnrCfcxiMuXCXA/Rvwy88SzAOgy2tm2yZu7VkUaAZU=
X-Gm-Gg: Acq92OHRPT+zALnoaFdqp3fVf3ef8cE4QtvK++q91hB7rqK5e6fO2JUpntBEf4m0mzX
	YG0PjcETTtct+zckSdpZhWB/X1jTDsDaCz7sqPNmxkcWGLcNng3fQKjvE+Ylw6PJuHltHaR3ctb
	YHG8/GJFlE3UA5bVEOyVb9kNMmxzB1X5KCD5TWmBgOUMNBXmbhxEYhTzMbQkGFok8mcO5l+Etoi
	fr+YbhSiwl+HC14Xxaf9Qqk4mgf3czXroRgcIghmxwe+d7UKsO6Y0LVT6VVBPtUmT1FOtVC0wKS
	t1C54iP4BpfL6mYymljRLNprZTpPq3VfrpjmRFYrQ7eXSSttAk82ioLuGRGVhsNZLiOmcyBKhav
	cvGNa9Oyu3fhyY91aoBRGlkhE+yhhoZVAyqtn1eP68c+CE/OHqgKsr+WNUvQln4s0gdTLwA==
X-Received: by 2002:a17:90b:3d47:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36a457566acmr3539155a91.23.1779374848359;
        Thu, 21 May 2026 07:47:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:27 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:06 +0800
Subject: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=4249;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=hIuDotw+GX5XbmOdxDTJx395z7b2RsR58qNFPRHASYc=;
 b=mGMAqj08bFdadIsaW7gwyfQxIqW2VhchrrwDKjJ7yi/lAwPWhQ9H5h5lXi2nTdUAqCK+wS9pG
 ya6svtBUFxCBqLgW95ChM2ub19tnbouMniUCfgpzNM1EF0HycM6c+R+
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109117-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,linaro.org:email,linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 952725A7E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the dual-panel system found in the virtual reality device.
This system consists of two physical 2160x2160 panels, each connected via
a MIPI DSI interface. The backlight is managed through DSI link.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
new file mode 100644
index 0000000000000..a94b355ed9557
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
+
+maintainers:
+  - Jun Nie <jun.nie@linaro.org>
+
+description:
+  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
+  pair in Headset devices. The Virtual Reality Display complex is composed of
+  two strictly identical display panels, each driven by its own DSI interface
+  but forms a single virtual display for the human eye perception and thus
+  requires a strict synchronization of the two display panel content update.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - sharp,ls026b3sa06
+        - boe,vs026c4m-n52-6000
+      - const: synaptics,r63455
+
+  reset-gpios:
+    maxItems: 2
+    description: 2 reset pins for 2 physical panels
+
+  left-pos-supply:
+    description: Positive 5.7V supply for left panel
+
+  right-pos-supply:
+    description: Positive 5.7V supply for right panel
+
+  left-neg-supply:
+    description: Negative 5.7V supply for left panel
+
+  right-neg-supply:
+    description: Negative 5.7V supply for right panel
+
+  left-backlight-supply:
+    description: Backlight 21V supply for left panel
+
+  right-backlight-supply:
+    description: Backlight 21V supply for right panel
+
+  vdda-supply:
+    description: core 1.8V supply for panels
+
+  ports: $ref: /schemas/graph.yaml#/properties/ports
+
+required:
+  - compatible
+  - reset-gpios
+  - left-pos-supply
+  - left-neg-supply
+  - right-pos-supply
+  - right-neg-supply
+  - left-backlight-supply
+  - right-backlight-supply
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    &mdss_dsi0 {
+        vdda-supply = <&vreg_l3i_1p2>;
+        status = "okay";
+
+        qcom,dual-dsi-mode;
+        qcom,master-dsi;
+
+        panel: panel@0 {
+            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
+            reg = <0>;
+
+            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
+                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+
+            left-pos-supply = <&vpos_left>;
+            left-neg-supply = <&vneg_left>;
+            right-pos-supply = <&vpos_right>;
+            right-neg-supply = <&vneg_right>;
+            left-backlight-supply = <&backlight_left>;
+            right-backlight-supply = <&backlight_right>;
+
+            vdda-supply = <&vreg_l12b_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    panel0_in: endpoint {
+                        remote-endpoint = <&mdss_dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel1_in: endpoint {
+                        remote-endpoint = <&mdss_dsi1_out>;
+                    };
+                };
+            };
+    };
+
+    &mdss_dsi0_out {
+            remote-endpoint = <&panel0_in>;
+            data-lanes = <0 1 2>;
+    };
+
+    &mdss_dsi1_out {
+            remote-endpoint = <&panel1_in>;
+            data-lanes = <0 1 2>;
+    };
+...

-- 
2.43.0


