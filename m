Return-Path: <linux-arm-msm+bounces-2742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C67267FF822
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FFCC2817B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9156772;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geoC9/gW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2D56757;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0731CC07615;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365126;
	bh=hSnEWQ5BFd65oW3upSVnQ42R/owuCp6Usl1kLC5b1FA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geoC9/gWAv6GcCrKW2qGzId615qUlwWxVb1ElZClUBeFckIAtvXkxTszffYp2we0P
	 LZvDG/pGS9thgKwWHFuRzGBlnTUD//23Y0E/7YEzE1O4jQcmOX8rIiBu/KhTgLnXd5
	 q7oktWMzroeb+ay/Q7MgZv8ciwm6g60cu3+C2PJ3wdKliW2LjIDvtxaE+ZDbuifSu3
	 S9iKTcKNJH+6PWb4pjfzyQx+srdgZjnJkTi0LNloxr8u2QDILbgszAUkXrUSeHFLhV
	 vf+6v0p+Fs9QrjsED2O0nKERxwNX6J4UhVaFof94wAKpoG4UVBa/BuTg91CojLJDn0
	 +ebrEI1FaseAg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8knX-0003H2-1m;
	Thu, 30 Nov 2023 18:25:59 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 4/4] dt-bindings: mfd: pm8008: fix example node names
Date: Thu, 30 Nov 2023 18:25:47 +0100
Message-ID: <20231130172547.12555-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130172547.12555-1-johan+linaro@kernel.org>
References: <20231130172547.12555-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree node names should be generic; fix up the pm8008 binding
example accordingly.

Fixes: b0572a9b2397 ("dt-bindings: mfd: pm8008: Add bindings")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 24c6158f73ae..32ea898e3ca9 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -88,10 +88,11 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/gpio/gpio.h>
-    qupv3_se13_i2c {
+    i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      pm8008i@8 {
+
+      pmic@8 {
         compatible = "qcom,pm8008";
         reg = <0x8>;
 
-- 
2.41.0


