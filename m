Return-Path: <linux-arm-msm+bounces-2738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAD7FF81B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 18:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC131C20E3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5817556754;
	Thu, 30 Nov 2023 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQsN2Qi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C455C34;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D76C433C9;
	Thu, 30 Nov 2023 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701365125;
	bh=tJgxRz4gUs6W6Faa+Cg1vkflopdC7A4P4ALBdtcXLMY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HQsN2Qi7iv0U/cVxFkcbXn63O2jSqdXm0fg5DVFkJmjiowP6RImhn2etpYiltW+G1
	 Wbu7eFZ1eYSHxGgye6gXf3sVDFrcUwY1tD9vhxlkwtYeaO/eqE6g2duOWY5o0KAjzQ
	 IGWEwo/S+vreGsBoOffXVIHea0W//Ds1AcFCiyM44WW499OO5VIuwHfrekGAXb8DKG
	 j2L2o9HBWsA2cW9nJSRpL1+JpxBLCgbtv3180ALMg83DNrxIEtbGYE63tmRepSh9Tj
	 K3E1q/8A5FfDuyIL2fKn8sGvoZQ/VQclWq9IcP+0Un4AXGTLHX92ilYuCOsYUAY6kA
	 sbOIIM8Lpq+eg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r8knX-0003Gv-0x;
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
Subject: [PATCH 1/4] dt-bindings: mfd: hisilicon,hi6421-spmi-pmic: fix up binding reference
Date: Thu, 30 Nov 2023 18:25:44 +0100
Message-ID: <20231130172547.12555-2-johan+linaro@kernel.org>
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

Fix up the SPMI PMIC binding document free text reference which
erroneously referred to itself rather than the parent SPMI controller
binding as intended.

Fixes: 9e5917288545 ("dt: document HiSilicon SPMI controller and mfd/regulator properties")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
index bdff5b653453..e36e5ce58136 100644
--- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
@@ -17,7 +17,7 @@ description: |
   node.
 
   The SPMI controller part is provided by
-  Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
+  Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 
 properties:
   $nodename:
-- 
2.41.0


