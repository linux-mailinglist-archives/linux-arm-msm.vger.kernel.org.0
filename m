Return-Path: <linux-arm-msm+bounces-117055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /vulBQAnTGr5gwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:06:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C2A715E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b="dMZ/2erA";
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117055-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117055-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD7D53038110
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 22:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528773E0223;
	Mon,  6 Jul 2026 22:06:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF30438498;
	Mon,  6 Jul 2026 22:06:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783375566; cv=none; b=qHoo892QB3+d/oRkwKZOVJUyzNH3CrtSQkGZLWUUXZqGiXuxszN/OuWY2ajGnQ3j4IrzEF6s8Krl84O9eBi+xpybhOu0p3fl0CkWcxrTUpb1uAwspbpDDfDfBaRRt6rMshYODN9amS505EXQNhhPn3wSX9crBbO0nAifDae3dwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783375566; c=relaxed/simple;
	bh=d+1veSMMNhmMknc4U5tBLbwBt8Cc5m4SNqcJtqh3z/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQTAj5lWq1zUymC14rwzWVMNRQn6BUrVM0pd1XUFReb5Gt8fcd7FPys3G2JUzwfBqM8WTjhi+N9TKav3kpJOUR/ytZfPibsGFbXS9YZ/gVz/pkWFiuyYAqOFyJ8AjwSi+u+HVpR/zbgwuOyZPTN6IAOsiVdEt5HyNZrrzbCXK9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dMZ/2erA; arc=none smtp.client-ip=79.135.106.31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783375553; x=1783634753;
	bh=NwhQeFqh/lqgtoLPEMKrAqFCbpgQgElRtomSXFaHFkM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dMZ/2erAzCh64hEGN7BXzjEl7MSqiijyTAirSL9SAtTyPLFYd8zxLrckXZOP7Abel
	 UefsxgY9c/lY/jrhbM2LvaFsoF3cNPOH6JeKKvb+kJ0cJI1p+sqeH+c7Ll5b93koCI
	 eaQqhdFwanAXplG1IZnCM5qfQPoFOuFiYmRLgAJmgJgrwgBTrOYX2m7/fGuU3/ynMc
	 V3Iqzc92Zxwr8jVRAqzYVsMwFGUp/7dOEN8Dn+RCJtPQTMpMNXf8q9TIIifJU/30vG
	 pF447UQkx2tVIqH3RJODFLCADozLSrjBj95RWe+rusdKd/uI9Jj5w7CVPu3BAEO8vj
	 GmZONjC+s0fuw==
Date: Mon, 06 Jul 2026 22:05:49 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: media: qcom,milos-iris: Add Milos video codec
Message-ID: <20260706-milos-iris-v4-1-119cbe0a7262@pm.me>
In-Reply-To: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
References: <20260706-milos-iris-v4-0-119cbe0a7262@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 2d7d2a5243d4b776945d0d26225f55eacf940eb6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117055-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82C2A715E24

Add binding for Qualcomm Milos Iris video codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 +++++++++++++++++=
++++
 1 file changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml b=
/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
new file mode 100644
index 000000000000..b0b0355ad52e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,milos-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC Iris video encoder and decoder
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  The Iris video processing unit on Qualcomm Milos SoC is a video encode a=
nd
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-iris
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+      - const: mx
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus
+      - const: core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/clock/qcom,milos-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible =3D "qcom,milos-iris";
+        reg =3D <0x0aa00000 0xf0000>;
+
+        clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names =3D "iface",
+                      "core",
+                      "vcodec0_core";
+
+        dma-coherent;
+        iommus =3D <&apps_smmu 0x1960 0>,
+                 <&apps_smmu 0x1967 0>;
+
+        interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_=
ONLY
+                         &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
+                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names =3D "cpu-cfg",
+                             "video-mem";
+
+        interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        operating-points-v2 =3D <&iris_opp_table>;
+
+        memory-region =3D <&video_mem>;
+
+        power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names =3D "venus",
+                             "vcodec0",
+                             "cx",
+                             "mx";
+
+        resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+        reset-names =3D "bus",
+                      "core";
+
+        iris_opp_table: opp-table {
+            compatible =3D "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz =3D /bits/ 64 <240000000>;
+                required-opps =3D <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz =3D /bits/ 64 <338000000>;
+                required-opps =3D <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz =3D /bits/ 64 <366000000>;
+                required-opps =3D <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz =3D /bits/ 64 <444000000>;
+                required-opps =3D <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-552000000 {
+                opp-hz =3D /bits/ 64 <552000000>;
+                required-opps =3D <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_nom>;
+            };
+        };
+    };

--=20
2.53.0



