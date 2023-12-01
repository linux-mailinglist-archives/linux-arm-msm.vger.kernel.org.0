Return-Path: <linux-arm-msm+bounces-2927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D715180107F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141611C20EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742A54CE01;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmy9tmur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460364AF78;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E1FC433C8;
	Fri,  1 Dec 2023 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449206;
	bh=5VDnDHEln3DKe1zG9t7qo9Eo+6x9j+qVjLQOECvlRlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mmy9tmurniIFtyjP3ziw7xjSYjUEYDmIScfc4kqHM7UqmbzUZ35zBFY2pdDes577s
	 tjRX/Ayd7P3WcUW6Vnug/ydDlLOVj3QZFrD8D268psT1enu/5lv9PKOp4jLV8H+xAu
	 DJiDHIbjSHheyDl6iGgUX1UFMDjYWzhyEVRk0fIc9yQP8726oGaOq0L2zozJ3gRiLp
	 oXZ4gYVOkl14X0Djv6abQvVP7dmLFOWO21vMsFOR5JfdvjvS4roITxotqkoqlMwgnE
	 x0R7MvzDA88sNRo4Gt3CHMh2vH/8JWCXOTWXGhxTWJF5PDJlcFcZzdYCRzQSPDY64T
	 gqGQ5x+J+VAIw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r96fj-0003IY-0q;
	Fri, 01 Dec 2023 17:47:23 +0100
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
Subject: [PATCH v2 4/4] dt-bindings: mfd: pm8008: clean up example node names
Date: Fri,  1 Dec 2023 17:45:46 +0100
Message-ID: <20231201164546.12606-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201164546.12606-1-johan+linaro@kernel.org>
References: <20231201164546.12606-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devicetree node names should be generic; fix up the pm8008 binding
example accordingly.

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


