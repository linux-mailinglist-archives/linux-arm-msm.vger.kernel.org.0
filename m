Return-Path: <linux-arm-msm+bounces-2925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DA80107C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAFE4281BED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668BE4CB53;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uY+PvO1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F1D495C7;
	Fri,  1 Dec 2023 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E04C433C9;
	Fri,  1 Dec 2023 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701449206;
	bh=xDVPMQd9A2W8u2+/8JI2ebYPTKJS6OCJRFu32DgoLik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uY+PvO1S03Humufsfsj2DHvI2+GYSLvtR1QjAbwGAik0BX9qFoqVG2f70w0plapHX
	 CG328qxTt68B1rlfEZhH8f3nVa/TSefo4hU6eV0zIaVzAq2BcEFbwIwOuPbXEnBpOB
	 EZyhh2wENBoW9WkFSKjuQi8sOPBspmlPPkrLvc+fdasB8jDqRjMs9+bXL4WKDoWiWh
	 AdwFpZlDdesVP4rIrX3jPvdk6V+en71o413t3tXIM/EJ5ycC56P2bp62FHG+nzc09a
	 IVOOhtaeRmMvNFxYHft4kRxlVGTgktDOwzXjeTcIp1TeWtiZa3pE0rjD+T9Pb1si0L
	 Hnw/GcxSHzwZw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r96fj-0003IU-0L;
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
Subject: [PATCH v2 2/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix regulator binding
Date: Fri,  1 Dec 2023 17:45:44 +0100
Message-ID: <20231201164546.12606-3-johan+linaro@kernel.org>
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

The regulator child nodes do not have unit addresses so drop the
incorrect '#address-cells' and '#size-cells' properties from the parent
'regulators' node.

Fixes: 352335a6aced ("staging: hikey9xx: hisilicon, hi6421-spmi-pmic.yaml: simplify props")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml       | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index e36e5ce58136..45cd6a613a91 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -42,13 +42,6 @@ properties:
 
     additionalProperties: false
 
-    properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
     patternProperties:
       '^ldo[0-9]+$':
         type: object
@@ -77,9 +70,6 @@ examples:
       interrupts = <0 0>;
 
       regulators {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
         ldo3: ldo3 {
           regulator-name = "ldo3";
           regulator-min-microvolt = <1500000>;
-- 
2.41.0


