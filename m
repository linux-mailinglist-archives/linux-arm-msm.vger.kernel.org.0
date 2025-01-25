Return-Path: <linux-arm-msm+bounces-46119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91080A1C0AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0071886EE5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09562063F0;
	Sat, 25 Jan 2025 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDzc58GL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302D3595E;
	Sat, 25 Jan 2025 03:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775891; cv=none; b=JcUinnAO+wkGYbU2n9PunvNBejf4YiP150+QWfQV7LQmBsOslBGHDHBjubKnS2YOJSg++0jZpIMKLdRNKMfmmHu+tLS2co/kEeziIku2D0Sqt65w5WwcHtPNuMwzsfX8TfL0jhsap28BhKoJRBM1nrN8YKG+iPu5uj0jxUffc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775891; c=relaxed/simple;
	bh=14JNtwzaggko4px4AFo91MrUKHtzGL+tdB0lfg7xYR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/wmbE24GDQb1U5ulfYMbJKAS0SHFK934QTk3MCu5nsQvs6/HfuL6SedLn8zuQCgXwA3UsxhPHdEkjoQ/QBjoSZG2wqUmJ7V+ojNeiMe7tcjH8h2K+9pPQHr3P1XNgoukR59qtSbYbtyMOo3Sf1Ew5FvKGW6F7bPWmcBpY7hv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDzc58GL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8A2C4CEE1;
	Sat, 25 Jan 2025 03:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775891;
	bh=14JNtwzaggko4px4AFo91MrUKHtzGL+tdB0lfg7xYR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RDzc58GLcn57z7WBTgDycEYErYO0dy7MkZyZW5V2Ef5pYdxhRPhEVqgo/UPjohoj7
	 JGG9LvlNyQveFOjq0/gHzTLT5QYrMb17rmMS7Osf2ookvQNrruNciQyRoLDDkglZkB
	 fgplGfCFEXxEAQjiy9gDoIzsFXUTGFFVlz6WuhMIBYnm8J96S65bQ7SfCjONBDsE10
	 F5ugwpumpJszp+XICHIW9uLJdobqUju2IHS+lRNIfzrfv31GD8iKp5HCYBvqJDhaFo
	 SXultECkYkWN1RT6z0wyrkCzqaGW644SxMHXrFMJw7HRks6vJtpm0TAECbZTDxV0P0
	 AgBBGDgfHeFDQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 25 Jan 2025 04:31:17 +0100
Subject: [PATCH 1/6] dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe
 Gen4x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-topic-x1p4_dts-v1-1-02659a08b044@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=1914;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=FYdx44lQWbzJYhduHK5Q+z5D4BL0BELlO06f6qXTvOg=;
 b=VCpNB5nnYTaxeOVLRWolLA/p3Ry3SlxgqlIUULYP+91T72hwooVFVDu6p4/UvYrMCzo5xg7Ms
 dFkff5bLYRNBkQO//tfeJ92l9Ix8PwIMF3Pdj6DeyXgBY8EdCJX3PhD
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

X1P42100 has two Gen4x4 PHYs instead of one Gen4x4 and one Gen4x8.

They are mostly identical to X1E80100's Gen4x4 PHY, but there are some
minor details in the programming sequences.

Introduce a new compatible for this flavor of the PHY.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 89391649e0b5cb7e778b51fe61fb445d1f17eaf5..f1ffc3d5cae44b8a9c96cdcd749a6e54533c94f6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -45,6 +45,7 @@ properties:
       - qcom,x1e80100-qmp-gen4x2-pcie-phy
       - qcom,x1e80100-qmp-gen4x4-pcie-phy
       - qcom,x1e80100-qmp-gen4x8-pcie-phy
+      - qcom,x1p42100-qmp-gen4x4-pcie-phy
 
   reg:
     minItems: 1
@@ -124,6 +125,7 @@ allOf:
             enum:
               - qcom,sc8280xp-qmp-gen3x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         reg:
@@ -180,6 +182,7 @@ allOf:
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x8-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         clocks:
@@ -211,6 +214,7 @@ allOf:
               - qcom,x1e80100-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen4x4-pcie-phy
               - qcom,x1e80100-qmp-gen4x8-pcie-phy
+              - qcom,x1p42100-qmp-gen4x4-pcie-phy
     then:
       properties:
         resets:

-- 
2.48.1


