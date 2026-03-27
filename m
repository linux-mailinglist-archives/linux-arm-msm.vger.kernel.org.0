Return-Path: <linux-arm-msm+bounces-100370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kClQHpuuxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:21:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5863475AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:21:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F00930D8C35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F3834AAF9;
	Fri, 27 Mar 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VrD/aJIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D75347FD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627959; cv=none; b=NfuVemCr2AIPpHRoCEeRJNWuaIVuDX8ZCnZoOgjfq5G08nOCFZXmmd9YRldu3hhDISuEF4wIEIlDqXeGRQjBZCN6xBZMy5gHw1tGo1/jrhfcoIOIxOU+tGy2eUdSHU00uYQ8kDV/lhsokqR7Adzs9uZU7ikDh0djTnNc0ZkqhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627959; c=relaxed/simple;
	bh=KtUn5G2UTlEzF/yc8/MAeH8lYJexJkFm284OdZOtjsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBNfWO+LVB/2oM96Gh9Me3nwgTY0bK4I+wpdM6GqNbcs/5k40YGYUS+iqYOyTaGFxH4N6vZTTRz1ao6VJ/oFIw0mCl4soGEpRQry7cKzxSY9+lbhOcPkzxcuN8qoVbJW+9BqSAHQQ/61MpH2W6oWH+qVbnvO8Y9OZlaWUJ06jg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VrD/aJIW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97ed4ad579so373937966b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627955; x=1775232755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq7FZmaEKFcQHlwC/6geG17+uu+aaA5ZxCfFTQLxT+c=;
        b=VrD/aJIWqP9BmTi/wYTjfLhIFf1S60MDFEICeTv2ULEjxV5/nS4a8Q/oSCZ79nZLwc
         8IM81A3W5nEXbHejsUVQ13ECYwNO364GcH8tjuCqz81NwWV+vt+jYBQyFaVwtWDMoqqj
         73eHv3gJIePgjfHPGilDZ/mSNvcRo5sLG7QzrhxYk0UIi5Rgvs7wOiQai8RKfZp+LCgl
         bLAW5rDsQyca3swEMt8zVP1i8y78uYBJZx4YyDrgFoz/lgVur3jBE4ZLTR1R6CwamzUn
         NZt+GdVyWnxZAjv/BPhnYC9p3skfdvIb0DCCtJfOD4TiO98lTJPk6IFI/VAdMVEUa3g8
         +PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627955; x=1775232755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dq7FZmaEKFcQHlwC/6geG17+uu+aaA5ZxCfFTQLxT+c=;
        b=WR6X+cnnZ1Gkm60MV93iuAGopw0ckakXi2om49AEh6lfoCIRa9rCc1d8wjtfQlgMjy
         sskbNTGL0vpaFq+VWMq0d37vKaawqsuZuubzIy8y3HOwaWXkSUlI2LnO+A1PXyiY3oDG
         2ENL1v05oGUy2vyIHi7Gt8BmhiQB2TkXgKhW4Gq4M9U8eaOYEgJt6HfzLoA/RKxKYm8a
         cOEafBDzfpEdaF2EQLISSqosSxV2Fu/aSBfSNdS9vjcla+QhOasJkJVCkwetkMT5SVoH
         adc4AtSsTvVHIoAmpXBMS5EBoHoAxEHIT0eTAnpaI3rxCP1bcfubTYMekVMup4MxJiIo
         7w3g==
X-Forwarded-Encrypted: i=1; AJvYcCWLC88eWeXA9rj2Y9HHoVd0ycXfeosLCrAi5rCkOATJiRZRXFeU+MysOUklTtUcjJP6SIP+kunpbOByPXW7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpr1+93gEtc/mTkUT6NhnflpSqMn5xatp/DGz4G7ua0lotZnG1
	R9PpiCz2YGTFxYy5EjsUNQyHKjRFuOr1FeQ030bgWh8ykmXBvGCl5Yc9fDtygMI6DU4=
X-Gm-Gg: ATEYQzy54zv6AKDFsaUhgTZVzvGGy3uj/ChdO2Fl9AuHGDocrQI9D4AeAqdiVFen5bO
	CLdNuVVWJ5/jzchkDelT0HC2fWUp9zhfKQg7scSGY7rYMkv92dlFGCegDUvdHrki+A6c7qmyFlo
	GzJStwaXOB/cFIi41zYbbuNxvFIX9zTOugpCnnl5UCD5Ys8dEcyPeRAGi7CNd9sW8Xq4OHxgImC
	Bc9x6lILYfy78uJjdSwElmsWp715M6LgzvK5ELdXye4R/mAJ0ej9uEvTsUbkwsO5ETxTfdoypK2
	WOL1vdp8+RSr9xnAVCG1mCi3eKzKkybIx6VcQ6smIli9fKbu/2khgQXtgMffB/yGDlidnIpAR2Z
	Gm9m/nV/U2/ASjgyKp2eAOP8vaZ8tV3ObdRxmp3Aj1hjsKRapVSsFOkN2In+VM5/KLSg0JgLOIq
	0ajXFynRiqS+ixSlL8rdqODQoX4Z3Azrk3KkaDPhdgVUN2St4QZw+/Q58neICv1Pmrx6+h+ORpd
	xpJdQ==
X-Received: by 2002:a17:907:94c2:b0:b97:bc6b:7f21 with SMTP id a640c23a62f3a-b9b4fa1aee7mr205959666b.0.1774627955130;
        Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:23 +0100
Subject: [PATCH v2 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=9238;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KtUn5G2UTlEzF/yc8/MAeH8lYJexJkFm284OdZOtjsA=;
 b=XRBDJr+T4inivP4pCestBgyjauRIBd5h9gxsYU7Sc+onWf6YvnD0LQUjqAApSV7jl/whtAR4E
 eTvFPG0+Te6Co++eRkdMlIQz0g81A6TkBr87kCD7dNRLZzUBawgg1LF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100370-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.0.0.0:email,0.0.0.1:email,ae00000:email,ae01000:email,devicetree.org:url]
X-Rspamd-Queue-Id: EC5863475AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Mobile Display Subsystem (MDSS) on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
new file mode 100644
index 000000000000..0fb66b4b2742
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
@@ -0,0 +1,283 @@
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
+        items:
+          - const: qcom,milos-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
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
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
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
+        #address-cells = <2>;
+        #size-cells = <2>;
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
2.53.0


