Return-Path: <linux-arm-msm+bounces-77443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E5BDFA5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEA719A3025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A382337685;
	Wed, 15 Oct 2025 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKbferZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268F3375CF;
	Wed, 15 Oct 2025 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545596; cv=none; b=QXUYsK+H0JHOCuyUGWCSLrfq+McxQMKvltBhi1Hb2uLat08PKCk8g+z/+XcdJK4/kJMVQ8yxLbcYQ1lKq2QGVKwBSlX/UBnzTDTHy+NJ+Lz0V8iBfaeXot15eGrlFl6AWt7Bta72Y7zR1kqCLXq+HNjDrDgzwicEe0eIK2shhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545596; c=relaxed/simple;
	bh=h2pgmTJ0LgxlrM1/acjmNVSi/h0KgG0d5PCKw7PpGzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BGxCTcXhgYaG9T1a3V+G25nBaUQaoE4PvXZFVlalTMMhN031YCeZEawHfPpb0qY8W6Te14LVIzayXTK5HBjogYU6q+0r6+Eyw/XFEnZ1WE3t+rD665K11/bCRFMHFxgeL1A3nI5ayD/NadbRFML3joa/Xj/ch+YMPaZLHRziXHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKbferZy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95644C4CEF9;
	Wed, 15 Oct 2025 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545595;
	bh=h2pgmTJ0LgxlrM1/acjmNVSi/h0KgG0d5PCKw7PpGzU=;
	h=From:Date:Subject:To:Cc:From;
	b=GKbferZypZzvoGx9e5v3V0cEprXcMRaUpcL/uxc/59vZ74BX5f7T1DKxQI0IldU3s
	 2anQ3m5diDjQI3buQO8ny2lOkJUMkgY+XkNNsIjVH2GLuc2qP1GuCKErs16c984O2J
	 wqByHPN0c1KLD9tBBjDzCBOmuOSUS6MkymSb3LX2CPx5RPwxVwl769LFxfECjgN5LW
	 MecplRWKTBJJbsDnFfNkeEkQfLVxgoJy509nrYs21wGtbvHCKc/I0Xut8SWi10PW2c
	 I00EAYb7CurNL+ZP/RwhHsPz8xD0wJc6/LbShydUqDuecHE4emAUaT0EYfnjo/cNeT
	 XXwAsO/nNcKng==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 15 Oct 2025 18:26:12 +0200
Subject: [PATCH net-next v5] dt-bindings: net: qcom: ethernet: Add
 interconnect properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-topic-qc_stmmac_icc_bindings-v5-1-da39126cff28@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACPL72gC/x3MQQqDMBAF0KvIrBswKUHbq0gJdjLRvzBqRkpBv
 HtDl2/zTlIpEKVnc1KRDxRrrvC3hnge8yQGsZpc67xtrTfHuoHNzkGPZRk5gDm8kSPypIaTu/d
 9TDY+OqrFViTh+++H13X9AHw2Jv9uAAAA
X-Change-ID: 20251015-topic-qc_stmmac_icc_bindings-cf2388df1d97
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, Andrew Lunn <andrew@lunn.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760545590; l=1712;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mTgsTgNTQHi6x0kc6W7bMbDPsez0DQhNORpyI2cjZWM=;
 b=vOIYMZd18lravoZ2+MqSK9dXKTZJqNRIlHSAlzZCiR1xYdG6d4uxY/2j13c7dXGLbDb8yvHS+
 1BI2wBrilQJC1jACi/7SocdCVV1FdIEbF6xsirTuYa9X01QdAx/vc77
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Add documentation for the interconnect and interconnect-names
properties required when voting for AHB and AXI buses.

Suggested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
I picked this up because it hasn't been merged for a year and the
original author didn't seem to react to that either..

The original driver change that was paired with this patch has
bitrotted, but this is still useful on its own (if only to reduce the
number of DT checker warnings in qcom/..)

No changes besides `b4 trailers -u && git commit --amend -s`

v4: https://lore.kernel.org/linux-arm-msm/20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com/
---
 Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index e7ee0d9efed8..423959cb928d 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -73,6 +73,14 @@ properties:
 
   dma-coherent: true
 
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-mac
+      - const: mac-mem
+
   phys: true
 
   phy-names:

---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20251015-topic-qc_stmmac_icc_bindings-cf2388df1d97

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


