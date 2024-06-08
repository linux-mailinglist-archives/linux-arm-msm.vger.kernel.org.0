Return-Path: <linux-arm-msm+bounces-22125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B1990127D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C8AF1C217CF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A32517B4F5;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEzKPNoH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E23817995A;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=rooUNqSQrOYpnkQdpv2IOzlAeExRoywnL1/e1hWMHdBsLe9YHhP4KBrYRb+/rgY1C6g+9rk1DF0+rdh2NxDmE7F4TwMbsniyGWwSTasG6jAZyqC915B/bEorf44uXU/GD1GGo9KIDe8Wkl8W9A0v4UM4QTX/55P7i0WDWmyJxJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=xQFnxItaw23X3Z5K4ATnqQiJwXgY2xVxtlO/Rvgqwyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQAvMd6Fx0gWU1iPPyqatupdCJOEjNTc9IaM8RgaMQBSSPSan9GzrrmlPXGAlQ5vne9ds+Kfh+PLuMFMkzBEI1MuoXNEzunpTUsNVbJ3dbLuKpb+nnsYa0NvJPdbTx+QUZ5jkHIeB97AyiDRflR1ZZGF4Q3q+0TEsV3xLD0YAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEzKPNoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95776C4AF08;
	Sat,  8 Jun 2024 15:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862240;
	bh=xQFnxItaw23X3Z5K4ATnqQiJwXgY2xVxtlO/Rvgqwyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cEzKPNoHMhn9xf1Ojtdi1B7vdXGhBvn2tCBQ66N0C8bjtukBHNRkxGgQmwgTbadqX
	 ytWx3Em/lTxLhSJbOA6YR7FqCFnoaSGBS0obtCtzK4FpxYtwy1B26coyLvOVkz45Se
	 fH+E4ACXwtAbdBPJAL4aMD3+j4vjrwVapiw/lAYdbUWRlDHUcpfSPgF6a/4iLfY6GN
	 ItuoKdjIAxUjPos95C2MjtHXrWvWuTg6sicNiwuuuSiP1FkTnSgXiatgOSOw8g13nq
	 OSSBQBzbpKmIy0PpCaZaovEu9oGZaK1CzKpduLoXFjkbRyXQgehNJ21XmobSNDM3UX
	 SwiP5IoNgcuJQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRT-000000003Pt-2StR;
	Sat, 08 Jun 2024 17:57:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/12] dt-bindings: mfd: pm8008: Add reset gpio
Date: Sat,  8 Jun 2024 17:55:15 +0200
Message-ID: <20240608155526.12996-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional reset gpio (which may not be wired up).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c75d8bde568..e1e05921afb4 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -29,6 +29,9 @@ properties:
 
     description: Parent interrupt.
 
+  reset-gpios:
+    maxItems: 1
+
   "#interrupt-cells":
     const: 2
 
@@ -97,6 +100,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/mfd/qcom-pm8008.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -115,6 +119,8 @@ examples:
         interrupt-parent = <&tlmm>;
         interrupts = <32 IRQ_TYPE_EDGE_RISING>;
 
+        reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+
         pm8008_gpios: gpio@c000 {
           compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
           reg = <0xc000>;
-- 
2.44.1


