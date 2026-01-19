Return-Path: <linux-arm-msm+bounces-89638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9DD3A769
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC3730A9D44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEBD318120;
	Mon, 19 Jan 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGpWhgAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9D3148C8;
	Mon, 19 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823301; cv=none; b=QOLFgs3UdVk2ihZbWX8bUgXRbZLk/y35Fn5XUvJKEPtvuMzt2vjGYXUfExit6HkAOhPeMA3bY7SlQ5inezBZ412R8ctqPFvc+UA7pQRUpCRcVbTXh3qdE52zaA+JG5xU7g0FJJRjUQquuytpm3plpI/a9KImiXPMyABMvPJIbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823301; c=relaxed/simple;
	bh=m6fiWE2pnNbhhpX2oZo1w8HwzGDymsBUVv89HVOO69U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ilmh0pKdJc8ojvhSA9pluEOJJ3G6OOYJIpSEzx1RWI2VCn+zzhv6D7niTCC4PogRiEGH2w1z4UGgwlXIM9OsYY8rm1fQJJ6rFGVMfaQPpC00KrXAqf0mHFSXtxsS9k0Z7UMVo6Ge+vr8rhGXLaADfyMcMfc4xgwMLzbxdmUn2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGpWhgAu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0655C116C6;
	Mon, 19 Jan 2026 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823300;
	bh=m6fiWE2pnNbhhpX2oZo1w8HwzGDymsBUVv89HVOO69U=;
	h=From:Date:Subject:To:Cc:From;
	b=dGpWhgAurL7BUnf4WTlLuqSPiBQMLfaJ+N4lNv78Mqtkq6aOvXdiNKHYVnTFQq3Gg
	 +BVC6XpwEtrGE27QhPeKoor+bKLLEDwAcmx/RUiaAkkUxYcWZqIrYvJVLWQcInXPOQ
	 ylySNStLJ8At2aG6CyVM8D5BukbjCuc+GZ/rLfMRZ96j/z0QfJtxn9JTfETdBzPStM
	 HqYAjgVM98kJrpJtqyd1hBu7OS3zdqU/8sNkJ2dcpQ5pCIClyNZY0z5MZE7X4OnC+f
	 ILjJu6T0+H3Eibk/w3W5AGWdBuuP8R4+uVrcYBzG6CHDou8/S207qOO1hXqVJr5EL6
	 3hGumzdCnjm/w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 19 Jan 2026 12:48:02 +0100
Subject: [PATCH] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow bifurcation
 register on Purwa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NMQ6DMAxA0asgz41EMiDCVaoqcsEQL8FySClC3
 J2I8S3/n5BJmTIMzQlKP868pgr7amCMmBYyPFWDa13XWuvNtgqPRoruGCQeIceyFQk7auK0mN5
 b6hG/zs8OakSUZv4/g/fnum6VGMFkcAAAAA==
X-Change-ID: 20260119-topic-purwa_phy_shutup_warning-891e8aab29f2
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 YijieYang <yijie.yang@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768823296; l=1939;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zafLI2H+tXlTDyy9bg4Qs3Rs79fUkAKI4Fp2LAgvkag=;
 b=xMtsEXOFlGjBtcLWdBg61jlatkGD/wYUEzbmPAYeQhklx4IQ70ZSTFCzFs9+IO93tnU6QAYA9
 UO8+tyvJDlxDvGch8lq32075lXJNwX6bGI+2xuSCiRKOUz8TQ9KYG/R
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
The PHY is however physically laid out as if it were to, since there
are two separate ports (A/B).

Split out a new if-then block to un-require the bifurcation register
handle to squash this warning:

purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property

Fixes: 2e1ffd4c1805 ("dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/176857775469.1631885.16133311938753588148.robh@kernel.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..431e8cb5df84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -136,13 +136,22 @@ allOf:
           items:
             - description: port a
             - description: port b
-      required:
-        - qcom,4ln-config-sel
     else:
       properties:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
+    then:
+      required:
+        - qcom,4ln-config-sel
+
   - if:
       properties:
         compatible:

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-topic-purwa_phy_shutup_warning-891e8aab29f2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


