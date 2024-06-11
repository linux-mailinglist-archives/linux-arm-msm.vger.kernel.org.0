Return-Path: <linux-arm-msm+bounces-22344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB4904714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 00:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6394B1F24155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 22:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AB6155329;
	Tue, 11 Jun 2024 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="F4S1XrRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp47.i.mail.ru (smtp47.i.mail.ru [95.163.41.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A546444;
	Tue, 11 Jun 2024 22:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718145487; cv=none; b=JwhuONmwKmLHhI+H2VzbOkcCIJ3dOixHoZtL3vBjklkWnRxpWz3w6lYmI+WPwMUMjt/OJfn1elo2BlqA9o4LlpnPerxAb7pv4i4EYTGSaofz5FBF4Z2SBEEypE73/rohqFLWu9szRV5blLShsjZNZ05Wws5p2Or9c8w2lulx3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718145487; c=relaxed/simple;
	bh=jTDmtYeGjPxS86wQsWZIm+BJszloo3xoYEExyW/wa94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrLa2Og1uXy/5Vbc9aLVWlncnNtaqTmRHmzoNf1IAeoUEKSMGvHWa2Hf6zxNVSlWCxxrw8GCLOmEWmostnJ5vQfrUUj/qjouUepsVY8aqX+Exs7EpWQSHVQ4l95cKCLpxPYs+JbQOIuxEzxJWVDAQ+lkWbMWnNcly868m+WvxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=F4S1XrRz; arc=none smtp.client-ip=95.163.41.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=c7heYHhC2SoV4gdd2n/u/wpYEOsmcXeGiohefmAbUxg=; t=1718145485; x=1718235485; 
	b=F4S1XrRzmwRzIEY2ZUQTWNbkK6n0CnYQGmiIc3ZOL0UGbdx0+oo4VU472ANjeeK8G1/kZVhwrrY
	I57gnzgbmdS/FviaIu6ukBosmaKS5Z38zgv29Ly+m8ZPltoxnO+dwPhkyWbQQV5ed/aEoFFEwt+Ap
	Yt6nc12gs3b6tw7h7cA=;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sHA7t-00000000PfZ-0X0P; Wed, 12 Jun 2024 01:38:01 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_rmccann@quicinc.com,
	konrad.dybcio@linaro.org,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	swboyd@chromium.org,
	quic_khsieh@quicinc.com,
	quic_jesszhan@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 3/4] dt-bindings: display/msm: Add SM7150 DPU
Date: Wed, 12 Jun 2024 01:37:42 +0300
Message-ID: <20240611223743.113223-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611223743.113223-1-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp47.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FAAADCB0684E75543E0F6F500DBE411A6A00894C459B0CD1B96773C183266EF60906104296DCCA83D2278EFBE135511FC442442993E2508E0A4A43D3E7D3A7B3F6
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7A1940B41596E7600EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C867FEFF36BCDF178638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8D22A709384736F8A408FF9FAEF290F8B4E2A078FD99198C1CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B861051D4BA689FCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C68E4D7E803FA7AD52D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3C711CAE753D09F11BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE97D2AE7161E217F1DD303D21008E298D5E8D9A59859A8B6E232F00D8D26902CAAAE862A0553A39223F8577A6DFFEA7CC96613F75B7D048DC4224003CC83647689D4C264860C145E
X-C1DE0DAB: 0D63561A33F958A5E1A1E8F93846C63A5002B1117B3ED696A228224A78125FA522DFD5397F446790823CB91A9FED034534781492E4B8EEADA2D5570B22232E1EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF6243CFF126C1FCF62AC561F2966B27CE72AE9D9077F7AB8678F94061C94E99F86E47D229C2E76ED404A26A3878DC1330EBAB428808D84F59E3725B7D062D8D430909D3C40AF6CEAE54A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKMb1ucvuH6PhA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810CCDD7C2C42388EEEA62B7A476541487CEDF1F29D0ECA7DC2D83D9AE89EADB3A2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Document the DPU hardware found on the Qualcomm SM7150 platform.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../bindings/display/msm/qcom,sm7150-dpu.yaml | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
new file mode 100644
index 0000000000000..465109f38acb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM7150 Display DPU
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm7150-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display hf axi clock
+      - description: Display ahb clock
+      - description: Display rotator clock
+      - description: Display lut clock
+      - description: Display core clock
+      - description: Display vsync clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: iface
+      - const: rot
+      - const: lut
+      - const: core
+      - const: vsync
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
+    #include <dt-bindings/clock/qcom,sm7150-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sm7150-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISPCC_MDSS_AHB_CLK>,
+                 <&dispcc DISPCC_MDSS_ROT_CLK>,
+                 <&dispcc DISPCC_MDSS_MDP_LUT_CLK>,
+                 <&dispcc DISPCC_MDSS_MDP_CLK>,
+                 <&dispcc DISPCC_MDSS_VSYNC_CLK>;
+        clock-names = "bus",
+                      "iface",
+                      "rot",
+                      "lut",
+                      "core",
+                      "vsync";
+
+        assigned-clocks = <&dispcc DISPCC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd RPMHPD_CX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dpu_intf1_out: endpoint {
+                    remote-endpoint = <&mdss_dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dpu_intf2_out: endpoint {
+                    remote-endpoint = <&mdss_dsi1_in>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                dpu_intf0_out: endpoint {
+                    remote-endpoint = <&dp_in>;
+                };
+            };
+        };
+
+        mdp_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-19200000 {
+                opp-hz = /bits/ 64 <19200000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-344000000 {
+                opp-hz = /bits/ 64 <344000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-430000000 {
+                opp-hz = /bits/ 64 <430000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
+...
-- 
2.45.2


