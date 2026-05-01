Return-Path: <linux-arm-msm+bounces-105447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB7pNFpT9GmsAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8F4AAE49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B6B1304F317
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4798B365A0F;
	Fri,  1 May 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YJgVjxE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7079836920F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619743; cv=none; b=Ta+QGSH+TRWA9dZBbbQJ9Yae1swlT3br09LsPXZ2MT4l1kpEfSF7ek2RRW4tMM7lq47SQ5p+jjMj9Woujivw5Rm2LpI01BAQw/19I/feiC5WJHdvesT2aht6EZ2BySEVwTN2gAXRraeQb5IBgADIEpQfVI2iNdejsN4bNe8AeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619743; c=relaxed/simple;
	bh=cpSBeucP8Ss790ZkmBApuFPudNB0i62Xj2QNp9/IQ8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFf55Iij3Ml0S7smPcS+kphnsM0for2G1l4yqhX2hFd3ll0mFZc/RbPOx8roo1tQ7Ct9cVVDVTzOJFZpOuI8Km8jqHKLmmWln2L/2l/aaM7rMc4bthPEvQ6OLEHyMurNZinW9757Ri1z20S0WvDAT7mosN+0vQKaYIUjZqH/QSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YJgVjxE9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so16321165e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619731; x=1778224531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hg6lKvTuHG4WEyxq/qM/gGPuVfbBHrwP8/vuB717wHQ=;
        b=YJgVjxE9Ymh+5CTXK2IJ/vnO4zEZMmIZhxhCt0axB2FDYgZm46B4aH5fXPkv7bg4Hb
         8uhMUI9+SD5maJtVebPjOMSo+jprDuXOwjXPKhKKvbgBF/DKG/Kf04nGo9kks7rI4Ik4
         szAjg/U0XyGroZXPcdwCDtBGSXg3/6eL8e2PC1Q4y1bOKvYWv+DgkqS82rGgVK3yBkMh
         vwY2YWwoZshvHxBPKpyIrUqLwBYNEd/F4E/RprZhSmX1kcdyy+tpivTn0dRC7XMV7BTi
         ChxpshqzDeg3mccBwDZBn7nQW3bhlrh6gSHoxP9ORdXOENe2uVJq7lXIbtmpq6DYZcsA
         eh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619731; x=1778224531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hg6lKvTuHG4WEyxq/qM/gGPuVfbBHrwP8/vuB717wHQ=;
        b=a/Vc5c1+u2xp3QUQ4VFMLbyIJGFsAqd3UCR8NwbUNmhjbjzSlS9Ui0r4WmH5p/wmxE
         i+iE9pzBIWNoj4I1/uabhGOnaAO0MeaaAFifLUciePLRJl0OqG6qytVP8W20LvvD7yEv
         8yub0KEgFQMT23OKGOs0n62HmeTlP3UoWSKsp+ZsMmy2A37C6lAGwTbmQZ4PcgV9uTcl
         xlhIQC/1Rx+yVmFlGc80tfptVpnScmTxtCS4lxZ3VwfTTIdW0pZnZC/k9KbswnMOnkbh
         EKjLiLLNeM4CJspcXxOeZ+rM2HYrFIM1JatG6PpPIfaOtNzNOM1977PzvGSRf5e2sN5R
         lS1A==
X-Forwarded-Encrypted: i=1; AFNElJ9NVuWtsWqZgOiuR2UURYYxUtKtCBjLbE0Q/aO9weLEAO5P3OOfbNj6Rruy0uk7jZQBWkjirkDNVKK7Vk9z@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZ1Kz/SyGyzlczXkY16SAFlfXDLEdeo2gz30sK6RbXUjHkHQb
	WOtIufGIHcEnGdUnwagsoFs5GJBBAil56yB6muv3ZP1PzdHqrdmQqVtN1P8EYykD64Q=
