Return-Path: <linux-arm-msm+bounces-81104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A58C48992
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CA744F4B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13CFB331A73;
	Mon, 10 Nov 2025 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GHsOQ53I";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NfH091mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A222331A6D;
	Mon, 10 Nov 2025 18:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799432; cv=none; b=MSIflELjj6rtsdl9iItPLlZ9qNJjl8HYh/x1PFoiGftyFlLy2kLm73FsLSY2XZu4zazxN110NFwi4rCw0KHmOqkmXH8Ez4f385I7A5GSy3G/yDeyACRyAU8kV3ZdsKBBPjdT+D2tMqWb+rfFA+avacCGW/971K7ZtaA3gq1TtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799432; c=relaxed/simple;
	bh=3X7FyZJcHIqcJhrCoLjciEc4RYUyyPCZpHFyHoCnv0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVRNS3aVKl0SWj1KNOrsvXs6+dOXyZf3Xg0MoR6PffcKFV9ZbckOqUoxWMVnvvJgJMvYg3m/TRocYa+nneubVyPFHJV1B8N1xihDMIIWfi8q66fEwUVqR4ezLvJXxRh2rmdwBXCwbJUdjBBpZKPHdI/c2IdYj/+mkgftzMs62sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GHsOQ53I; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NfH091mV; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799391; bh=UqC4emy1T1cmqSo/pDmnOdw
	6LgbapF9Bxbin2r6URvc=; b=GHsOQ53IHYPxvmbeQiapJpOnhToMD9LbbIGrx7HU5tIa190lX2
	2LnXe5Zj+1hWDZt1nDzgf53wFmN/KnOXurj1B7Xn6PXK7CSBzalraYoTwdD15Iqbh2gmA51KJGk
	denbpZ5mD732yUaOloCTmi/aTPGi2pkKVIgmXH5hdkWz9Yv6aZdJJP+e2PXtlDgHOeLvx1GKkX3
	WlafbcNSfKy9twqcTE/iibnDErr6TbquEn9uVlaKPuzN2KXIuqVbm2QflF+ocT1TFPb1fy0pEZC
	sYO1Ni5dMA9oMAP1wPzroy5oQu3lxrcvvhsNk4E5EX2oqwdU5AESPTqkJmDnFicqQ2A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1762799391; bh=UqC4emy1T1cmqSo/pDmnOdw
	6LgbapF9Bxbin2r6URvc=; b=NfH091mVZrDjocbn6f4EjhT1RWglDwwNTN2qyHYCloBu2ZIBDG
	h8+ETrjxyI8P9ovp5f8Jjyhusc5A7HrtUoCA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 10 Nov 2025 21:29:44 +0300
Subject: [PATCH v3 2/3] dt-bindings: remoteproc: qcom: adsp: Add SDM660
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-qcom-sdm660-cdsp-v3-2-cc3c37287e72@mainlining.org>
References: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
In-Reply-To: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762799388; l=1968;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=3X7FyZJcHIqcJhrCoLjciEc4RYUyyPCZpHFyHoCnv0k=;
 b=U6Mtgqf9MRmyldORt67vdSMcfmzyEM2BYQr2bkogKux2UDiavUz4Cnny3mf6Eb3drmuzQgwlc
 5ILT5mdINcdBVpvvTHEriZieaTp/zumqFxhCmF/sA408AYDPBnOXHfR
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add compatible for the compute DSP remoteproc found in SDM660.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index c48561aae3a6..88da57ce7132 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,msm8998-adsp-pas
       - qcom,msm8998-slpi-pas
       - qcom,sdm660-adsp-pas
+      - qcom,sdm660-cdsp-pas
       - qcom,sdm845-adsp-pas
       - qcom,sdm845-cdsp-pas
       - qcom,sdm845-slpi-pas
@@ -70,6 +71,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -95,6 +97,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -125,6 +128,7 @@ allOf:
               - qcom,msm8996-adsp-pil
               - qcom,msm8998-adsp-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         power-domains:
@@ -181,6 +185,7 @@ allOf:
               - qcom,msm8998-adsp-pas
               - qcom,msm8998-slpi-pas
               - qcom,sdm660-adsp-pas
+              - qcom,sdm660-cdsp-pas
     then:
       properties:
         qcom,qmp: false

-- 
2.51.2


