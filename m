Return-Path: <linux-arm-msm+bounces-2747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A997FF888
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:40:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220A0281830
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4516B58131;
	Thu, 30 Nov 2023 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvBHxVbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193845810B;
	Thu, 30 Nov 2023 17:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD9AC433CB;
	Thu, 30 Nov 2023 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701366047;
	bh=aiwDU/GO9SPonpL1asp0uLBSgBwdDtrE9e2UpRiImAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nvBHxVbD6Dce6k2qA75F5gI2inzEChlJVddBeMp+jO1UBEwEWhLuPxK+rb+PbaKaA
	 XzWGJw9tgtG4GiRFEJj8y5fiTZVHrLTnNrdP5MhfHZzx81yuePdnbWeF/QYOWlVdGC
	 Fcqcq4uVq1Tz5OPGxlA/Pm1HdJ0d6GhYLCxclYFQFmwuYzoeWnncDKHPfKCH+QC8RM
	 1tp2w95NHodHjBMl0WUpob9hAFfWvOYVH0TKlNg+8K/myQSuHQHD9wk9s+IktrXyhq
	 KTraiJBRboYhUuqWpD5aJqKTuWjj/Tdt+POF8aI8jJ/Lpn5QcD265cih7WjJIzX0+Y
	 yz495e5IPUSDA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8l2P-0003Pw-0Q;
	Thu, 30 Nov 2023 18:41:21 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 1/2] dt-bindings: thermal: qcom-spmi-adc-tm5/hc: fix example node names
Date: Thu, 30 Nov 2023 18:41:13 +0100
Message-ID: <20231130174114.13122-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130174114.13122-1-johan+linaro@kernel.org>
References: <20231130174114.13122-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADC Thermal Monitor is part of an SPMI PMIC, which in turn sits on
an SPMI bus.

Fixes: db03874b8543 ("dt-bindings: thermal: qcom: add HC variant of adc-thermal monitor bindings")
Fixes: e8ffd6c0756b ("dt-bindings: thermal: qcom: add adc-thermal monitor bindings")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml    | 3 ++-
 .../devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml      | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
index 01253d58bf9f..82f8f25885c0 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml
@@ -114,7 +114,8 @@ examples:
   - |
     #include <dt-bindings/iio/qcom,spmi-vadc.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    spmi_bus {
+
+    pmic {
         #address-cells = <1>;
         #size-cells = <0>;
         pm8998_adc: adc@3100 {
diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
index 3c81def03c84..02347cee6c6f 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
@@ -167,7 +167,8 @@ examples:
   - |
     #include <dt-bindings/iio/qcom,spmi-vadc.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    spmi_bus {
+
+    pmic {
         #address-cells = <1>;
         #size-cells = <0>;
         pm8150b_adc: adc@3100 {
@@ -207,7 +208,8 @@ examples:
     #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
     #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    spmi_bus {
+
+    pmic {
         #address-cells = <1>;
         #size-cells = <0>;
         pmk8350_vadc: adc@3100 {
-- 
2.41.0