X-Gm-Gg: AeBDietA/6PQs4KBeGy/t9MVWMXfiInC3WbsGSDoi6knPDoC3bPiMBRmOvvAckbO4DN
	cjBOgItv9lC9comfErNh3Bbyf8RUSOruTDVgV6kUq6k4BVUpKZ5Ht8qtUQbq9bJEey6vigp586H
	y2FvIlaZqqWpr0xqsKoUhginj5R8C/WjS2WcKJn1Rhjkyo80+a4FpMQTkDBbOWltJJWXwXxy4OU
	+0O0L0hIqvwtdX9MH8FUc5AicL9QWzdj25y2P5351ZMLhx/Etqftmfh2Jcu03ZNdQZsbA0zeklH
	tsO+fR845kWCrJUElI7Z3S9Zn68Vd+/xjQA/v7Hh+7aPP/pHuQhkhLC7GHPiFQIc8qyGFTmFIds
	iXfk0BgJEAt3ytpRynw7QgoK0dc5b82wNT0iQ0QIJb8TmjCwl7sz1duJilQBAz6KDeSQQPMGu9A
	jyKzHAcXSPSXKbzKgl/FUJ8gmXGpQzZkhHVaJX3QSa1ZoDYoGBz/HTGm+KvNhhMQXD25trKAyKO
	Xo7pU91
X-Received: by 2002:a05:600c:c058:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-48a83d6a866mr74058475e9.1.1777619730949;
        Fri, 01 May 2026 00:15:30 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:46 +0200
Subject: [PATCH v3 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-4-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=9414;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cpSBeucP8Ss790ZkmBApuFPudNB0i62Xj2QNp9/IQ8M=;
 b=rydXBjABT+hodAOm0ItdUCLrIiDLWGd6Ct7O4HNC8damd2NM60CmZRo9R7PCyNCjBepBvwnXw
 RRsVc5TP2qIDgTAYfcr0mPyT5HitNhYHz+rE+/+MoLm5fbnIgIxtTnJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 78D8F4AAE49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105447-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[fairphone.com:s=fair];
	GREYLIST(0.00)[pass,meta];
	DMARC_POLICY_ALLOW(0.00)[fairphone.com,quarantine];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.287];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ae01000:email]

Document the Mobile Display Subsystem (MDSS) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 286 +++++++++++++++++++++
 1 file changed, 286 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
new file mode 100644
index 000000000000..7010ffa0ae35
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -0,0 +1,286 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,milos-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos Display MDSS
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Milos MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,milos-mdss
+
+  clocks:
+    items:
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,milos-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,milos-dsi-phy-4nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,milos-dispcc.h>
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,milos-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+        interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                        <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                         &cnoc_main SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+        interconnect-names = "mdp0-mem",
+                             "cpu-cfg";
+
+        power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,milos-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x3000>;
+            reg-names = "mdp",
+                        "vbif";
+
+            interrupts-extended = <&mdss 0>;
+
+            clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+                     <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                     <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            clock-names = "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_CX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-342000000 {
+                    opp-hz = /bits/ 64 <342000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-402000000 {
+                    opp-hz = /bits/ 64 <402000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-535000000 {
+                    opp-hz = /bits/ 64 <535000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+
+                opp-600000000 {
+                    opp-hz = /bits/ 64 <600000000>;
+                    required-opps = <&rpmhpd_opp_nom_l1>;
+                };
+
+                opp-630000000 {
+                    opp-hz = /bits/ 64 <630000000>;
+                    required-opps = <&rpmhpd_opp_turbo>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x1000>;
+            reg-names = "dsi_ctrl";
+
+            interrupts-extended = <&mdss 4>;
+
+            clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+                     <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+                     <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+                     <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+                     <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&gcc GCC_DISP_HF_AXI_CLK>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+                              <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+            assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+                                     <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+            operating-points-v2 = <&mdss_dsi_opp_table>;
+
+            power-domains = <&rpmhpd RPMHPD_CX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            mdss_dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae95000 {
+            compatible = "qcom,milos-dsi-phy-4nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x300>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                     <&rpmhcc RPMH_CXO_CLK>;
+            clock-names = "iface",
+                          "ref";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+        };
+    };
+...

-- 
2.54.0


