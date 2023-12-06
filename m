Return-Path: <linux-arm-msm+bounces-3531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 506EF806DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B2A7281BED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9847B3175C;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SL/gPgdT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568273172E;
	Wed,  6 Dec 2023 11:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7946C433CB;
	Wed,  6 Dec 2023 11:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701861462;
	bh=wMWsV85NWCSegh0Gab+O0xc9mK0JLvIvAXgKFlqRUBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SL/gPgdTsF/7MmxwofVLR1UAmX6VOKajZh25GWG12l+G1HsiDNJNNgd98MRd8v9kH
	 jFW1puRE8Multrki2iGnJDBp7SPDsWiSsGZHnvRcVY/4vGCVVhDBBNYOIqBvqtumPk
	 j3Fw4azh5uV+04vKi+WfOL53fyClkx+t+ZZfEfjHIv64du1LWd5Dc+SJbfDYfIsxUj
	 xsC1RcJGM5eu344Pfvsl7owaBcqoGpDNo208uTDkAkOziVDiVejgyfSp9qSpqF2nAK
	 tphXvD4GC0VRAuGt/20YGWoSzEFnxtScrgSdCeFgSnivRzdOe0uSqD4TZA6zeGnrBl
	 8RphkmcOKeGZQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rApvA-0001wK-2D;
	Wed, 06 Dec 2023 12:18:28 +0100
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
	Johan Hovold <johan+linaro@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 4/4] dt-bindings: mfd: pm8008: clean up example node names
Date: Wed,  6 Dec 2023 12:17:54 +0100
Message-ID: <20231206111754.7410-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231206111754.7410-1-johan+linaro@kernel.org>
References: <20231206111754.7410-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree node names should be generic; fix up the pm8008 binding
example accordingly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 9e4eed34dae8..0c75d8bde568 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -99,10 +99,12 @@ examples:
   - |
     #include <dt-bindings/mfd/qcom-pm8008.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    qupv3_se13_i2c {
+
+    i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      pm8008i@8 {
+
+      pmic@8 {
         compatible = "qcom,pm8008";
         reg = <0x8>;
         #address-cells = <1>;
-- 
2.41.0


