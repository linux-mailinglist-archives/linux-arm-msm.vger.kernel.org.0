Return-Path: <linux-arm-msm+bounces-46814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAE8A26207
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 19:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122B5188771A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B2C20E318;
	Mon,  3 Feb 2025 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="vX6xsN4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from send127.i.mail.ru (send127.i.mail.ru [89.221.237.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B6920DD7E;
	Mon,  3 Feb 2025 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606502; cv=none; b=OgzyOtEUh/FxPPywdIrtoujVjrNr+yqUl3sjT0Jbt3ouf0PgKXvtAC5VPC8rExQ+vsLkDt+oHOf08B4DshjBdOEc1SXY8F4OX28MkFGINaXWXMrMIb4J6vnXqD77sRylK7HkemrNELUX1ubL7BH9rJ1zC00fG17pykpiFKLeL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606502; c=relaxed/simple;
	bh=5lYR82+vA3HXXcWAA/yq2Sk1VdicLiia9FPRnYnSomk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7zjtx+lKntEJpb6+JvV7h1SCYwYgU3mzvwtNShOs/ZHSA4rp5+FKOy33GDhMmUH309/XatXBPZaeApeI4LslnW/jaqLyn6G+DWh86lxHijbsGALEGo7UG8u4qxnXHRwrRAY7h11eUQztZ2o6b24jJTy627LmaFJIalr1DQb0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=vX6xsN4v; arc=none smtp.client-ip=89.221.237.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=vMI27AoYZKG1CD0cxeK+bWR5XL/P6T55MHlECj5RKqk=; t=1738606499; x=1738696499; 
	b=vX6xsN4vm/8q27rSpmnQ2vtlsrAzZyvSHdRVOdXlRrAe52SeQeBQIuqHmTbbIV2fia2jelrHeDf
	2FCT9zTjnUSbIDt4gIlG48s9YftIiuU8CTXn+FakRmkARBAm+eAEtagXQBZqeMgy4GcAMsLi7T4RX
	OnxTZW9KZBsVlVFpwDk=;
Received: by exim-smtp-6d97ff8cf4-crh4d with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1tf0yE-00000000H1P-1fMB; Mon, 03 Feb 2025 21:14:55 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	jonathan@marek.ca,
	jun.nie@linaro.org,
	fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/4] dt-bindings: display: panel: Add Visionox RM692E5
Date: Mon,  3 Feb 2025 21:14:24 +0300
Message-ID: <20250203181436.87785-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203181436.87785-1-danila@jiaxyga.com>
References: <20250203181436.87785-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: exim-smtp-6d97ff8cf4-crh4d; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD985D89FF3B425BBEF2193CC243B11556D4B3C007C06E5751BCD62213F67905E7AB0649A66F3AA3068BDA1AADECFE04B8598A8AF26F29BC2CA8CCD77A89BB61E5C074A40F52AF1438D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE79CBBCC7DE3A5D56AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637826327602763C04B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D862F0D7E7066D67FEA51576F636F323C960FF3A77CDDDD7E0CC7F00164DA146DAFE8445B8C89999728AA50765F79006370BDD70ABAC747F53389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C0085B890FD2717DA2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38486209235C84D5EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE702706FBA10211704731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5369D1127B58F3B825002B1117B3ED696AD07EB059A5FB68A406406D89DD9EB8A823CB91A9FED034534781492E4B8EEADC24E78AA85F86F6CC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAB5AF39FC37094E5026FA46F59BDAFFA48B8FFBE6A9FD84395D19E6975599BBF673DC415E80A8BD9C56FE0738BD31C048F2B6330692F492F139AD299E36D9692496E903E34223801354DA1E504E663BD02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojks+hT+CyYL1LIkh1H03mOA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FF5005910AAC18673741D06F8E7BD5C4967C203FCFC3633DB5C591B039FEC00412C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

The Visionox RM692E5 is a 6.55” AMOLED panel used in Nothing Phone (1)
(sm7325-nothing-spacewar).

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../display/panel/visionox,rm692e5.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
new file mode 100644
index 000000000000..d4b4672815fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm692e5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox RM692E5 6.55" 2400x1080 120Hz MIPI-DSI Panel
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+
+description:
+  The Visionox RM692E5 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - visionox,rm692e5
+      - items:
+          - enum:
+              - nothing,rm692e5-spacewar
+          - const: visionox,rm692e5
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: 1.8V I/O source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vddio-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "nothing,rm692e5-spacewar",
+                         "visionox,rm692e5";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_oled>;
+            vddio-supply = <&vdd_io_oled>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1


