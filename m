Return-Path: <linux-arm-msm+bounces-50107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB29A4D2AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 05:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED9418905E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3FE1DACA7;
	Tue,  4 Mar 2025 04:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="P2+ExE1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7650273FE;
	Tue,  4 Mar 2025 04:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741063570; cv=none; b=AlV/5j8A2J2aL49NuggOfHzWBLhSH/j9B1bnAdKbR6ywTRGIiugFUZNKLDCuf8Q5FGpC1MwMAoJSMoIxrIGtW1PaAP/AwewgSZTqzLAhq3mR2PnTCByeSzIj+DwAvvIh6JAIYX3uR3K6Ld8GPmV3j5MTxzJKO+kEc3a4syZ4he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741063570; c=relaxed/simple;
	bh=fLrUZzi2O2CHXVLtjjJD/Zz4ACTitOh1CdYE2z+7TTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/F670JcweCEwSP2gR1EWJInVBuDxdL97xS1vO+46mB8eCTLZUqAbnDVlcQQzMJ8ZvVisVMY8qVF+C57FdO3M60BpJnGUxWzYLyXnzga2LjW1CkwJG0ge60H8MXJ0VHs9b1Xvds4xfZlZongr6s12Bt7zdjghdRwnT+QqibW7hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=P2+ExE1B; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EE45925CB8;
	Tue,  4 Mar 2025 05:38:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N9u9EjEUFwdy; Tue,  4 Mar 2025 05:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741063094; bh=fLrUZzi2O2CHXVLtjjJD/Zz4ACTitOh1CdYE2z+7TTs=;
	h=From:To:Cc:Subject:Date;
	b=P2+ExE1B39+bn7wpWI+RPAr/3RPEMicqUvXhMg8KPeCP6mQMzM92UkJNnFQ6BuWZ0
	 DC0rmbdfOJ52Ix5c2lm/tWgYDEKAlAJvwPcc/pXuqD6lnSRkOUlKTWKDkfdrAvc/up
	 593YzPBT7Lt59UxLY/3ei8UakqCUVXvqPSGm4s8Iq5TG/Xh7FgxicvrbmsASTrBAVi
	 l9uiZdG01isqPbgh74XKBdmXLOVjI8rQUkNE29eFjs8g+fQkap1GT/30dy7+wx/sru
	 VAk7Z26guDcFHLA29ViO2Tyo68K/LKZssX34zsXQo37GenN8BChrTi2CrNy02zFdhW
	 7wLzNz7GzOeJQ==
From: Gabriel Gonzales <semfault@disroot.org>
To: linux-kernel@vger.kernel.org
Cc: Gabriel Gonzales <semfault@disroot.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
Date: Tue,  4 Mar 2025 12:37:39 +0800
Message-ID: <20250304043742.9252-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Xiaomi Redmi Note 8, which is based off the SM6125 SoC

Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693..52f7b217b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1020,6 +1020,7 @@ properties:
       - items:
           - enum:
               - sony,pdx201
+              - xiaomi,ginkgo
               - xiaomi,laurel-sprout
           - const: qcom,sm6125
 
-- 
2.47.0


