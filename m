Return-Path: <linux-arm-msm+bounces-19566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A728C0CB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F7E9B21C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 08:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1375147C6C;
	Thu,  9 May 2024 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/1SRg54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220913D24D;
	Thu,  9 May 2024 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715243999; cv=none; b=H5So82lRpliWN6n7oOUpAahuHwl5u0KDfe43QPFgEIWQ5qJbi+VNYLNScJc9YLH4b/EGYCCJcygDLyTe7wFj+FY3L79eAr7VOQHTRnu2ND2IDj1d0jt3kooWWGVCwwRKr0vg0jfEUSoKDN7iCMYFbz5IR8qFwGiCAct/QuOqaXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715243999; c=relaxed/simple;
	bh=N3lC747+fKJugAEc1wHWjEynnNZm00O2tIitmKEOf7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3/fg6fdWveJTVlJGts5KEISsIn5CUjOkNBhYogyKFYhCqNIfQ6VBKyKe+Ft6yMKlYyD2mUHUC1YWV+h+1vRz29PSjKOOpVKtaB3H7Sh/R/oYjK/lL3ijYdhXXh2PsEBv1pSLCti9O3NH1kV3LUVqidGal3E7tNOY0ogofyrHdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/1SRg54; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6E7C2BBFC;
	Thu,  9 May 2024 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715243998;
	bh=N3lC747+fKJugAEc1wHWjEynnNZm00O2tIitmKEOf7w=;
	h=From:To:Cc:Subject:Date:From;
	b=a/1SRg54ACQpGXLe28vNjQcbiCnoXapyCGFnpwLjWG+RG/X0HmktUb2dn6NxZWsL1
	 NDvwNS73G3ApSTzsvUFHzTmhOReqBV9miaU4ODUvzxjcOeN2uwk10I/AHFtoLe4y9u
	 oxT4e+qvo1Cl2gOlQ8zmCJUbBIYkfxWuPw1YUGs2LjZbQ7UDC9nN1zYY4t3UpgK7Wk
	 OOyMaeNtcTTR/hVjeh9XmN022qyKOz/TYt21TSqLvGuspEX5TltNf5invNuRoaGqjB
	 zlE096UsIJFVB6MQlQqjnRQuGDBpC6pc+0PpgtlmSaEJ2+BSMHImsEfE1hTzj5as6r
	 yBu8zGlUVP+wA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4zJq-0000000008m-1zlW;
	Thu, 09 May 2024 10:40:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH] dt-bindings: usb: qcom,dwc3: fix interrupt max items
Date: Thu,  9 May 2024 10:38:22 +0200
Message-ID: <20240509083822.397-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent commit adding the SC8280XP multiport controller to the binding
failed to update the interrupt maxItems, which results it DT checker
warnings like:

	arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: usb@a4f8800: interrupts-extended: [[1, 0, 130, 4], [1, 0, 135, 4], [1, 0, 857, 4], [1, 0, 856, 4], [1, 0, 131, 4], [1, 0, 136, 4], [1, 0, 860, 4], [1, 0, 859, 4], [136, 127, 3], [136, 126, 3], [136, 129, 3], [136, 128, 3], [136, 131, 3], [136, 130, 3], [136, 133, 3], [136, 132, 3], [136, 16, 4], [136, 17, 4]] is too long

Fixes: 80adfb54044e ("dt-bindings: usb: qcom,dwc3: Add bindings for SC8280 Multiport")
Reported-by: "Rob Herring (Arm)" <robh@kernel.org>
Link: https://lore.kernel.org/r/171502764588.89686.5159158035724685961.robh@kernel.org
Link: https://lore.kernel.org/lkml/171449016553.3484108.5214033788092698309.robh@kernel.org/
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index f55f601c0329..7dfd2d88b90a 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -118,11 +118,11 @@ properties:
                                exception of SDM670/SDM845/SM6350.
         - ss_phy_irq: Used for remote wakeup in Super Speed mode of operation.
     minItems: 2
-    maxItems: 5
+    maxItems: 18
 
   interrupt-names:
     minItems: 2
-    maxItems: 5
+    maxItems: 18
 
   qcom,select-utmi-as-pipe-clk:
     description:
-- 
2.43.2


